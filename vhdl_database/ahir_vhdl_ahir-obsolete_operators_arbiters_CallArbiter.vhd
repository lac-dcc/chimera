library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity CallArbiter is
  port ( -- ready/ready handshake on all ports
    -- ports for the caller
    call_reqs   : in  std_logic_vector;
    call_acks   : out std_logic_vector;
    call_data   : in  StdLogicArray2D;
    -- call port connected to the called module
    call_mreq   : out std_logic;
    call_mack   : in  std_logic;
    call_mdata  : out std_logic_vector;
    call_mtag   : out std_logic_vector;
    -- similarly for return, initiated by the caller
    return_reqs : in  std_logic_vector;
    return_acks : out std_logic_vector;
    return_data : out StdLogicArray2D;
    -- return from function
    -- function to assert mreq arbiter to return mack
    -- ( NOTE: It has to be this way, the arbiter should
    -- accept the return value if it has room)
    return_mreq : in std_logic;
    return_mack : out std_logic;
    return_mdata : in  std_logic_vector;
    return_mtag : in  std_logic_vector;
    clk: in std_logic;
    reset: in std_logic);
end CallArbiter;


architecture Struct of CallArbiter is
   alias lcall_reqs: std_logic_vector(call_reqs'length-1 downto 0) is call_reqs;
   alias lcall_acks: std_logic_vector(call_acks'length-1 downto 0) is call_acks;
   alias lreturn_reqs: std_logic_vector(return_reqs'length-1 downto 0) is return_reqs;
   alias lreturn_acks: std_logic_vector(return_acks'length-1 downto 0) is return_acks;

   signal pe_call_reqs: std_logic_vector(call_reqs'length-1 downto 0);
   signal return_mack_sig, lreturn_acks_sig: std_logic_vector(return_acks'length-1 downto 0);

   type TwordArray is array (natural range <>) of std_logic_vector(return_mdata'length-1 downto 0);
   signal return_data_sig : TwordArray(return_data'length(1)-1 downto 0);
begin

  -----------------------------------------------------------------------------
  -- priority encode incoming
  -----------------------------------------------------------------------------
   pe_call_reqs <= PriorityEncode(lcall_reqs);

   ----------------------------------------------------------------------------
   -- combinational process to handle call_reqs  --> call_mreq muxing
   ----------------------------------------------------------------------------
   process(pe_call_reqs, call_data, call_mack)
     variable lcall_data : StdLogicArray2D(call_data'length(1)-1 downto 0, call_data'length(2)-1 downto 0);
     variable there_is_a_call : std_logic;
     variable out_data : std_logic_vector(call_data'length(2)-1 downto 0);
     variable out_tag : std_logic_vector(call_mtag'length-1 downto 0);
   begin
     there_is_a_call := OrReduce(pe_call_reqs);
     out_tag := (others => '0');
     out_data := (others => '0');
     lcall_acks <= (others => '0');
     if(there_is_a_call = '1') then
       lcall_data := call_data;
       for I in lcall_data'length(1)-1 downto 0 loop
         if(pe_call_reqs(I) = '1') then
           out_data := Extract(lcall_data,I);
           out_tag := To_SLV(To_Unsigned(I,out_tag'length));
           lcall_acks(I) <= call_mack;
         end if;
       end loop;  -- I
     end if;
     call_mreq <= there_is_a_call;
     call_mtag <= out_tag;
     call_mdata <= out_data;
   end process;

   ----------------------------------------------------------------------------
   -- reverse path
   ----------------------------------------------------------------------------

   -- pack registers into return data array
   process(return_data_sig)
     variable lreturn_data : StdLogicArray2D(return_data'length(1)-1 downto 0, return_data'length(2)-1 downto 0);
   begin
     for J in return_data'length(1)-1 downto 0 loop
       Insert(lreturn_data,J,return_data_sig(J));
     end loop;  -- J
     return_data <= lreturn_data;
   end process;

   -- the acks in both directions
   lreturn_acks <= lreturn_acks_sig;
   return_mack <= OrReduce(return_mack_sig);
   
   -- incoming data written into appropriate register.
   RetGen: for I in return_reqs'length-1 downto 0 generate

     fsm: block
       signal ack_reg, mack_sig, valid_flag : std_logic;
       signal data_reg : std_logic_vector(return_mdata'length-1 downto 0);
     begin  -- block fsm

       -- valid = '1' implies this index is incoming
       valid_flag <= '1' when return_mreq = '1' and return_mtag = To_SLV(To_Unsigned(I,return_mtag'length)) else '0';

       -- mack if valid and mreq and (either ack bit is not set or return_reqs
       -- is asserted)
       mack_sig <= (lreturn_reqs(I) or (not ack_reg)) and return_mreq and valid_flag;

       --------------------------------------------------------------------------
       -- ack ff
       --------------------------------------------------------------------------
       -- set if mack_sig is asserted, else clear if return_reqs is asserted
       -- and register is already set.
       process(clk)
       begin
         if clk'event and clk= '1' then
           if(reset = '1') then
             ack_reg <= '0';
           elsif mack_sig = '1' then
             ack_reg <= '1';
           elsif lreturn_reqs(I) = '1' and ack_reg = '1' then
             ack_reg <= '0';
           end if;

           -- register data when you send mack
           if(mack_sig = '1') then
             data_reg <= return_mdata;
           end if;
         end if;
       end process;

       -- pass info out of the generate
       lreturn_acks_sig(I) <= (lreturn_reqs(I) and ack_reg);
       return_data_sig(I) <= data_reg;
       return_mack_sig(I) <= mack_sig;
       
     end block fsm;

     
   end generate RetGen;
end Struct;
