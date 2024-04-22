library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package hash_pkg is

  constant key_len : integer := 128;
  constant value_len : integer := 126;
  constant stash_depth : integer := 8;

end hash_pkg;
