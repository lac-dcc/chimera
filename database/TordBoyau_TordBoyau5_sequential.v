// This program was cloned from: https://github.com/BrunoLevy/TordBoyau
// License: BSD 3-Clause "New" or "Revised" License

/**
 * Sequential pipeline
 * 5 stages
 * Used to test what maxfreq could be
 */
 
/******************************************************************************/

module Processor (
    input  wire        clk,
    input  wire        resetn,
    output wire [31:0] IO_mem_addr, // IO memory address
    input  wire [31:0] IO_mem_rdata, // data read from IO memory
    output wire [31:0] IO_mem_wdata, // data written to IO memory
    output wire        IO_mem_wr     // IO write flag
);

/******************************************************************************/
   
   /* state machine (removed in next step that has a true pipeline) */
   
   localparam F_bit = 0; localparam F_state = 1 << F_bit;
   localparam D_bit = 1; localparam D_state = 1 << D_bit;
   localparam E_bit = 2; localparam E_state = 1 << E_bit;
   localparam M_bit = 3; localparam M_state = 1 << M_bit;
   localparam W_bit = 4; localparam W_state = 1 << W_bit;

   reg [4:0] 	  state;
   wire           halt;
   
   always @(posedge clk) begin
      if(!resetn) begin
	 state  <= F_state;
      end else if(!halt) begin
	 state <= {state[3:0],state[4]};
      end
   end

   
/******************************************************************************/

 /* 
   Reminder for the 10 RISC-V codeops
   ----------------------------------
   ALUreg  // rd <- rs1 OP rs2   
   ALUimm  // rd <- rs1 OP Iimm
   Branch  // if(rs1 OP rs2) PC<-PC+Bimm
   JALR    // rd <- PC+4; PC<-rs1+Iimm
   JAL     // rd <- PC+4; PC<-PC+Jimm
   AUIPC   // rd <- PC + Uimm
   LUI     // rd <- Uimm   
   Load    // rd <- mem[rs1+Iimm]
   Store   // mem[rs1+Simm] <- rs2
   SYSTEM  // special
 */

/******************************************************************************/
   
   reg [63:0] cycle;   
   reg [63:0] instret;

   always @(posedge clk) begin
      cycle <= !resetn ? 0 : cycle + 1;
   end
   
/******************************************************************************/

   localparam NOP = 32'b0000000_00000_00000_000_00000_0110011; 
   
                      /***  F: Instruction fetch ***/   

   reg  [31:0] 	  F_PC;

   /** These two signals come from the Execute stage **/
   wire [31:0] 	  jumpOrBranchAddress;
   wire 	  jumpOrBranch;

   reg [31:0] PROGROM[0:16383]; // 16384 4-bytes words  
                                // 64 Kb of program ROM 
   initial begin
      $readmemh("PROGROM.hex",PROGROM);
   end

   always @(posedge clk) begin
      if(!resetn) begin
	 F_PC    <= 0;
      end else if(state[F_bit]) begin
	 FD_instr <= PROGROM[F_PC[15:2]];
	 FD_PC    <= F_PC;
	 F_PC     <= F_PC+4;
      end else if(state[M_bit] & jumpOrBranch) begin
	 F_PC  <= jumpOrBranchAddress;	 
      end      
   end
   
/******************************************************************************/
   reg [31:0] FD_PC;   
   reg [31:0] FD_instr;
