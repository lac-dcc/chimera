----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Tom Almy
-- 
-- Create Date:    10:07:29 04/19/2014 
-- Design Name: 
-- Module Name:    pdp8 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: PDP-8 Project not using external memory. This is for the Nexys 3 using EPP.
-- Nexys 4 will not use EPP.
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pdp8 is
    Port ( clk : in  STD_LOGIC;
           sw : in STD_LOGIC_VECTOR(15 downto 0);
           btnc : in std_logic;
           btnu : in std_logic;
           btnd : in std_logic;
           btnl : in std_logic;
           btnr : in std_logic;
           btnCpuReset : in std_logic;
           seg : out  STD_LOGIC_VECTOR (7 downto 0);
           an : out  STD_LOGIC_VECTOR (7 downto 0);
           led : out  STD_LOGIC_VECTOR (15 downto 0);
	   RamCLK : out STD_LOGIC;
	   RamADVn : out STD_LOGIC;
	   RamCEn : out STD_LOGIC;
	   RamCRE : out STD_LOGIC;
	   RamOEn : out STD_LOGIC;
	   RamWEn : out STD_LOGIC;
	   RamLBn : out STD_LOGIC;
	   RamUBn : out STD_LOGIC;
	   RamWait : in STD_LOGIC;
	   MemDB : inout STD_LOGIC_VECTOR (15 downto 0);
	   MemAdr : out STD_LOGIC_VECTOR (22 downto 0);
           RsRx : in  STD_LOGIC;
           RsTx : out  STD_LOGIC);
end pdp8;

