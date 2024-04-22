----------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com> 
-- 
-- Create Date:    13:52:21 05/03/2012 
-- Design Name: 
-- Module Name:    blob_sender - Behavioral 
-- Project Name: 
-- Target Devices: Spartan 6 
-- Tool versions: ISE 14.1 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

library work ;
use work.utils_pack.all ;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity blob_sender is
generic(NB_BLOB : positive	:=	16);
	port(
		clk	:	in std_logic ;
		resetn	:	in std_logic ;
		oe : in std_logic ;
		clear_blob	:	out std_logic ;
		ram_addr	:	out std_logic_vector(7 downto 0);
		ram_data_in		: in std_logic_vector(39 downto 0);
		blob_data : out std_logic_vector(7 downto 0); -- data of blob
		active	:	out std_logic ;
		send_blob	:	out std_logic 
	);
end blob_sender;

architecture Behavioral of blob_sender is
constant NEW_PACKET	: std_logic_vector(7 downto 0) := X"55" ;
type FRAME_MAE is (ACTIVE_FRAME, WAIT_NEW_FRAME, SEND_DATA, OUTPUT1, OUTPUT2, OUTPUT3, OUTPUT4, ERASE_BLOB, NEXT_BLOB);
signal frame_state, next_frame_state : FRAME_MAE ;
signal sraz_blob_addr, en_blob_addr : std_logic ;
signal blobxmin, blobxmax, blobymin, blobymax, width, height : unsigned(9 downto 0);
signal blobdatax, blobdatay, blobdataw, blobdatah : std_logic_vector(7 downto 0);
signal blob_addr  : std_logic_vector(7 downto 0);
begin

	blobxmin <= unsigned(ram_data_in(9 downto 0)) ; -- top left coordinate
	blobxmax <= unsigned(ram_data_in(19 downto 10)) ; -- top right coordinate

	blobymin <= unsigned(ram_data_in(29 downto 20)) ; -- bottom left coordinate
	blobymax <= unsigned(ram_data_in(39 downto 30)) ; -- bottom right coordinate
	 
	width  <= blobxmax - blobxmin ;
	height <= blobymax - blobymin ;

	blobdatax <= std_logic_vector(blobxmin(8 downto 1)) when (std_logic_vector(blobxmin(8 downto 1)) /= NEW_PACKET) else 
					 std_logic_vector(blobxmin(8 downto 1) - 1)	; 
	blobdatay <= std_logic_vector(blobymin(8 downto 1)) when std_logic_vector(blobymin(8 downto 1)) /= NEW_PACKET else
					 std_logic_vector(blobymin(8 downto 1) - 1)	; 

	blobdataw <= std_logic_vector(width(8 downto 1)) when std_logic_vector(width(8 downto 1)) /= NEW_PACKET else	
					 std_logic_vector(width(8 downto 1) - 1) ; -- bottom left coordinate
	blobdatah <= std_logic_vector(height(8 downto 1)) when std_logic_vector(height(8 downto 1)) /= NEW_PACKET else
					 std_logic_vector(height(8 downto 1) - 1) ; -- bottom right coordinate

	addr_counter0 :  simple_counter
	 generic map(NBIT => 4)
	 port map( clk => clk,
			  resetn => resetn,
			  sraz => sraz_blob_addr,
			  en => en_blob_addr,
			  load => '0', 
			  E => std_logic_vector(to_unsigned(0, 4)),
			  Q => blob_addr(3 downto 0)
			  );
	blob_addr(7 downto 4) <= (others => '0') ;
	ram_addr <= blob_addr ;
		
					  
	clear_blob <= '1' when frame_state = ERASE_BLOB else
					  '0' ;			 


	with frame_state select
		send_blob <= '1' when SEND_DATA,
						 '1' when OUTPUT1 ,
						 '1' when OUTPUT2 ,
						 '1' when OUTPUT3 ,
						 '1' when OUTPUT4 ,
						 '0' when others ;
							 
	with frame_state select
	blob_data <= NEW_PACKET when SEND_DATA,
					 --X"01" when OUTPUT1 ,
					 --X"02" when OUTPUT2 ,
					 --X"03" when OUTPUT3  ,
					 --X"04" when OUTPUT4 ,
					 blobdatax when OUTPUT1 ,
					 blobdatay when OUTPUT2 ,
					 blobdataw when OUTPUT3  ,
					 blobdatah when OUTPUT4 ,
					 X"00" when others ;
						 
	with frame_state select
	en_blob_addr <= '1' when ERASE_BLOB,
					 '0' when others ;
	with frame_state select
	sraz_blob_addr <= '1' when ACTIVE_FRAME,
				  '1' when WAIT_NEW_FRAME,
				 '0' when others ;

	with frame_state select
	active <= '0' when ACTIVE_FRAME,
					 '1' when others ;


	process(clk, resetn)
	begin
	if resetn = '0' then
		frame_state <= WAIT_NEW_FRAME ;
	elsif clk'event and clk = '1' then
		frame_state <= next_frame_state ;
	end if;
	end process ;
	
	process(frame_state, oe)
	begin
		next_frame_state  <= frame_state ;
		case frame_state is
			when ACTIVE_FRAME =>
				if oe = '1' then
					next_frame_state <= SEND_DATA ;
				end if ;
			when WAIT_NEW_FRAME => 
				if oe = '0' then
					next_frame_state <= ACTIVE_FRAME ;
				end if ;
			when SEND_DATA =>
				next_frame_state <= OUTPUT1 ;
			when OUTPUT1 =>
					next_frame_state <= OUTPUT2 ;
			when OUTPUT2 =>
					next_frame_state <= OUTPUT3 ;
			when OUTPUT3 =>
					next_frame_state <= OUTPUT4 ;
			when OUTPUT4 =>
					next_frame_state <= ERASE_BLOB ;
			when ERASE_BLOB =>
				if blob_addr = (NB_BLOB - 1)  OR oe = '0' then
					next_frame_state <= WAIT_NEW_FRAME ;
				else
					next_frame_state <= NEXT_BLOB ;
				end if ;
			when NEXT_BLOB =>
					next_frame_state <= OUTPUT1 ;
			when others => next_frame_state <= WAIT_NEW_FRAME ;
		end case ;
	end process ;


end Behavioral;