/******************************************************************************/

                     /*** D: Instruction decode ***/

   /** These three signals come from the Writeback stage **/
   wire        wbEnable;
   wire [31:0] wbData;
   wire [4:0]  wbRdId;

   reg [31:0] registerFile [0:31];

   wire D_isLoad       = (FD_instr[6:2] == 5'b00000);
   wire D_isJALorJALR  = (FD_instr[2] & FD_instr[6]); 
   wire D_isJAL        = FD_instr[3]; 
   wire D_isALUreg     = (FD_instr[6:2] == 5'b01100);
   wire D_isBranch     = (FD_instr[6:2] == 5'b11000);
   wire D_isStore      = (FD_instr[6:2] == 5'b01000);
   wire D_isSYSTEM     = (FD_instr[6:2] == 5'b11100);
   wire [31:0] D_Iimm = {{21{FD_instr[31]}},FD_instr[30:20]};
   wire [31:0] D_Simm = {{21{FD_instr[31]}},FD_instr[30:25],FD_instr[11:7]};
   wire [31:0] D_Uimm = {FD_instr[31:12],{12{1'b0}}};
   wire [31:0] D_Jimm = 
         {{12{FD_instr[31]}},FD_instr[19:12],FD_instr[20],FD_instr[30:21],1'b0};
   wire [31:0] D_Bimm = 
         {{20{FD_instr[31]}},FD_instr[7],FD_instr[30:25],FD_instr[11:8],1'b0};

   // Load-Store
   wire [31:0] D_addr = DE_rs1 + (D_isLoad ? D_Iimm : D_Simm);
   wire        D_isB = (FD_instr[13:12] == 2'b00);
   wire        D_isH = (FD_instr[13:12] == 2'b01);
   wire [3:0]  D_storeMask = D_isB ?
	                     (D_addr[1] ?
		                (D_addr[0] ? 4'b1000 : 4'b0100) :
		                (D_addr[0] ? 4'b0010 : 4'b0001)
                             ) :
	                    D_isH ? (D_addr[1] ? 4'b1100 : 4'b0011) :
                                 4'b1111 ;
   wire        D_isRAM = !D_addr[22];
   
   always @(posedge clk) begin
      if(state[D_bit]) begin
	 DE_isALUreg <= D_isALUreg;
	 DE_isBranch <= D_isBranch;
	 DE_isALUregorBranch <= D_isALUreg || D_isBranch;
	 DE_isJALR   <= (FD_instr[6:2] == 5'b11001);
	 DE_isLoad   <= D_isLoad; 
	 DE_isStore  <= D_isStore;
	 DE_isCSRRS  <= D_isSYSTEM && (FD_instr[14:12] == 3'b010);
	 DE_isEBREAK <= D_isSYSTEM && (FD_instr[14:12] == 3'b000);

	 DE_Iimm <= D_Iimm; 

	 DE_rdId   <= FD_instr[11:7];
	 DE_funct3 <= FD_instr[14:12];
	 DE_funct3_is <= 8'b00000001 << FD_instr[14:12];
	 DE_funct7 <= FD_instr[30];
	 DE_csrId  <= {FD_instr[27],FD_instr[21]};

	 DE_addr <= D_addr;

	 // Code below is equivalent to:
	 // DE_PCplus4orUimm = 
	 //    ((isLUI ? 0 : FD_PC)) + ((isJAL | isJALR) ? 4 : Uimm)
	 // (knowing that isLUI | isAUIPC | isJAL | isJALR)
	 DE_PCplus4orUimm <= ({32{FD_instr[6:5]!=2'b01}} & FD_PC) + 
                             (D_isJALorJALR ? 4 : D_Uimm);

	 DE_isJALorJALRorLUIorAUIPC <= FD_instr[2];

	 DE_PCplusBorJimm <= FD_PC + (D_isJAL ? D_Jimm : D_Bimm);

	 DE_isJALorJALR <= (FD_instr[2] & FD_instr[6]);

	 DE_storeMask <= D_storeMask & {4{D_isRAM & D_isStore}};
      end
   end

   always @(posedge clk) begin
      if(state[W_bit] & wbEnable) begin
	 registerFile[wbRdId] <= wbData;
      end
   end
   
/******************************************************************************/
   wire [31:0] DE_rs1 = registerFile[FD_instr[19:15]];
   wire [31:0] DE_rs2 = registerFile[FD_instr[24:20]];

   reg DE_isALUreg; 
   reg DE_isBranch; 
   reg DE_isJALR;   
   reg DE_isLoad;   
   reg DE_isStore;
   reg DE_isEBREAK;
   reg DE_isCSRRS;

   reg [31:0] DE_Iimm;

   reg [4:0]  DE_rdId;
   reg [1:0]  DE_csrId;
   reg [2:0]  DE_funct3;
   (* onehot *) reg [7:0] DE_funct3_is;
   reg [5:5]  DE_funct7;

   reg [31:0] DE_addr;

   reg 	      DE_isJALorJALRorLUIorAUIPC;
   reg        DE_isJALorJALR;
   reg        DE_isALUregorBranch;
   
   reg [31:0] DE_PCplus4orUimm;
   reg [31:0] DE_PCplusBorJimm;

   reg [3:0] DE_storeMask;
   
/******************************************************************************/

                     /*** E: Execute ***/

   /*********** the ALU *************************************************/

   wire [31:0] E_aluIn1 = DE_rs1;
   wire [31:0] E_aluIn2 = DE_isALUregorBranch ? DE_rs2 : DE_Iimm;

   wire E_minus = DE_funct7[5] & DE_isALUreg;
   wire E_arith_shift = DE_funct7[5];
   
   // The adder is used by both arithmetic instructions and JALR.
   wire [31:0] E_aluPlus = E_aluIn1 + E_aluIn2;

   // Use a single 33 bits subtract to do subtraction and all comparisons
   // (trick borrowed from swapforth/J1)
   wire [32:0] E_aluMinus = {1'b1, ~E_aluIn2} + {1'b0,E_aluIn1} + 33'b1;
   wire        E_LT  = 
                 (E_aluIn1[31] ^ E_aluIn2[31]) ? E_aluIn1[31] : E_aluMinus[32];
   wire        E_LTU =  E_aluMinus[32];
   wire        E_EQ  = (E_aluMinus[31:0] == 0);

   // Flip a 32 bit word. Used by the shifter (a single shifter for
   // left and right shifts, saves silicium !)
   function [31:0] flip32;
      input [31:0] x;
      flip32 = {x[ 0], x[ 1], x[ 2], x[ 3], x[ 4], x[ 5], x[ 6], x[ 7], 
		x[ 8], x[ 9], x[10], x[11], x[12], x[13], x[14], x[15], 
		x[16], x[17], x[18], x[19], x[20], x[21], x[22], x[23],
		x[24], x[25], x[26], x[27], x[28], x[29], x[30], x[31]};
   endfunction

   wire [31:0] E_shifter_in = DE_funct3_is[1] ? flip32(E_aluIn1) : E_aluIn1;
   
   /* verilator lint_off WIDTH */
   wire [31:0] E_rightshift = 
       $signed({E_arith_shift & E_aluIn1[31], E_shifter_in}) >>> E_aluIn2[4:0];
   /* verilator lint_on WIDTH */

   wire [31:0] E_leftshift = flip32(E_rightshift);

   wire [31:0] E_aluOut =
	       DE_funct3_is[0] ? (E_minus ? E_aluMinus[31:0] : E_aluPlus) :
	       DE_funct3_is[1] ? E_leftshift         :
	       DE_funct3_is[2] ? {31'b0, E_LT}       :
	       DE_funct3_is[3] ? {31'b0, E_LTU}      :
	       DE_funct3_is[4] ? E_aluIn1 ^ E_aluIn2 :
	       DE_funct3_is[5] ? E_rightshift        :
	       DE_funct3_is[6] ? E_aluIn1 | E_aluIn2 :
 	                         E_aluIn1 & E_aluIn2 ;
   
   /****************** Branch ******************************/

   wire E_takeBranch =
	DE_funct3_is[0] ?  E_EQ  :
	DE_funct3_is[1] ? !E_EQ  :
	DE_funct3_is[4] ?  E_LT  :
	DE_funct3_is[5] ? !E_LT  :
	DE_funct3_is[6] ?  E_LTU : 
                          !E_LTU ;

   /****************** Store ******************************/


   wire E_isB = (DE_funct3[1:0] == 2'b00);
   wire E_isH = (DE_funct3[1:0] == 2'b01);

   wire [31:0] E_STORE_data;
   assign E_STORE_data[ 7: 0] = DE_rs2[7:0];
   assign E_STORE_data[15: 8] = DE_addr[0] ? DE_rs2[7:0]  : DE_rs2[15: 8] ;
   assign E_STORE_data[23:16] = DE_addr[1] ? DE_rs2[7:0]  : DE_rs2[23:16] ;
   assign E_STORE_data[31:24] = DE_addr[0] ? DE_rs2[7:0]  :
			        DE_addr[1] ? DE_rs2[15:8] : DE_rs2[31:24] ;

   wire  E_isIO         = DE_addr[22];
   wire  E_isRAM        = !E_isIO;

   assign IO_mem_addr  = DE_addr;
   assign IO_mem_wr    = state[E_bit] & DE_isStore & E_isIO; 
   assign IO_mem_wdata = DE_rs2;

   
   reg [31:0] DATARAM [0:16383]; // 16384 4-bytes words 
                                 // 64 Kb of data RAM in total
   wire [13:0] E_word_addr = DE_addr[15:2];
   
   always @(posedge clk) begin
      if(state[E_bit]) begin
	 EM_Mdata <= DATARAM[E_word_addr];
	 if(DE_storeMask[0]) DATARAM[E_word_addr][ 7:0 ] <= E_STORE_data[ 7:0 ];
	 if(DE_storeMask[1]) DATARAM[E_word_addr][15:8 ] <= E_STORE_data[15:8 ];
	 if(DE_storeMask[2]) DATARAM[E_word_addr][23:16] <= E_STORE_data[23:16];
	 if(DE_storeMask[3]) DATARAM[E_word_addr][31:24] <= E_STORE_data[31:24];
      end
   end

   always @(posedge clk) begin
      if(state[E_bit]) begin      
	 EM_IOdata  <= IO_mem_rdata;
	 case(DE_csrId) 
	   2'b00: EM_CSRdata <= cycle[31:0];
	   2'b10: EM_CSRdata <= cycle[63:32];
	   2'b01: EM_CSRdata <= instret[31:0];
	   2'b11: EM_CSRdata <= instret[63:32];	 
	 endcase 
      end
   end

   initial begin
      $readmemh("DATARAM.hex",DATARAM);
   end
   
   /**************************************************************/

   always @(posedge clk) begin
      if(state[E_bit]) begin
	 EM_Eresult  <= DE_isJALorJALRorLUIorAUIPC ? 
                        DE_PCplus4orUimm : E_aluOut;

	 EM_JumpOrBranch        <= DE_isJALorJALR || 
                                   (DE_isBranch && E_takeBranch);
	 
	 EM_JumpOrBranchAddress <= DE_isJALR ? {E_aluPlus[31:1],1'b0} 
                                             : DE_PCplusBorJimm;
	 
	 EM_addr     <= DE_addr[1:0];
	 EM_isIO     <= DE_addr[22];
	 
	 EM_isLoad   <= DE_isLoad;
	 EM_isStore  <= DE_isStore;
	 EM_isBranch <= DE_isBranch;
	 EM_isCSRRS  <= DE_isCSRRS;

	 EM_rdId   <= DE_rdId;
	 EM_funct3 <= DE_funct3;
      end
   end

   assign halt = resetn & DE_isEBREAK;
   
/******************************************************************************/
   reg [31:0] EM_Eresult;
   reg [1:0]  EM_addr;
   reg        EM_isIO;
   reg 	      EM_isLoad;
   reg 	      EM_isStore;
   reg 	      EM_isBranch;
   reg 	      EM_isCSRRS;
   reg [4:0]  EM_rdId;
   reg [2:0]  EM_funct3;

   reg [31:0] EM_CSRdata;
   
   reg [31:0] EM_Mdata;
   reg [31:0] EM_IOdata;
   
   reg        EM_JumpOrBranch;
   reg [31:0] EM_JumpOrBranchAddress;
/******************************************************************************/

   /*** M: Memory ***/


   wire M_isB = (EM_funct3[1:0] == 2'b00);
   wire M_isH = (EM_funct3[1:0] == 2'b01);
   wire M_sext = !EM_funct3[2];		     

   /*************** LOAD ****************************/
   
   wire [15:0] M_LOAD_H=EM_addr[1] ? EM_Mdata[31:16]: EM_Mdata[15:0];
   wire  [7:0] M_LOAD_B=EM_addr[0] ? M_LOAD_H[15:8] : M_LOAD_H[7:0];
   wire        M_LOAD_sign=M_sext & (M_isB ? M_LOAD_B[7] : M_LOAD_H[15]);

   wire [31:0] M_Mresult = M_isB ? {{24{M_LOAD_sign}},M_LOAD_B} :
	                   M_isH ? {{16{M_LOAD_sign}},M_LOAD_H} :
                                                      EM_Mdata ;
   
   always @(posedge clk) begin
      if(state[M_bit]) begin
	 MW_rdId <= EM_rdId;
	 MW_WBdata <= EM_isLoad  ? (EM_isIO ? EM_IOdata : M_Mresult) :
		      EM_isCSRRS ?  EM_CSRdata :
		      EM_Eresult ;
	 MW_wbEnable <= !EM_isBranch && !EM_isStore && (EM_rdId != 0);
	 instret <= instret + 1;	 
      end
      if(!resetn) begin
	 instret <= 0;
      end 
   end

/******************************************************************************/
   reg [31:0] MW_WBdata;
   reg [4:0]  MW_rdId;
   reg 	      MW_wbEnable;
/******************************************************************************/
   
   assign wbData   = MW_WBdata;
   assign wbEnable = MW_wbEnable;
   assign wbRdId   = MW_rdId;
   
/******************************************************************************/
   assign jumpOrBranchAddress = EM_JumpOrBranchAddress;
   assign jumpOrBranch        = EM_JumpOrBranch;
/******************************************************************************/

`ifdef BENCH   
   always @(posedge clk) begin
      if(halt) $finish();
   end
`endif   

/******************************************************************************/
   
endmodule

 
