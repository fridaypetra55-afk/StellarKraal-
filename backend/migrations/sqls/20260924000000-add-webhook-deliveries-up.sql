-- Migration: Add webhook_deliveries table for persistent retry tracking
-- Closes #1073: DB migration system / #1071: Webhook retry

CREATE TABLE IF NOT EXISTS webhook_deliveries (
  id TEXT PRIMARY KEY,
  webhook_id TEXT NOT NULL,
  url TEXT NOT NULL,
  payload TEXT NOT NULL,
  attempt_number INTEGER DEFAULT 1,
  max_attempts INTEGER DEFAULT 5,
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'success', 'failed', 'permanent_failure')),
  last_error TEXT,
  next_retry_at TEXT,
  created_at TEXT DEFAULT (datetime('now')),
  updated_at TEXT DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_webhook_deliveries_webhook_id ON webhook_deliveries(webhook_id);
CREATE INDEX IF NOT EXISTS idx_webhook_deliveries_status ON webhook_deliveries(status);
CREATE INDEX IF NOT EXISTS idx_webhook_deliveries_next_retry ON webhook_deliveries(next_retry_at);
