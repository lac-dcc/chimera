// This program was cloned from: https://github.com/stillwater-sc/RISC-V-TensorCore
// License: MIT License

// Code your design here
`include "tc_sram.sv"
`include "sc_sram.sv"
`include "fifo_queue.sv"
`include "valu.sv"
`include "vrf_arbiter.sv"

module sequencer (
  input logic clk,
  input logic nrst,
  
  //seq to decoder interface
  output bit vseq_busy, // if the sequencer is busy executing an instruction
  input logic[4:0] vs1,
  input logic[4:0] vs2,
  input logic[4:0] vd,
  input logic[2:0] lmul,
  input logic[2:0] vsew,
  input logic[31:0] vl, //Defined as lmul * VLEN/vsew
  input logic[15:0] var_dec_bits, //Defined as {$funct6, $funct3, $opcode};
  
  
  input logic[127:0] ld_data, //128 bit bus to write into all 4 banks simultaneously
  output logic[127:0] st_data, // output from VRF to store in Memory
  
  //These 3 can be combined into 1 vseq_busy signal later
  input bit rw_done, //indicate load done
  input bit w_done, //indicate VRF read done
  input bit s_done, //indicate store done
  ///////////////////////////////
  
 // input bit oq_done, // finish writing output queue values into VRF
  output logic[2:0] vid,
  
  //seq to Scalar RF interface signals
  input logic[4:0] s_addr, // 5 bit destination address for 32 registers in scalar RF
  input logic[31:0] s_inData,
  output logic[31:0] s_outData,
  input logic se, //Single port RF - either write/read
  
  //Arbiter to sequencer interface for LD/VALU output
  input logic ldg,
  input logic oqg // output queue grant - to write data from Output queue into VRF
);
  
  //seq to VRF Interface
  logic[3:0][7:0] vrf_addr1; //logic[4:0] for 4 banks; next[7:0] for addr width
  logic[3:0][7:0] vrf_addr2;
  logic[3:0][7:0] vrfd_addr;
  logic [3:0][31:0] inData;
  logic [3:0][31:0] outDataA;
  logic [3:0][31:0] outDataB;
  logic[3:0]vre;
  logic[3:0]vwe;
  
  
  //Input signals to Arbiter
  logic lreq;
  logic oq_req;
  
  
  logic[31:0] srcA_ele; //output from VRF, input to VALU
  logic[31:0] srcB_ele;
  
  //Seq to VALU signals
  logic[2:0]  vfu_id;
  logic[8:0]  valu_op;
  logic valu_start; // start ALU op signal
  logic alu_dvalid; // the alu output is valid
  
  //Sequencer to Queue to ALU
  logic[31:0] Vin_A;
  logic[31:0] Vin_B;
  logic[31:0] result; // to be put in output queue 
  logic oq_full;
  logic oq_empty; //status signals to determine when to write outout queue data to VRF
  logic[31:0] rq_out; // output of result queue
  logic valid_out; // alu output is valid
  logic[31:0] valid_data; //  // output written to VRF when oqg comes and data from queue is ready
  
  
  //Decoder to VRF logic
  logic [7:0] base_addr;
  logic [7:0] rbase_addr1;
  logic [7:0] rbase_addr2;
  logic [2:0] cnt;
  logic [2:0] w_cnt; //Load counter for parallel writes to all 4 banks
  
  //Output queue result write back to VRF valid & address
  logic wb_rdy;
  logic wb_valid; 
  logic[7:0] wb_addr;
  logic[2:0] oq_cnt;
  
  //VRF  State Machine signals
  
  localparam	IS0 = 4'd0,
  				IS1	= 4'd1,
  				IS2 = 4'd2,
  				IS3 = 4'd3,
  				IS4	= 4'd4;
  
  
  logic[3:0] INS;
  
  //Output queue to VRF state machine
  localparam	oq_IS0 = 4'd0,
  				oq_IS1 = 4'd1,
  				oq_IS2 = 4'd2,
  				oq_IS3 = 4'd3,
  				oq_IS4 = 4'd4;
  
  
  logic[3:0] oq_INS;
  
  
  // Vid and VALU OP assignment
  assign valu_op = !nrst ? 9'd0 : var_dec_bits[15:7]; // {funct6, funct3}
  assign vid = !nrst ? 'd0 : vfu_id; 
  
  //A. vector address to VRF address mapping
  always_comb begin
    
    if(!nrst) begin
      base_addr = 'hz;
    end
    
    else begin
      case(vd) 
        5'd0 : begin
          base_addr = 7'd0;
        end
        
        5'd1 : begin
          base_addr = 7'd8;
        end
        
        5'd2 : begin
          base_addr = 7'd16;
        end
        
        5'd3 : begin
          base_addr = 7'd24;
        end
        
        5'd4 : begin
          base_addr = 7'd32;
        end
        
        5'd5 : begin
          base_addr = 7'd40;
        end
        
        5'd6 : begin
          base_addr = 7'd48;
        end
        
        5'd7 : begin
          base_addr = 7'd56;
        end
        
        5'd8 : begin
          base_addr = 7'd64;
        end
        
        default : begin
          base_addr = 7'd0;
        end
       
        //Insert more cases here for more Vector reggister support
      endcase
    end
  end
  
  //For read addresses 1  to SRAM
  always_comb begin
    
    if(!nrst) begin
      rbase_addr1 = 'hz;
    end
    
    else begin
      case(vs1) 
        5'd0 : begin
          rbase_addr1 = 7'd0;
        end
        
        5'd1 : begin
          rbase_addr1 = 7'd8;
        end
        
        5'd2 : begin
          rbase_addr1 = 7'd16;
        end
        
        5'd3 : begin
          rbase_addr1 = 7'd24;
        end
        
        5'd4 : begin
          rbase_addr1 = 7'd32;
        end
        
        5'd5 : begin
          rbase_addr1 = 7'd40;
        end
        
        5'd6 : begin
          rbase_addr1 = 7'd48;
        end
        
        5'd7 : begin
          rbase_addr1 = 7'd56;
        end
        
        5'd8 : begin
          rbase_addr1 = 7'd64;
        end
        
        default : begin
          rbase_addr1 = 'hz;
        end
       
        //Insert more cases here for more Vector reggister support
      endcase
    end
  end
    
  
  always_comb begin
    
    if(!nrst) begin
      rbase_addr2 = 'hz;
    end
    
    else begin
      case(vs2) 
        5'd0 : begin
          rbase_addr2 = 7'd0;
        end
        
        5'd1 : begin
          rbase_addr2 = 7'd8;
        end
        
        5'd2 : begin
          rbase_addr2 = 7'd16;
        end
        
        5'd3 : begin
          rbase_addr2 = 7'd24;
        end
        
        5'd4 : begin
          rbase_addr2 = 7'd32;
        end
        
        5'd5 : begin
          rbase_addr2 = 7'd40;
        end
        
        5'd6 : begin
          rbase_addr2 = 7'd48;
        end
        
        5'd7 : begin
          rbase_addr2 = 7'd56;
        end
        
        5'd8 : begin
          rbase_addr2 = 7'd64;
        end
        
        default : begin
          rbase_addr2 = 'hz;
        end
       
        //Insert more cases here for more Vector register support
      endcase
    end
  end
         
   
  //Counter to count no. of entries in each bank for each VR
  
  always_ff @(posedge clk, negedge nrst) begin
    if(!nrst)
      cnt <= 'd0;
    else if ((vfu_id[2] == 1) && INS == IS3) begin
      cnt <= cnt + 1;
    end
    else
      cnt <= cnt;
  end
  
  //VRF load counter
  always_ff @(posedge clk, negedge nrst) begin
    if(!nrst)
      w_cnt <= 'd0;
    else if (vfu_id[0] == 1 && rw_done == 0 && ldg == 1) // ldg == load grant from arbiter 
      w_cnt <= w_cnt + 1;
    else
      w_cnt <= 'd0;
  end
  
  //enabling the VFU and sending load request to arbiter
  always_ff @(posedge clk, negedge nrst) begin
    if(!nrst) begin
      vfu_id <= 3'b000;
      lreq <= 1'b0;
    end
    
    else if(var_dec_bits[6:0] == 7'b0000111) begin //send a load grant from arbiter
      vfu_id <= 3'b001; 
      lreq <= 1'b1;
    end
    else if (var_dec_bits[6:0] == 7'b0100111) begin
      vfu_id <= 3'b010; //ST VFU enabled
      lreq	 <= 1'b0;
    end
    else if (var_dec_bits[6:0] == 7'b1010111 && var_dec_bits[9:7] != 3'b111) begin
      vfu_id <= 3'b100; // VALU enabled
      lreq	 <= 1'b0;	
    end
    
    else begin
      vfu_id <= 3'b000;
      lreq <= 1'b0;
    end
  end
  
  
  //Start ALU computations
  assign valu_start = (vfu_id[2] == 1 && oq_full != 1); //start only if its a valu_op 
  													  // and output result queue is not full 
  //Generating write back valid to VRF
  //assign wb_valid = (oqg == 1 && oq_empty == 0 && alu_dvalid == 1);
  
  always_ff @(posedge clk, negedge nrst) begin
    if(!nrst)
      wb_rdy <= 'b0;
    //else if (oq_empty == 0 && alu_dvalid == 1)
    else if (oq_empty == 0)
      wb_rdy <= 'b1;
    else 
      wb_rdy <= 'b0;
  end
  
  always_ff @(posedge clk, negedge nrst) begin
    if(!nrst) begin
      wb_valid	<= 'b0;
      valid_data <= '0;
    end
    
    else if(oqg == 1 && wb_rdy == 1) begin
      wb_valid 	<= 'b1;
      valid_data <= rq_out;
    end
    
    else begin
      wb_valid	<= 'b0;
      valid_data <= 'hz;
    end
  end
      
  
  //sending valu Output write back request to arbiter
  always_ff @(posedge clk, negedge nrst) begin
    if(!nrst)
      oq_req	<= 1'b0;
    else if(oq_empty != 1) 
      oq_req  <= 1'b1;
    else
      oq_req  <= 1'b0;
  end
  

  //VRF State Sequence
  //Write/load VRF logic
    
    always_ff @(posedge clk, negedge nrst) begin
      if(!nrst) begin
        vwe			<= 'd0;
        vrfd_addr	<= 'd0;
        INS			<= IS0;
        oq_INS		<= oq_IS0;
        vre			<= 'd0;
        vrf_addr1	<= 'd0;
        vrf_addr2	<= 'd0;
        //vseq_busy	<= 'd0;
      end
      
      //LOAD 
      else if(vfu_id[0] == 1'b1 && ldg == 1) begin
        //Multiple loads into all 4 banks
        if(rw_done == 1) begin
          vwe 			<= 4'd0;
          vrfd_addr[0]	<= vrfd_addr[0];
          vrfd_addr[1]	<= vrfd_addr[1];
          vrfd_addr[2]	<= vrfd_addr[2];
          vrfd_addr[3]	<= vrfd_addr[3];
        
          inData[0]		<= 32'hDEAD_DEAD;
          inData[1]		<= 32'hDEAD_DEAD;
          inData[2]		<= 32'hDEAD_DEAD;
          inData[3]		<= 32'hDEAD_DEAD;
        end
        
        else begin
          vwe 			<= 4'hf;
          vrfd_addr[0]	<= base_addr + w_cnt;
          vrfd_addr[1]	<= base_addr + w_cnt;
          vrfd_addr[2]	<= base_addr + w_cnt;
          vrfd_addr[3]	<= base_addr + w_cnt;
        
          inData[0]		<= ld_data[31:0];
          inData[1]		<= ld_data[63:32];
          inData[2]		<= ld_data[95:64];
          inData[3]		<= ld_data[127:96];
        end
      end
      
      //STORE operation
      else if (vfu_id[1] == 1'b1) begin
        //Store data from all 4 banks
        if(s_done == 1) begin
          vre 			<= 4'd0;
          vrf_addr1[0]	<= vrf_addr1[0];
          vrf_addr1[1]	<= vrf_addr1[1];
          vrf_addr1[2]	<= vrf_addr1[2];
          vrf_addr1[3]	<= vrf_addr1[3];
          
          st_data[31:0]		<= 32'hDEAD_DEAD;
          st_data[63:32]	<= 32'hDEAD_DEAD;
          st_data[95:64]	<= 32'hDEAD_DEAD;
          st_data[127:96]	<= 32'hDEAD_DEAD;
        end
        
        else begin
          vre 			<= 4'hf;
          vrf_addr1[0]	<= base_addr + w_cnt;
          vrf_addr1[1]	<= base_addr + w_cnt;
          vrf_addr1[2]	<= base_addr + w_cnt;
          vrf_addr1[3]	<= base_addr + w_cnt;
        
          st_data[31:0]		<= outDataA[0];
          st_data[63:32]	<= outDataA[1];
          st_data[95:64]	<= outDataA[2];
          st_data[127:96]	<= outDataA[3];
        end
      end
        
      else begin
        
        if(wb_valid == 1) begin
          case(oq_INS)
            oq_IS0	: begin
              vwe				<= 4'd1;
              vrfd_addr[0] 		<= wb_addr + oq_cnt;
              inData[0]	 		<= valid_data;
              oq_INS			<= oq_IS1;
              
            end
          
            oq_IS1	: begin
              vwe 				<= 4'd2;
              vrfd_addr[1]		<= wb_addr + oq_cnt;
              inData[1]			<= valid_data;
              oq_INS			<= oq_IS2;
            end
          
            oq_IS2	: begin
              vwe				<= 4'd4;
              vrfd_addr[2]		<= wb_addr + oq_cnt;
              inData[2]			<= valid_data;
              oq_INS			<= oq_IS3;
            end
          
            oq_IS3 	: begin
              vwe				<= 4'd8;
              vrfd_addr[3]		<= wb_addr + oq_cnt;
              inData[3]			<= valid_data;
              oq_INS			<= oq_IS0;
            end
          endcase
        end
                  
        if(vfu_id[2] == 1'b1) begin
          case(INS)
            IS0	: begin
              vre				<= 4'd1;
              vrf_addr1[0] 	<= rbase_addr1 + cnt;
            //srcA_ele		<= outDataA[0];
              Vin_A			<= outDataA[0];
            
              if(var_dec_bits[9] != 1) begin
                vrf_addr2[0] 	<= rbase_addr2 + cnt;
              //srcB_ele		<= outDataB[0];
                Vin_B			<= outDataB[0];
              end
            
              else begin
                vrf_addr2[0]	<= 'hz;
              //srcB_ele		<= s_outData;
                Vin_B			<= s_outData;
              end
                       
              if(w_done == 0)
                INS				<= IS1;
            
              else begin
                INS			<= INS;
                vre			<= 'd0;
                vrf_addr1	<= 'hz;
                Vin_A		<= 'hdead_dead;
                Vin_B		<= 'hdead_dead;
                //cnt 		<= 'd0;
              end
            
            end
          
            IS1	: begin
              vre				<= 4'd2;
              vrf_addr1[1] 	<= rbase_addr1 + cnt;
            //srcA_ele		<= outDataA[1];
              Vin_A			<= outDataA[1];
            
              if(var_dec_bits[9] != 1) begin
                vrf_addr2[1] 	<= rbase_addr2 + cnt;
              //srcB_ele		<= outDataB[1];
                Vin_B			<= outDataB[1];
              
              end
            
              else begin
                vrf_addr2[1]	<= 'hz;
              //srcB_ele		<= s_outData;
                Vin_B			<= s_outData;
              end
            
              INS				<= IS2;
            end
          
            IS2	: begin
              vre				<= 4'd4;
              vrf_addr1[2] 	<= rbase_addr1 + cnt;
            //srcA_ele		<= outDataA[2];
              Vin_A			<= outDataA[2];
            
              if(var_dec_bits[9] != 1) begin
                vrf_addr2[2] 	<= rbase_addr2 + cnt;
              //srcB_ele		<= outDataB[2];
                Vin_B			<= outDataB[2];
              end
            
              else begin
              //se			<= 1'b0;
                vrf_addr2[2]	<= 'hz;
              //srcB_ele		<= s_outData;
                Vin_B			<= s_outData;
              end
            
              INS				<= IS3;
            end
          
            IS3 	: begin
              vre				<= 4'd8;
              vrf_addr1[3] 	<= rbase_addr1 + cnt;
            //srcA_ele		<= outDataA[3];
              Vin_A			<= outDataA[3];
            
              if(var_dec_bits[9] != 1) begin
                vrf_addr2[3] 	<= rbase_addr2 + cnt;
              //srcB_ele		<= outDataB[3];
                Vin_B			<= outDataB[3];
              end
            
              else begin
              //se			<= 1'b0;
                vrf_addr2[3]	<= 'hz;
              //srcB_ele		<= s_outData;
                Vin_B			<= s_outData;
              end
            
              INS				<= IS0;
           end
          endcase
        end
      end
    end
  
 
  
  //Decoding to VRF Logic
  
 // assign vl_cnt = vl;
 // assign s_cnt	= vl;
 
  ///TASKS for commonly used operations
  // Output queue counter
  //Counter to count no. of entries in each bank for each VR
  always_ff @(posedge clk, negedge nrst) begin
    if(!nrst)
      oq_cnt <= 'd0;
    else if (wb_valid == 1 && oq_INS == oq_IS3) begin
      oq_cnt <= oq_cnt + 1;
    end
    else
      oq_cnt <= oq_cnt;
  end
  
  
 ///////////////// DUT CONNECTIONS//////////////////
 //SRAM DUT Connection     
    tc_sram #(
    .NumWords('d1024), // Total  elements - (VRs * elementperVR)
    .NumBanks('d4),	   // banks
    .WordsPerBank('d256), //NumWords/NumBanks
    .DataWidth('d32),  // Data signal width
    
    .AddrWidth('d8) //$clog2(WordsPerBank)
  )
  sram_dut0(
    .clk(clk),      // Clock
    .nrst(nrst),     // Asynchronous reset active low
    .re(vre),
    .we(vwe),
    .waddr(vrfd_addr),    // request address
    .raddr1(vrf_addr1),
    .raddr2(vrf_addr2),
    .wdata(inData),    // write data to be defined later
    .rdataA(outDataA),
    .rdataB(outDataB)
  );
  
  //sc_sram
  sc_sram scalar_RF(
    .clk(clk),
    .nrst(nrst),
    .we(se),
    .addr(s_addr),
    .wdata(s_inData),
    .rdata(s_outData)
  );

  
  //Needed if there are multiple VFUs requesting operands, since we've 1 VALU, we don't need these here
  //Queue Connections
  /*
  fifo_queue fq1 (
    .clk(clk),
    .nrst(nrst),
    .write(1'b1), // always write if queue is not full 
    .read(1'b1), // always read new values from queue (to VALU)
    .rdata(Vin_A),
    .wdata(srcA_ele),
    .full(),
    .empty()
  );
  
  fifo_queue fq2(
    .clk(clk), 
    .nrst(nrst),
    .write(1'b1),
    .read(1'b1),
    .rdata(Vin_B),
    .wdata(srcB_ele),
    .full(),
    .empty()
  );
 */ 
   
  //VV vs VS input to ALU
  // Only fetch element 0 from VRF if the instruction is vector scalar operation
  // Pass that element to all 32 inB values to VALU to add/mul with each of 32 elements (inA values) in a VS operation
  //assign Vin_A 
  //Seq to Queue to VFU logic
  valu v_alu(
    .nrst(nrst),
    .valu_en(valu_start),
    .inA(Vin_A),
    .inB(Vin_B),
    .vrfb_addr(base_addr),
    .op(valu_op),
    .out_res(result),
    .valid_out(alu_dvalid),
    .vrfo_addr(wb_addr)
  );
  
  //Output queue
  fifo_queue fq_out (
    .clk(clk),
    .nrst(nrst),
    .write(alu_dvalid), // always write if queue is not full 
    .read(wb_rdy),   // only read values when there's a valid output
    .rdata(rq_out),
    .wdata(result),
    .full(oq_full),
    .empty(oq_empty)
  );
  
  
  //Arbiter connections
  arbiter arb_dut(
    .clk(clk),
    .nrst(nrst),
    .ld_req(lreq),
    .valu_req(oq_req),
    .ld_gnt(ldg),
    .valu_gnt(oqg)
  );
  
    
endmodule  

