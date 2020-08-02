// init database for sync service

// create collections
db.createCollection("block");
db.createCollection("sync_task");
db.createCollection("tx_common");
db.createCollection("proposal");
// db.createCollection("tx_msg");
db.createCollection("sync_conf");
db.createCollection("mgo_txn");
db.createCollection("mgo_txn.stash");


// create index
db.account.createIndex({"address": 1}, {"unique": true});
db.block.createIndex({"height": -1}, {"unique": true});

db.sync_task.createIndex({"start_height": 1, "end_height": 1}, {"unique": true});
db.sync_task.createIndex({"status": 1}, {"background": true});

db.tx_common.createIndex({"height": -1});
db.tx_common.createIndex({"time": -1});
db.tx_common.createIndex({"tx_hash": 1}, {"unique": true});
// db.tx_common.createIndex({"from": 1});
// db.tx_common.createIndex({"to": 1});
db.tx_common.createIndex({"type": 1});
db.tx_common.createIndex({"status": 1});
db.tx_common.createIndex({"proposal_id": 1}, {"background": true});
db.tx_common.createIndex({"type": -1, "time": -1, "height": -1}, {"background": true});

db.proposal.createIndex({"proposal_id": 1}, {"unique": true});
db.proposal.createIndex({"status": 1}, {"background": true});
db.proposal.createIndex({"voting_end_time": 1, "deposit_end_time": 1, "status": 1}, {"background": true});

// db.tx_msg.createIndex({"hash": 1}, {"unique": true});

// init data
db.sync_conf.insert({"block_num_per_worker_handle": 100, "max_worker_sleep_time": 120});


// ---------------------------------------------------------------
// init database for explorer backend

// db.createCollection("ex_power_change");
// db.createCollection("ex_uptime_change");
db.createCollection("ex_tx_num_stat");
db.createCollection("ex_config");
db.createCollection("ex_val_black_list");
db.createCollection("ex_validator");
db.createCollection("ex_gov_params");
db.createCollection("ex_asset_tokens");
db.createCollection("ex_asset_gateways");

// create index
// db.ex_power_change.createIndex({"height": 1, "address": 1}, {"unique": true});
db.ex_tx_num_stat.createIndex({"date": -1}, {"unique": true});
db.ex_config.createIndex({"env": 1, "chain_id": 1}, {"unique": true, "background": true});
db.ex_val_black_list.createIndex({"operator_addr": 1}, {"unique": true});
db.ex_validator.createIndex({"operator_address": 1}, {"unique": true});
db.ex_validator.createIndex({"proposer_addr": 1}, {"unique": true,"background": true});
db.ex_validator.createIndex({"jailed": -1, "status": -1, "voting_power": -1}, {"background": true});
db.ex_gov_params.createIndex({"key": 1}, {"unique": true});
db.ex_asset_tokens.createIndex({"token_id": 1}, {"unique": true, "background": true});
db.ex_asset_tokens.createIndex({"source": 1}, {"background": true});
db.ex_asset_gateways.createIndex({"moniker": 1}, {"unique": true, "background": true});

// init data
db.ex_config.insert({
    "network_name": "shinecloudnet",
    "env": "mainnet",
    "host": "http://3.113.34.107:8080",
    "chain_id": "shinecloudnet",
    "show_faucet": 0
});

