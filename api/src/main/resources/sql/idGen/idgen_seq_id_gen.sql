SET FOREIGN_KEY_CHECKS=0;
UPDATE idgen_seq_id_gen SET max_length = null WHERE id = 1;
SET FOREIGN_KEY_CHECKS=1;