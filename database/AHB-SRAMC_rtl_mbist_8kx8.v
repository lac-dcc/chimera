module mbist_8kx8 
#(parameter WE_WIDTH = 1,
  parameter ADDR_WIDTH = 13,
  parameter DATA_WIDTH = 8
 )
 (
  //input signals
  input                      b_clk,    // bist clock	
  input                      b_rst_n,  // bist resetn
  input                      b_te,     // bist enable
  input [(ADDR_WIDTH-1):0]   addr_fun, // Address
  input [(WE_WIDTH-1):0]     wen_fun,  // write enable
  input                      cen_fun,  // chip enable
  input                      oen_fun,  // ouput enable
  input [(DATA_WIDTH-1):0]   data_fun, // data input
  input [(DATA_WIDTH-1):0]   ram_read_out, //RAM data output

  //output signals
  output [(ADDR_WIDTH-1):0]  addr_test, // address of test
  output [(WE_WIDTH-1):0]    wen_test,  // writing control of bist test mode
  output                     cen_test,  // chip enable control of bist test mode
  output                     oen_test,  // output enable control of bist test mode
  output [(DATA_WIDTH-1):0]  data_test, // data input of bist test mode
  output				             b_done,    // output state of bist test mode
                                        // When "bist_done" is high, it shows BIST test is over.

  output reg                 b_fail     // output result of sram function
                                        // When "bist_fail" is high, the sram function is wrong;
                                        // else, the sram function is right.
);

  //----------------------------------------------------
  //Define 27 work states of BIST block for bist test
  //----------------------------------------------------
  `define IDEL1         5'b00000
  `define P1_WRITE0     5'b00001
  `define IDEL2         5'b00010
  `define P2_READ0      5'b00011
  `define P2_COMPARE0   5'b00100
  `define P2_WRITE1     5'b00101
  `define IDEL3         5'b00110
  `define P3_READ1      5'b00111
  `define P3_COMPARE1   5'b01000
  `define P3_WRITE0     5'b01001
  `define P3_READ0      5'b01010
  `define P3_COMPARE0   5'b01011
  `define P3_WRITE1     5'b01100
  `define IDEL4         5'b01101
  `define P4_READ1      5'b01110
  `define P4_COMPARE1   5'b01111
  `define P4_WRITE0     5'b10000
  `define IDEL5         5'b10001
  `define P5_READ0      5'b10010
  `define P5_COMPARE0   5'b10011
  `define P5_WRITE1     5'b10100
  `define P5_READ1      5'b10101
  `define P5_COMPARE1   5'b10110
  `define P5_WRITE0     5'b10111
  `define IDEL6         5'b11000
  `define P6_READ0      5'b11001
  `define P6_COMPARE0   5'b11010
  
  // sram address when in bist test mode
  reg [(ADDR_WIDTH-1):0] test_addr;
  
  // bist test end signal
  reg r_end;
  reg r_end_en;
 
  // sram address reset when in bist test mode.
  reg test_addr_rst;

  // sram read or write enable signal when in bist test mode
  reg [(WE_WIDTH-1):0] wen_test_inner;

  // bist start to work in IDLE
  reg rf_start;
  
  // compare the data read from sram with the data written into sram 
  // enable signal
  reg check_en;

  // bist test data source select signal
  // "pattern_sel == 1'b0"-----> test_pattern =  32'b0;
  // "pattern_sel == 1'b1"-----> test_pattern =  32'b1;
  reg pattern_sel;
  wire [(DATA_WIDTH-1):0] test_pattern;
  reg [4:0] cstate, nstate;
  // 1 -- address is goign upward; 0 -- address is going downward
  reg up1_down0; 
  // 1 -- address is stepping; 0 -- address remains
  reg count_en;  


  //-----------------------------------------------------------------
  //          Main Code
  //-----------------------------------------------------------------

  //-----------------------------------------------------------------
  //     Combinatorial portion
  //-----------------------------------------------------------------
  assign b_done = r_end;
  assign test_pattern = (pattern_sel == 1'b0) ? {DATA_WIDTH{1'b0}} : {DATA_WIDTH{1'b1}};

  //--------------------------------------------------------------------
  // The output values of all the mux below will be changed based on the
  // sram whether in normal operation or in bist test mode. 
  //---------------------------------------------------------------------
  // b_te 打开的话就选择测试一侧的，否则就选择功能一侧的fun
  assign data_test = (b_te == 1'b1) ? test_pattern   : data_fun;
  assign addr_test = (b_te == 1'b1) ? test_addr      : addr_fun;
  assign wen_test  = (b_te == 1'b1) ? wen_test_inner : wen_fun;
  assign cen_test  = (b_te == 1'b1) ? 1'b0           : cen_fun;
  assign oen_test  = (b_te == 1'b1) ? 1'b0           : oen_fun;

  //--------------------------------------------------------------------
  //    Sequential portion
  //--------------------------------------------------------------------

  //--------------------------------
  // Generate bist work end signal. 
  //--------------------------------
  always @(posedge b_clk , negedge b_rst_n) begin
    if (b_rst_n == 1'b0) 
       r_end<=1'b0;
    else if (r_end_en == 1'b1) 
       r_end<= 1'b1;
       else
         r_end <= 1'b0;
  end
  //----------------------------------------------------
  //          Generate the sram test address.
  // "test_addr_rst " and "up1_down0" decide the mode of 
  // variable the address(increment/decrement). 
  //-----------------------------------------------------
  always @(posedge b_clk , negedge b_rst_n) begin
    if (b_rst_n == 1'b0) 
       test_addr <= {ADDR_WIDTH{1'b0}};
    else if (b_te == 1'b1) 
  	  if (test_addr_rst == 1'b1) 
           if (up1_down0 == 1'b1)
          	  test_addr<=  {ADDR_WIDTH{1'b0}};
           else
              test_addr<=  {ADDR_WIDTH{1'b1}};
     	else
           if (count_en == 1'b1)
               if (up1_down0 == 1'b1)
          	      test_addr<=  test_addr + 1'b1; // 地址从小往大扫描
               else
                  test_addr<=  test_addr - 1'b1; // 地址从大往小扫描
  end

  always @(posedge b_clk , negedge b_rst_n)
    if (b_rst_n == 1'b0) 
       b_fail<=1'b1;
    else begin
      //---------------------------------------------------------
      //  When in bist idle1 state, "b_fail" defualt value is "0".
      // --------------------------------------------------------
      if ((b_te == 1'b1) && (rf_start == 1'b1)) // 重新启动清零
          b_fail<=  1'b0;

      //------------------------------------------------------------
      //  "b_fail" value is "1", when data read from sram is different
      // from the expected data wirtten into sram.
      //--------------------------------------------------------------
      if ((b_te == 1'b1) && (check_en == 1'b1) && !(test_pattern == ram_read_out)) // 写的跟读出的是否一致
          b_fail<=  1'b1;
     end
  
  //------------------------------------------------------------------------------
  //                    Bist test state machine(知道了解即可)
  //   write "0"(initial sram)                         test_address 0-->1fff
  //   read  "0"------> compare -------->write "1"     test_address 1fff-->0
  //   read  "1"------> compare -------->write "0"     test_address 0-->1fff
  //   write "1"------> read "1"-------->compare       test_address 1fff-->0        
  //   write "0"------> read "0"-------->compare       test_address 0-->1fff        
  //   write "1"------> read "1"-------->compare       test_address 1fff-->0        
  //   write "0"------> read "0"-------->compare       test_address 0-->1fff        
  //------------------------------------------------------------------------------
  always @(posedge b_clk , negedge b_rst_n) begin
    if (b_rst_n == 1'b0) 
          cstate<=`IDEL1;
    else
          cstate<= nstate;
  end
  
  always @(cstate or b_te or r_end or test_addr) begin
    up1_down0     = 1'b1;
    count_en      = 1'b0;
    r_end_en      = 1'b0;
    pattern_sel   = 1'b0;
    test_addr_rst = 1'b0;
    rf_start      = 1'b0;
    check_en      = 1'b0;
    wen_test_inner = {WE_WIDTH{1'b1}};
    nstate        = cstate;
    case (cstate)
      `IDEL1 :
          begin
             test_addr_rst = 1'b1;
             if (b_te == 1'b1 && r_end == 1'b0) begin
                   nstate   = `P1_WRITE0;
                   rf_start = 1'b1;
             end
          end
      `P1_WRITE0 :   //initial sram from addr 0~1fff(16K) 做bist的时候不会去考虑低功耗了，看到的就是0-16K
          begin
    	    count_en       = 1'b1;
    	    wen_test_inner = {WE_WIDTH{1'b0}};
    	    pattern_sel    = 1'b0;
             if (test_addr == {ADDR_WIDTH{1'b1}} ) begin
                  nstate        = `IDEL2;
                  test_addr_rst = 1'b1;
    	            up1_down0     = 1'b0;
             end
          end
      `IDEL2 :
          begin
    	      pattern_sel   = 1'b0;
    	      up1_down0     = 1'b0;
            test_addr_rst = 1'b1; 
            nstate        = `P2_READ0;
          end
      `P2_READ0 :
          begin
            nstate = `P2_COMPARE0;
          end
      `P2_COMPARE0 :  //compare all "0" data after read from addr 0~1fff
          begin
             pattern_sel = 1'b0;
    	       check_en    = 1'b1;
             nstate      = `P2_WRITE1;
          end
      `P2_WRITE1 :  //all "1" write test from addr 1fff~0
          begin
    	      up1_down0      = 1'b0;
    	      count_en       = 1'b1;
    	      wen_test_inner = {WE_WIDTH{1'b0}};
    	      pattern_sel    = 1'b1;
             if (test_addr == {ADDR_WIDTH{1'b0}}) begin
                  nstate        = `IDEL3;
                  test_addr_rst = 1'b1;
    	          up1_down0     = 1'b1;
             end
             else
                nstate        = `P2_READ0;
          end
      `IDEL3 :
          begin
             pattern_sel   = 1'b1;
             test_addr_rst = 1'b1;
             nstate        = `P3_READ1;
          end
      `P3_READ1 :
          begin
             nstate = `P3_COMPARE1;
          end
      `P3_COMPARE1 :  //compare all "1" data after read from addr 1fff~0
          begin
            pattern_sel = 1'b1;
            check_en    = 1'b1;
            nstate      = `P3_WRITE0;
          end
      `P3_WRITE0 :
          begin
             wen_test_inner = {WE_WIDTH{1'b0}};
             pattern_sel    = 1'b0;
             nstate         = `P3_READ0;
          end
      `P3_READ0 :
          begin
            nstate = `P3_COMPARE0;
          end
      `P3_COMPARE0 :
          begin
            pattern_sel = 1'b0;
            check_en    = 1'b1;
            nstate      = `P3_WRITE1;
          end
      `P3_WRITE1 :
          begin
             wen_test_inner = {WE_WIDTH{1'b0}};
             pattern_sel    = 1'b1;
             count_en       = 1'b1;
             if (test_addr == {ADDR_WIDTH{1'b1}}) begin
                  nstate        = `IDEL4;
                  test_addr_rst = 1'b1;
             end
             else
                nstate        = `P3_READ1;
          end
      `IDEL4 :   // read all data from addr 1fff~0 and compare with write data "1" every time 
          begin
            pattern_sel   = 1'b1;
            test_addr_rst = 1'b1;
            nstate        = `P4_READ1;
          end
      `P4_READ1 :
          begin
            nstate = `P4_COMPARE1;
          end
      `P4_COMPARE1 :
          begin
            pattern_sel = 1'b1;
            check_en    = 1'b1;
            nstate      = `P4_WRITE0;
          end
      `P4_WRITE0 :
          begin
            wen_test_inner = {WE_WIDTH{1'b0}};
            pattern_sel    = 1'b0;
            count_en       = 1'b1;
             if (test_addr == {ADDR_WIDTH{1'b1}}) begin
                   nstate        = `IDEL5;
                   test_addr_rst = 1'b1;
             end
             else         
                nstate        = `P4_READ1;
          end
      `IDEL5 :  // read all data from addr 1fff~0 and compare with write data "0" every time 
          begin
             pattern_sel   = 1'b1;
             test_addr_rst = 1'b1;
             nstate        = `P5_READ0;
          end
      `P5_READ0 :
          begin
             nstate = `P5_COMPARE0;
          end
      `P5_COMPARE0 :
          begin
             pattern_sel=1'b0;
             check_en=1'b1;
             nstate = `P5_WRITE1;
          end
      `P5_WRITE1 :
          begin
             wen_test_inner = {WE_WIDTH{1'b0}};
             pattern_sel   = 1'b1;
             nstate = `P5_READ1;
          end
      `P5_READ1 :
          begin
             nstate = `P5_COMPARE1;
          end
      `P5_COMPARE1 :
          begin
             pattern_sel=1'b1;
             check_en=1'b1;
             nstate = `P5_WRITE0;
          end
      `P5_WRITE0 :
          begin
             wen_test_inner = {WE_WIDTH{1'b0}};
             pattern_sel    = 1'b0;
             count_en       = 1'b1;
             if (test_addr == {ADDR_WIDTH{1'b1}}) begin
                   nstate        = `IDEL6;
                   test_addr_rst = 1'b1;
             end
             else
                nstate        = `P5_READ0;
          end
      `IDEL6 :
          begin
             pattern_sel   = 1'b0;
             test_addr_rst = 1'b1;
             nstate        = `P6_READ0;
          end
      `P6_READ0 :
          begin
             nstate        = `P6_COMPARE0;
          end
      `P6_COMPARE0 :
          begin
             pattern_sel = 1'b0;
             check_en    = 1'b1;
             count_en    = 1'b1;
             if (test_addr == {ADDR_WIDTH{1'b1}}) begin
                   nstate        = `IDEL1;
                   test_addr_rst = 1'b1;
                   r_end_en      = 1'b1;
             end
             else
                nstate = `P6_READ0;
          end
      default :
          begin
             nstate        = `IDEL1;
             test_addr_rst = 1'b1;
          end 
    endcase
  end

endmodule
