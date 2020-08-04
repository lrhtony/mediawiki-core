-- This file is automatically generated using maintenance/generateSchemaSql.php.
-- Source: maintenance/tables.json
-- Do not modify this file directly.
-- See https://www.mediawiki.org/wiki/Manual:Schema_changes
CREATE TABLE /*_*/site_identifiers (
  si_type BLOB NOT NULL,
  si_key BLOB NOT NULL,
  si_site INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(si_type, si_key)
);
CREATE INDEX site_ids_site ON /*_*/site_identifiers (si_site);
CREATE INDEX site_ids_key ON /*_*/site_identifiers (si_key);
CREATE TABLE /*_*/updatelog (
  ul_key VARCHAR(255) NOT NULL,
  ul_value BLOB DEFAULT NULL,
  PRIMARY KEY(ul_key)
);
CREATE TABLE /*_*/actor (
  actor_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  actor_user INTEGER UNSIGNED DEFAULT NULL,
  actor_name BLOB NOT NULL
);
CREATE UNIQUE INDEX actor_user ON /*_*/actor (actor_user);
CREATE UNIQUE INDEX actor_name ON /*_*/actor (actor_name);
CREATE TABLE /*_*/user_former_groups (
  ufg_user INTEGER UNSIGNED DEFAULT 0 NOT NULL,
  ufg_group BLOB DEFAULT '' NOT NULL,
  PRIMARY KEY(ufg_user, ufg_group)
);
CREATE TABLE /*_*/bot_passwords (
  bp_user INTEGER UNSIGNED NOT NULL,
  bp_app_id BLOB NOT NULL,
  bp_password BLOB NOT NULL,
  bp_token BLOB DEFAULT '' NOT NULL,
  bp_restrictions BLOB NOT NULL,
  bp_grants BLOB NOT NULL,
  PRIMARY KEY(bp_user, bp_app_id)
);
CREATE TABLE /*_*/comment (
  comment_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  comment_hash INTEGER NOT NULL, comment_text BLOB NOT NULL,
  comment_data BLOB DEFAULT NULL
);
CREATE INDEX comment_hash ON /*_*/comment (comment_hash);
CREATE TABLE /*_*/slots (
  slot_revision_id BIGINT UNSIGNED NOT NULL,
  slot_role_id SMALLINT UNSIGNED NOT NULL,
  slot_content_id BIGINT UNSIGNED NOT NULL,
  slot_origin BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY(slot_revision_id, slot_role_id)
);
CREATE INDEX slot_revision_origin_role ON /*_*/slots (
  slot_revision_id, slot_origin, slot_role_id
);
CREATE TABLE /*_*/site_stats (
  ss_row_id INTEGER UNSIGNED NOT NULL,
  ss_total_edits BIGINT UNSIGNED DEFAULT NULL,
  ss_good_articles BIGINT UNSIGNED DEFAULT NULL,
  ss_total_pages BIGINT UNSIGNED DEFAULT NULL,
  ss_users BIGINT UNSIGNED DEFAULT NULL,
  ss_active_users BIGINT UNSIGNED DEFAULT NULL,
  ss_images BIGINT UNSIGNED DEFAULT NULL,
  PRIMARY KEY(ss_row_id)
);
CREATE TABLE /*_*/user_properties (
  up_user INTEGER UNSIGNED NOT NULL,
  up_property BLOB NOT NULL,
  up_value BLOB DEFAULT NULL,
  PRIMARY KEY(up_user, up_property)
);
CREATE INDEX user_properties_property ON /*_*/user_properties (up_property);
CREATE TABLE /*_*/log_search (
  ls_field BLOB NOT NULL,
  ls_value VARCHAR(255) NOT NULL,
  ls_log_id INTEGER UNSIGNED DEFAULT 0 NOT NULL,
  PRIMARY KEY(ls_field, ls_value, ls_log_id)
);
CREATE INDEX ls_log_id ON /*_*/log_search (ls_log_id);
CREATE TABLE /*_*/change_tag (
  ct_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  ct_rc_id INTEGER UNSIGNED DEFAULT NULL,
  ct_log_id INTEGER UNSIGNED DEFAULT NULL,
  ct_rev_id INTEGER UNSIGNED DEFAULT NULL,
  ct_params BLOB DEFAULT NULL, ct_tag_id INTEGER UNSIGNED NOT NULL
);
CREATE UNIQUE INDEX change_tag_rc_tag_id ON /*_*/change_tag (ct_rc_id, ct_tag_id);
CREATE UNIQUE INDEX change_tag_log_tag_id ON /*_*/change_tag (ct_log_id, ct_tag_id);
CREATE UNIQUE INDEX change_tag_rev_tag_id ON /*_*/change_tag (ct_rev_id, ct_tag_id);
CREATE INDEX change_tag_tag_id_id ON /*_*/change_tag (
  ct_tag_id, ct_rc_id, ct_rev_id, ct_log_id
);