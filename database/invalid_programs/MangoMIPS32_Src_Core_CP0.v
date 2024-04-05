/********************MangoMIPS32*******************
Filename:   CP0.v
Author:     RickyTino
Version:    v1.1.3
**************************************************/
`include "../Config.v"
`include "../Defines.v"

module CP0
(
    input  wire            clk,
    input  wire            rst,
    input  wire [`HardInt] intr,

    input  wire [`CP0Addr] addr,
    input  wire            wen,
    output reg  [`DataBus] rdata,
    input  wire [`DataBus] wdata,

    input  wire            exc_flag,
    input  wire [`ExcType] exc_type,
    input  wire [`AddrBus] pc,
    input  wire [`AddrBus] exc_baddr,
    input  wire [`CPNum  ] exc_cpnum,
    input  wire            exc_save,
    input  wire            inslot,

    input  wire            tlb_idxwen,
    input  wire            tlb_itmwen,
    input  wire [`DataBus] tlb_index,
    input  wire [`TLB_Itm] tlb_item,

    output wire [`DataBus] Index_o,
    output wire [`DataBus] Random_o,
    output wire [`DataBus] EntryLo0_o,
    output wire [`DataBus] EntryLo1_o,
    output wire [`DataBus] PageMask_o,
    output wire [`DataBus] EntryHi_o,
    output wire [`DataBus] Status_o,
    output wire [`DataBus] Cause_o,
    output wire [`DataBus] EPC_o,
    output wire [`DataBus] Config_o,
    output wire [`DataBus] TagLo_o,
    output wire [`DataBus] ErrorEPC_o,

    output wire            usermode,
    output wire            exc_intr
);

    reg  [`Word] BadVAddr;

    reg  [`Word] EPC;
    // reg  [`Word] ITagHi;
    // reg  [`Word] DTagHi;
    reg  [`Word] TagLo;
    reg  [`Word] TagHi;
    reg  [`Word] ErrorEPC;

    // Count & Compare
    reg  [33: 0] Count__;
    reg  [`Word] Compare;
    wire [`Word] Count    = Count__[32:1];

    reg  timer_intr;
    wire timer_eq = (Count ^ Compare) == `ZeroWord;
    wire timer_on = Compare != `ZeroWord && timer_eq;

    // Status
    reg          Status_CU0;
    reg          Status_BEV;
    reg  [ 7: 0] Status_IM;
    reg          Status_UM;
    reg          Status_ERL;
    reg          Status_EXL;
    reg          Status_IE;
    wire [`Word] Status = {
        3'b0,
        Status_CU0, // 28
        5'b0,
        Status_BEV, // 22
        6'b0,
        Status_IM,  // 15:8
        3'b0,
        Status_UM,  // 4
        1'b0,
        Status_ERL, // 2
        Status_EXL, // 1
        Status_IE   // 0
    };

    // Cause
    reg          Cause_BD;
    reg  [ 1: 0] Cause_CE;
    reg          Cause_IV;
    reg  [ 7: 0] Cause_IP;
    reg  [ 4: 0] Cause_ExcCode;
    wire [`Word] Cause = {
        Cause_BD,       // 31 R
        1'b0,
        Cause_CE,       // 29:28 R
        4'b0,
    `ifdef Disable_Cause_IV
        1'b0,
    `else
        Cause_IV,       // 23 RW
    `endif
        7'b0,
        Cause_IP,       // 15:8 R[15:10] RW[9:8]
        1'b0,
        Cause_ExcCode,  // 6:2 R
        2'b0
    };

    // PrId
    wire [`Word] PrId = 
    {
        8'h00,          // Company Options
        8'h01,          // Company ID
        8'h80,          // Processor ID
        8'h00           // Revision
    };
    // 32'h00004220; //LS232

    // Config
    reg  [ 2: 0] Config_K23;
    reg  [ 2: 0] Config_KU;
    reg  [ 2: 0] Config_K0;
    wire [`Word] Config = {
        1'b1,       // 31    Config1
    `ifdef Fixed_Mapping_MMU
        Config_K23, // 30:28
        Config_KU,  // 27:25
    `else
        3'b0,       // 30:28
        3'b0,       // 27:25
    `endif
        9'b0,
        1'b0,       // 15    BE:Little Endian
        2'b0,       // 14:13 AT:MIPS32
        3'b0,       // 12:10 AR:Release 1
    `ifdef Fixed_Mapping_MMU
        3'b011,     //  9: 7 MT:Fixed Mapping
    `else
        3'b001,     //  9: 7 MT:Standart TLB
    `endif
        3'b0,
        1'b0,       //  3    VI:0
        Config_K0   //  2: 0
    };

    // Config1
    `define  IS  3'd`ICache_N - 3'd1
    `define  DS  3'd`DCache_N - 3'd1
    wire [`Word] Config1 = {
        1'b0,       // 31    Config2
    `ifdef Fixed_Mapping_MMU
        6'b0,       // 30:25 MMU Size-1
    `else
        6'd31,      // 30:25 MMU Size-1
    `endif
        `IS,        // 24:22 IS
        3'd5,       // 21:19 IL = 5 64B
        3'b0,       // 18:16 IA
        `DS,        // 15:13 DS
        3'd5,       // 12:10 DL = 5 64B
        3'b0,       //  9: 7 DA
        1'b0,       //  6    C2
        1'b0,       //  5    MD
        1'b0,       //  4    PC
        1'b0,       //  3    WR
        1'b0,       //  2    CA
        1'b0,       //  1    EP
        1'b0        //  0    FP
    };

    // Index
    reg             Index_P;
    reg  [`TLB_Idx] Index__;
    wire [`Word   ] Index;

    assign Index [   31   ] = Index_P;
    assign Index [`Index_0] = 0;
    assign Index [`TLB_Idx] = Index__;

    // Random
    reg  [`TLB_Idx] Random__;
    wire [`Word   ] Random;
    
    assign Random [`Random_0] = 0;
    assign Random [`TLB_Idx ] = Random__;

    // EntryLo
    reg  [19: 0] EntryLo0_PFN,  EntryLo1_PFN;
    reg  [ 2: 0] EntryLo0_C,    EntryLo1_C;
    reg          EntryLo0_D,    EntryLo1_D;
    reg          EntryLo0_V,    EntryLo1_V;
    reg          EntryLo0_G,    EntryLo1_G;

    wire [`Word   ] EntryLo0 = {
        6'b0,
        EntryLo0_PFN,   // 25: 6
        EntryLo0_C,     //  5: 3
        EntryLo0_D,     //  2
        EntryLo0_V,     //  1
        EntryLo0_G      //  0
    };
    wire [`Word   ] EntryLo1 = {
        6'b0,
        EntryLo1_PFN,
        EntryLo1_C,
        EntryLo1_D,
        EntryLo1_V,
        EntryLo1_G
    };

    // EntryHi
    reg  [18: 0] EntryHi_VPN2;
    reg  [ 7: 0] EntryHi_ASID;
    wire [`Word] EntryHi = {EntryHi_VPN2, 5'b0, EntryHi_ASID};

    // Context
    reg  [ 8: 0] Context_PTEBase;
    reg  [18: 0] Context_BadVPN2;
    wire [`Word] Context = {
        Context_PTEBase,
        Context_BadVPN2,
        4'b0
    };

    // PageMask
    reg  [15: 0] PageMask__;
    wire [`Word] PageMask = {3'b0, PageMask__, 13'b0};

    // Wired
    reg  [`TLB_Idx] Wired__;
    wire [`Word   ] Wired;
    assign Wired [`Wired_0] = 0;
    assign Wired [`TLB_Idx] = Wired__;

// CP0 Operations
    wire [`Word] pcm4     = pc - 32'h4;
    

    //PageMask write
    wire [15: 0] w_mask;
    genvar i;
    generate
        for(i = 0; i < 16; i = i + 2) begin
            assign w_mask[i    ] = wdata[i + 13];
            assign w_mask[i + 1] = wdata[i + 13];
        end
    endgenerate

    always @(posedge clk, posedge rst) begin
        if(rst) begin

            Index_P         <= 0;
            Index__         <= 0;
            Random__        <= `Random_Rst;
            EntryLo0_PFN    <= 0;
            EntryLo0_C      <= 0;
            EntryLo0_D      <= 0;
            EntryLo0_V      <= 0;
            EntryLo0_G      <= 0;
            EntryLo1_PFN    <= 0;
            EntryLo1_C      <= 0;
            EntryLo1_D      <= 0;
            EntryLo1_V      <= 0;
            EntryLo1_G      <= 0;
            Context_BadVPN2 <= 0;
            Context_PTEBase <= 0;
            PageMask__      <= 0;
            Wired__         <= 0;
            BadVAddr        <= 0;
            Count__         <= 0;
            timer_intr      <= 0;
            EntryHi_VPN2    <= 0;
            EntryHi_ASID    <= 0;
            Compare         <= 0;
            Status_CU0      <= 0;
            Status_BEV      <= 1;
            Status_IM       <= 0;
            Status_UM       <= 0;
            Status_ERL      <= 1;
            Status_EXL      <= 0;
            Status_IE       <= 0;
            Cause_BD        <= 0;
            Cause_CE        <= 0;
            Cause_IV        <= 0;
            Cause_IP        <= 0;
            Cause_ExcCode   <= 0;
            EPC             <= 0;
            `ifdef Reset_Cacheable
            Config_K23      <= 3'd3;
            Config_KU       <= 3'd3;
            Config_K0       <= 3'd3;
            `else
            Config_K23      <= 3'd2;
            Config_KU       <= 3'd2;
            Config_K0       <= 3'd2;
            `endif
            TagLo           <= 0;
            TagHi           <= 0;
            ErrorEPC        <= 32'hBFC00000;
        end
        else begin
            // Count & Compare
            Count__ <= Count__ + 33'd1;
            if(timer_on) timer_intr <= `true;
            
            // Random
            Random__ <= (Random__ ^ Wired__) == 0 ? `Random_Rst : Random__ - 1;

            // Interrupts
            Cause_IP[7:2] <= {intr[5] | timer_intr, intr[4:0]};

            // Exceptions
            if(exc_flag) begin
                case (exc_type)
                    `ExcT_Intr,
                    `ExcT_CpU,
                    `ExcT_RI,
                    `ExcT_Ov,
                    `ExcT_Trap,
                    `ExcT_SysC,
                    `ExcT_Bp,
                    `ExcT_AdE,
                    // `ExcT_IBE,
                    // `ExcT_DBE,
                    `ExcT_TLBR,
                    `ExcT_TLBI,
                    `ExcT_TLBM: begin
                        if(!Status_EXL) begin
                            EPC       <= inslot ? pcm4 : pc;
                            Cause_BD  <= inslot;
                        end
                        Status_EXL <= `One;
                    end
                    
                    `ExcT_ERET: begin
                        Status_EXL <= `Zero;
                    end
                endcase

                case (exc_type)
                    `ExcT_AdE: BadVAddr <= exc_baddr;

                    `ExcT_TLBR,
                    `ExcT_TLBI,
                    `ExcT_TLBM: begin
                        BadVAddr        <= exc_baddr;
                        Context_BadVPN2 <= exc_baddr[`VPN2];
                        EntryHi_VPN2    <= exc_baddr[`VPN2];
                    end

                    `ExcT_CpU: Cause_CE <= exc_cpnum;
                endcase

                // ExcCode
                case (exc_type)
                    `ExcT_Intr: Cause_ExcCode <= `ExcC_Intr;
                    `ExcT_CpU:  Cause_ExcCode <= `ExcC_CpU;
                    `ExcT_RI:   Cause_ExcCode <= `ExcC_RI;
                    `ExcT_Ov:   Cause_ExcCode <= `ExcC_Ov;
                    `ExcT_Trap: Cause_ExcCode <= `ExcC_Tr;
                    `ExcT_SysC: Cause_ExcCode <= `ExcC_SysC;
                    `ExcT_Bp:   Cause_ExcCode <= `ExcC_Bp;
                    `ExcT_AdE:  Cause_ExcCode <= exc_save ? `ExcC_AdES : `ExcC_AdEL;
                    `ExcT_TLBR: Cause_ExcCode <= exc_save ? `ExcC_TLBS : `ExcC_TLBL;
                    `ExcT_TLBI: Cause_ExcCode <= exc_save ? `ExcC_TLBS : `ExcC_TLBL;
                    `ExcT_TLBM: Cause_ExcCode <= `ExcC_Mod;
                    // `ExcT_IBE:  Cause_ExcCode <= `ExcC_IBE
                    // `ExcT_DBE:  Cause_ExcCode <= `ExcC_DBE
                endcase

                // Displaying
                `ifdef Output_Exception_Info
                    case (exc_type)
                        `ExcT_Intr: $display("Interrupt Exception");
                        `ExcT_CpU:  $display("Coprocessor Unusable Exception");
                        `ExcT_RI:   $display("Reserved Instruction Exception");
                        `ExcT_Ov:   $display("Integer Overflow Exception");
                        `ExcT_Trap: $display("Trap Exception");
                        `ExcT_SysC: $display("System Call Exception");
                        `ExcT_Bp:   $display("Breakpoint Exception");
                        `ExcT_AdE:  $display("Address Error Exception");
                        `ExcT_TLBR: $display("TLB Refill Exception");
                        `ExcT_TLBI: $display("TLB Invalid Exception");
                        `ExcT_TLBM: $display("TLB Modified Exception");
                        // `ExcT_IBE: $display("Bus Error Exception - Inst");
                        // `ExcT_DBE: $display("Bus Error Exception - Data");
                    endcase
                `endif
            end
            else if(tlb_idxwen) begin
                Index_P <= tlb_index[31];
                Index__ <= tlb_index[`TLB_Idx];
            end
            else if(tlb_itmwen) begin
                PageMask__   <= tlb_item[`TLB_Mask];
                EntryHi_VPN2 <= tlb_item[`TLB_VPN2];
                EntryHi_ASID <= tlb_item[`TLB_ASID];
                EntryLo0_G   <= tlb_item[`TLB_G];
                EntryLo0_PFN <= tlb_item[`TLB_PFN0];
                EntryLo0_V   <= tlb_item[`TLB_V0];
                EntryLo0_D   <= tlb_item[`TLB_D0];
                EntryLo0_C   <= tlb_item[`TLB_C0];
                EntryLo1_G   <= tlb_item[`TLB_G];
                EntryLo1_PFN <= tlb_item[`TLB_PFN1];
                EntryLo1_V   <= tlb_item[`TLB_V1];
                EntryLo1_D   <= tlb_item[`TLB_D1];
                EntryLo1_C   <= tlb_item[`TLB_C1];
            end
            else if(wen) begin
                case (addr)
                    `CP0_Index: begin
                        Index__  <= wdata[`TLB_Idx];
                    end

                    `CP0_EntryLo0: begin
                        EntryLo0_PFN <= wdata[`PFN];
                        EntryLo0_C   <= wdata[`CAt];
                        EntryLo0_D   <= wdata[`Drt];
                        EntryLo0_V   <= wdata[`Vld];
                        EntryLo0_G   <= wdata[`Glb];
                    end

                    `CP0_EntryLo1: begin
                        EntryLo1_PFN <= wdata[`PFN];
                        EntryLo1_C   <= wdata[`CAt];
                        EntryLo1_D   <= wdata[`Drt];
                        EntryLo1_V   <= wdata[`Vld];
                        EntryLo1_G   <= wdata[`Glb];
                    end

                    `CP0_Context: begin
                        Context_PTEBase <= wdata[`PTEBase];
                    end

                    `CP0_PageMask: begin
                        PageMask__ <= w_mask;
                    end

                    `CP0_Wired: begin
                        Wired__  <= wdata[`TLB_Idx];
                        Random__ <= `Random_Rst;
                    end

                    `CP0_BadVAddr: begin
                        BadVAddr <= wdata;
                    end

                    `CP0_Count: begin
                        Count__ <= {wdata, 1'b0};
                    end

                    `CP0_EntryHi: begin
                        EntryHi_VPN2 <= wdata[`VPN2];
                        EntryHi_ASID <= wdata[`ASID];
                    end

                    `CP0_Compare: begin
                        Compare    <= wdata;
                        timer_intr <= `false;
                    end

                    `CP0_Status: begin
                        Status_CU0 <= wdata[`CU0];
                        Status_BEV <= wdata[`BEV];
                        Status_IM  <= wdata[`IM ];
                        Status_UM  <= wdata[`UM ];
                        Status_ERL <= wdata[`ERL];
                        Status_EXL <= wdata[`EXL];
                        Status_IE  <= wdata[`IE ];
                    end

                    `CP0_Cause: begin
                        Cause_IV      <= wdata[`IV ];
                        Cause_IP[1:0] <= wdata[`IPS];
                    end

                    `CP0_EPC: begin
                        EPC <= wdata;
                    end

                    `CP0_Config: begin
                        Config_K23 <= wdata[`K23];
                        Config_KU  <= wdata[`KU ];
                        Config_K0  <= wdata[`K0 ];
                    end

                    `CP0_TagLo: begin
                        TagLo <= wdata;
                    end

                    `CP0_TagHi: begin
                        TagHi <= wdata;
                    end

                    `CP0_ErrorEPC: begin
                        ErrorEPC <= wdata;
                    end
                endcase
            end
        end
    end

    always @(*) begin
        case (addr) 
            `CP0_Index:    rdata <= Index;
            `CP0_Random:   rdata <= Random;
            `CP0_EntryLo0: rdata <= EntryLo0;
            `CP0_EntryLo1: rdata <= EntryLo1;
            `CP0_Context:  rdata <= Context;
            `CP0_PageMask: rdata <= PageMask;
            `CP0_Wired:    rdata <= Wired;
            `CP0_BadVAddr: rdata <= BadVAddr;
            `CP0_Count:    rdata <= Count;
            `CP0_EntryHi:  rdata <= EntryHi;
            `CP0_Compare:  rdata <= Compare;
            `CP0_Status:   rdata <= Status;
            `CP0_Cause:    rdata <= Cause;
            `CP0_EPC:      rdata <= EPC;
            `CP0_PrId:     rdata <= PrId;
            `CP0_Config:   rdata <= Config;
            `CP0_Config1:  rdata <= Config1;
            `CP0_TagLo:    rdata <= TagLo;
            `CP0_TagHi:    rdata <= TagHi;
            `CP0_ErrorEPC: rdata <= ErrorEPC;
            default:       rdata <= `ZeroWord;
        endcase
    end

    wire   no_ex_er = ~Status[`ERL] & ~Status[`EXL];
    assign exc_intr = (Cause[`IP] & Status[`IM]) != 0 && Status[`IE] && no_ex_er;
    
    `ifdef Disable_User_Mode
        assign usermode = `false;
    `else
        assign usermode = Status[`UM] & no_ex_er;
    `endif
    
    // Output
    assign Index_o    = Index;
    assign Random_o   = Random;
    assign EntryLo0_o = EntryLo0;
    assign EntryLo1_o = EntryLo1;
    assign PageMask_o = PageMask;
    assign EntryHi_o  = EntryHi;
    assign Status_o   = Status;
    assign Cause_o    = Cause;
    assign EPC_o      = EPC;
    assign Config_o   = Config;
    assign TagLo_o    = TagLo;
    assign ErrorEPC_o = ErrorEPC;

endmodule