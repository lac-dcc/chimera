-- Create Date: 21.05.2016 12:38:42
-- Design Name: 
-- Module Name: ENCAPS_DECAPS - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all; 
use work.salutil.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity modify_field is

generic (C_S00_AXI_DATA_WIDTH : integer := 32;
C_S00_AXI_ADDR_WIDTH : integer := 32
);

Port (   axis_aclk         : in std_logic;
axis_resetn       : in std_logic;
s_axis            :in axis;
--s_axis_tdata      : in std_logic_vector (255 downto 0);
--s_axis_tkeep      : in std_logic_vector (31 downto 0);
--s_axis_tuser      : in std_logic_vector (127 downto 0);
--s_axis_tvalid     : in std_logic;
--s_axis_tlast      : in std_logic; 
s_axis_tready     : out std_logic;

m_axis            : out axis;
--m_axis_tdata      : out std_logic_vector(255 downto 0);
--m_axis_tkeep      : out std_logic_vector(31 downto 0);
--m_axis_tuser      : out std_logic_vector(127 downto 0);
--m_axis_tvalid     : out std_logic;
--m_axis_tlast      : out std_logic;
m_axis_tready     : in std_logic;


in_offset		   : in std_logic_vector(13 downto 0);
in_size		   : in std_logic_vector(1 downto 0);
in_field		   : in std_logic_vector(31 downto 0);
enable          : std_logic
);

end modify_field;

architecture Behavioral of modify_field is

type state_type is (
        IDLE,	      -- Waiting of packet
        --HEADER,       -- Wait for insert
        --STAMP,        -- Stamp field
        --REALIGN,    -- Realigning packets
        --EXTRA_SLOT, -- if needed
        WAIT_EOP      -- Wait for end
);
signal offset: std_logic_vector(13 downto 0);
signal reg_offset: std_logic_vector(13 downto 0); 
signal size: std_logic_vector(1 downto 0);
signal reg_size: std_logic_vector(1 downto 0); 
signal field: std_logic_vector(31 downto 0);
signal reg_field: std_logic_vector(31 downto 0); 

signal state : state_type;
signal relative_offset,counter: integer; --std_logic_vector(31 downto 0);
signal index:integer:=0;
begin


relative_offset <=to_integer(unsigned(offset))-counter;
index<=to_integer(unsigned(offset(4 downto 0)));
--shifted  <= extended(31+i downto i);


m_axis.tkeep<=s_axis.tkeep;
m_axis.tuser<=s_axis.tuser;
m_axis.tlast<=s_axis.tlast;
m_axis.tvalid<=s_axis.tvalid;
s_axis_tready<=m_axis_tready;



process (size,relative_offset,s_axis.tdata,field,index)
    begin
        
        m_axis.tdata <= s_axis.tdata;
        if (size="01") then 
--           if ((relative_offset>=0) and (relative_offset<=31)) then                    
--               m_axis.tdata(index+7 downto index) <= field(7 downto 0);
--           end if;
            if (relative_offset>31) then
                -- do nothing for now
                m_axis.tdata <= s_axis.tdata;
            
            elsif (relative_offset=0) then
                  m_axis.tdata <= s_axis.tdata(247 downto 0) & field(7 downto 0);   
           
           elsif ((relative_offset>0) and (relative_offset<31)) then
           m_axis.tdata(7 downto 0)<=s_axis.tdata(7 downto 0);
                for i in 1 to 31 loop
                  if (i<index) then m_axis.tdata(8*i+7 downto 8*i)<=s_axis.tdata(8*i+7 downto 8*i);
                  elsif (i=index) then m_axis.tdata(8*i+7 downto 8*i)<=field(7 downto 0);
                  else m_axis.tdata(8*i+7 downto 8*i)<=s_axis.tdata(8*i+7 downto 8*i);
                  end if;
                end loop;
          end if; 
        
        elsif (size="10") then
