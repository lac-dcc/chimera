library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity CPU2A03 is
	port(
			clk	:	in std_logic;
			reset	:	in std_logic;
			irq_in	:	in std_logic;
			nmi_in	:	in std_logic;
			addr	:	out std_logic_vector(15 downto 0);
			data_in	:	in std_logic_vector(7 downto 0);
			data_out	:	out std_logic_vector(7 downto 0);
			we	:	out std_logic;
			rd	:	out std_logic;
			sync	:	out std_logic
			);
end CPU2A03;

architecture behav of CPU2A03 is
  component core_6502
    port (clk	 	:in std_logic;
          reset	 	:in std_logic;
          irq_in	:in std_logic;
          nmi_in	:in std_logic;
          addr_pin 	:out std_logic_vector (15 downto 0);
          din	 	:in  std_logic_vector (7 downto 0);
          dout	 	:out std_logic_vector (7 downto 0);
          dout_oe  	:out std_logic;
          we_pin	:out std_logic;
          rd_pin	:out std_logic;
          sync	 	:out std_logic
         );
  end component;

signal dout_oe : std_logic;
begin

cpu1: core_6502 port map(clk,reset,irq_in,nmi_in,addr,data_in,data_out,dout_oe,we,rd,sync);

end behav;