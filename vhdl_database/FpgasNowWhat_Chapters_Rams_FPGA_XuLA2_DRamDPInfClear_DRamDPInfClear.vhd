--*********************************************************************
-- Distributed RAM, dual-port, inferred more clearly.
--*********************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity DRamDPInfClear is
  port (
    clk_i       : in  std_logic;
    innerProd_o : out std_logic_vector(31 downto 0) := (others => '0')
    );
end entity;

architecture Behavioral of DRamDPInfClear is
  constant NO          : std_logic := '0';
  constant YES         : std_logic := '1';
  constant RAM_SIZE_C  : natural   := 16;   -- Number of words in RAM.
  constant RAM_WIDTH_C : natural   := 8;    -- Width of RAM words.
  constant VEC_LEN_C   : natural   := 5;    -- Length of vectors.
  subtype RamWord_t is unsigned(RAM_WIDTH_C-1 downto 0);   -- RAM word type.
  type Ram_t is array (0 to RAM_SIZE_C-1) of RamWord_t;  -- array of RAM words type.
  signal ram_r         : Ram_t;         -- RAM declaration.
  signal dataToRam_r   : RamWord_t;     -- Data to write to RAM.
  signal vec1Ptr_r     : natural range 0 to RAM_SIZE_C-1;  -- Pointer to 1st vector.
  signal vec2Ptr_r     : natural range 0 to RAM_SIZE_C-1;  -- Pointer to 2nd vector.
  signal innerProd_r   : natural range 0 to (2**RAM_WIDTH_C - 1) * (2**RAM_WIDTH_C - 1);
begin

  --*********************************************************************
  -- State machine that initializes RAM with two vectors and then reads 
  -- the vectors simultaneously from RAM to compute the inner-product.
  --*********************************************************************
  Fsm_p : process (clk_i)
    type state_t is (INIT, WRITE_VECS, INNER_PRODUCT, DONE);
    variable state_v : state_t := INIT;
  begin
    if rising_edge(clk_i) then
      case state_v is
        when INIT =>
          vec1Ptr_r   <= 0;             -- Init ptr for writing data to RAM.
          dataToRam_r <= TO_UNSIGNED(1, dataToRam_r'length);  -- Initial data value.
          state_v     := WRITE_VECS;
        when WRITE_VECS =>              -- Initialize the 1st and 2nd vectors.
          ram_r(vec1Ptr_r) <= dataToRam_r;  -- Write data to RAM at current ptr.
          if vec1Ptr_r < 2 * VEC_LEN_C - 1 then  -- If haven't init'ed both vectors ...
            vec1Ptr_r   <= vec1Ptr_r + 1;  -- point at next RAM location ...
            dataToRam_r <= dataToRam_r + 1;  -- and init it with the next value.
          else  -- Else, finished initializing the vectors.
            vec1Ptr_r   <= 0;  -- Init ptr to 1st vector at start of RAM.
            vec2Ptr_r   <= VEC_LEN_C;  -- Init ptr to 2nd vector that follows 1st vector.
            innerProd_r <= 0;  -- Init inner-product summation register.
            state_v     := INNER_PRODUCT;  -- Go to next state.
          end if;
        when INNER_PRODUCT =>  -- Compute the inner-product of the 1st and 2nd vectors.
          if vec1Ptr_r <= VEC_LEN_C - 1 then  -- If haven't processed all vector elements...
            -- Add the product of the current elements from the 1st and 2nd vectors using
            -- two simultaneous reads of the RAM.
            innerProd_r <= innerProd_r + TO_INTEGER(ram_r(vec1Ptr_r) * ram_r(vec2Ptr_r));
            vec1Ptr_r   <= vec1Ptr_r + 1;  -- Increment to the next element of 1st vector.
            vec2Ptr_r   <= vec2Ptr_r + 1;  -- Increment to the next element of 2nd vector.
          else  -- Else, all the vector elements have been processed ...
            state_v := DONE;            -- so go to the next state.
          end if;
        when DONE =>                    -- Inner-product complete ...
          null;                         -- so wait here and do nothing.
        when others =>                  -- Erroneous state ...
          state_v := INIT;              -- so re-run the entire process.
      end case;
    end if;
  end process;

  -- Output the inner-product.
  innerProd_o <= std_logic_vector(TO_UNSIGNED(innerProd_r, innerProd_o'length));
  
end architecture;

