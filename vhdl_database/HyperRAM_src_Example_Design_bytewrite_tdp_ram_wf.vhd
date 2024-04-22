-- True-Dual-Port BRAM with Byte-wide Write Enable
-- Write First mode
--
-- bytewrite_tdp_ram_wf.vhd
-- WRITE_FIRST ByteWide WriteEnable Block RAM Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity bytewrite_tdp_ram_wf is
   generic(
      G_DOA_REG  : boolean;
      G_DOB_REG  : boolean;
      SIZE       : integer;
      ADDR_WIDTH : integer;
      COL_WIDTH  : integer;
      NB_COL     : integer
   );
   port(
      clka  : in  std_logic;
      ena   : in  std_logic;
      wea   : in  std_logic_vector(NB_COL - 1 downto 0);
      addra : in  std_logic_vector(ADDR_WIDTH - 1 downto 0);
      dia   : in  std_logic_vector(NB_COL * COL_WIDTH - 1 downto 0);
      doa   : out std_logic_vector(NB_COL * COL_WIDTH - 1 downto 0);
      clkb  : in  std_logic;
      enb   : in  std_logic;
      web   : in  std_logic_vector(NB_COL - 1 downto 0);
      addrb : in  std_logic_vector(ADDR_WIDTH - 1 downto 0);
      dib   : in  std_logic_vector(NB_COL * COL_WIDTH - 1 downto 0);
      dob   : out std_logic_vector(NB_COL * COL_WIDTH - 1 downto 0)
   );
end bytewrite_tdp_ram_wf;

architecture byte_wr_ram_wf of bytewrite_tdp_ram_wf is

   type ram_type is array (0 to SIZE - 1) of std_logic_vector(NB_COL * COL_WIDTH - 1 downto 0);
   signal RAM : ram_type := (others => (others => '1'));

   attribute ram_decomp : string;
   attribute ram_decomp of RAM : signal is "power";

   signal doa_noreg : std_logic_vector(NB_COL * COL_WIDTH - 1 downto 0);
   signal doa_reg   : std_logic_vector(NB_COL * COL_WIDTH - 1 downto 0);
   signal dob_noreg : std_logic_vector(NB_COL * COL_WIDTH - 1 downto 0);
   signal dob_reg   : std_logic_vector(NB_COL * COL_WIDTH - 1 downto 0);

begin

------- Port A -------
   process(clka)
   begin
      if rising_edge(clka) then
         if ena = '1' then
            for i in 0 to NB_COL - 1 loop
               if wea(i) = '1' then
                  RAM(conv_integer(addra))((i + 1) * COL_WIDTH - 1 downto i * COL_WIDTH) <= dia((i
                  + 1) * COL_WIDTH - 1 downto i * COL_WIDTH);
               end if;
            end loop;
            doa_noreg <= RAM(conv_integer(addra));
         end if;
         doa_reg <= doa_noreg;
      end if;
   end process;

   doa <= doa_reg when G_DOA_REG else doa_noreg;


------- Port B -------
   process(clkb)
   begin
      if rising_edge(clkb) then
         if enb = '1' then
            for i in 0 to NB_COL - 1 loop
               if web(i) = '1' then
                  RAM(conv_integer(addrb))((i + 1) * COL_WIDTH - 1 downto i * COL_WIDTH) <= dib((i
                  + 1) * COL_WIDTH - 1 downto i * COL_WIDTH);
               end if;
            end loop;
            dob_noreg <= RAM(conv_integer(addrb));
         end if;
         dob_reg <= dob_noreg;
      end if;
   end process;

   dob <= dob_reg when G_DOB_REG else dob_noreg;

end architecture byte_wr_ram_wf;

