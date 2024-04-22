library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;

package BaseComponents is
  -----------------------------------------------------------------------------
  -- operator base components
  -----------------------------------------------------------------------------
  component OperatorShared is
                             generic
                             (
                               operator_id : string;
                               const_operand : IStdLogicVector;
                               use_constant   : boolean := false;
                               zero_delay : boolean := false;
                               colouring : NaturalArray;
                               suppress_immediate_ack : BooleanArray
                               );
                           port (
                             -- req/ack follow level protocol
                             reqL                     : in BooleanArray;
                             ackR                     : out BooleanArray;
                             ackL                     : out BooleanArray;
                             reqR                     : in  BooleanArray;
                             -- data is array(n,m) or array(2n,m)
                             dataL                    : in StdLogicArray2D;
                             dataR                    : out StdLogicArray2D;
                             -- with dataR
                             clk, reset               : in std_logic);
  end component OperatorShared;

  component InputMuxBase is
                           generic (
                             colouring  : NaturalArray;
                             suppress_immediate_ack : BooleanArray );
                         port (
                           -- req/ack follow pulse protocol
                           -- arrays of length n
                           reqL                 : in  BooleanArray;
                           ackL                 : out BooleanArray;
                           -- dataL is array(n,m) or array(2n,m)
                           dataL                : in  StdLogicArray2D;
                           -- reqR/ackR follow level protocol
                           reqR                : out std_logic;
                           ackR                : in  std_logic;
                           -- dataR is array(1,m) or array(2,m)
                           dataR               : out StdLogicArray2D;
                           -- tag specifies the index of the
                           -- operation which is selected
                           tagR                : out std_logic_vector;
                           clk, reset          : in std_logic);
  end  component InputMuxBase;

  component InputMuxBase_32 is
                           generic (
                             colouring  : NaturalArray;
                             suppress_immediate_ack : BooleanArray );
                         port (
                           -- req/ack follow pulse protocol
                           -- arrays of length n
                           reqL                 : in  BooleanArray;
                           ackL                 : out BooleanArray;
                           -- dataL is array(n,m) or array(2n,m)
                           dataL                : in  StdLogicArray2D;
                           -- reqR/ackR follow level protocol
                           reqR                : out std_logic;
                           ackR                : in  std_logic;
                           -- dataR is array(1,m) or array(2,m)
                           dataR               : out StdLogicArray2D;
                           -- tag specifies the index of the
                           -- operation which is selected
                           tagR                : out std_logic_vector;
                           clk, reset          : in std_logic);
  end  component InputMuxBase_32;

  component OperatorBase is
                           generic
                           (
                             operator_id : string;
                             const_operand : IStdLogicVector;
                             use_constant   : boolean := false;
                             zero_delay  : boolean := false
                             );
                         port (
                           -- req/ack follow level protocol
                           ackL,reqR                : out std_logic;
                           ackR,reqL                : in  std_logic;
                           -- tagL is passed out to tagR
                           tagL                     : in std_logic_vector;           
                           -- data is array(1,m) or array(2,m)
                           dataL                    : in StdLogicArray2D;
                           dataR                    : out IStdLogicVector;
                           -- tagR is received from tagL, concurrent
                           -- with dataR
                           tagR                     : out std_logic_vector;
                           clk, reset               : in std_logic);
  end component OperatorBase;

  component OutputDeMuxBase is
                              generic (
                                colouring  : NaturalArray;
                                pulse_ack_dominant: boolean := false);
                            port (
                              -- req/ack follow level protocol
                              reqL                 : in  std_logic;
                              ackL                 : out std_logic;
                              dataL                : in  std_logic_vector;
                              -- tag identifies index to which demux
                              -- should happen
                              tagL                 : in std_logic_vector;
                              -- reqR/ackR follow pulse protocol
                              -- and are of length n
                              reqR                : in BooleanArray;
                              ackR                : out  BooleanArray;
                              -- dataR is array(n,m) 
                              dataR               : out StdLogicArray2D;
                              clk, reset          : in std_logic);
  end component OutputDeMuxBase;

  component OperatorSharedTB is
     generic
     ( g_num_req: integer := 2;
       operator_id: string := "ApIntAdd";
       zero_delay : boolean := false;
       verbose_mode: boolean := false;
       tb_id : string := "anonymous"
     );
  end component OperatorSharedTB;

  component ApInt_S_2_TB is
    generic
       ( g_num_req: integer := 2;
         g_input_data_width: integer := 8;
         g_output_data_width: integer := 8;
         verbose_mode: boolean := false;
         operator_id : string := "ApIntAdd";
         tb_id : string := "anonymous"
       );
    port
      (all_tests_succeeded :out boolean;
       all_tests_evaluated :out boolean);
  end component ApInt_S_2_TB;

  component ApInt_S_2_C_TB is
    generic
      (g_num_req     : integer := 2;
        g_input_data_width : integer := 8;
        g_output_data_width : integer := 8;
        verbose_mode : boolean := false;
        operator_id  : string  := "ApIntAdd";
        tb_id        : string  := "anonymous"
        );
    port
      (all_tests_succeeded :out boolean;
       all_tests_evaluated :out boolean);
  end component ApInt_S_2_C_TB;
  
  component ApInt_S_1_TB is
    generic
      ( g_num_req     : integer := 2;
        g_input_data_width : integer := 8;
        g_output_data_width : integer := 8;
        verbose_mode : boolean := false;
        operator_id  : string  := "ApIntNot";
        tb_id        : string  := "anonymous"
        );
    port
      (all_tests_succeeded :out boolean;
       all_tests_evaluated :out boolean);
  end component ApInt_S_1_TB;

end BaseComponents;