--            if ((relative_offset>=0) and (relative_offset<=30)) then
--                m_axis.tdata(index+15 downto index) <= field(15 downto 0);
                if (relative_offset>31) then
                -- do nothing for now
                    m_axis.tdata <= s_axis.tdata;
                
                elsif (relative_offset=0) then
                     m_axis.tdata <= s_axis.tdata(239 downto 0) & field(15 downto 0);  
                
              elsif ((relative_offset>0) and (relative_offset<30)) then  
              m_axis.tdata(15 downto 0)<=s_axis.tdata(15 downto 0);
              for i in 2 to 31 loop
                if (i<index) then m_axis.tdata(8*i+7 downto 8*i)<=s_axis.tdata(8*i+7 downto 8*i);
                elsif (i=index)   then m_axis.tdata(8*i+7 downto 8*i)<=field(7 downto 0);
                elsif (i=index+1) then m_axis.tdata(8*i+7 downto 8*i)<=field(15 downto 8);
                else m_axis.tdata(8*i+7 downto 8*i)<=s_axis.tdata(8*i+7 downto 8*i);
                end if;
              end loop;
            elsif (relative_offset=31) then
                m_axis.tdata <= field(7 downto 0) & s_axis.tdata(247 downto 0);
                --m_axis.tdata(255 downto 247) <= field(7 downto 0);
            elsif (relative_offset=-1) then
               m_axis.tdata <=s_axis.tdata(255 downto 8)& field(15 downto 8);
               -- m_axis.tdata(7 downto 0) <= field(15 downto 8);
            --end if;
            
        end if;
        
        elsif (size="11") then 
--            if ((relative_offset>=0) and (relative_offset<=28)) then
--                m_axis.tdata(index+31 downto index) <= field;
            --split the field in two frames
            if ((relative_offset>0) and (relative_offset<28)) then
                        --m_axis_tdata <= s_axis_tdata(223 downto index) & field & s_axis_tdata(index-1 downto 0); --FIXME
                        m_axis.tdata(31 downto 0) <= s_axis.tdata(31 downto 0);
                        for i in 4 to 31 loop
                          if (i<index) then m_axis.tdata(8*i+7 downto 8*i)<=s_axis.tdata(8*i+7 downto 8*i);
                          elsif (i=index)   then m_axis.tdata(8*i+7 downto 8*i)<=field(7 downto 0);
                          elsif (i=index+1) then m_axis.tdata(8*i+7 downto 8*i)<=field(15 downto 8);
                          elsif (i=index+2) then m_axis.tdata(8*i+7 downto 8*i)<=field(23 downto 16);
                          elsif (i=index+3) then m_axis.tdata(8*i+7 downto 8*i)<=field(31 downto 24);
                          else m_axis.tdata(8*i+7 downto 8*i)<=s_axis.tdata(8*i+7 downto 8*i);
                          end if;
                        end loop;
              elsif (relative_offset=0) then
                   m_axis.tdata <= s_axis.tdata(223 downto 0) & field;
              elsif (relative_offset=28) then
                   m_axis.tdata <= field & s_axis.tdata(223 downto 0);
                        
            elsif (relative_offset=29) then
                m_axis.tdata <= field(23 downto 0) & s_axis.tdata(231 downto 0);
            elsif (relative_offset=30) then
                m_axis.tdata <= field(15 downto 0) & s_axis.tdata(239 downto 0);
            elsif (relative_offset=31) then
                m_axis.tdata <= field(7 downto 0) & s_axis.tdata(247 downto 0);                        
            elsif (relative_offset=-1) then
                m_axis.tdata <= s_axis.tdata(255 downto 24) & field(31 downto 8);
            elsif (relative_offset=-2) then
                m_axis.tdata <= s_axis.tdata(255 downto 16) & field(31 downto 16);
            elsif (relative_offset=-3) then
                m_axis.tdata <= s_axis.tdata(255 downto 8) & field(31 downto 24);                                                
            end if; 
         else
         m_axis.tdata <= s_axis.tdata;  
        end if;                  
end process;

offset <= in_offset when (enable ='1') else reg_offset;
size <= in_size when (enable ='1') else reg_size;
field <= in_field when (enable ='1') else reg_field;
process (axis_aclk)
	begin
	if (axis_aclk = '1' and axis_aclk'event) then                                          
	   if (axis_resetn = '0') then 
	       state <= IDLE;
	       counter<=0;
	   else
	   case state is
           when IDLE =>
            if (s_axis.tvalid='1') and (m_axis_tready = '1') then
                state<=WAIT_EOP;
                counter<=counter+32;
                reg_offset <=in_offset;
                reg_size<=in_size;
                reg_field <=in_field;
            end if;
           when WAIT_EOP => 
            if (s_axis.tvalid='1') and (m_axis_tready = '1') and (s_axis.tlast='1') then
                state<=IDLE;
                counter<=0;
            end if;                                    
       end case;       
	   end if;
	end if;
end process;

end Behavioral;


