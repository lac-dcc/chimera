-------------------------------------------------------------------------------
-- leon3_zedboard_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

use std.textio.all;

library grlib;
use grlib.stdlib.all;
use grlib.stdio.all;

entity leon3_zedboard_stub is
  port (
  DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
  DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
  DDR_cas_n : inout STD_LOGIC;
  DDR_ck_n : inout STD_LOGIC;
  DDR_ck_p : inout STD_LOGIC;
  DDR_cke : inout STD_LOGIC;
  DDR_cs_n : inout STD_LOGIC;
  DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
  DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
  DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
  DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
  DDR_odt : inout STD_LOGIC;
  DDR_ras_n : inout STD_LOGIC;
  DDR_reset_n : inout STD_LOGIC;
  DDR_we_n : inout STD_LOGIC;
  FCLK_CLK0 : out STD_LOGIC;
  FCLK_CLK1 : out STD_LOGIC;
  FCLK_RESET0_N : out STD_LOGIC;
  FIXED_IO_ddr_vrn : inout STD_LOGIC;
  FIXED_IO_ddr_vrp : inout STD_LOGIC;
  FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
  FIXED_IO_ps_clk : inout STD_LOGIC;
  FIXED_IO_ps_porb : inout STD_LOGIC;
  FIXED_IO_ps_srstb : inout STD_LOGIC;
  S_AXI_GP0_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S_AXI_GP0_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S_AXI_GP0_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S_AXI_GP0_arid : in STD_LOGIC_VECTOR ( 5 downto 0 ); --
  S_AXI_GP0_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S_AXI_GP0_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 ); --
  S_AXI_GP0_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S_AXI_GP0_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );  --
  S_AXI_GP0_arready : out STD_LOGIC;
  S_AXI_GP0_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S_AXI_GP0_arvalid : in STD_LOGIC;
  S_AXI_GP0_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S_AXI_GP0_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
  S_AXI_GP0_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S_AXI_GP0_awid : in STD_LOGIC_VECTOR ( 5 downto 0 );  --
  S_AXI_GP0_awlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S_AXI_GP0_awlock : in STD_LOGIC_VECTOR ( 1 downto 0 ); --
  S_AXI_GP0_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S_AXI_GP0_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );  --
  S_AXI_GP0_awready : out STD_LOGIC;
  S_AXI_GP0_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
  S_AXI_GP0_awvalid : in STD_LOGIC;
  S_AXI_GP0_bid : out STD_LOGIC_VECTOR ( 5 downto 0 );  --
  S_AXI_GP0_bready : in STD_LOGIC;
  S_AXI_GP0_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S_AXI_GP0_bvalid : out STD_LOGIC;
  S_AXI_GP0_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
  S_AXI_GP0_rid : out STD_LOGIC_VECTOR ( 5 downto 0 );  --
  S_AXI_GP0_rlast : out STD_LOGIC;
  S_AXI_GP0_rready : in STD_LOGIC;
  S_AXI_GP0_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
  S_AXI_GP0_rvalid : out STD_LOGIC;
  S_AXI_GP0_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
  S_AXI_GP0_wid : in STD_LOGIC_VECTOR ( 5 downto 0 );  --
  S_AXI_GP0_wlast : in STD_LOGIC;
  S_AXI_GP0_wready : out STD_LOGIC;
  S_AXI_GP0_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
  S_AXI_GP0_wvalid : in STD_LOGIC
  );
end leon3_zedboard_stub;

architecture STRUCTURE of leon3_zedboard_stub is

signal clk            : std_logic := '0';
signal clk0            : std_logic := '0';
signal clk1            : std_logic := '0';
signal rst             : std_logic := '0';

type memstatetype is (idle, read1, read2, read3, write1, write2, write3);
type blane is array (0 to 2**18-1) of natural;
type memtype is array (0 to 3) of blane;
constant abits : integer := 20;
subtype BYTE is std_logic_vector(7 downto 0);
type MEM is array(0 to ((2**abits)-1)) of BYTE;
type regtype is record
  memstate : memstatetype;
  addr     : integer;
  arlen    : integer;
  mem      : memtype;
  rcnt     : integer;
end record;
signal S_AXI_GP0_rvalid_i : std_logic;
signal r, rin : regtype;

begin

  clk0 <= not clk0 after 6.0 ns; -- 83.33 MHz
  clk1 <= not clk1 after 2.5 ns; -- 200 MHz
  rst <= '1' after 1 us;
  S_AXI_GP0_rvalid <= S_AXI_GP0_rvalid_i;
  FCLK_CLK0 <= clk0;
  clk <= clk0;
  FCLK_CLK1 <= clk1;
--  FCLK_CLK2 <= clk2;
--  FCLK_CLK3 <= clk3;
  FCLK_RESET0_N <= rst;


  mem0 : process(clk)
  variable MEMA : MEM;
  variable L1 : line;
  variable FIRST : boolean := true;
  variable ADR : std_logic_vector(19 downto 0);
  variable BUF : std_logic_vector(31 downto 0);
  variable CH : character;
  variable ai : integer := 0;
  variable len : integer := 0;
  file TCF : text open read_mode is "ram.srec";
  variable rectype : std_logic_vector(3 downto 0);
  variable recaddr : std_logic_vector(31 downto 0);
  variable reclen  : std_logic_vector(7 downto 0);
  variable recdata : std_logic_vector(0 to 16*8-1);

  variable memstate : memstatetype;
  variable addr     : integer;
