CREATE TABLE ipv4_data (
  oct_1 TINYINT UNSIGNED,
  oct_2 TINYINT UNSIGNED,
  start INT UNSIGNED,
  end INT UNSIGNED,
  country VARCHAR(50),
  region VARCHAR(50),
  asn VARCHAR(15),
  org VARCHAR(100),
  ipv4_1_str VARCHAR(15),
  ipv4_2_str VARCHAR(15),
  PRIMARY KEY (start, end)
);

UPDATE ipv4_data SET oct_1 = (start >> 24) & 255;
CREATE INDEX idx_oct_1 ON ipv4_data (oct_1);
CREATE INDEX idx_oct_2 ON ipv4_data (oct_2);
OPTIMIZE ipv4_data;
