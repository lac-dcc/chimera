// This program was cloned from: https://github.com/silicon-efabless/tt06-silicon-tinytapeout-lm07
// License: Apache License 2.0

`timescale 1ns/1ns

/******************************************************************************/
`default_nettype none

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a VCD file. You can view it with gtkwave.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  // Wire up the inputs and outputs:
  reg clk;
  reg rst_n;
  reg ena;
  reg [7:0] ui_in;
  reg [7:0] uio_in;
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;

  // Replace tt_um_example with your module name:
  tt_um_silicon_tinytapeout_lm07 obj(

      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(1'b1),
      .VGND(1'b0),
`endif

      .ui_in  (ui_in),    // Dedicated inputs
      .uo_out (uo_out),   // Dedicated outputs
      .uio_in (uio_in),   // IOs: Input path
      .uio_out(uio_out),  // IOs: Output path
      .uio_oe (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
      .ena    (ena),      // enable - goes high when design is selected
      .clk    (clk),      // clock
      .rst_n  (rst_n)     // not reset
  );



/***********************************************************************/
  wire SCK;
  wire CS;
  reg [15:0]TEMP_SET;
  wire [2:0]sel_ext;
  reg sw_ext,sw_lsb,sw_deg;
 
  assign CS = uio_out[0];
  assign SCK = uio_out[1];

  assign sel_ext[0] = uio_out[3];      //C/F
  assign sel_ext[1] = uio_out[4];      //LSB
  assign sel_ext[2] = uio_out[5];      //MSB
  
  always@(*)
    begin
      ui_in[0] = sw_ext;
      ui_in[1] = sw_lsb;
      ui_in[2] = sw_deg;
    end
  
  initial ena <= 0;
 
  /***********Counter to keep it synchronized**************/
  
  integer cnt;
  
  always @(posedge clk or negedge rst_n)
    begin
      if(~rst_n) cnt<=0;
      else if(~CS) cnt<=0;
      else if(cnt==6) cnt<=6;
      else if(CS && cnt<6) cnt<=cnt+1;
    end
  
    
  /***************task : generateTempData*****************/
  
  //reg [11:0][6:0] dataRegisters;  
  
  //reg [11:0] test1 = 12'b1_0_0_9'd24;--> NOT WORKING
  
  //reg [11:0] test1 = 12'b1_0_0_00000_0000 + 9'd24;
  
  reg [11:0] test ;
 
  reg [3:0]bcd_msb;
  reg [3:0]bcd_lsb;
  reg [8:0]number_f;
  reg [3:0]bcd_msb_f;
  reg [3:0]bcd_lsb_f;
  reg [9:0]number;
  
  reg [2:0] reg_dataset = 0; 
  
 task generateTempData; 
   reg [4:0] highBits  ;
   reg [1:0] extraBits ;           //for 0.25 and 0.5 resolution
  begin
    //--MUX TO SET DATA--
    case(reg_dataset)
      3'b000:   test = {1'b1,1'b0,1'b0,9'd26};  //{EXT_7_seg_select , on_board_Lsb_select , C/F_select , Temp_data in decimals} 
      3'b001:   test = {1'b1,1'b0,1'b0,9'd72};
      3'b010:   test = {1'b1,1'b0,1'b1,9'd32};
      3'b011:   test = {1'b0,1'b0,1'b0,9'd34};
      3'b100:   test = {1'b0,1'b1,1'b0,9'd34};
      
      default : test = {1'b1,1'b0,1'b0,9'd02};
    endcase
    
    extraBits = 2'b00;
    highBits  = 5'b11111;
    
    sw_ext = test[11];
    sw_lsb = test[10];
    sw_deg = test[9];
    
    number = test[8:0];
    
    TEMP_SET = {number,extraBits,highBits};
    bcd_msb = number/10;
    bcd_lsb = number - bcd_msb*10;
    number_f = number*2 + 32;
    bcd_msb_f = number_f/10;
    bcd_lsb_f = number_f - bcd_msb_f*10;
    
    // mux control signal
    reg_dataset = reg_dataset+1;
    if(reg_dataset==5)
      reg_dataset = 0;      
  end
endtask
//----------------------------------------------------------------------
  /****************task_compare***************************/
  reg [7:0] bcd_received = 0;
  reg [2:0]flag_c = 0;
  reg [2:0]flag_f = 0;
  
  task task_compare;
    
    casez({sw_ext,sw_lsb,sw_deg})
     
      3'b000: begin     
        if(~sel_ext[0] && ~sel_ext[1] && ~sel_ext[2])
          begin
            $display("ON BOARD MSB TEST : DATA SENT : %0d%0d C",bcd_msb,bcd_lsb);
            
            if(bcdOutput[3:0] == bcd_msb)
              begin
                $display("RECEIVED MSB : %0d C (PASS)",bcdOutput[3:0]);
                $display("--------------------");
              end
            else
              begin
                $display("RECEIVED MSB : %0d C (FAIL)",bcdOutput[3:0]);
                $display("--------------------");
              end
          end
      end
        
       3'b001: begin     
         if(~sel_ext[0] && ~sel_ext[1] && ~sel_ext[2])
          begin
            $display("ON BOARD MSB TEST : DATA SENT : %0d%0d F",bcd_msb_f,bcd_lsb_f);
            
            if(bcdOutput[3:0] == bcd_msb_f)
              begin
                $display("RECEIVED MSB : %0d F (PASS)",bcdOutput[3:0]);
                $display("--------------------");
              end
            else 
              begin
                $display("RECEIVED MSB : %0d F (FAIL)",bcdOutput[3:0]);
                $display("--------------------");
              end
          end
      end
      
      3'b010 : begin
        if(~sel_ext[0] && ~sel_ext[1] && ~sel_ext[2])
          begin
            $display("ON BOARD LSB TEST : DATA SENT : %0d%0d C",bcd_msb,bcd_lsb);
            
            if(bcdOutput[3:0] == bcd_lsb)
              begin
                $display("RECEIVED LSB : %0d C (PASS)",bcdOutput[3:0]);
                $display("--------------------");
              end
                
            else 
              begin
                $display("RECEIVED LSB : %0d C (FAIL)",bcdOutput[3:0]);
                $display("--------------------");
              end
          end
      end
        
        3'b011 : begin
          if(~sel_ext[0] && ~sel_ext[1] && ~sel_ext[2])
          begin
            $display("ON BOARD LSB TEST : DATA SENT : %0d%0d F",bcd_msb_f,bcd_lsb_f);
            
            if(bcdOutput[3:0] == bcd_lsb_f)
              begin
                $display("RECEIVED LSB : %0d F (PASS)",bcdOutput[3:0]); 
                $display("--------------------");
              end
            else 
              begin
                $display("RECEIVED LSB : %0d F (FAIL)",bcdOutput[3:0]);
                $display("--------------------");
              end
          end
      end
    
      3'b1?0 : begin
        
        if(cnt_cs==0) 
          begin
            $display("EXT 7 SEG TEST : DATA SENT : %0d%0d C",bcd_msb,bcd_lsb);
          end
        
        if(sel_ext[0] && ~bcdOutput[4])
          begin
            if(bcdOutput == 5'b00000) flag_c[2] = 1;
            else                      flag_c[2] = 0;
          end
        
        else if(sel_ext[1] && bcdOutput[4])
          begin
            if(bcdOutput[3:0] == bcd_lsb)
              begin
                bcd_received[3:0] = bcdOutput[3:0];
                flag_c[1] = 1;
              end
            else
              begin
                bcd_received[3:0] = bcdOutput[3:0];
                flag_c[1] = 0;
              end
          end
        else if(sel_ext[2] && bcdOutput[4])
          begin
            if(bcdOutput[3:0] == bcd_msb)
              begin
                bcd_received[7:4] = bcdOutput[3:0];
                flag_c[0] = 1;
              end
            else
              begin
                bcd_received[7:4] = bcdOutput[3:0];
                flag_c[0] = 0;
              end
          end
       
        
        if(cnt_cs == 2)
          begin
            if(&flag_c == 1)  $display("DATA RECEIVED : %0h C (PASS)",bcd_received);
            else if(~flag_c[2] && flag_c[1] && flag_c[0])
              begin
                $display("TEMP UNIT CODE RECEIVED : INCORRECT");
                $display("DATA RECEIVED : %0h (FAIL)",bcd_received);
              end
            else $display("DATA RECEIVED : %0h C (FAIL)",bcd_received);
            
            $display("-------------------");
          end
          
      end
        
        3'b1?1 : begin
          
          if(cnt_cs==0) 
          begin
            $display("EXT 7 SEG TEST : DATA SENT : %0d%0d F",bcd_msb_f,bcd_lsb_f);
          end
        
        if(sel_ext[0] && ~bcdOutput[4]) 
          begin
            if(bcdOutput == 5'b00001) flag_f[2] = 1;
            else                      flag_f[2] = 0; 
          end
        
        else if(sel_ext[1] && bcdOutput[4])
          begin
            if(bcdOutput[3:0] == bcd_lsb_f)
              begin
                bcd_received[3:0] = bcdOutput[3:0];
                flag_f[1] = 1;
              end
            else
              begin
                bcd_received[3:0] = bcdOutput[3:0];
                flag_f[1] = 0;
              end
          end
        else if(sel_ext[2] && bcdOutput[4])
          begin
            if(bcdOutput[3:0] == bcd_msb_f)
              begin
                bcd_received[7:4] = bcdOutput[3:0];
                flag_f[0] = 1;
              end
            else
              begin
                bcd_received[7:4] = bcdOutput[3:0];
                flag_f[0] = 0;
              end
          end
          
          if(cnt_cs == 2)
            begin
              if(&flag_f == 1)  $display("DATA RECEIVED : %0h F (PASS)",bcd_received);
              else if(~flag_f[2] && flag_f[1] && flag_f[0])
               begin
                 $display("TEMP UNIT CODE RECEIVED : INCORRECT");
                 $display("DATA RECEIVED : %0h (FAIL)",bcd_received);
               end
              
              else $display("DATA RECEIVED : %0h F (FAIL)",bcd_received);
            
            $display("-------------------");
          end
        end
            
      endcase
    
    endtask 
  
    
  
  /***********Always BLOCK for controlling the Task********/
  integer cnt_cs = 1'b0;
  
  always @(negedge CS)
    begin
     if(~CS)
        begin
          if(sw_ext)
            begin
              cnt_cs <= cnt_cs+1;
              if(cnt_cs==2)
                begin
                  generateTempData;
                  cnt_cs <=0;
                end
            end
          
          else if(bcdOutput == 5'b10001)
            generateTempData;     
          else if(~sw_ext) generateTempData; 
        end
    end
  
  
  always @(posedge clk or negedge rst_n)
    begin
      if(CS)
        if(cnt==4)
          begin
            task_compare;
          end
    end
      
  /***********************************************************/
          
  
  //////////////////////////////////////////////////////////////////
  /*
  NOTE:
  This block cannot be put after task call as when task will be called
  only task will be executed and here that task is doing reset on after 15
  so the counter will be start at 20 if we will put this counter code after 
  task call 
  */
       
      
  initial begin
    
    #15000
    $finish(2);   
  end
  
  //always @(cnt) test;
  
  
  //Task for simple test
  task testRead;
    begin
        #20   rst_n = 1'b1;
    end
  endtask
  
  wire SIO;
  //initial uio_in[4] <= SIO;
  //initial cannot be used as it run only once
  always @(*) begin uio_in[2] <= SIO; end
  
  //Instiate LM07
  LM07 tsense(.TEMP_SET(TEMP_SET),.CS(CS), .SCK(SCK), .SIO(SIO));
 
  //Initialize CS
  initial rst_n = 1'b0;
  
  //Generate test clock
  initial clk= 1'b1;
  initial forever #10 clk = ~clk;    

  //Testbench
  initial
    begin
      //$monitor("time= %0t;data[]=,CS=%b,CLK=%b,SIO=%b,",$time,CS,CLK,SIO);
      testRead;
    end
//////////////////////////////////////////////////////////////////////////////
   
/////////Encoder TO CONTROL OPERATIONS/////////////

//-------------------------------------------------
  reg [4:0] bcdOutput = 5'b10001;
   always @(uo_out)
   begin
    case(uo_out)
      8'b00111111: bcdOutput = 5'b10000;
      8'b00000110: bcdOutput = 5'b10001;           
      8'b01011011: bcdOutput = 5'b10010;           
      8'b01001111: bcdOutput = 5'b10011;           
      8'b01100110: bcdOutput = 5'b10100;           
      8'b01101101: bcdOutput = 5'b10101;           
      8'b01111101: bcdOutput = 5'b10110;           
      8'b00000111: bcdOutput = 5'b10111; 
      8'b01111111: bcdOutput = 5'b11000; 
      8'b01101111: bcdOutput = 5'b11001; 
      8'b00111111: bcdOutput = 5'b11010; 
      8'b00000110: bcdOutput = 5'b11011;
      8'b01011011: bcdOutput = 5'b11100;
      8'b01001111: bcdOutput = 5'b11101; 
      8'b01100110: bcdOutput = 5'b11110; 
      8'b01101101: bcdOutput = 5'b11111; 
      
      8'b00111001: bcdOutput = 5'b00000;
      8'b01110001: bcdOutput = 5'b00001;
   
    endcase
  end
  
endmodule

//////////////////////////////TEMP SENSOR LM70 DUMMY MODEL/////////////////
//Define
// In this design we only read the 8-MSBs 
// which has a resolution of 2-deg C 
    
////////////////////////////////////////////////////////////////////////////
// Verilog model for the SPI-based temperature 
// sensor LM07 or it's equivalent family.
//
module LM07(TEMP_SET,CS, SCK, SIO);
  output SIO;
  input SCK, CS;
  input [15:0] TEMP_SET;
  //
  // lm07_reg represents the register that stores
  // temperature value after A2D conversion
  // FIXME: Model the A2D
  reg [15:0] shift_reg;
  wire clk_gated;
  
  //Reset at startup
  initial begin
    shift_reg = TEMP_SET; 
    //shift_reg = shift_reg>>1;
  end
  
  //SIO bit of the LM07 is hardwired output of
  // the MSB of the shift register
  assign SIO = shift_reg[15];

  //Gate the clock with CS
  assign clk_gated = ~CS & SCK;
  
  // When CS goes low, load temp_shift_reg with lm07_reg
  // If high, reset
  always @(CS)
   begin
     shift_reg = TEMP_SET;
     //shift_reg = shift_reg>>1;
   end
  
  //Shift register to shift the loaded temp reg
  //every negedge of the gated clock
  always @(negedge clk_gated)
    begin
      shift_reg = shift_reg<<1;
    end
  /*initial begin
    $monitor("data=%0b,dataseg=%0b,dataout=%0b",SIO,dataSeg,dbugout);
  end*/
endmodule
//////////////////////////////////////////////////////////////////////////////////
    