--  variable len    : integer;
--  variable mem      : memtype;
  variable rcnt     : integer;
  
  begin
    if FIRST then

--      if clear = 1 then MEMA := (others => X"00"); end if;
      L1:= new string'("");	--'
      while not endfile(TCF) loop
        readline(TCF,L1);
        if (L1'length /= 0) then	--'
          while (not (L1'length=0)) and (L1(L1'left) = ' ') loop
            std.textio.read(L1,CH);
          end loop;

          if L1'length > 0 then	--'
            read(L1, ch);
            if (ch = 'S') or (ch = 's') then
              hread(L1, rectype);
              hread(L1, reclen);
	      len := conv_integer(reclen)-1;
	      recaddr := (others => '0');
	      case rectype is 
		when "0001" =>
                  hread(L1, recaddr(15 downto 0));
		when "0010" =>
                  hread(L1, recaddr(23 downto 0));
		when "0011" =>
                  hread(L1, recaddr);
		when others => next;
	      end case;
              hread(L1, recdata);
	      recaddr(31 downto abits) := (others => '0');
	      ai := conv_integer(recaddr);
 	      for i in 0 to 15 loop
                MEMA(ai+i) := recdata((i*8) to (i*8+7));
	      end loop;
	      if ai = 0 then
		ai := 1;
	      end if;
            end if;
          end if;
        end if;
      end loop;

      FIRST := false;

    elsif rising_edge(clk) then
      case memstate is
      when idle =>
        S_AXI_GP0_arready <= '0'; S_AXI_GP0_rvalid_i <= '0'; S_AXI_GP0_rlast <= '0';
        S_AXI_GP0_awready <= '0'; S_AXI_GP0_wready <= '0'; S_AXI_GP0_bvalid <= '0';
        if S_AXI_GP0_arvalid = '1' then
          memstate := read1; S_AXI_GP0_arready <= '1';
        elsif S_AXI_GP0_awvalid = '1' then
          memstate := write1; S_AXI_GP0_awready <= '1';
        end if;
      when read1 =>
        addr:= conv_integer(S_AXI_GP0_araddr(19 downto 0));
        len := conv_integer(S_AXI_GP0_arlen);
        S_AXI_GP0_arready <= '0'; memstate := read2; rcnt := 23;
      when read2 =>
        if rcnt /= 0 then rcnt := rcnt - 1;
        else
          S_AXI_GP0_rvalid_i <= '1';
          if len = 0 then S_AXI_GP0_rlast <= '1'; end if;
          if (S_AXI_GP0_rready and S_AXI_GP0_rvalid_i)  = '1' then
            if len = 0 then 
              S_AXI_GP0_rlast <= '0'; S_AXI_GP0_rvalid_i <= '0';
              memstate := idle;
            else
              addr := addr + 4; len := len - 1;
              if len = 0 then S_AXI_GP0_rlast <= '1'; end if;
            end if;
          end if;
          for i in 0 to 3 loop
            S_AXI_GP0_rdata(i*8+7 downto i*8) <= MEMA(addr+3-i);
          end loop;
        end if;
      when write1 =>
        addr:= conv_integer(S_AXI_GP0_awaddr(19 downto 0));
        len := conv_integer(S_AXI_GP0_awlen);
        S_AXI_GP0_awready <= '0'; memstate := write2; rcnt := 0;
      when write2 =>
        if rcnt /= 0 then rcnt := rcnt - 1;
        else
          memstate := write3;
           S_AXI_GP0_wready <= '1';
        end if;
      when write3 =>
          if S_AXI_GP0_wvalid = '1' then
            for i in 0 to 3 loop
              if S_AXI_GP0_wstrb(i) = '1' then
                MEMA(addr+3-i) := S_AXI_GP0_wdata(i*8+7 downto i*8);
              end if;
            end loop;
            if (len = 0) or (S_AXI_GP0_wlast = '1') then
              memstate := idle; S_AXI_GP0_wready <= '0'; S_AXI_GP0_bvalid <= '1';
            else
              addr := addr + 1; len := len - 1;
            end if;
          end if;
      when others =>
      end case;
    end if;   
  end process;
  
  S_AXI_GP0_bid <= (others => '0');
  S_AXI_GP0_bresp <= (others => '0');
  S_AXI_GP0_rresp <= (others => '0');
  S_AXI_GP0_rid <= (others => '0');
  DDR_addr <= (others => '0');                      
  DDR_ba <= (others => '0');                      
  DDR_cas_n <= '0';                        
  DDR_ck_n <= '0';                        
  DDR_ck_p <= '0';                        
  DDR_cke <= '0';                        
  DDR_cs_n <= '0';                        
  DDR_dm <= (others => '0');                      
  DDR_dq <= (others => '0');                      
  DDR_dqs_n <= (others => '0');                      
  DDR_dqs_p <= (others => '0');                      
  DDR_odt <= '0';                        
  DDR_ras_n <= '0';                        
  DDR_reset_n <= '0';                        
  DDR_we_n <= '0';                        
  FIXED_IO_ddr_vrn <= '0';                        
  FIXED_IO_ddr_vrp <= '0';                        
  FIXED_IO_mio <= (others => '0');                      
  FIXED_IO_ps_clk <= '0';                        
  FIXED_IO_ps_porb <= '0';                        
  FIXED_IO_ps_srstb <= '0';                        

end architecture STRUCTURE;

