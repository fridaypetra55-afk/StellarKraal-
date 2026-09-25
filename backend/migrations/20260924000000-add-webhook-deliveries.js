'use strict';

const path = require('path');
const fs = require('fs');

exports.up = function (db) {
  const sql = fs
    .readFileSync(
      path.join(__dirname, 'sqls', '20260924000000-add-webhook-deliveries-up.sql'),
      'utf8'
    )
    .toString();
  return db.runSql(sql);
};

exports.down = function (db) {
  const sql = fs
    .readFileSync(
      path.join(__dirname, 'sqls', '20260924000000-add-webhook-deliveries-down.sql'),
      'utf8'
    )
    .toString();
  return db.runSql(sql);
};
