// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module top();
  logic clk, nrst;
  bit vseq_busy;
  logic[4:0] vs1, vs2, vd;
  logic[2:0] lmul, vsew;
  logic [31:0] vl;
  logic[15:0] var_dec_bits;
  logic[127:0] ld_data; //127 bit reg to store the data to be transferred from memory to VRF
  logic[127:0] st_data; // 127 bit reg to store the data to be transferred to memory from VRF
  //int ld_data;
  logic[2:0] vid;
  bit rw_done;
  bit w_done;
  bit s_done;
  logic ldg;
  logic oqg;
  //seq to Scalar RF interface signals
  logic[4:0] s_addr; // 5 bit destination address for 32 registers in scalar RF
  logic[31:0] s_inData;
  logic[31:0] s_outData;
  logic se; //Single port RF - either write/read
  
  int data;
  
  //Connections
  sequencer seq(
    .clk(clk),
    .nrst(nrst),
    .vseq_busy(vseq_busy),
    .vs1(vs1),
    .vs2(vs2),
    .vd(vd),
    .lmul(lmul),
    .vsew(vsew),
    .vl(vl),
    .var_dec_bits(var_dec_bits),
    .ld_data(ld_data),
    .st_data(st_data),
    .vid(vid),
    .rw_done(rw_done),
    .w_done(w_done),
    .s_done(s_done),
    
    //Scalar RF connections
    .se(se),
    .s_addr(s_addr),
    .s_inData(s_inData),
    .s_outData(s_outData)
    
    //.ldg(ldg),
    //.oqg(oqg)
    
  );
  
  //TB to memory interface // to be implememted later
  //10 leve deep queue with 128 bits data of data from VRF in each level to be     
  //transferred to memory when required - bus is available, etc.
  logic[127:0] st_q [9:0];
  //
  
  logic[4:0] ele_cnt;
  logic[4:0] addr;
  
  
  initial begin
    clk = 1'b0;
    forever #5ns
    clk = !clk;
  end
  
  initial begin
    nrst = 1'b0;
    //ele_cnt = 32'd0;
    ld_data = 127'd0;
    data = 'd0;
    //addr = 32'd0; 
    #10ns
    nrst = 1'b1;
    //#5ns
    //nrst = 1'b0;
  end
  
  //Stimulus 
  //1. Load SRAM with values
  //Make sure all addresses vs1, vs2, vd are multiples of 8
  //For 32 vector registers, possible values are - [4'd0, 4'd8, 4'd16, etc.)
  //This needs to be modified later

  initial begin
    @(posedge nrst);
    //@(posedge clk);
    //Load the scalar RF
    //se = 1'b1;
    //for(int i=0; i<31; i++) begin
    
    //A. Load scalar
      @(posedge clk);
      se        = 1;
      s_addr 	= 2;
      s_inData 	= 2;
    
      @(posedge clk);
      se		= 'x;
    //end
    
    //B. Load VR1
    @(posedge clk);
    var_dec_bits = 16'b0000_0000_0000_0111;
    vd = 5'd1;
    
    for (int j = 0; j<8; j++) begin
     // for (int i = 0; i< 4; i++)begin
       @(posedge clk);
       //vd = 5'd1;
       ld_data = {32'd1, 32'd2, 32'd3, 32'd4};
       //data = data + 4;
    end
    
    @(posedge clk);
    @(posedge clk);
    rw_done = 1;
    
    //C. Load VR2
    for (int j = 0; j<8; j++) begin
      //for (int i = 0; i< 4; i++)begin
      @(posedge clk);
      vd = 5'd2;
      rw_done = 0;
      ld_data = {32'hffff_fffe, 32'hffff_fffc, 32'hffff_fffa, 32'hffff_fff8};
      //end
    end
    
    @(posedge clk);
    rw_done = 1;
    
    
    //Perform VR1 & Scalar MUL and store back in VR3 
    @(posedge clk);
    //rw_done = 0;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    var_dec_bits = 16'b0101_1110_0101_0111; //VS mul
    vs1 = 5'd1;
    vs2 = 'hz;
    vd  = 5'd1;
    
    s_addr = 2;
    se    = 0;
    
    for (int j = 0; j< 8; j++) begin
      for (int i = 0; i< 4; i++)begin
        @(posedge clk);
        //ld_data = ld_data + 1;
      end
      //vwe = 3'd0;
    end
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    
    //var_dec_bits[6:0] = 6'd0;
    var_dec_bits = 'd0;
    w_done = 1;
    
    
    //VV ADD
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    //@(posedge clk);
    //@(posedge clk);
    w_done = 1'b0;
   
    var_dec_bits = 16'b0000_0000_0101_0111;
    vs1 = 5'd1;
    vs2 = 5'd2;
    vd  = 5'd3;
    
    for (int j = 0; j<8; j++) begin
      for (int i = 0; i< 4; i++)begin
        @(posedge clk);
      end
    end
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    var_dec_bits = 'd0;
    w_done = 1;
    
   
    //B. Store data from VR
    @(posedge clk);
    var_dec_bits = 16'b000_000_110_0100111;
    @(posedge clk);
    s_done = 1;
    @(posedge clk);
    @(posedge clk);
    s_done = 0;
    vs1 = 5'd3;
    
    for (int j = 0; j<8; j++) begin
     // for (int i = 0; i< 4; i++)begin
       @(posedge clk);
       //vd = 5'd1;
      st_q[j] = st_data; // push into store queue for later transfer to memory
       //data = data + 4;
    end
    
    @(posedge clk);
    @(posedge clk);
    s_done = 1;
    var_dec_bits = 'd0;
    
  end
  
  initial begin
    #1500ns
    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
 
 
  
endmodule


      
    
 