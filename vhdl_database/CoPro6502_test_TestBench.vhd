--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:24:00 10/29/2014
-- Design Name:   
-- Module Name:   /home/dmb/atom/CoPro6502/TestBench.vhd
-- Project Name:  CoPro6502
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CoPro6502
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.textio.all;
USE ieee.std_logic_textio.all;
use work.txt_util.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TestBench IS
END TestBench;
 
ARCHITECTURE behavior OF TestBench IS 


    
   

   --task para_write;
   --   input [2:0] addr;
   --   input [7:0] data;
   --   begin
   --     @ (negedge HO2);
   --     PA = addr;
   --     PDIN = data;
   --     PNWDS = 0;
   --     PCS = 0;
   --     @ (negedge HO2);        
   --     PCS = 1;
   --     PA = "000;
   --     PDIN = "00000000;
   --     PNWDS = 1;
   --   end         
   -- endtask

   -- task para_read;
   --   input [2:0] addr;
   --   input [7:0] expected_mask;
   --   input [7:0] expected_data;
   --   begin
   --     @ (negedge HO2);
   --     PA = addr;
   --     PNRDS = 0;
   --     PCS = 0;
   --     @ (posedge HO2);
   --     if ((PDOUT & expected_mask) != expected_data)
   --         $display("%0dns: para addr %0d data error detected; expected_mask = %b; expected_data = %b; actual_data = %b", $time, PA, expected_mask, expected_data, PDOUT);
   --     @ (negedge HO2);
   --     PCS = 1;
   --     PA = "000;
   --     PNRDS = 1;
   --   end         
   -- endtask
    


  
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CoPro6502
    PORT(
         fastclk : IN  std_logic;
         tp : OUT  std_logic_vector(8 downto 2);
         sw : IN  std_logic_vector(2 downto 1);
         fcs : OUT  std_logic;
         h_phi2 : IN  std_logic;
         h_addr : IN  std_logic_vector(2 downto 0);
         h_data : INOUT  std_logic_vector(7 downto 0);
         h_rdnw : IN  std_logic;
         h_cs_b : IN  std_logic;
         h_rst_b : IN  std_logic;
         h_irq_b : INOUT  std_logic;
         ram_cs : OUT  std_logic;
         ram_oe : OUT  std_logic;
         ram_wr : OUT  std_logic;
         ram_addr : OUT  std_logic_vector(18 downto 0);
         ram_data : INOUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;

    COMPONENT SRAM
    PORT(
         ADDR : in std_logic_vector(15 downto 0);
         DATA : inout std_logic_vector(7 downto 0);
         OE : in std_logic;
         WE : in std_logic;
         CS : in std_logic
        );
    END COMPONENT;

   --Inputs
   signal fastclk : std_logic := '0';
   signal sw : std_logic_vector(2 downto 1) := (others => '0');
   signal h_phi2 : std_logic := '0';
   signal h_addr : std_logic_vector(2 downto 0) := (others => '0');
   signal h_rdnw : std_logic := '1';
   signal h_cs_b : std_logic := '1';
   signal h_rst_b : std_logic := '1';

	--BiDirs
   signal h_data : std_logic_vector(7 downto 0);
   signal h_irq_b : std_logic;
   signal ram_data : std_logic_vector(7 downto 0);

 	--Outputs
   signal tp : std_logic_vector(8 downto 2);
   signal fcs : std_logic;
   signal ram_cs : std_logic;
   signal ram_oe : std_logic;
   signal ram_wr : std_logic;
   signal ram_addr : std_logic_vector(18 downto 0);

   -- Clock period definitions
   constant fastclk_period : time := 10 ns;
   constant phi2_period : time := 250 ns;
   
   


BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CoPro6502 PORT MAP (
          fastclk => fastclk,
          tp => tp,
          sw => sw,
          fcs => fcs,
          h_phi2 => h_phi2,
          h_addr => h_addr,
          h_data => h_data,
          h_rdnw => h_rdnw,
          h_cs_b => h_cs_b,
          h_rst_b => h_rst_b,
          h_irq_b => h_irq_b,
          ram_cs => ram_cs,
          ram_oe => ram_oe,
          ram_wr => ram_wr,
          ram_addr => ram_addr,
          ram_data => ram_data
        );

    inst_sram: SRAM PORT MAP (
         ADDR => ram_addr(15 downto 0),
         DATA => ram_data,
         OE => ram_oe,
         WE => ram_wr,
         CS => ram_cs
    );
    
   -- Clock process definitions
   fastclk_process :process
   begin
		fastclk <= '0';
		wait for fastclk_period/2;
		fastclk <= '1';
		wait for fastclk_period/2;
   end process;

   phi2_process :process
   begin
		h_phi2 <= '0';
		wait for phi2_period/2;
		h_phi2 <= '1';
		wait for phi2_period/2;
   end process;
 
 

   -- Stimulus process
   stim_proc: process
   
   procedure host_write (
      addr : in std_logic_vector(2 downto 0);
      data : in std_logic_vector(7 downto 0)
   ) is
   begin
      wait until falling_edge(h_phi2);
      h_addr <= addr;
      h_data <= data;
      h_rdnw <= '0';
      h_cs_b <= '0';
      wait until falling_edge(h_phi2);
      h_cs_b <= '1';
      h_addr <= "000";
      h_data <= "ZZZZZZZZ";
      h_rdnw <= '1';
    end host_write;
 
    procedure delay (
        n : in integer
    ) is 
    begin
        for i in 0 to n loop
            wait until falling_edge(h_phi2);
        end loop;
    end delay;
    
   procedure host_read (
      addr : in std_logic_vector(2 downto 0);
      expected_mask : in std_logic_vector(7 downto 0);
      expected_data : in std_logic_vector(7 downto 0)
   ) is
   begin
      wait until falling_edge(h_phi2);
      h_addr <= addr;
      h_rdnw <= '1';
      h_cs_b <= '0';
      wait until falling_edge(h_phi2);
      if ((h_data and expected_mask) /= expected_data) then
          report " data error detected: host addr" & str(h_addr) severity note;     
          report " expected_mask = " & str(expected_mask) severity note;
          report " expected_data = " & str(expected_data) severity note;
          report " actual_data = " & str(h_data) severity note;
      end if;
      wait until falling_edge(h_phi2);
      h_cs_b <= '1';
      h_addr <= "000";
      h_rdnw <= '1';
    end host_read;
   
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait until falling_edge(h_phi2);

      h_rst_b <= '0';
      for i in 0 to 99 loop
        wait until falling_edge(h_phi2);
      end loop;
      h_rst_b <= '1';

      wait for 1 ms;	

        delay(10);
        
        -- Take PRST high, low, high
        host_write("000", "00100000");
        host_write("000", "10100000");
        host_write("000", "00100000");
        host_read("000", "00000000", "00000000");
        delay(10);

        -- De-Assert soft reset (up until this point it will be X)
        host_write("000", "01000000");
        delay(10);
        
        -- Assert soft reset for atleast 24 clocks to flush the 24 byte FIFO
        host_write("000", "11000000");
        delay(50);
        
        -- De-Assert  soft reset
        host_write("000", "01000000");
        delay(10);

        -- Disable all interrupts
        host_write("000", "00001111");

        -- Set two byte mode for register 3
        host_write("000", "00010000");

        -- Enable NMI (M=1)
        host_write("000", "10001000");
        
        -- Check the control bits are as expected
        host_read("000", "11111111", "01001000");

        -- Read the junk byte out of register 3
        -- para_read("100", "11000000", "00000000"); -- N=0 _F=0
        host_read("101", "00000000", "00000000");
        -- para_read("100", "11000000", "11000000"); -- N=1 _F=1
        delay(10);
        
      wait for 1000 ms;	

   end process;

END;