architecture Behavioral of pdp8 is
        COMPONENT IOT_Distributor
        PORT(
                ready_3 : IN std_logic;
                clearacc_3 : IN std_logic;
                datain_3 : IN std_logic_vector(7 downto 0);
                ready_4 : IN std_logic;
                clearacc_4 : IN std_logic;
                datain_4 : IN std_logic_vector(7 downto 0);
                bit1_cp2 : IN std_logic;
                dataout : IN std_logic_vector(7 downto 0);
                bit2_cp3 : IN std_logic;
                io_address : IN std_logic_vector(2 downto 0);          
                clear_3 : OUT std_logic;
                dataout_3 : OUT std_logic_vector(7 downto 0);
                load_3 : OUT std_logic;
                clear_4 : OUT std_logic;
                dataout_4 : OUT std_logic_vector(7 downto 0);
                load_4 : OUT std_logic;
                skip_flag : OUT std_logic;
                clearacc : OUT std_logic;
                datain : OUT std_logic_vector(7 downto 0)
                );
        END COMPONENT;
        COMPONENT Panel
        PORT(
                clk : IN std_logic;
                dispout : IN std_logic_vector(11 downto 0);
                linkout : IN std_logic;
                halt : IN std_logic;
                swreg : OUT std_logic_vector(11 downto 0);
                dispsel : OUT std_logic_vector(1 downto 0);
                run : OUT std_logic;
                loadpc : OUT std_logic;
                loadac : OUT std_logic;
                step : OUT std_logic;
                deposit : OUT std_logic;
                sw : in std_logic_vector(15 downto 0);
                btnc : in std_logic;
                btnu : in std_logic;
                btnd : in std_logic;
                btnl : in std_logic;
                btnr : in std_logic;
                btnCpuReset : in std_logic;
                reset : out std_logic;
                led : OUT std_logic_vector(15 downto 0);
                seg : OUT std_logic_vector(7 downto 0);
                an : OUT std_logic_vector(7 downto 0)
                );
        END COMPONENT;
        COMPONENT Panel_Phoney
        PORT(
                clk : IN std_logic;
                dispout : IN std_logic_vector(11 downto 0);
                linkout : IN std_logic;
                halt : IN std_logic;
                swreg : OUT std_logic_vector(11 downto 0);
                dispsel : OUT std_logic_vector(1 downto 0);
                run : OUT std_logic;
                loadpc : OUT std_logic;
                loadac : OUT std_logic;
                step : OUT std_logic;
                deposit : OUT std_logic;
                sw : in std_logic_vector(15 downto 0);
                btnc : in std_logic;
                btnu : in std_logic;
                btnd : in std_logic;
                btnl : in std_logic;
                btnr : in std_logic;
                btnCpuReset : in std_logic;
                reset : out std_logic;
                led : OUT std_logic_vector(15 downto 0);
                seg : OUT std_logic_vector(7 downto 0);
                an : OUT std_logic_vector(7 downto 0)
                );
        END COMPONENT;
        COMPONENT Memory
        PORT(
                clk : IN std_logic;
                reset : IN std_logic;
                address : IN std_logic_vector(11 downto 0);
                write_data : IN std_logic_vector(11 downto 0);
                write_enable : IN std_logic;
                read_enable : IN std_logic;          
                read_data : OUT std_logic_vector(11 downto 0);
                mem_finished : OUT std_logic
                );
        END COMPONENT;
        COMPONENT Memory_Alternate
        PORT(
                clk : IN std_logic;
                reset : IN std_logic;
                address : IN std_logic_vector(11 downto 0);
                write_data : IN std_logic_vector(11 downto 0);
                write_enable : IN std_logic;
                read_enable : IN std_logic;          
                read_data : OUT std_logic_vector(11 downto 0);
                mem_finished : OUT std_logic
                );
        END COMPONENT;
        COMPONENT Memory_Module
        PORT(
                clk : IN std_logic;
                reset : IN std_logic;
                address : IN std_logic_vector(11 downto 0);
                write_data : IN std_logic_vector(11 downto 0);
                write_enable : IN std_logic;
                read_enable : IN std_logic;          
                read_data : OUT std_logic_vector(11 downto 0);
                mem_finished : OUT std_logic;
   	        RamCLK : out STD_LOGIC;
		RamADVn : out STD_LOGIC;
		RamCEn : out STD_LOGIC;
		RamCRE : out STD_LOGIC;
		RamOEn : out STD_LOGIC;
		RamWEn : out STD_LOGIC;
		RamLBn : out STD_LOGIC;
		RamUBn : out STD_LOGIC;
		RamWait : in STD_LOGIC;
		MemDB : inout STD_LOGIC_VECTOR (15 downto 0);
		MemAdr : out STD_LOGIC_VECTOR (22 downto 0)
                );
        END COMPONENT;
        COMPONENT CPU
        PORT(
                clk : IN std_logic;
                reset : IN std_logic;
                read_data : IN std_logic_vector(11 downto 0);
                mem_finished : IN std_logic;
                swreg : IN std_logic_vector(11 downto 0);
                dispsel : IN std_logic_vector(1 downto 0);
                run : IN std_logic;
                loadpc : IN std_logic;
                loadac : IN std_logic;
                step : IN std_logic;
                deposit : IN std_logic;
                skip_flag : IN std_logic;
                clearacc : IN std_logic;
                datain : IN std_logic_vector(7 downto 0);          
                address : OUT std_logic_vector(11 downto 0);
                write_data : OUT std_logic_vector(11 downto 0);
                write_enable : OUT std_logic;
                read_enable : OUT std_logic;
                dispout : OUT std_logic_vector(11 downto 0);
                linkout : OUT std_logic;
                halt : OUT std_logic;
                bit1_cp2 : OUT std_logic;
                bit2_cp3 : OUT std_logic;
                io_address : OUT std_logic_vector(2 downto 0);
                dataout : OUT std_logic_vector(7 downto 0)
                );
        END COMPONENT;
        COMPONENT UART
        PORT(
                clk : IN std_logic;
                rx : IN std_logic;
                clear_3 : IN std_logic;
                load_3 : IN std_logic;
                dataout_3 : IN std_logic_vector(7 downto 0);
                clear_4 : IN std_logic;
                load_4 : IN std_logic;
                dataout_4 : IN std_logic_vector(7 downto 0);          
                tx : OUT std_logic;
                ready_3 : OUT std_logic;
                clearacc_3 : OUT std_logic;
                datain_3 : OUT std_logic_vector(7 downto 0);
                ready_4 : OUT std_logic;
                clearacc_4 : OUT std_logic;
                datain_4 : OUT std_logic_vector(7 downto 0)
                );
        END COMPONENT;
