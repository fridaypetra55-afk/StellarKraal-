-- Rollback: Drop webhook_deliveries table and its indexes

DROP INDEX IF EXISTS idx_webhook_deliveries_next_retry;
DROP INDEX IF EXISTS idx_webhook_deliveries_status;
DROP INDEX IF EXISTS idx_webhook_deliveries_webhook_id;
DROP TABLE IF EXISTS webhook_deliveries;
