/********************MangoMIPS32*******************
Filename:   Core_Top.v
Author:     RickyTino
Version:    v1.1.3
**************************************************/
`include "../Config.v"
`include "../Defines.v"

module MangoMIPS_Core_Top
(
    input  wire            clk,
    input  wire            rst,
    input  wire [`HardInt] intr,

    output wire            ibus_en,
    output wire [`AddrBus] ibus_addr,
    input  wire [`DataBus] ibus_rdata,
    input  wire            ibus_streq,
    output wire            ibus_stall,
    output wire            ibus_cached,

    output wire            dbus_en,
    output wire [`AddrBus] dbus_addr,
    input  wire [`DataBus] dbus_rdata,
    output wire [`ByteWEn] dbus_wen,
    output wire [`DataBus] dbus_wdata,
    output wire [`AXISize] dbus_size,
    input  wire            dbus_streq,
    output wire            dbus_stall,
    output wire            dbus_cached,

    output wire [`CacheOp] cacheop,
    output wire [`DataBus] cop_tag
);

    wire [`AddrBus] if_pcp4;
    wire [`ExcBus ] if_excp;
    wire            if_i_en;
    wire [`AddrBus] if_i_vaddr;
    wire [`DataBus] if_i_rdata; 

    wire            itlb_en;
    wire [`AddrBus] itlb_vaddr;
    wire            itlb_rdy;
    wire [`AddrBus] itlb_paddr;
    wire            itlb_cat;
    wire            i_tlbr;
    wire            i_tlbi;
    wire            exc_i_tlbr;
    wire            exc_i_tlbi;

    wire [`AddrBus] id_pc;
    wire [`AddrBus] id_pcp4;
    wire [`DataBus] id_inst;
    wire [`ExcBus ] id_excp_i;
    wire            id_inslot;
    wire            br_flag;
    wire [`AddrBus] br_addr;

    wire            r1read;
    wire [`RegAddr] r1addr;
    wire [`DataBus] r1data;
    wire            r2read;
    wire [`RegAddr] r2addr;
    wire [`DataBus] r2data;
    wire            hazard_ex;
    wire            hazard_mem;

    wire [`DataBus] id_opr1;
    wire [`DataBus] id_opr2;
    wire [`DataBus] id_offset;
    wire [`CP0Addr] id_cp0sel;
    wire [`ALUOp  ] id_aluop;
    wire [`CacheOp] id_cacheop;
    wire            id_wreg;
    wire [`RegAddr] id_wraddr;
    wire [`ExcBus ] id_excp_o;
    wire [`CPNum  ] id_ecpnum;
    wire            id_isbranch;
    wire            id_clrslot;
    wire            id_null;

    wire [`AddrBus] ex_pc;
    wire [`ALUOp  ] ex_aluop;
    wire [`CacheOp] ex_cacheop;
    wire [`DataBus] ex_opr1;
    wire [`DataBus] ex_opr2;
    wire [`DataBus] ex_offset;
    wire [`CP0Addr] ex_cp0sel;
    wire            ex_wreg;
    wire [`RegAddr] ex_wraddr;
    wire [`ExcBus ] ex_excp_i;
    wire [`CPNum  ] ex_ecpnum;
    wire            ex_inslot;

    wire            div_start;
    wire            div_signed;
    wire            div_ready;
    wire [`DWord  ] div_res;

    wire [`DataBus] ex_alures;
    wire            ex_resnrdy;
    wire [`DWord  ] ex_mulhi;
    wire [`DWord  ] ex_mullo;
    wire            ex_mul_s;
    wire [`ByteWEn] ex_wregsel;
    wire            ex_llb_wen;
    wire            ex_llbit;
    wire [`ExcBus ] ex_excp_o;
    wire [`TLBOp  ] ex_tlbop; 
    wire            ex_null;

    wire            ex_m_en;
    wire [`ByteWEn] ex_m_wen;
    wire [`AddrBus] ex_m_vaddr;
    wire [`DataBus] ex_m_wdata;
    wire [`AXISize] ex_m_size;
    
    wire [`AddrBus] mem_pc;
    wire [`ALUOp  ] mem_aluop;
    wire [`DataBus] mem_alures_i;
    wire [`DWord  ] mem_mulhi;
    wire [`DWord  ] mem_mullo;
    wire            mem_mul_s;
    wire [`DWord  ] mem_divres; 
    wire [`CP0Addr] mem_cp0sel;
    wire [`ByteWEn] mem_wreg;
    wire [`RegAddr] mem_wraddr;
    wire            mem_llb_wen;
    wire            mem_llbit;
    wire [`ExcBus ] mem_excp;
    wire [`CPNum  ] mem_ecpnum;
    wire [`TLBOp  ] mem_tlbop;
    wire            mem_inslot;
    wire            mem_null;

    wire            mem_m_en;
    wire [`ByteWEn] mem_m_wen;
    wire [`AddrBus] mem_m_vaddr;
    wire [`DataBus] mem_m_wdata;
    wire [`DataBus] mem_m_rdata;
    wire [`AXISize] mem_m_size;
    wire            mem_m_refs;

    wire            dtlb_en;
    wire [`AddrBus] dtlb_vaddr;
    // wire            dtlb_refs;
    wire            dtlb_rdy;
    wire [`AddrBus] dtlb_paddr;
    wire            dtlb_cat;
    wire            d_tlbr;
    wire            d_tlbi;
    wire            d_tlbm;

    wire            exc_flag;
    wire            exc_save;
    wire            exc_intr;
    wire            exc_d_tlbr;
    wire            exc_d_tlbi;
    wire            exc_d_tlbm;
    wire [`ExcType] exc_type;
    wire [`AddrBus] exc_baddr;
    wire [`AddrBus] exc_newpc;
    wire            usermode;

    wire            cp0_wen;
    wire [`CP0Addr] cp0_addr;
    wire [`DataBus] cp0_wdata;
    wire [`DataBus] cp0_rdata;
    wire            cp0_idxwen;
    wire            cp0_itmwen;
    wire [`DataBus] cp0_tlbidx;
    wire [`TLB_Itm] cp0_tlbitm; 

    wire [`DataBus] cp0_Index;
    wire [`DataBus] cp0_Random;
    wire [`DataBus] cp0_EntryLo0;
    wire [`DataBus] cp0_EntryLo1;
    wire [`DataBus] cp0_PageMask;
    wire [`DataBus] cp0_EntryHi;
    wire [`DataBus] cp0_Status;
    wire [`DataBus] cp0_Cause;
    wire [`DataBus] cp0_EPC;
    wire [`DataBus] cp0_Config;
    wire [`DataBus] cp0_ErrorEPC;

    wire [`DataBus] mem_alures_o;
    wire [`DataBus] mem_mulres;
    wire            mem_resnrdy;
    wire            mem_hilo_wen;
    wire [`DWord  ] mem_hilo;

    wire [`AddrBus] wb_pc;
    wire [`ALUOp  ] wb_aluop;
    wire [`DataBus] wb_alures;
    wire [`DataBus] wb_mulres;
    wire [`AddrBus] wb_m_vaddr;
    wire [`DataBus] wb_m_rdata; 
    wire [`ByteWEn] wb_wreg;
    wire [`RegAddr] wb_wraddr;
    wire            wb_hilo_wen;
    wire [`DWord  ] wb_hilo;
    wire            wb_llb_wen;
    wire            wb_llbit;

    wire [`DataBus] wb_wrdata;
    wire [`DWord  ] hilo;
    wire            llbit;

    wire [`Stages ] streq;
    wire [`Stages ] stall;
    wire [`Stages ] flush; 

    assign ibus_stall = stall[`IF ];
    assign dbus_stall = stall[`MEM];
  
    PC pc (
        .clk        ( clk           ),
        .rst        ( rst           ),
        .stall      ( stall[`IF]    ),
        .flush      ( flush[`IF]    ),
        .flush_pc   ( exc_newpc     ),
        .br_flag    ( br_flag       ),
        .br_addr    ( br_addr       ),
        .usermode   ( usermode      ),
        .i_tlbr     ( exc_i_tlbr    ),
        .i_tlbi     ( exc_i_tlbi    ),

        .pc         ( if_i_vaddr    ),
        .pcp4       ( if_pcp4       ),
        .excp       ( if_excp       ),
        .i_en       ( if_i_en       )
    );

    MMU mmu_inst (
        .en         ( if_i_en       ),
        .wen        ( `WrDisable    ),
        .vaddr      ( if_i_vaddr    ),
        .wdata      ( `ZeroWord     ),
        .rdata      ( if_i_rdata    ),
        .size       ( `ASize_Word   ),

        .bus_en     ( ibus_en       ),
        .bus_paddr  ( ibus_addr     ),
        .bus_rdata  ( ibus_rdata    ),
        .bus_streq  ( ibus_streq    ),
        .bus_cached ( ibus_cached   ),

        .tlb_en     ( itlb_en       ),
        .tlb_vaddr  ( itlb_vaddr    ),
        .tlb_rdy    ( itlb_rdy      ),
        .tlb_paddr  ( itlb_paddr    ),
        .tlb_cat    ( itlb_cat      ),
        .tlb_tlbr   ( i_tlbr        ),
        .tlb_tlbi   ( i_tlbi        ),
        .tlb_tlbm   ( `false        ),

        .exc_flag   ( exc_flag      ),
        .cp0_Status ( cp0_Status    ), 
        .cp0_Config ( cp0_Config    ),
        .exc_tlbr   ( exc_i_tlbr    ),
        .exc_tlbi   ( exc_i_tlbi    ),
        .stallreq   ( streq[`IF]    )
    );

    Reg_IF_ID reg_if_id (
        .clk            ( clk           ),
        .rst            ( rst           ),
        .stall          ( stall[`ID]    ),
        .flush          ( flush[`ID]    ),
        .clrslot        ( id_clrslot    ),

        .if_pc          ( if_i_vaddr    ),
        .if_pcp4        ( if_pcp4       ),
        .if_inst        ( if_i_rdata    ),
        .if_excp        ( if_excp       ),

        .id_isbranch    ( id_isbranch   ),
        .id_pc          ( id_pc         ),
        .id_pcp4        ( id_pcp4       ),
        .id_inst        ( id_inst       ),
        .id_excp        ( id_excp_i     ),
        .id_inslot      ( id_inslot     ),
        .id_null        ( id_null       )
    );

    Decode decode (
        .pc             ( id_pc         ),
        .pcp4           ( id_pcp4       ),
        .inst           ( id_inst       ),

        .r1read         ( r1read        ),
        .r1addr         ( r1addr        ),
        .r1data         ( r1data        ),
        .r2read         ( r2read        ),
        .r2addr         ( r2addr        ),
        .r2data         ( r2data        ),

        .opr1           ( id_opr1       ),
        .opr2           ( id_opr2       ),
        .aluop          ( id_aluop      ),
        .cacheop        ( id_cacheop    ),
        .offset         ( id_offset     ),
        .cp0sel         ( id_cp0sel     ),
        .wreg           ( id_wreg       ),
        .wraddr         ( id_wraddr     ),

        .ex_resnrdy     ( ex_resnrdy    ),
        .mem_resnrdy    ( mem_resnrdy   ),
        .hazard_ex      ( hazard_ex     ),
        .hazard_mem     ( hazard_mem    ),

        .isbranch       ( id_isbranch   ),
        .inslot         ( id_inslot     ),
        .clrslot        ( id_clrslot    ),
        .br_flag        ( br_flag       ),
        .br_addr        ( br_addr       ),

        .usermode       ( usermode      ),
        .cp0_Status     ( cp0_Status    ), 
        .excp_i         ( id_excp_i     ),
        .excp_o         ( id_excp_o     ),
        .ecpnum         ( id_ecpnum     ),

        .stallreq       ( streq[`ID]    )
    );

    RegFile regfile (
        .clk        ( clk           ),
        .rst        ( rst           ), 

        .re1        ( r1read        ), 
        .r1addr     ( r1addr        ),
        .r1data     ( r1data        ),

        .re2        ( r2read        ),
        .r2addr     ( r2addr        ),
        .r2data     ( r2data        ),

        .we         ( wb_wreg       ),
        .waddr      ( wb_wraddr     ), 
        .wdata      ( wb_wrdata     ),

        .ex_wreg    ( ex_wregsel    ),
        .ex_wraddr  ( ex_wraddr     ),
        .ex_alures  ( ex_alures     ),
        .mem_wreg   ( mem_wreg      ),
        .mem_wraddr ( mem_wraddr    ),
        .mem_alures ( mem_alures_o  ),

        .hazard_ex  ( hazard_ex     ),
        .hazard_mem ( hazard_mem    )
    );

    Reg_ID_EX reg_id_ex (
        .clk        ( clk           ),
        .rst        ( rst           ),
        .stall      ( stall[`EX]    ),
        .flush      ( flush[`EX]    ),

        .id_pc      ( id_pc         ),
        .id_aluop   ( id_aluop      ),
        .id_cacheop ( id_cacheop    ),
        .id_opr1    ( id_opr1       ),
        .id_opr2    ( id_opr2       ),
        .id_offset  ( id_offset     ),
        .id_cp0sel  ( id_cp0sel     ),
        .id_wreg    ( id_wreg       ),
        .id_wraddr  ( id_wraddr     ),
        .id_excp    ( id_excp_o     ),
        .id_ecpnum  ( id_ecpnum     ),
        .id_inslot  ( id_inslot     ),
        .id_null    ( id_null       ),

        .ex_pc      ( ex_pc         ),
        .ex_aluop   ( ex_aluop      ),
        .ex_cacheop ( ex_cacheop    ),
        .ex_opr1    ( ex_opr1       ),
        .ex_opr2    ( ex_opr2       ),
        .ex_offset  ( ex_offset     ),
        .ex_cp0sel  ( ex_cp0sel     ),
        .ex_wreg    ( ex_wreg       ),
        .ex_wraddr  ( ex_wraddr     ),
        .ex_excp    ( ex_excp_i     ),
        .ex_ecpnum  ( ex_ecpnum     ),
        .ex_inslot  ( ex_inslot     ),
        .ex_null    ( ex_null       )
    );

    ALU_EX alu_ex (
        .pc         ( ex_pc         ),
        .aluop      ( ex_aluop      ),
        .opr1       ( ex_opr1       ),
        .opr2       ( ex_opr2       ),
        .offset     ( ex_offset     ),
        .div_start  ( div_start     ),
        .div_signed ( div_signed    ),
        .div_ready  ( div_ready     ),

        .alures     ( ex_alures     ),
        .resnrdy    ( ex_resnrdy    ),
        .mulhi      ( ex_mulhi      ),
        .mullo      ( ex_mullo      ),
        .mul_s      ( ex_mul_s      ),

        .m_en       ( ex_m_en       ),
        .m_wen      ( ex_m_wen      ),
        .m_vaddr    ( ex_m_vaddr    ),
        .m_wdata    ( ex_m_wdata    ),
        .m_size     ( ex_m_size     ),
        .wreg       ( ex_wreg       ),
        .wregsel    ( ex_wregsel    ),

        .llbit_i    ( llbit         ),
        .llb_wen    ( ex_llb_wen    ),
        .llbit_o    ( ex_llbit      ),

        .usermode   ( usermode      ),
        .excp_i     ( ex_excp_i     ),
        .excp_o     ( ex_excp_o     ),
        .tlbop      ( ex_tlbop      ),
        .stallreq   ( streq[`EX]    )
    );

    Divider divider (
        .clk        ( clk           ),
        .rst        ( rst           ),
        .start      ( div_start     ),
        .abandon    ( flush[`EX]    ),
        .stall      ( stall[`EX]    ),
        .signdiv    ( div_signed    ),
        .opr1       ( ex_opr1       ),
        .opr2       ( ex_opr2       ),
        .ready      ( div_ready     ),
        .res        ( div_res       )
    );

    Reg_EX_MEM reg_ex_mem (
        .clk            ( clk           ),
        .rst            ( rst           ),
        .stall          ( stall[`MEM]   ),
        .flush          ( flush[`MEM]   ),

        .ex_pc          ( ex_pc         ),
        .ex_aluop       ( ex_aluop      ),
        .ex_cacheop     ( ex_cacheop    ),
        .ex_alures      ( ex_alures     ),
        .ex_mulhi       ( ex_mulhi      ),
        .ex_mullo       ( ex_mullo      ),
        .ex_mul_s       ( ex_mul_s      ),
        .ex_divres      ( div_res       ),
        .ex_cp0sel      ( ex_cp0sel     ),
        .ex_m_en        ( ex_m_en       ),
        .ex_m_wen       ( ex_m_wen      ),
        .ex_m_vaddr     ( ex_m_vaddr    ),
        .ex_m_wdata     ( ex_m_wdata    ),
        .ex_m_size      ( ex_m_size     ),
        .ex_wreg        ( ex_wregsel    ),
        .ex_wraddr      ( ex_wraddr     ),
        .ex_llb_wen     ( ex_llb_wen    ),
        .ex_llbit       ( ex_llbit      ),
        .ex_excp        ( ex_excp_o     ),
        .ex_ecpnum      ( ex_ecpnum     ),
        .ex_tlbop       ( ex_tlbop      ),
        .ex_inslot      ( ex_inslot     ),
        .ex_null        ( ex_null       ),
        
        .mem_pc         ( mem_pc        ),
        .mem_aluop      ( mem_aluop     ),
        .mem_cacheop    ( cacheop       ),
        .mem_alures     ( mem_alures_i  ),
        .mem_mulhi      ( mem_mulhi     ),
        .mem_mullo      ( mem_mullo     ),
        .mem_mul_s      ( mem_mul_s     ),
        .mem_divres     ( mem_divres    ),
        .mem_cp0sel     ( mem_cp0sel    ),
        .mem_m_en       ( mem_m_en      ),
        .mem_m_wen      ( mem_m_wen     ),
        .mem_m_vaddr    ( mem_m_vaddr   ),
        .mem_m_wdata    ( mem_m_wdata   ),
        .mem_m_size     ( mem_m_size    ),
        .mem_wreg       ( mem_wreg      ),
        .mem_wraddr     ( mem_wraddr    ),
        .mem_llb_wen    ( mem_llb_wen   ),
        .mem_llbit      ( mem_llbit     ),
        .mem_excp       ( mem_excp      ),
        .mem_ecpnum     ( mem_ecpnum    ),
        .mem_tlbop      ( mem_tlbop     ),
        .mem_inslot     ( mem_inslot    ),
        .mem_null       ( mem_null      )
    );
    
    MMU mmu_data (
        .en         ( mem_m_en      ),
        .wen        ( mem_m_wen     ),
        .vaddr      ( mem_m_vaddr   ),
        .wdata      ( mem_m_wdata   ),
        .rdata      ( mem_m_rdata   ),
        .size       ( mem_m_size    ),
        .refs       ( mem_m_refs    ),

        .bus_en     ( dbus_en       ),
        .bus_paddr  ( dbus_addr     ),
        .bus_rdata  ( dbus_rdata    ),
        .bus_wen    ( dbus_wen      ),
        .bus_wdata  ( dbus_wdata    ),
        .bus_size   ( dbus_size     ),
        .bus_streq  ( dbus_streq    ),
        .bus_cached ( dbus_cached   ),

        .tlb_en     ( dtlb_en       ),
        .tlb_vaddr  ( dtlb_vaddr    ),
        .tlb_rdy    ( dtlb_rdy      ),
        .tlb_paddr  ( dtlb_paddr    ),
        .tlb_cat    ( dtlb_cat      ),
        .tlb_tlbr   ( d_tlbr        ),
        .tlb_tlbi   ( d_tlbi        ),
        .tlb_tlbm   ( d_tlbm        ),

        .exc_flag   ( exc_flag      ),
        .cp0_Status ( cp0_Status    ),
        .cp0_Config ( cp0_Config    ),
        .exc_tlbr   ( exc_d_tlbr    ),
        .exc_tlbi   ( exc_d_tlbi    ),
        .exc_tlbm   ( exc_d_tlbm    ),
        .stallreq   ( streq[`MEM]   )
    );
    
    ALU_MEM alu_mem (
        .aluop     ( mem_aluop      ),
        .alures_i  ( mem_alures_i   ),
        .mulhi     ( mem_mulhi      ),
        .mullo     ( mem_mullo      ),
        .mul_s     ( mem_mul_s      ),
        .divres    ( mem_divres     ),
        .hilo_i    ( hilo           ),
        .cp0sel    ( mem_cp0sel     ),
        .exc_flag  ( exc_flag       ),

        .alures_o  ( mem_alures_o   ),
        .mulres    ( mem_mulres     ),
        .hilo_wen  ( mem_hilo_wen   ),
        .hilo_o    ( mem_hilo       ),
        .cp0_wen   ( cp0_wen        ),
        .cp0_addr  ( cp0_addr       ),
        .cp0_wdata ( cp0_wdata      ),
        .cp0_rdata ( cp0_rdata      ),
        .resnrdy   ( mem_resnrdy    )
    );

    Exception exception (
        .excp_i     ( mem_excp      ),
        .d_tlbr     ( exc_d_tlbr    ),
        .d_tlbi     ( exc_d_tlbi    ),
        .d_tlbm     ( exc_d_tlbm    ),
        .d_refs     ( mem_m_refs    ),
        .exc_intr   ( exc_intr      ),
        .pc         ( mem_pc        ),
        .m_en       ( mem_m_en      ),
        .m_vaddr    ( mem_m_vaddr   ),
        .nullinst   ( mem_null      ),

        .exc_flag   ( exc_flag      ),
        .exc_save   ( exc_save      ),
        .exc_type   ( exc_type      ),
        .exc_baddr  ( exc_baddr     )
    );

    CP0 coprocessor0 (
        .clk        ( clk           ),
        .rst        ( rst           ),
        .intr       ( intr          ),
        .addr       ( cp0_addr      ),
        .wen        ( cp0_wen       ),
        .rdata      ( cp0_rdata     ),
        .wdata      ( cp0_wdata     ),

        .exc_flag   ( exc_flag      ),
        .exc_save   ( exc_save      ),
        .exc_type   ( exc_type      ),
        .pc         ( mem_pc        ),
        .exc_baddr  ( exc_baddr     ),
        .exc_cpnum  ( mem_ecpnum    ),
        .inslot     ( mem_inslot    ),

        .tlb_idxwen ( cp0_idxwen    ),
        .tlb_itmwen ( cp0_itmwen    ),
        .tlb_index  ( cp0_tlbidx    ),
        .tlb_item   ( cp0_tlbitm    ),

        .Index_o    ( cp0_Index     ),
        .Random_o   ( cp0_Random    ),
        .EntryLo0_o ( cp0_EntryLo0  ),
        .EntryLo1_o ( cp0_EntryLo1  ),
        .PageMask_o ( cp0_PageMask  ),
        .EntryHi_o  ( cp0_EntryHi   ),
        .Status_o   ( cp0_Status    ),
        .Cause_o    ( cp0_Cause     ),
        .EPC_o      ( cp0_EPC       ),
        .Config_o   ( cp0_Config    ),
        .TagLo_o    ( cop_tag       ),
        .ErrorEPC_o ( cp0_ErrorEPC  ),

        .usermode   ( usermode      ),
        .exc_intr   ( exc_intr      )
    );

    Reg_MEM_WB reg_mem_wb (
        .clk            ( clk           ),
        .rst            ( rst           ),
        .stall          ( stall[`WB]    ),
        .flush          ( flush[`WB]    ),

        .mem_pc         ( mem_pc        ),
        .mem_aluop      ( mem_aluop     ),
        .mem_alures     ( mem_alures_o  ),
        .mem_mulres     ( mem_mulres    ),
        .mem_m_vaddr    ( mem_m_vaddr   ),
        .mem_m_rdata    ( mem_m_rdata   ),
        .mem_wreg       ( mem_wreg      ),
        .mem_wraddr     ( mem_wraddr    ),
        .mem_hilo_wen   ( mem_hilo_wen  ),
        .mem_hilo       ( mem_hilo      ),
        .mem_llb_wen    ( mem_llb_wen   ),
        .mem_llbit      ( mem_llbit     ),

        .wb_pc          ( wb_pc         ),
        .wb_aluop       ( wb_aluop      ),
        .wb_alures      ( wb_alures     ),
        .wb_mulres      ( wb_mulres     ),
        .wb_m_vaddr     ( wb_m_vaddr    ),
        .wb_m_rdata     ( wb_m_rdata    ),
        .wb_wreg        ( wb_wreg       ),
        .wb_wraddr      ( wb_wraddr     ),
        .wb_hilo_wen    ( wb_hilo_wen   ),
        .wb_hilo        ( wb_hilo       ),
        .wb_llb_wen     ( wb_llb_wen    ),
        .wb_llbit       ( wb_llbit      )
    );

    WriteBack writeback (
        .aluop      ( wb_aluop      ),
        .alures     ( wb_alures     ),
        .mulres     ( wb_mulres     ),
        .m_vaddr    ( wb_m_vaddr    ),
        .m_rdata    ( wb_m_rdata    ),
        .wrdata     ( wb_wrdata     ),
        .stallreq   ( streq[`WB]    )
    );
    
    HiLo_LLbit hilo_llbit (
        .clk            ( clk           ),
        .rst            ( rst           ),
        .hilo_wen       ( wb_hilo_wen   ),
        .hilo_wdata     ( wb_hilo       ),
        .hilo_rdata     ( hilo          ),

        .exc_type       ( exc_type      ),
        .llb_wen        ( wb_llb_wen    ),
        .llb_wdata      ( wb_llbit      ),
        .mem_llb_wen    ( mem_llb_wen   ),
        .mem_llbit      ( mem_llbit     ),
        .llb_rdata      ( llbit         )
    );
    
    Control control (
        .streq          ( streq         ),
        .stall          ( stall         ),
        .exc_flag       ( exc_flag      ),
        .exc_type       ( exc_type      ),
        .cp0_Status     ( cp0_Status    ),
        .cp0_Cause      ( cp0_Cause     ),
        .cp0_EPC        ( cp0_EPC       ),
        .cp0_ErrorEPC   ( cp0_ErrorEPC  ),
        .ex_null        ( ex_null       ),
        .mem_null       ( mem_null      ),
        .flush          ( flush         ),
        .flush_pc       ( exc_newpc     )
    );

`ifndef Fixed_Mapping_MMU

    TLBU tlb (
        .clk        ( clk           ),
        .rst        ( rst           ),
        .tlb_op     ( mem_tlbop     ),
        .Index      ( cp0_Index     ),
        .Random     ( cp0_Random    ),
        .EntryLo0   ( cp0_EntryLo0  ),
        .EntryLo1   ( cp0_EntryLo1  ),
        .PageMask   ( cp0_PageMask  ),
        .EntryHi    ( cp0_EntryHi   ),
        .immu_en    ( itlb_en       ),
        .immu_vaddr ( itlb_vaddr    ),
        .immu_rdy   ( itlb_rdy      ),
        .immu_paddr ( itlb_paddr    ),
        .immu_cat   ( itlb_cat      ),
        .immu_stall ( stall[`IF]    ),
        .dmmu_en    ( dtlb_en       ),
        .dmmu_vaddr ( dtlb_vaddr    ),
        .dmmu_refs  ( mem_m_refs    ),
        .dmmu_rdy   ( dtlb_rdy      ),
        .dmmu_paddr ( dtlb_paddr    ),
        .dmmu_cat   ( dtlb_cat      ),
        .dmmu_stall ( stall[`MEM]   ),
        .cp0_idxwen ( cp0_idxwen    ),
        .cp0_wIndex ( cp0_tlbidx    ),
        .cp0_tlbwen ( cp0_itmwen    ),
        .cp0_tlbitm ( cp0_tlbitm    ),
        .i_tlbr     ( i_tlbr        ),
        .i_tlbi     ( i_tlbi        ),
        .d_tlbr     ( d_tlbr        ),
        .d_tlbi     ( d_tlbi        ),
        .d_tlbm     ( d_tlbm        )
    );

`endif

endmodule