-- Systemwide
signal reset : std_logic;
-- Memory Interface
--signal RamCLK, RamADVn, RamCEn, RamCRE, RamOEn, RamWEn, RamLBn, RamUBn, RamWait : STD_LOGIC;
--signal MemDB : STD_LOGIC_VECTOR (15 downto 0);
--signal MemAdr: STD_LOGIC_VECTOR (22 downto 0);
-- Panel to CPU
signal swreg: std_logic_vector (11 downto 0);
signal dispsel: std_logic_vector (1 downto 0);
signal run: std_logic;
signal loadpc: std_logic;
signal loadac: std_logic; -- added
signal step: std_logic;
signal deposit: std_logic;
-- CPU to Panel
signal dispout: std_logic_vector(11 downto 0);
signal linkout: std_logic;
signal halt: std_logic;
-- CPU to IOT_Distributor
signal bit1_cp2: std_logic;
signal bit2_cp3: std_logic;
signal io_address: std_logic_vector(2 downto 0); -- abbreviated since we don't need all IO addresses
signal dataout : std_logic_vector (7 downto 0);
-- IOT_Distributor to CPU
signal skip_flag: std_logic; 
signal clearacc: std_logic;
signal datain: std_logic_vector(7 downto 0);
-- IOT_Distributor to UART
signal clear_3: std_logic; 
signal load_3: std_logic;
signal dataout_3: std_logic_vector(7 downto 0);
signal clear_4: std_logic; 
signal load_4: std_logic;
signal dataout_4: std_logic_vector(7 downto 0);
-- UART to IOT_Distributor
signal ready_3: std_logic; 
signal clearacc_3: std_logic;
signal datain_3: std_logic_vector(7 downto 0);
signal ready_4: std_logic; 
signal clearacc_4: std_logic;
signal datain_4: std_logic_vector(7 downto 0);
-- Signals in bus Memory
signal address: std_logic_vector (11 downto 0);
signal write_data: std_logic_vector (11 downto 0);
signal read_data: std_logic_vector (11 downto 0);
signal write_enable: std_logic;
signal read_enable: std_logic; -- added handshake signal to start read cycle
signal mem_finished: std_logic; -- added handshake signal 

-- System reset
begin

        Inst_IOT_Distributor: IOT_Distributor PORT MAP(
                ready_3 => ready_3,
                clear_3 => clear_3,
                clearacc_3 => clearacc_3,
                dataout_3 => dataout_3,
                datain_3 => datain_3,
                load_3 => load_3,
                ready_4 => ready_4,
                clear_4 => clear_4,
                clearacc_4 => clearacc_4,
                dataout_4 => dataout_4,
                datain_4 => datain_4,
                load_4 => load_4,
                skip_flag => skip_flag,
                bit1_cp2 => bit1_cp2,
                clearacc => clearacc,
                dataout => dataout,
                datain => datain,
                bit2_cp3 => bit2_cp3,
                io_address => io_address
        );


        Inst_Panel: Panel PORT MAP(
                clk => clk,
                dispout => dispout,
                linkout => linkout,
                halt => halt,
                swreg => swreg,
                dispsel => dispsel,
                run => run,
                loadpc => loadpc,
                loadac => loadac,
                step => step,
                deposit => deposit,
                sw => sw,
                btnc => btnc,
                btnu => btnu,
                btnd => btnd,
                btnl => btnl,
                btnr => btnr,
                btnCpuReset => btnCpuReset,
                reset => reset,
                led => led,
                seg => seg,
                an => an
        );


--        Inst_Memory: Memory PORT MAP(
--        Inst_Memory: Memory_Alternate PORT MAP(
        Inst_Memory: Memory_Module PORT MAP(
                clk => clk,
                reset => reset,
                address => address,
                write_data => write_data,
                read_data => read_data,
                write_enable => write_enable,
                read_enable => read_enable,
                mem_finished => mem_finished,
-- Memory_Module only
   	        RamCLK => RamCLK,
		RamADVn => RamADVn,
		RamCEn => RamCEn,
		RamCRE => RamCRE,
		RamOEn => RamOEn,
		RamWEn => RamWEn,
		RamLBn => RamLBn,
		RamUBn => RamUBn,
		RamWait => RamWait,
		MemDB => MemDB,
		MemAdr => MemAdr
        );


        Inst_CPU: CPU PORT MAP(
                clk => clk,
                reset => reset,
                address => address,
                write_data => write_data,
                read_data => read_data,
                write_enable => write_enable,
                read_enable => read_enable,
                mem_finished => mem_finished,
                swreg => swreg,
                dispsel => dispsel,
                run => run,
                loadpc => loadpc,
                loadac => loadac,
                step => step,
                deposit => deposit,
                dispout => dispout,
                linkout => linkout,
                halt => halt,
                bit1_cp2 => bit1_cp2,
                bit2_cp3 => bit2_cp3,
                io_address => io_address,
                dataout => dataout,
                skip_flag => skip_flag,
                clearacc => clearacc,
                datain => datain
        );

        Inst_UART: UART PORT MAP(
                clk => clk,
                rx => rsrx,
                tx => rstx,
                clear_3 => clear_3,
                load_3 => load_3,
                dataout_3 => dataout_3,
                ready_3 => ready_3,
                clearacc_3 => clearacc_3,
                datain_3 => datain_3,
                clear_4 => clear_4,
                load_4 => load_4,
                dataout_4 => dataout_4,
                ready_4 => ready_4,
                clearacc_4 => clearacc_4,
                datain_4 => datain_4
        );

end Behavioral;

