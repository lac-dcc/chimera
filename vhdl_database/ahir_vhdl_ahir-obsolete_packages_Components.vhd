-- all component declarations necessary for the
-- vhdl generator
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;

package Components is

  component place
    generic (
      marking : boolean); 
    port (
      preds : in  BooleanArray;
      succs : in  BooleanArray;
      token : out boolean;
      clk   : in  std_logic;
      reset : in  std_logic); 
  end component;

  component transition
    port (
      preds      : in BooleanArray;
      symbol_in  : in boolean;
      symbol_out : out boolean); 
  end component;

  component TagLatch
    port (
      clk, reset : in  std_logic;
      r, a       : in  std_logic;
      tag_in     : in  std_logic_vector;
      tag_out    : out std_logic_vector); 
  end component;

  component ApIntBranch is
                          port (condition: in ApInt;
                                clk,reset: in std_logic;
                                req: in Boolean;
                                ack0: out Boolean;
                                ack1: out Boolean);
  end component;

  component ApIntPhi is
                       port(x,y: in ApInt;
                            reqx,reqy: in boolean;
                            z: out ApInt;
                            ack: out boolean;
                            clk,reset: in std_logic);
  end component;

  component ApInt_S_1 is
                        generic(colouring: NaturalArray);
                      port (x: in ApIntArray;
                            clk,reset: in std_logic;
                            reqR,reqC: in BooleanArray;
                            ackR,ackC: out BooleanArray;
                            z: out ApIntArray);
  end component;

  component ApInt_S_2_C is
                          generic (const_operand: ApInt; colouring: NaturalArray);
                        port (x: in ApIntArray;
                              clk,reset: in std_logic;
                              reqR,reqC: in BooleanArray;
                              ackR,ackC: out BooleanArray;
                              z: out ApIntArray);
  end component;

  component ApInt_S_2 is
                        generic (colouring: NaturalArray);
                      port (x,y: in ApIntArray;
                            clk,reset: in std_logic;
                            reqR,reqC: in BooleanArray;
                            ackR,ackC: out BooleanArray;
                            z: out ApIntArray);
  end component;

  component ApIntSelect is
                          port(x,y,sel: in ApInt;
                               req: in boolean;
                               z: out ApInt;
                               ack: out boolean;
                               clk,reset: in std_logic);
  end component ApIntSelect;

  component ApFloatPhi is
                         port(x,y: in ApFloat;
                              reqx,reqy: in boolean;
                              z: out ApFloat;
                              ack: out boolean;
                              clk,reset: in std_logic);
  end component ApFloatPhi;

  component ApFloatSelect is
                            port(x,y: in ApFloat;
                                 sel: in ApInt;
                                 req: in boolean;
                                 z: out ApFloat;
                                 ack: out boolean;
                                 clk,reset: in std_logic);
  end component ApFloatSelect;

  component ApFloat_S_1 is
                          generic(colouring: NaturalArray);
                        port (x: in ApFloatArray;
                              clk,reset: in std_logic;
                              reqR,reqC: in BooleanArray;
                              ackR,ackC: out BooleanArray;
                              z: out ApFloatArray);
  end component;

  component ApFloat_S_2_C is
                            generic (const_operand: ApFloat; colouring: NaturalArray);
                          port (x: in ApFloatArray;
                                clk,reset: in std_logic;
                                reqR,reqC: in BooleanArray;
                                ackR,ackC: out BooleanArray;
                                z: out ApFloatArray);
  end component;

  component ApFloat_S_2 is
		generic (colouring: NaturalArray);
		      port (x,y: in ApFloatArray;
			    clk,reset: in std_logic;
			    reqR,reqC: in BooleanArray;
			    ackR,ackC: out BooleanArray;
			    z: out ApFloatArray);
  end component;

  component ApFloat_Cmp_2 is
                          generic (colouring: NaturalArray);
                        port (x,y: in ApFloatArray;
                              clk,reset: in std_logic;
                              reqR,reqC: in BooleanArray;
                              ackR,ackC: out BooleanArray;
                              z: out ApIntArray);
  end component;
  
  component ApFloat_Cmp_2_C is
			  generic (const_operand: ApFloat; colouring: NaturalArray);
			  port (x: in ApFloatArray;
			      clk,reset: in std_logic;
			      reqR,reqC: in BooleanArray;
			      ackR,ackC: out BooleanArray;
			      z: out ApIntArray);
  end component;

  component ApFloatToApInt_S_1
    generic (
      colouring : NaturalArray);
    port (
      x          : in  ApFloatArray;
      clk, reset : in  std_logic;
      reqR, reqC : in  BooleanArray;
      ackR, ackC : out BooleanArray;
      z          : out ApIntArray);
  end component;

  component ApIntToApFloat_S_1
    generic (
      colouring : NaturalArray);
    port (
      x          : in  ApIntArray;
      clk, reset : in  std_logic;
      reqR, reqC : in  BooleanArray;
      ackR, ackC : out BooleanArray;
      z          : out ApFloatArray);
  end component;

  component ApLoadReq is
                        generic (
                          width: NaturalArray;
                          suppress_immediate_ack: BooleanArray
                          );
                      port (
                        addr : in ApIntArray;
                        req : in BooleanArray;
                        ack : out BooleanArray;
                        mreq : out std_logic_vector;
                        mack : in  std_logic_vector;
                        maddr : out std_logic_vector;
                        mtag : out std_logic_vector;
                        clk : in std_logic;
                        reset : in std_logic);
  end component ApLoadReq;

  component ApLoadComplete
    generic (
      width : NaturalArray); 
    port (
      req   : in  BooleanArray;
      ack   : out BooleanArray;
      data  : out StdLogicArray2D;
      mreq  : out std_logic_vector;
      mack  : in  std_logic_vector;
      mtag  : in  std_logic_vector;
      mdata : in  std_logic_vector;
      clk   : in  std_logic;
      reset : in  std_logic); 
  end component;

  component ApStoreReq
    generic (
      width : NaturalArray;
      suppress_immediate_ack: BooleanArray      
      );
    port (
      addr  : in  ApIntArray;
      data  : in  StdLogicArray2D;
      req   : in  BooleanArray;
      ack   : out BooleanArray;
      mreq  : out std_logic_vector;
      mack  : in  std_logic_vector;
      maddr : out std_logic_vector;
      mdata : out std_logic_vector;
      mtag  : out std_logic_vector;
      clk   : in  std_logic;
      reset : in  std_logic);
  end component;
  
  component ApStoreComplete is
                              generic (
                                width: NaturalArray
                                );
                            port (
                              req : in BooleanArray;
                              ack : out BooleanArray;
                              mreq : out std_logic_vector;
                              mack : in  std_logic_vector;
                              mtag : in std_logic_vector;
                              clk : in std_logic;
                              reset : in std_logic);
  end component ApStoreComplete;

  component InputPort is
  generic (colouring: NaturalArray);
  port (
    -- pulse interface with the data-path
    req       : in  BooleanArray;
    ack       : out BooleanArray;
    data      : out StdLogicArray2D;
    -- ready/ready interface with outside world
    oreq       : out std_logic;
    oack       : in  std_logic;
    odata      : in  std_logic_vector;
    clk, reset : in  std_logic);
  end component;

  component InputPortLevel
    generic (
      colouring : NaturalArray); 
    port (
      req        : in  std_logic_vector;
      ack        : out std_logic_vector;
      data       : out StdLogicArray2D;
      oreq       : out std_logic;
      oack       : in  std_logic;
      odata      : in  std_logic_vector;
      clk, reset : in  std_logic); 
  end component;

  component OutputPort is
  generic(colouring: NaturalArray);
  port (
    req       : in  BooleanArray;
    ack       : out BooleanArray;
    data      : in  StdLogicArray2D;
    oreq       : out std_logic;
    oack       : in  std_logic;
    odata      : out std_logic_vector;
    clk, reset : in  std_logic);
  end component;

  component OutputPortLevel
    generic (
      colouring : NaturalArray); 
    port (
      req        : in  std_logic_vector;
      ack        : out std_logic_vector;
      data       : in  StdLogicArray2D;
      oreq       : out std_logic;
      oack       : in  std_logic;
      odata      : out std_logic_vector;
      clk, reset : in  std_logic); 
  end component;

  component CallArbiter
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
  end component;


end Components;
