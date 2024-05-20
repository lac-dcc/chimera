// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module b17 #(
        parameter P1_Pending=1'b1,
        parameter P1_NotPending=1'b0,
        parameter P1_WidthByte=0,
        parameter P1_WidthWord=1,
        parameter P1_WidthDword=2,
        parameter P1_StateInit=0,
        parameter P1_StateTi=1,
        parameter P1_StateT1=2,
        parameter P1_StateT2=3,
        parameter P1_StateT1P=4,
        parameter P1_StateTh=5,
        parameter P1_StateT2P=6,
        parameter P1_StateT2I=7,
        parameter P1_REP=8'hF3,
        parameter P1_REPNE=8'hF2,
        parameter P1_LOCK=8'hF0,
        parameter P1_CSsop=8'h2E,
        parameter P1_SSsop=8'h36,
        parameter P1_DSsop=8'h3E,
        parameter P1_ESsop=8'h26,
        parameter P1_FSsop=8'h64,
        parameter P1_GSsop=8'h65,
        parameter P1_OPsop=8'h66,
        parameter P1_ADsop=8'h67,
        parameter P1_MOV_al_b=8'hB0,
        parameter P1_MOV_eax_dw=8'hB8,
        parameter P1_MOV_ebx_dw=8'hBB,
        parameter P1_MOV_ebx_eax=8'h89,
        parameter P1_MOV_eax_ebx=8'h8B,
        parameter P1_IN_al=8'hE4,
        parameter P1_OUT_al=8'hE6,
        parameter P1_ADD_al_b=8'h04,
        parameter P1_ADD_ax_w=8'h05,
        parameter P1_ROL_eax_b=8'hD1,
        parameter P1_ROL_al_1=8'hD0,
        parameter P1_ROL_al_n=8'hC0,
        parameter P1_INC_eax=8'h40,
        parameter P1_INC_ebx=8'h43,
        parameter P1_JMP_rel_short=8'hEB,
        parameter P1_JMP_rel_near=8'hE9,
        parameter P1_JMP_intseg_immed=8'hEA,
        parameter P1_HLT=8'hF4,
        parameter P1_WAITx=8'h9B,
        parameter P1_NOP=8'h90,
        parameter P1_InstQueueLimit=15,
        parameter P1_Si=0,
        parameter P1_S1=1,
        parameter P1_S2=2,
        parameter P1_S3=3,
        parameter P1_S4=4,
        parameter P1_S5=5,
        parameter P1_S6=6,
        parameter P1_S7=7,
        parameter P1_S8=8,
        parameter P1_S9=9,
        parameter P2_Pending=1'b1,
        parameter P2_NotPending=1'b0,
        parameter P2_WidthByte=0,
        parameter P2_WidthWord=1,
        parameter P2_WidthDword=2,
        parameter P2_StateInit=0,
        parameter P2_StateTi=1,
        parameter P2_StateT1=2,
        parameter P2_StateT2=3,
        parameter P2_StateT1P=4,
        parameter P2_StateTh=5,
        parameter P2_StateT2P=6,
        parameter P2_StateT2I=7,
        parameter P2_REP=8'hF3,
        parameter P2_REPNE=8'hF2,
        parameter P2_LOCK=8'hF0,
        parameter P2_CSsop=8'h2E,
        parameter P2_SSsop=8'h36,
        parameter P2_DSsop=8'h3E,
        parameter P2_ESsop=8'h26,
        parameter P2_FSsop=8'h64,
        parameter P2_GSsop=8'h65,
        parameter P2_OPsop=8'h66,
        parameter P2_ADsop=8'h67,
        parameter P2_MOV_al_b=8'hB0,
        parameter P2_MOV_eax_dw=8'hB8,
        parameter P2_MOV_ebx_dw=8'hBB,
        parameter P2_MOV_ebx_eax=8'h89,
        parameter P2_MOV_eax_ebx=8'h8B,
        parameter P2_IN_al=8'hE4,
        parameter P2_OUT_al=8'hE6,
        parameter P2_ADD_al_b=8'h04,
        parameter P2_ADD_ax_w=8'h05,
        parameter P2_ROL_eax_b=8'hD1,
        parameter P2_ROL_al_1=8'hD0,
        parameter P2_ROL_al_n=8'hC0,
        parameter P2_INC_eax=8'h40,
        parameter P2_INC_ebx=8'h43,
        parameter P2_JMP_rel_short=8'hEB,
        parameter P2_JMP_rel_near=8'hE9,
        parameter P2_JMP_intseg_immed=8'hEA,
        parameter P2_HLT=8'hF4,
        parameter P2_WAITx=8'h9B,
        parameter P2_NOP=8'h90,
        parameter P2_InstQueueLimit=15,
        parameter P2_Si=0,
        parameter P2_S1=1,
        parameter P2_S2=2,
        parameter P2_S3=3,
        parameter P2_S4=4,
        parameter P2_S5=5,
        parameter P2_S6=6,
        parameter P2_S7=7,
        parameter P2_S8=8,
        parameter P2_S9=9,
        parameter P3_Pending=1'b1,
        parameter P3_NotPending=1'b0,
        parameter P3_WidthByte=0,
        parameter P3_WidthWord=1,
        parameter P3_WidthDword=2,
        parameter P3_StateInit=0,
        parameter P3_StateTi=1,
        parameter P3_StateT1=2,
        parameter P3_StateT2=3,
        parameter P3_StateT1P=4,
        parameter P3_StateTh=5,
        parameter P3_StateT2P=6,
        parameter P3_StateT2I=7,
        parameter P3_REP=8'hF3,
        parameter P3_REPNE=8'hF2,
        parameter P3_LOCK=8'hF0,
        parameter P3_CSsop=8'h2E,
        parameter P3_SSsop=8'h36,
        parameter P3_DSsop=8'h3E,
        parameter P3_ESsop=8'h26,
        parameter P3_FSsop=8'h64,
        parameter P3_GSsop=8'h65,
        parameter P3_OPsop=8'h66,
        parameter P3_ADsop=8'h67,
        parameter P3_MOV_al_b=8'hB0,
        parameter P3_MOV_eax_dw=8'hB8,
        parameter P3_MOV_ebx_dw=8'hBB,
        parameter P3_MOV_ebx_eax=8'h89,
        parameter P3_MOV_eax_ebx=8'h8B,
        parameter P3_IN_al=8'hE4,
        parameter P3_OUT_al=8'hE6,
        parameter P3_ADD_al_b=8'h04,
        parameter P3_ADD_ax_w=8'h05,
        parameter P3_ROL_eax_b=8'hD1,
        parameter P3_ROL_al_1=8'hD0,
        parameter P3_ROL_al_n=8'hC0,
        parameter P3_INC_eax=8'h40,
        parameter P3_INC_ebx=8'h43,
        parameter P3_JMP_rel_short=8'hEB,
        parameter P3_JMP_rel_near=8'hE9,
        parameter P3_JMP_intseg_immed=8'hEA,
        parameter P3_HLT=8'hF4,
        parameter P3_WAITx=8'h9B,
        parameter P3_NOP=8'h90,
        parameter P3_InstQueueLimit=15,
        parameter P3_Si=0,
        parameter P3_S1=1,
        parameter P3_S2=2,
        parameter P3_S3=3,
        parameter P3_S4=4,
        parameter P3_S5=5,
        parameter P3_S6=6,
        parameter P3_S7=7,
        parameter P3_S8=8,
        parameter P3_S9=9) (
            input clock,
            input reset,
            input [31:0] datai,
            output integer datao,
            input hold,
            input na,
            input bs16,
            output reg  [29:0] address1,
            output reg  [29:0] address2,
            output reg  wr,
            output reg  dc,
            output reg  mio,
            output reg  ast1,
            output reg  ast2,
            input ready1,
            input ready2) ;
    integer buf1 ;
    integer buf2 ;
    wire [3:0] be1 ;
    wire [3:0] be2 ;
    wire [3:0] be3 ;
    wire [29:0] addr1 ;
    wire [29:0] addr2 ;
    wire [29:0] addr3 ;
    wire wr1 ;
    wire wr2 ;
    wire wr3 ;
    wire dc1 ;
    wire dc2 ;
    wire dc3 ;
    wire mio1 ;
    wire mio2 ;
    wire mio3 ;
    wire ads1 ;
    wire ads2 ;
    wire ads3 ;
    integer di1 ;
    integer di2 ;
    integer di3 ;
    wire [31:0] do1 ;
    wire [31:0] do2 ;
    wire [31:0] do3 ;
    reg rdy1 ;
    reg rdy2 ;
    reg rdy3 ;
    reg ready11 ;
    reg ready12 ;
    reg ready21 ;
    reg ready22 ;
    always @(  posedge clock or  posedge reset)
        if (reset==1'b1)
        begin
            buf1 <=0;
            ready11 <=1'b0;
            ready12 <=1'b0;
        end
        else
        begin
            if (addr1>2**29&ads1==1'b0&mio1==1'b1&dc1==1'b0&wr1==1'b1&be1==4'b0000)
            begin
                buf1 <=do1;
                ready11 <=1'b0;
                ready12 <=1'b1;
            end
            else
                if (addr2>2**29&ads2==1'b0&mio2==1'b1&dc2==1'b0&wr2==1'b1&be2==4'b0000)
                begin
                    buf1 <=do2;
                    ready11 <=1'b1;
                    ready12 <=1'b0;
                end
                else
                begin
                    ready11 <=1'b1;
                    ready12 <=1'b1;
                end
        end

    always @(  posedge clock or  posedge reset)
        if (reset==1'b1)
        begin
            buf2 <=0;
            ready21 <=1'b0;
            ready22 <=1'b0;
        end
        else
        begin
            if (addr2<2**29&ads2==1'b0&mio2==1'b1&dc2==1'b0&wr2==1'b1&be2==4'b0000)
            begin
                buf2 <=do2;
                ready21 <=1'b0;
                ready22 <=1'b1;
            end
            else
                if (ads3==1'b0&mio3==1'b1&dc3==1'b0&wr3==1'b0&be3==4'b0000)
                begin
                    ready21 <=1'b1;
                    ready22 <=1'b0;
                end
                else
                begin
                    ready21 <=1'b1;
                    ready22 <=1'b1;
                end
        end

    always @(   addr1 or  buf1 or  datai)
        if (addr1>2**29)
            di1 <=buf1;
        else
            di1 <=datai;

    always @(   addr2 or  buf1 or  buf2)
        if (addr2>2**29)
            di2 <=buf1;
        else
            di2 <=buf2;

    always @(     addr2 or  addr3 or  do1 or  do2 or  do3)
        if ((do1<2**30)&(do2<2**30)&(do3<2**30))
            address2 <=addr3;
        else
            address2 <=addr2;

    always @(              buf2 or  do3 or  addr1 or  wr3 or  dc3 or  mio3 or  ads1 or  ads3 or  ready1 or  ready2 or  ready11 or  ready12 or  ready21 or  ready22)
    begin
        di3 <=buf2;
        datao <=do3;
        address1 <=addr1;
        wr <=wr3;
        dc <=dc3;
        mio <=mio3;
        ast1 <=ads1;
        ast2 <=ads3;
        rdy1 <=ready11&ready1;
        rdy2 <=ready12&ready21;
        rdy3 <=ready22&ready2;
    end


    reg [3:0] P1_BE_n;
    reg [29:0] P1_Address;
    reg  P1_W_R_n;
    reg  P1_D_C_n;
    reg  P1_M_IO_n;
    reg  P1_ADS_n;
    wire [31:0] P1_Datai;
    integer P1_Datao;
    wire  P1_CLOCK;
    wire  P1_NA_n;
    wire  P1_BS16_n;
    wire  P1_READY_n;
    wire  P1_HOLD;
    wire  P1_RESET;
    reg [3:0] P2_BE_n;
    reg [29:0] P2_Address;
    reg  P2_W_R_n;
    reg  P2_D_C_n;
    reg  P2_M_IO_n;
    reg  P2_ADS_n;
    wire [31:0] P2_Datai;
    integer P2_Datao;
    wire  P2_CLOCK;
    wire  P2_NA_n;
    wire  P2_BS16_n;
    wire  P2_READY_n;
    wire  P2_HOLD;
    wire  P2_RESET;
    reg [3:0] P3_BE_n;
    reg [29:0] P3_Address;
    reg  P3_W_R_n;
    reg  P3_D_C_n;
    reg  P3_M_IO_n;
    reg  P3_ADS_n;
    wire [31:0] P3_Datai;
    integer P3_Datao;
    wire  P3_CLOCK;
    wire  P3_NA_n;
    wire  P3_BS16_n;
    wire  P3_READY_n;
    wire  P3_HOLD;
    wire  P3_RESET;

    reg  P1_StateNA  ;
    reg  P1_StateBS16  ;
    reg  P1_RequestPending  ;
    reg  P1_NonAligned  ;
    reg  P1_ReadRequest  ;
    reg  P1_MemoryFetch  ;
    reg  P1_CodeFetch  ;
    reg[3:0]  P1_ByteEnable  ;
    integer  P1_DataWidth  ;
    reg[2:0]  P1_State  ;
    integer  P1_EAX  ;
    integer  P1_EBX  ;
    integer  P1_rEIP  ;
    always @(  posedge    P1_CLOCK          or  posedge   P1_RESET  )
    begin :  P1_P0
        if (  P1_RESET  ==1'b1)
        begin
            P1_BE_n   <=4'b0000;
            P1_Address   <=0;
            P1_W_R_n   <=1'b0;
            P1_D_C_n   <=1'b0;
            P1_M_IO_n   <=1'b0;
            P1_ADS_n   <=1'b0;
            P1_State   <=  P1_StateInit  ;
            P1_StateNA   <=1'b0;
            P1_StateBS16   <=1'b0;
            P1_DataWidth   <=0;
        end
        else
        case (  P1_State  )
            P1_StateInit   :
            begin
                P1_D_C_n   <=1'b1;
                P1_ADS_n   <=1'b1;
                P1_State   <=  P1_StateTi  ;
                P1_StateNA   <=1'b1;
                P1_StateBS16   <=1'b1;
                P1_DataWidth   <=2;
                P1_State   <=  P1_StateTi  ;
            end
            P1_StateTi   :
                if (  P1_RequestPending  ==  P1_Pending  )
                    P1_State   <=  P1_StateT1  ;
                else
                    if (  P1_HOLD  ==1'b1)
                        P1_State   <=  P1_StateTh  ;
                    else
                        P1_State   <=  P1_StateTi  ;
            P1_StateT1   :
            begin
                P1_Address   <=  P1_rEIP  /4%2**30;
                P1_BE_n   <=  P1_ByteEnable  ;
                P1_M_IO_n   <=  P1_MemoryFetch  ;
                if (  P1_ReadRequest  ==  P1_Pending  )
                    P1_W_R_n   <=1'b0;
                else
                    P1_W_R_n   <=1'b1;
                if (  P1_CodeFetch  ==  P1_Pending  )
                    P1_D_C_n   <=1'b0;
                else
                    P1_D_C_n   <=1'b1;
                P1_ADS_n   <=1'b0;
                P1_State   <=  P1_StateT2  ;
            end
            P1_StateT2   :
            begin
                if (  P1_READY_n  ==1'b0&  P1_HOLD  ==1'b0&  P1_RequestPending  ==  P1_Pending  )
                    P1_State   <=  P1_StateT1  ;
                else
                    if (  P1_READY_n  ==1'b1&  P1_NA_n  ==1'b1)
                        ;
                    else
                        if ((  P1_RequestPending  ==  P1_Pending  |  P1_HOLD  ==1'b1)&(  P1_READY_n  ==1'b1&  P1_NA_n  ==1'b0))
                            P1_State   <=  P1_StateT2I  ;
                        else
                            if (  P1_RequestPending  ==  P1_Pending  &  P1_HOLD  ==1'b0&  P1_READY_n  ==1'b1&  P1_NA_n  ==1'b0)
                                P1_State   <=  P1_StateT2P  ;
                            else
                                if (  P1_RequestPending  ==  P1_NotPending  &  P1_HOLD  ==1'b0&  P1_READY_n  ==1'b0)
                                    P1_State   <=  P1_StateTi  ;
                                else
                                    if (  P1_HOLD  ==1'b1&  P1_READY_n  ==1'b1)
                                        P1_State   <=  P1_StateTh  ;
                                    else
                                        P1_State   <=  P1_StateT2  ;
                P1_StateBS16   <=  P1_BS16_n  ;
                if (  P1_BS16_n  ==1'b0)
                    P1_DataWidth   <=  P1_WidthWord  ;
                else
                    P1_DataWidth   <=  P1_WidthDword  ;
                P1_StateNA   <=  P1_NA_n  ;
                P1_ADS_n   <=1'b1;
            end
            P1_StateT1P   :
            begin
                if (  P1_NA_n  ==1'b0&  P1_HOLD  ==1'b0&  P1_RequestPending  ==  P1_Pending  )
                    P1_State   <=  P1_StateT2P  ;
                else
                    if (  P1_NA_n  ==1'b0&(  P1_HOLD  ==1'b1|  P1_RequestPending  ==  P1_NotPending  ))
                        P1_State   <=  P1_StateT2I  ;
                    else
                        if (  P1_NA_n  ==1'b1)
                            P1_State   <=  P1_StateT2  ;
                        else
                            P1_State   <=  P1_StateT1P  ;
                P1_StateBS16   <=  P1_BS16_n  ;
                if (  P1_BS16_n  ==1'b0)
                    P1_DataWidth   <=  P1_WidthWord  ;
                else
                    P1_DataWidth   <=  P1_WidthDword  ;
                P1_StateNA   <=  P1_NA_n  ;
                P1_ADS_n   <=1'b1;
            end
            P1_StateTh   :
                if (  P1_HOLD  ==1'b0&  P1_RequestPending  ==  P1_Pending  )
                    P1_State   <=  P1_StateT1  ;
                else
                    if (  P1_HOLD  ==1'b0&  P1_RequestPending  ==  P1_NotPending  )
                        P1_State   <=  P1_StateTi  ;
                    else
                        P1_State   <=  P1_StateTh  ;
            P1_StateT2P   :
            begin
                P1_Address   <=  P1_rEIP  /2%2**30;
                P1_BE_n   <=  P1_ByteEnable  ;
                P1_M_IO_n   <=  P1_MemoryFetch  ;
                if (  P1_ReadRequest  ==  P1_Pending  )
                    P1_W_R_n   <=1'b0;
                else
                    P1_W_R_n   <=1'b1;
                if (  P1_CodeFetch  ==  P1_Pending  )
                    P1_D_C_n   <=1'b0;
                else
                    P1_D_C_n   <=1'b1;
                P1_ADS_n   <=1'b0;
                if (  P1_READY_n  ==1'b0)
                    P1_State   <=  P1_StateT1P  ;
                else
                    P1_State   <=  P1_StateT2P  ;
            end
            P1_StateT2I   :
                if (  P1_READY_n  ==1'b1&  P1_RequestPending  ==  P1_Pending  &  P1_HOLD  ==1'b0)
                    P1_State   <=  P1_StateT2P  ;
                else
                    if (  P1_READY_n  ==1'b0&  P1_HOLD  ==1'b1)
                        P1_State   <=  P1_StateTh  ;
                    else
                        if (  P1_READY_n  ==1'b0&  P1_HOLD  ==1'b0&  P1_RequestPending  ==  P1_Pending  )
                            P1_State   <=  P1_StateT1  ;
                        else
                            if (  P1_READY_n  ==1'b0&  P1_HOLD  ==1'b0&  P1_RequestPending  ==  P1_NotPending  )
                                P1_State   <=  P1_StateTi  ;
                            else
                                P1_State   <=  P1_StateT2I  ;
        endcase
    end

    always @(  posedge    P1_CLOCK          or  posedge   P1_RESET  )
    begin :  P1_P1
        if (  P1_RESET  ==1'b1)
        begin
            P1_State2   =  P1_Si  ;
            P1_InstQueue   ={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
            P1_InstQueueRd_Addr   =0;
            P1_InstQueueWr_Addr   =0;
            P1_InstAddrPointer   =0;
            P1_PhyAddrPointer   =0;
            P1_Extended   =1'b0;
            P1_More   =1'b0;
            P1_Flush   =1'b0;
            P1_lWord   =0;
            P1_uWord   =0;
            P1_fWord   =0;
            P1_CodeFetch   <=1'b0;
            P1_Datao   <=0;
            P1_EAX   <=0;
            P1_EBX   <=0;
            P1_rEIP   <=0;
            P1_ReadRequest   <=1'b0;
            P1_MemoryFetch   <=1'b0;
            P1_RequestPending   <=1'b0;
        end
        else
        case (  P1_State2  )
            P1_Si   :
            begin
                P1_PhyAddrPointer   =  P1_rEIP  ;
                P1_InstAddrPointer   =  P1_PhyAddrPointer  ;
                P1_State2   =  P1_S1  ;
                P1_rEIP   <=20'hFFFF0;
                P1_ReadRequest   <=1'b1;
                P1_MemoryFetch   <=1'b1;
                P1_RequestPending   <=1'b1;
            end
            P1_S1   :
            begin
                P1_RequestPending   <=  P1_Pending  ;
                P1_ReadRequest   <=  P1_Pending  ;
                P1_MemoryFetch   <=  P1_Pending  ;
                P1_CodeFetch   <=  P1_Pending  ;
                if (  P1_READY_n  ==1'b0)
                    P1_State2   =  P1_S2  ;
                else
                    P1_State2   =  P1_S1  ;
            end
            P1_S2   :
            begin
                P1_RequestPending   <=  P1_NotPending  ;
                P1_InstQueue   [  P1_InstQueueWr_Addr  ]=  P1_Datai  %(2**8);
                P1_InstQueueWr_Addr   =(  P1_InstQueueWr_Addr  +1)%16;
                P1_InstQueue   [  P1_InstQueueWr_Addr  ]=  P1_Datai  %2**8;
                P1_InstQueueWr_Addr   =(  P1_InstQueueWr_Addr  +1)%16;
                if (  P1_StateBS16  ==1'b1)
                begin
                    P1_InstQueue   [  P1_InstQueueWr_Addr  ]=(  P1_Datai  /(2**16))%(2**8);
                    P1_InstQueueWr_Addr   =(  P1_InstQueueWr_Addr  +1)%16;
                    P1_InstQueue   [  P1_InstQueueWr_Addr  ]=(  P1_Datai  /(2**24))%(2**8);
                    P1_InstQueueWr_Addr   =(  P1_InstQueueWr_Addr  +1)%16;
                    P1_PhyAddrPointer   =  P1_PhyAddrPointer  +4;
                    P1_State2   =  P1_S5  ;
                end
                else
                begin
                    P1_PhyAddrPointer   =  P1_PhyAddrPointer  +2;
                    if (  P1_PhyAddrPointer  <0)
                        P1_rEIP   <=-  P1_PhyAddrPointer  ;
                    else
                        P1_rEIP   <=  P1_PhyAddrPointer  ;
                    P1_State2   =  P1_S3  ;
                end
            end
            P1_S3   :
            begin
                P1_RequestPending   <=  P1_Pending  ;
                if (  P1_READY_n  ==1'b0)
                    P1_State2   =  P1_S4  ;
                else
                    P1_State2   =  P1_S3  ;
            end
            P1_S4   :
            begin
                P1_RequestPending   <=  P1_NotPending  ;
                P1_InstQueue   [  P1_InstQueueWr_Addr  ]=  P1_Datai  %(2**8);
                P1_InstQueueWr_Addr   =(  P1_InstQueueWr_Addr  +1)%16;
                P1_InstQueue   [  P1_InstQueueWr_Addr  ]=  P1_Datai  %(2**8);
                P1_InstQueueWr_Addr   =(  P1_InstQueueWr_Addr  +1)%16;
                P1_PhyAddrPointer   =  P1_PhyAddrPointer  +2;
                P1_State2   =  P1_S5  ;
            end
            P1_S5   :
            begin
                case (  P1_InstQueue  [  P1_InstQueueRd_Addr  ])
                    P1_NOP   :
                    begin
                        P1_InstAddrPointer   =  P1_InstAddrPointer  +1;
                        P1_InstQueueRd_Addr   =(  P1_InstQueueRd_Addr  +1)%16;
                        P1_Flush   =1'b0;
                        P1_More   =1'b0;
                    end
                    P1_OPsop   :
                    begin
                        P1_InstAddrPointer   =  P1_InstAddrPointer  +1;
                        P1_InstQueueRd_Addr   =(  P1_InstQueueRd_Addr  +1)%16;
                        P1_Extended   =1'b1;
                        P1_Flush   =1'b0;
                        P1_More   =1'b0;
                    end
                    P1_JMP_rel_short   :
                        if ((  P1_InstQueueWr_Addr  -  P1_InstQueueRd_Addr  )>=3)
                        begin
                            if (  P1_InstQueue  [(  P1_InstQueueRd_Addr  +1)%16]>127)
                            begin
                                P1_PhyAddrPointer   =  P1_InstAddrPointer  +1-(8'hFF-  P1_InstQueue  [(  P1_InstQueueRd_Addr  +1)%16]);
                                P1_InstAddrPointer   =  P1_PhyAddrPointer  ;
                            end
                            else
                            begin
                                P1_PhyAddrPointer   =  P1_InstAddrPointer  +2+  P1_InstQueue  [(  P1_InstQueueRd_Addr  +1)%16];
                                P1_InstAddrPointer   =  P1_PhyAddrPointer  ;
                            end
                            P1_Flush   =1'b1;
                            P1_More   =1'b0;
                        end
                        else
                        begin
                            P1_Flush   =1'b0;
                            P1_More   =1'b1;
                        end
                    P1_JMP_rel_near   :
                        if ((  P1_InstQueueWr_Addr  -  P1_InstQueueRd_Addr  )>=5)
                        begin
                            P1_PhyAddrPointer   =  P1_InstAddrPointer  +5+  P1_InstQueue  [(  P1_InstQueueRd_Addr  +1)%16];
                            P1_InstAddrPointer   =  P1_PhyAddrPointer  ;
                            P1_Flush   =1'b1;
                            P1_More   =1'b0;
                        end
                        else
                        begin
                            P1_Flush   =1'b0;
                            P1_More   =1'b1;
                        end
                    P1_JMP_intseg_immed   :
                    begin
                        P1_InstAddrPointer   =  P1_InstAddrPointer  +1;
                        P1_InstQueueRd_Addr   =(  P1_InstQueueRd_Addr  +1)%16;
                        P1_Flush   =1'b0;
                        P1_More   =1'b0;
                    end
                    P1_MOV_al_b   :
                    begin
                        P1_InstAddrPointer   =  P1_InstAddrPointer  +1;
                        P1_InstQueueRd_Addr   =(  P1_InstQueueRd_Addr  +1)%16;
                        P1_Flush   =1'b0;
                        P1_More   =1'b0;
                    end
                    P1_MOV_eax_dw   :
                        if ((  P1_InstQueueWr_Addr  -  P1_InstQueueRd_Addr  )>=5)
                        begin
                            P1_EAX   <=  P1_InstQueue  [(  P1_InstQueueRd_Addr  +4)%16]*(2**23)+  P1_InstQueue  [(  P1_InstQueueRd_Addr  +3)%16]*(2**16)+  P1_InstQueue  [(  P1_InstQueueRd_Addr  +2)%16]*(2**8)+  P1_InstQueue  [(  P1_InstQueueRd_Addr  +1)%16];
                            P1_More   =1'b0;
                            P1_Flush   =1'b0;
                            P1_InstAddrPointer   =  P1_InstAddrPointer  +5;
                            P1_InstQueueRd_Addr   =(  P1_InstQueueRd_Addr  +5)%16;
                        end
                        else
                        begin
                            P1_Flush   =1'b0;
                            P1_More   =1'b1;
                        end
                    P1_MOV_ebx_dw   :
                        if ((  P1_InstQueueWr_Addr  -  P1_InstQueueRd_Addr  )>=5)
                        begin
                            P1_EBX   <=  P1_InstQueue  [(  P1_InstQueueRd_Addr  +4)%16]*(2**23)+  P1_InstQueue  [(  P1_InstQueueRd_Addr  +3)%16]*(2**16)+  P1_InstQueue  [(  P1_InstQueueRd_Addr  +2)%16]*(2**8)+  P1_InstQueue  [(  P1_InstQueueRd_Addr  +1)%1];
                            P1_More   =1'b0;
                            P1_Flush   =1'b0;
                            P1_InstAddrPointer   =  P1_InstAddrPointer  +5;
                            P1_InstQueueRd_Addr   =(  P1_InstQueueRd_Addr  +5)%16;
                        end
                        else
                        begin
                            P1_Flush   =1'b0;
                            P1_More   =1'b1;
                        end
                    P1_MOV_eax_ebx   :
                        if ((  P1_InstQueueWr_Addr  -  P1_InstQueueRd_Addr  )>=2)
                        begin
                            if (  P1_EBX  <0)
                                P1_rEIP   <=-  P1_EBX  ;
                            else
                                P1_rEIP   <=  P1_EBX  ;
                            P1_RequestPending   <=  P1_Pending  ;
                            P1_ReadRequest   <=  P1_Pending  ;
                            P1_MemoryFetch   <=  P1_Pending  ;
                            P1_CodeFetch   <=  P1_NotPending  ;
                            if (  P1_READY_n  ==1'b0)
                            begin
                                P1_RequestPending   <=  P1_NotPending  ;
                                P1_uWord   =  P1_Datai  %(2**15);
                                if (  P1_StateBS16  ==1'b1)
                                    P1_lWord   =  P1_Datai  %(2**16);
                                else
                                begin
                                    P1_rEIP   <=  P1_rEIP  +2;
                                    P1_RequestPending   <=  P1_Pending  ;
                                    if (  P1_READY_n  ==1'b0)
                                    begin
                                        P1_RequestPending   <=  P1_NotPending  ;
                                        P1_lWord   =  P1_Datai  %(2**16);
                                    end
                                end
                                if (  P1_READY_n  ==1'b0)
                                begin
                                    P1_EAX   <=  P1_uWord  *(2**16)+  P1_lWord  ;
                                    P1_More   =1'b0;
                                    P1_Flush   =1'b0;
                                    P1_InstAddrPointer   =  P1_InstAddrPointer  +2;
                                    P1_InstQueueRd_Addr   =(  P1_InstQueueRd_Addr  +2)%16;
                                end
                            end
                        end
                        else
                        begin
                            P1_Flush   =1'b0;
                            P1_More   =1'b1;
                        end
                    P1_MOV_ebx_eax   :
                        if ((  P1_InstQueueWr_Addr  -  P1_InstQueueRd_Addr  )>=2)
                        begin
                            if (  P1_EBX  <0)
                                P1_rEIP   <=  P1_EBX  ;
                            else
                                P1_rEIP   <=  P1_EBX  ;
                            P1_lWord   =  P1_EAX  %(2**16);
                            P1_uWord   =(  P1_EAX  /(2**16))%(2**15);
                            P1_RequestPending   <=  P1_Pending  ;
                            P1_ReadRequest   <=  P1_NotPending  ;
                            P1_MemoryFetch   <=  P1_Pending  ;
                            P1_CodeFetch   <=  P1_NotPending  ;
                            if (  P1_State  ==  P1_StateT1  |  P1_State  ==  P1_StateT1P  )
                            begin
                                P1_Datao   <=(  P1_uWord  *(2**16)+  P1_lWord  );
                                if (  P1_READY_n  ==1'b0)
                                begin
                                    P1_RequestPending   <=  P1_NotPending  ;
                                    if (  P1_StateBS16  ==1'b0)
                                    begin
                                        P1_rEIP   <=  P1_rEIP  +2;
                                        P1_RequestPending   <=  P1_Pending  ;
                                        P1_ReadRequest   <=  P1_NotPending  ;
                                        P1_MemoryFetch   <=  P1_Pending  ;
                                        P1_CodeFetch   <=  P1_NotPending  ;
                                        P1_State2   =  P1_S6  ;
                                    end
                                    P1_More   =1'b0;
                                    P1_Flush   =1'b0;
                                    P1_InstAddrPointer   =  P1_InstAddrPointer  +2;
                                    P1_InstQueueRd_Addr   =(  P1_InstQueueRd_Addr  +2)%16;
                                end
                            end
                        end
                        else
                        begin
                            P1_Flush   =1'b0;
                            P1_More   =1'b1;
                        end
                    P1_IN_al   :
                        if ((  P1_InstQueueWr_Addr  -  P1_InstQueueRd_Addr  )>=2)
                        begin
                            P1_rEIP   <=  P1_InstQueueRd_Addr  +1;
                            P1_RequestPending   <=  P1_Pending  ;
                            P1_ReadRequest   <=  P1_Pending  ;
                            P1_MemoryFetch   <=  P1_NotPending  ;
                            P1_CodeFetch   <=  P1_NotPending  ;
                            if (  P1_READY_n  ==1'b0)
                            begin
                                P1_RequestPending   <=  P1_NotPending  ;
                                P1_EAX   <=  P1_Datai  ;
                                P1_InstAddrPointer   =  P1_InstAddrPointer  +2;
                                P1_InstQueueRd_Addr   =(  P1_InstQueueRd_Addr  +2);
                                P1_Flush   =1'b0;
                                P1_More   =1'b0;
                            end
                        end
                        else
                        begin
                            P1_Flush   =1'b0;
                            P1_More   =1'b1;
                        end
                    P1_OUT_al   :
                        if ((  P1_InstQueueWr_Addr  -  P1_InstQueueRd_Addr  )>=2)
                        begin
                            P1_rEIP   <=  P1_InstQueueRd_Addr  +1;
                            P1_RequestPending   <=  P1_Pending  ;
                            P1_ReadRequest   <=  P1_NotPending  ;
                            P1_MemoryFetch   <=  P1_NotPending  ;
                            P1_CodeFetch   <=  P1_NotPending  ;
                            if (  P1_State  ==  P1_StateT1  |  P1_State  ==  P1_StateT1P  )
                            begin
                                P1_fWord   =  P1_EAX  %(2**16);
                                P1_Datao   <=  P1_fWord  ;
                                if (  P1_READY_n  ==1'b0)
                                begin
                                    P1_RequestPending   <=  P1_NotPending  ;
                                    P1_InstAddrPointer   =  P1_InstAddrPointer  +2;
                                    P1_InstQueueRd_Addr   =(  P1_InstQueueRd_Addr  +2)%16;
                                    P1_Flush   =1'b0;
                                    P1_More   =1'b0;
                                end
                            end
                        end
                        else
                        begin
                            P1_Flush   =1'b0;
                            P1_More   =1'b1;
                        end
                    P1_ADD_al_b   :
                    begin
                        P1_InstAddrPointer   =  P1_InstAddrPointer  +1;
                        P1_InstQueueRd_Addr   =(  P1_InstQueueRd_Addr  +1)%16;
                        P1_Flush   =1'b0;
                        P1_More   =1'b0;
                    end
                    P1_ADD_ax_w   :
                    begin
                        P1_InstAddrPointer   =  P1_InstAddrPointer  +1;
                        P1_InstQueueRd_Addr   =(  P1_InstQueueRd_Addr  +1)%16;
                        P1_Flush   =1'b0;
                        P1_More   =1'b0;
                    end
                    P1_ROL_al_1   :
                    begin
                        P1_InstAddrPointer   =  P1_InstAddrPointer  +2;
                        P1_InstQueueRd_Addr   =(  P1_InstQueueRd_Addr  +2)%16;
                        P1_Flush   =1'b0;
                        P1_More   =1'b0;
                    end
                    P1_ROL_al_n   :
                    begin
                        P1_InstAddrPointer   =  P1_InstAddrPointer  +2;
                        P1_InstQueueRd_Addr   =(  P1_InstQueueRd_Addr  +2)%16;
                        P1_Flush   =1'b0;
                        P1_More   =1'b0;
                    end
                    P1_INC_eax   :
                    begin
                        P1_EAX   <=  P1_EAX  +1;
                        P1_InstAddrPointer   =  P1_InstAddrPointer  +1;
                        P1_InstQueueRd_Addr   =(  P1_InstQueueRd_Addr  +1)%16;
                        P1_Flush   =1'b0;
                        P1_More   =1'b0;
                    end
                    P1_INC_ebx   :
                    begin
                        P1_EBX   <=  P1_EBX  +1;
                        P1_InstAddrPointer   =  P1_InstAddrPointer  +1;
                        P1_InstQueueRd_Addr   =(  P1_InstQueueRd_Addr  +1)%16;
                        P1_Flush   =1'b0;
                        P1_More   =1'b0;
                    end
                    default :
                    begin
                        P1_InstAddrPointer   =  P1_InstAddrPointer  +1;
                        P1_InstQueueRd_Addr   =(  P1_InstQueueRd_Addr  +1)%16;
                        P1_Flush   =1'b0;
                        P1_More   =1'b0;
                    end
                endcase
                if ((~(  P1_InstQueueRd_Addr  <  P1_InstQueueWr_Addr  ))|(((  P1_InstQueueLimit  -  P1_InstQueueRd_Addr  )<4)|  P1_Flush  |  P1_More  ))
                    P1_State2   =  P1_S7  ;
            end
            P1_S6   :
            begin
                P1_Datao   <=(  P1_uWord  *(2**16)+  P1_lWord  );
                if (  P1_READY_n  ==1'b0)
                begin
                    P1_RequestPending   <=  P1_NotPending  ;
                    P1_State2   =  P1_S5  ;
                end
            end
            P1_S7   :
            begin
                if (  P1_Flush  )
                begin
                    P1_InstQueueRd_Addr   =1;
                    P1_InstQueueWr_Addr   =1;
                    if (  P1_InstAddrPointer  <0)
                        P1_fWord   =-  P1_InstAddrPointer  ;
                    else
                        P1_fWord   =  P1_InstAddrPointer  ;
                    if (  P1_fWord  %2==1)
                        P1_InstQueueRd_Addr   =(  P1_InstQueueRd_Addr  +  P1_fWord  %4)%16;
                end
                if ((  P1_InstQueueLimit  -  P1_InstQueueRd_Addr  )<3)
                begin
                    P1_State2   =  P1_S8  ;
                    P1_InstQueueWr_Addr   =0;
                end
                else
                    P1_State2   =  P1_S9  ;
            end
            P1_S8   :
                if (  P1_InstQueueRd_Addr  <=  P1_InstQueueLimit  )
                begin
                    P1_InstQueue   [  P1_InstQueueWr_Addr  ]=  P1_InstQueue  [  P1_InstQueueRd_Addr  ];
                    P1_InstQueueRd_Addr   =(  P1_InstQueueRd_Addr  +1)%16;
                    P1_InstQueueWr_Addr   =(  P1_InstQueueWr_Addr  +1)%16;
                    P1_State2   =  P1_S8  ;
                end
                else
                begin
                    P1_InstQueueRd_Addr   =0;
                    P1_State2   =  P1_S9  ;
                end
            P1_S9   :
            begin
                P1_rEIP   <=  P1_PhyAddrPointer  ;
                P1_State2   =  P1_S1  ;
            end
        endcase
    end

    always @(  posedge    P1_CLOCK          or  posedge   P1_RESET  )
    begin :  P1_P2
        if (  P1_RESET  ==1'b1)
        begin
            P1_ByteEnable   <=4'b0000;
            P1_NonAligned   <=1'b0;
        end
        else
        case (  P1_DataWidth  )
            P1_WidthByte   :
            case (  P1_rEIP  %4)
                0 :
                    P1_ByteEnable   <=4'b1110;
                1 :
                    P1_ByteEnable   <=4'b1101;
                2 :
                    P1_ByteEnable   <=4'b1011;
                3 :
                    P1_ByteEnable   <=4'b0111;
                default :
                    ;
            endcase
            P1_WidthWord   :
            case (  P1_rEIP  %4)
                0 :
                begin
                    P1_ByteEnable   <=4'b1100;
                    P1_NonAligned   <=  P1_NotPending  ;
                end
                1 :
                begin
                    P1_ByteEnable   <=4'b1001;
                    P1_NonAligned   <=  P1_NotPending  ;
                end
                2 :
                begin
                    P1_ByteEnable   <=4'b0011;
                    P1_NonAligned   <=  P1_NotPending  ;
                end
                3 :
                begin
                    P1_ByteEnable   <=4'b0111;
                    P1_NonAligned   <=  P1_Pending  ;
                end
                default :
                    ;
            endcase
            P1_WidthDword   :
            case (  P1_rEIP  %4)
                0 :
                begin
                    P1_ByteEnable   <=4'b0000;
                    P1_NonAligned   <=  P1_NotPending  ;
                end
                1 :
                begin
                    P1_ByteEnable   <=4'b0001;
                    P1_NonAligned   <=  P1_Pending  ;
                end
                2 :
                begin
                    P1_NonAligned   <=  P1_Pending  ;
                    P1_ByteEnable   <=4'b0011;
                end
                3 :
                begin
                    P1_NonAligned   <=  P1_Pending  ;
                    P1_ByteEnable   <=4'b0111;
                end
                default :
                    ;
            endcase
            default :
                ;
        endcase
    end




    reg  P2_StateNA  ;
    reg  P2_StateBS16  ;
    reg  P2_RequestPending  ;
    reg  P2_NonAligned  ;
    reg  P2_ReadRequest  ;
    reg  P2_MemoryFetch  ;
    reg  P2_CodeFetch  ;
    reg[3:0]  P2_ByteEnable  ;
    integer  P2_DataWidth  ;
    reg[2:0]  P2_State  ;
    integer  P2_EAX  ;
    integer  P2_EBX  ;
    integer  P2_rEIP  ;
    always @(  posedge    P2_CLOCK          or  posedge   P2_RESET  )
    begin :  P2_P0
        if (  P2_RESET  ==1'b1)
        begin
            P2_BE_n   <=4'b0000;
            P2_Address   <=0;
            P2_W_R_n   <=1'b0;
            P2_D_C_n   <=1'b0;
            P2_M_IO_n   <=1'b0;
            P2_ADS_n   <=1'b0;
            P2_State   <=  P2_StateInit  ;
            P2_StateNA   <=1'b0;
            P2_StateBS16   <=1'b0;
            P2_DataWidth   <=0;
        end
        else
        case (  P2_State  )
            P2_StateInit   :
            begin
                P2_D_C_n   <=1'b1;
                P2_ADS_n   <=1'b1;
                P2_State   <=  P2_StateTi  ;
                P2_StateNA   <=1'b1;
                P2_StateBS16   <=1'b1;
                P2_DataWidth   <=2;
                P2_State   <=  P2_StateTi  ;
            end
            P2_StateTi   :
                if (  P2_RequestPending  ==  P2_Pending  )
                    P2_State   <=  P2_StateT1  ;
                else
                    if (  P2_HOLD  ==1'b1)
                        P2_State   <=  P2_StateTh  ;
                    else
                        P2_State   <=  P2_StateTi  ;
            P2_StateT1   :
            begin
                P2_Address   <=  P2_rEIP  /4%2**30;
                P2_BE_n   <=  P2_ByteEnable  ;
                P2_M_IO_n   <=  P2_MemoryFetch  ;
                if (  P2_ReadRequest  ==  P2_Pending  )
                    P2_W_R_n   <=1'b0;
                else
                    P2_W_R_n   <=1'b1;
                if (  P2_CodeFetch  ==  P2_Pending  )
                    P2_D_C_n   <=1'b0;
                else
                    P2_D_C_n   <=1'b1;
                P2_ADS_n   <=1'b0;
                P2_State   <=  P2_StateT2  ;
            end
            P2_StateT2   :
            begin
                if (  P2_READY_n  ==1'b0&  P2_HOLD  ==1'b0&  P2_RequestPending  ==  P2_Pending  )
                    P2_State   <=  P2_StateT1  ;
                else
                    if (  P2_READY_n  ==1'b1&  P2_NA_n  ==1'b1)
                        ;
                    else
                        if ((  P2_RequestPending  ==  P2_Pending  |  P2_HOLD  ==1'b1)&(  P2_READY_n  ==1'b1&  P2_NA_n  ==1'b0))
                            P2_State   <=  P2_StateT2I  ;
                        else
                            if (  P2_RequestPending  ==  P2_Pending  &  P2_HOLD  ==1'b0&  P2_READY_n  ==1'b1&  P2_NA_n  ==1'b0)
                                P2_State   <=  P2_StateT2P  ;
                            else
                                if (  P2_RequestPending  ==  P2_NotPending  &  P2_HOLD  ==1'b0&  P2_READY_n  ==1'b0)
                                    P2_State   <=  P2_StateTi  ;
                                else
                                    if (  P2_HOLD  ==1'b1&  P2_READY_n  ==1'b1)
                                        P2_State   <=  P2_StateTh  ;
                                    else
                                        P2_State   <=  P2_StateT2  ;
                P2_StateBS16   <=  P2_BS16_n  ;
                if (  P2_BS16_n  ==1'b0)
                    P2_DataWidth   <=  P2_WidthWord  ;
                else
                    P2_DataWidth   <=  P2_WidthDword  ;
                P2_StateNA   <=  P2_NA_n  ;
                P2_ADS_n   <=1'b1;
            end
            P2_StateT1P   :
            begin
                if (  P2_NA_n  ==1'b0&  P2_HOLD  ==1'b0&  P2_RequestPending  ==  P2_Pending  )
                    P2_State   <=  P2_StateT2P  ;
                else
                    if (  P2_NA_n  ==1'b0&(  P2_HOLD  ==1'b1|  P2_RequestPending  ==  P2_NotPending  ))
                        P2_State   <=  P2_StateT2I  ;
                    else
                        if (  P2_NA_n  ==1'b1)
                            P2_State   <=  P2_StateT2  ;
                        else
                            P2_State   <=  P2_StateT1P  ;
                P2_StateBS16   <=  P2_BS16_n  ;
                if (  P2_BS16_n  ==1'b0)
                    P2_DataWidth   <=  P2_WidthWord  ;
                else
                    P2_DataWidth   <=  P2_WidthDword  ;
                P2_StateNA   <=  P2_NA_n  ;
                P2_ADS_n   <=1'b1;
            end
            P2_StateTh   :
                if (  P2_HOLD  ==1'b0&  P2_RequestPending  ==  P2_Pending  )
                    P2_State   <=  P2_StateT1  ;
                else
                    if (  P2_HOLD  ==1'b0&  P2_RequestPending  ==  P2_NotPending  )
                        P2_State   <=  P2_StateTi  ;
                    else
                        P2_State   <=  P2_StateTh  ;
            P2_StateT2P   :
            begin
                P2_Address   <=  P2_rEIP  /2%2**30;
                P2_BE_n   <=  P2_ByteEnable  ;
                P2_M_IO_n   <=  P2_MemoryFetch  ;
                if (  P2_ReadRequest  ==  P2_Pending  )
                    P2_W_R_n   <=1'b0;
                else
                    P2_W_R_n   <=1'b1;
                if (  P2_CodeFetch  ==  P2_Pending  )
                    P2_D_C_n   <=1'b0;
                else
                    P2_D_C_n   <=1'b1;
                P2_ADS_n   <=1'b0;
                if (  P2_READY_n  ==1'b0)
                    P2_State   <=  P2_StateT1P  ;
                else
                    P2_State   <=  P2_StateT2P  ;
            end
            P2_StateT2I   :
                if (  P2_READY_n  ==1'b1&  P2_RequestPending  ==  P2_Pending  &  P2_HOLD  ==1'b0)
                    P2_State   <=  P2_StateT2P  ;
                else
                    if (  P2_READY_n  ==1'b0&  P2_HOLD  ==1'b1)
                        P2_State   <=  P2_StateTh  ;
                    else
                        if (  P2_READY_n  ==1'b0&  P2_HOLD  ==1'b0&  P2_RequestPending  ==  P2_Pending  )
                            P2_State   <=  P2_StateT1  ;
                        else
                            if (  P2_READY_n  ==1'b0&  P2_HOLD  ==1'b0&  P2_RequestPending  ==  P2_NotPending  )
                                P2_State   <=  P2_StateTi  ;
                            else
                                P2_State   <=  P2_StateT2I  ;
        endcase
    end

    always @(  posedge    P2_CLOCK          or  posedge   P2_RESET  )
    begin :  P2_P1
        if (  P2_RESET  ==1'b1)
        begin
            P2_State2   =  P2_Si  ;
            P2_InstQueue   ={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
            P2_InstQueueRd_Addr   =0;
            P2_InstQueueWr_Addr   =0;
            P2_InstAddrPointer   =0;
            P2_PhyAddrPointer   =0;
            P2_Extended   =1'b0;
            P2_More   =1'b0;
            P2_Flush   =1'b0;
            P2_lWord   =0;
            P2_uWord   =0;
            P2_fWord   =0;
            P2_CodeFetch   <=1'b0;
            P2_Datao   <=0;
            P2_EAX   <=0;
            P2_EBX   <=0;
            P2_rEIP   <=0;
            P2_ReadRequest   <=1'b0;
            P2_MemoryFetch   <=1'b0;
            P2_RequestPending   <=1'b0;
        end
        else
        case (  P2_State2  )
            P2_Si   :
            begin
                P2_PhyAddrPointer   =  P2_rEIP  ;
                P2_InstAddrPointer   =  P2_PhyAddrPointer  ;
                P2_State2   =  P2_S1  ;
                P2_rEIP   <=20'hFFFF0;
                P2_ReadRequest   <=1'b1;
                P2_MemoryFetch   <=1'b1;
                P2_RequestPending   <=1'b1;
            end
            P2_S1   :
            begin
                P2_RequestPending   <=  P2_Pending  ;
                P2_ReadRequest   <=  P2_Pending  ;
                P2_MemoryFetch   <=  P2_Pending  ;
                P2_CodeFetch   <=  P2_Pending  ;
                if (  P2_READY_n  ==1'b0)
                    P2_State2   =  P2_S2  ;
                else
                    P2_State2   =  P2_S1  ;
            end
            P2_S2   :
            begin
                P2_RequestPending   <=  P2_NotPending  ;
                P2_InstQueue   [  P2_InstQueueWr_Addr  ]=  P2_Datai  %(2**8);
                P2_InstQueueWr_Addr   =(  P2_InstQueueWr_Addr  +1)%16;
                P2_InstQueue   [  P2_InstQueueWr_Addr  ]=  P2_Datai  %2**8;
                P2_InstQueueWr_Addr   =(  P2_InstQueueWr_Addr  +1)%16;
                if (  P2_StateBS16  ==1'b1)
                begin
                    P2_InstQueue   [  P2_InstQueueWr_Addr  ]=(  P2_Datai  /(2**16))%(2**8);
                    P2_InstQueueWr_Addr   =(  P2_InstQueueWr_Addr  +1)%16;
                    P2_InstQueue   [  P2_InstQueueWr_Addr  ]=(  P2_Datai  /(2**24))%(2**8);
                    P2_InstQueueWr_Addr   =(  P2_InstQueueWr_Addr  +1)%16;
                    P2_PhyAddrPointer   =  P2_PhyAddrPointer  +4;
                    P2_State2   =  P2_S5  ;
                end
                else
                begin
                    P2_PhyAddrPointer   =  P2_PhyAddrPointer  +2;
                    if (  P2_PhyAddrPointer  <0)
                        P2_rEIP   <=-  P2_PhyAddrPointer  ;
                    else
                        P2_rEIP   <=  P2_PhyAddrPointer  ;
                    P2_State2   =  P2_S3  ;
                end
            end
            P2_S3   :
            begin
                P2_RequestPending   <=  P2_Pending  ;
                if (  P2_READY_n  ==1'b0)
                    P2_State2   =  P2_S4  ;
                else
                    P2_State2   =  P2_S3  ;
            end
            P2_S4   :
            begin
                P2_RequestPending   <=  P2_NotPending  ;
                P2_InstQueue   [  P2_InstQueueWr_Addr  ]=  P2_Datai  %(2**8);
                P2_InstQueueWr_Addr   =(  P2_InstQueueWr_Addr  +1)%16;
                P2_InstQueue   [  P2_InstQueueWr_Addr  ]=  P2_Datai  %(2**8);
                P2_InstQueueWr_Addr   =(  P2_InstQueueWr_Addr  +1)%16;
                P2_PhyAddrPointer   =  P2_PhyAddrPointer  +2;
                P2_State2   =  P2_S5  ;
            end
            P2_S5   :
            begin
                case (  P2_InstQueue  [  P2_InstQueueRd_Addr  ])
                    P2_NOP   :
                    begin
                        P2_InstAddrPointer   =  P2_InstAddrPointer  +1;
                        P2_InstQueueRd_Addr   =(  P2_InstQueueRd_Addr  +1)%16;
                        P2_Flush   =1'b0;
                        P2_More   =1'b0;
                    end
                    P2_OPsop   :
                    begin
                        P2_InstAddrPointer   =  P2_InstAddrPointer  +1;
                        P2_InstQueueRd_Addr   =(  P2_InstQueueRd_Addr  +1)%16;
                        P2_Extended   =1'b1;
                        P2_Flush   =1'b0;
                        P2_More   =1'b0;
                    end
                    P2_JMP_rel_short   :
                        if ((  P2_InstQueueWr_Addr  -  P2_InstQueueRd_Addr  )>=3)
                        begin
                            if (  P2_InstQueue  [(  P2_InstQueueRd_Addr  +1)%16]>127)
                            begin
                                P2_PhyAddrPointer   =  P2_InstAddrPointer  +1-(8'hFF-  P2_InstQueue  [(  P2_InstQueueRd_Addr  +1)%16]);
                                P2_InstAddrPointer   =  P2_PhyAddrPointer  ;
                            end
                            else
                            begin
                                P2_PhyAddrPointer   =  P2_InstAddrPointer  +2+  P2_InstQueue  [(  P2_InstQueueRd_Addr  +1)%16];
                                P2_InstAddrPointer   =  P2_PhyAddrPointer  ;
                            end
                            P2_Flush   =1'b1;
                            P2_More   =1'b0;
                        end
                        else
                        begin
                            P2_Flush   =1'b0;
                            P2_More   =1'b1;
                        end
                    P2_JMP_rel_near   :
                        if ((  P2_InstQueueWr_Addr  -  P2_InstQueueRd_Addr  )>=5)
                        begin
                            P2_PhyAddrPointer   =  P2_InstAddrPointer  +5+  P2_InstQueue  [(  P2_InstQueueRd_Addr  +1)%16];
                            P2_InstAddrPointer   =  P2_PhyAddrPointer  ;
                            P2_Flush   =1'b1;
                            P2_More   =1'b0;
                        end
                        else
                        begin
                            P2_Flush   =1'b0;
                            P2_More   =1'b1;
                        end
                    P2_JMP_intseg_immed   :
                    begin
                        P2_InstAddrPointer   =  P2_InstAddrPointer  +1;
                        P2_InstQueueRd_Addr   =(  P2_InstQueueRd_Addr  +1)%16;
                        P2_Flush   =1'b0;
                        P2_More   =1'b0;
                    end
                    P2_MOV_al_b   :
                    begin
                        P2_InstAddrPointer   =  P2_InstAddrPointer  +1;
                        P2_InstQueueRd_Addr   =(  P2_InstQueueRd_Addr  +1)%16;
                        P2_Flush   =1'b0;
                        P2_More   =1'b0;
                    end
                    P2_MOV_eax_dw   :
                        if ((  P2_InstQueueWr_Addr  -  P2_InstQueueRd_Addr  )>=5)
                        begin
                            P2_EAX   <=  P2_InstQueue  [(  P2_InstQueueRd_Addr  +4)%16]*(2**23)+  P2_InstQueue  [(  P2_InstQueueRd_Addr  +3)%16]*(2**16)+  P2_InstQueue  [(  P2_InstQueueRd_Addr  +2)%16]*(2**8)+  P2_InstQueue  [(  P2_InstQueueRd_Addr  +1)%16];
                            P2_More   =1'b0;
                            P2_Flush   =1'b0;
                            P2_InstAddrPointer   =  P2_InstAddrPointer  +5;
                            P2_InstQueueRd_Addr   =(  P2_InstQueueRd_Addr  +5)%16;
                        end
                        else
                        begin
                            P2_Flush   =1'b0;
                            P2_More   =1'b1;
                        end
                    P2_MOV_ebx_dw   :
                        if ((  P2_InstQueueWr_Addr  -  P2_InstQueueRd_Addr  )>=5)
                        begin
                            P2_EBX   <=  P2_InstQueue  [(  P2_InstQueueRd_Addr  +4)%16]*(2**23)+  P2_InstQueue  [(  P2_InstQueueRd_Addr  +3)%16]*(2**16)+  P2_InstQueue  [(  P2_InstQueueRd_Addr  +2)%16]*(2**8)+  P2_InstQueue  [(  P2_InstQueueRd_Addr  +1)%1];
                            P2_More   =1'b0;
                            P2_Flush   =1'b0;
                            P2_InstAddrPointer   =  P2_InstAddrPointer  +5;
                            P2_InstQueueRd_Addr   =(  P2_InstQueueRd_Addr  +5)%16;
                        end
                        else
                        begin
                            P2_Flush   =1'b0;
                            P2_More   =1'b1;
                        end
                    P2_MOV_eax_ebx   :
                        if ((  P2_InstQueueWr_Addr  -  P2_InstQueueRd_Addr  )>=2)
                        begin
                            if (  P2_EBX  <0)
                                P2_rEIP   <=-  P2_EBX  ;
                            else
                                P2_rEIP   <=  P2_EBX  ;
                            P2_RequestPending   <=  P2_Pending  ;
                            P2_ReadRequest   <=  P2_Pending  ;
                            P2_MemoryFetch   <=  P2_Pending  ;
                            P2_CodeFetch   <=  P2_NotPending  ;
                            if (  P2_READY_n  ==1'b0)
                            begin
                                P2_RequestPending   <=  P2_NotPending  ;
                                P2_uWord   =  P2_Datai  %(2**15);
                                if (  P2_StateBS16  ==1'b1)
                                    P2_lWord   =  P2_Datai  %(2**16);
                                else
                                begin
                                    P2_rEIP   <=  P2_rEIP  +2;
                                    P2_RequestPending   <=  P2_Pending  ;
                                    if (  P2_READY_n  ==1'b0)
                                    begin
                                        P2_RequestPending   <=  P2_NotPending  ;
                                        P2_lWord   =  P2_Datai  %(2**16);
                                    end
                                end
                                if (  P2_READY_n  ==1'b0)
                                begin
                                    P2_EAX   <=  P2_uWord  *(2**16)+  P2_lWord  ;
                                    P2_More   =1'b0;
                                    P2_Flush   =1'b0;
                                    P2_InstAddrPointer   =  P2_InstAddrPointer  +2;
                                    P2_InstQueueRd_Addr   =(  P2_InstQueueRd_Addr  +2)%16;
                                end
                            end
                        end
                        else
                        begin
                            P2_Flush   =1'b0;
                            P2_More   =1'b1;
                        end
                    P2_MOV_ebx_eax   :
                        if ((  P2_InstQueueWr_Addr  -  P2_InstQueueRd_Addr  )>=2)
                        begin
                            if (  P2_EBX  <0)
                                P2_rEIP   <=  P2_EBX  ;
                            else
                                P2_rEIP   <=  P2_EBX  ;
                            P2_lWord   =  P2_EAX  %(2**16);
                            P2_uWord   =(  P2_EAX  /(2**16))%(2**15);
                            P2_RequestPending   <=  P2_Pending  ;
                            P2_ReadRequest   <=  P2_NotPending  ;
                            P2_MemoryFetch   <=  P2_Pending  ;
                            P2_CodeFetch   <=  P2_NotPending  ;
                            if (  P2_State  ==  P2_StateT1  |  P2_State  ==  P2_StateT1P  )
                            begin
                                P2_Datao   <=(  P2_uWord  *(2**16)+  P2_lWord  );
                                if (  P2_READY_n  ==1'b0)
                                begin
                                    P2_RequestPending   <=  P2_NotPending  ;
                                    if (  P2_StateBS16  ==1'b0)
                                    begin
                                        P2_rEIP   <=  P2_rEIP  +2;
                                        P2_RequestPending   <=  P2_Pending  ;
                                        P2_ReadRequest   <=  P2_NotPending  ;
                                        P2_MemoryFetch   <=  P2_Pending  ;
                                        P2_CodeFetch   <=  P2_NotPending  ;
                                        P2_State2   =  P2_S6  ;
                                    end
                                    P2_More   =1'b0;
                                    P2_Flush   =1'b0;
                                    P2_InstAddrPointer   =  P2_InstAddrPointer  +2;
                                    P2_InstQueueRd_Addr   =(  P2_InstQueueRd_Addr  +2)%16;
                                end
                            end
                        end
                        else
                        begin
                            P2_Flush   =1'b0;
                            P2_More   =1'b1;
                        end
                    P2_IN_al   :
                        if ((  P2_InstQueueWr_Addr  -  P2_InstQueueRd_Addr  )>=2)
                        begin
                            P2_rEIP   <=  P2_InstQueueRd_Addr  +1;
                            P2_RequestPending   <=  P2_Pending  ;
                            P2_ReadRequest   <=  P2_Pending  ;
                            P2_MemoryFetch   <=  P2_NotPending  ;
                            P2_CodeFetch   <=  P2_NotPending  ;
                            if (  P2_READY_n  ==1'b0)
                            begin
                                P2_RequestPending   <=  P2_NotPending  ;
                                P2_EAX   <=  P2_Datai  ;
                                P2_InstAddrPointer   =  P2_InstAddrPointer  +2;
                                P2_InstQueueRd_Addr   =(  P2_InstQueueRd_Addr  +2);
                                P2_Flush   =1'b0;
                                P2_More   =1'b0;
                            end
                        end
                        else
                        begin
                            P2_Flush   =1'b0;
                            P2_More   =1'b1;
                        end
                    P2_OUT_al   :
                        if ((  P2_InstQueueWr_Addr  -  P2_InstQueueRd_Addr  )>=2)
                        begin
                            P2_rEIP   <=  P2_InstQueueRd_Addr  +1;
                            P2_RequestPending   <=  P2_Pending  ;
                            P2_ReadRequest   <=  P2_NotPending  ;
                            P2_MemoryFetch   <=  P2_NotPending  ;
                            P2_CodeFetch   <=  P2_NotPending  ;
                            if (  P2_State  ==  P2_StateT1  |  P2_State  ==  P2_StateT1P  )
                            begin
                                P2_fWord   =  P2_EAX  %(2**16);
                                P2_Datao   <=  P2_fWord  ;
                                if (  P2_READY_n  ==1'b0)
                                begin
                                    P2_RequestPending   <=  P2_NotPending  ;
                                    P2_InstAddrPointer   =  P2_InstAddrPointer  +2;
                                    P2_InstQueueRd_Addr   =(  P2_InstQueueRd_Addr  +2)%16;
                                    P2_Flush   =1'b0;
                                    P2_More   =1'b0;
                                end
                            end
                        end
                        else
                        begin
                            P2_Flush   =1'b0;
                            P2_More   =1'b1;
                        end
                    P2_ADD_al_b   :
                    begin
                        P2_InstAddrPointer   =  P2_InstAddrPointer  +1;
                        P2_InstQueueRd_Addr   =(  P2_InstQueueRd_Addr  +1)%16;
                        P2_Flush   =1'b0;
                        P2_More   =1'b0;
                    end
                    P2_ADD_ax_w   :
                    begin
                        P2_InstAddrPointer   =  P2_InstAddrPointer  +1;
                        P2_InstQueueRd_Addr   =(  P2_InstQueueRd_Addr  +1)%16;
                        P2_Flush   =1'b0;
                        P2_More   =1'b0;
                    end
                    P2_ROL_al_1   :
                    begin
                        P2_InstAddrPointer   =  P2_InstAddrPointer  +2;
                        P2_InstQueueRd_Addr   =(  P2_InstQueueRd_Addr  +2)%16;
                        P2_Flush   =1'b0;
                        P2_More   =1'b0;
                    end
                    P2_ROL_al_n   :
                    begin
                        P2_InstAddrPointer   =  P2_InstAddrPointer  +2;
                        P2_InstQueueRd_Addr   =(  P2_InstQueueRd_Addr  +2)%16;
                        P2_Flush   =1'b0;
                        P2_More   =1'b0;
                    end
                    P2_INC_eax   :
                    begin
                        P2_EAX   <=  P2_EAX  +1;
                        P2_InstAddrPointer   =  P2_InstAddrPointer  +1;
                        P2_InstQueueRd_Addr   =(  P2_InstQueueRd_Addr  +1)%16;
                        P2_Flush   =1'b0;
                        P2_More   =1'b0;
                    end
                    P2_INC_ebx   :
                    begin
                        P2_EBX   <=  P2_EBX  +1;
                        P2_InstAddrPointer   =  P2_InstAddrPointer  +1;
                        P2_InstQueueRd_Addr   =(  P2_InstQueueRd_Addr  +1)%16;
                        P2_Flush   =1'b0;
                        P2_More   =1'b0;
                    end
                    default :
                    begin
                        P2_InstAddrPointer   =  P2_InstAddrPointer  +1;
                        P2_InstQueueRd_Addr   =(  P2_InstQueueRd_Addr  +1)%16;
                        P2_Flush   =1'b0;
                        P2_More   =1'b0;
                    end
                endcase
                if ((~(  P2_InstQueueRd_Addr  <  P2_InstQueueWr_Addr  ))|(((  P2_InstQueueLimit  -  P2_InstQueueRd_Addr  )<4)|  P2_Flush  |  P2_More  ))
                    P2_State2   =  P2_S7  ;
            end
            P2_S6   :
            begin
                P2_Datao   <=(  P2_uWord  *(2**16)+  P2_lWord  );
                if (  P2_READY_n  ==1'b0)
                begin
                    P2_RequestPending   <=  P2_NotPending  ;
                    P2_State2   =  P2_S5  ;
                end
            end
            P2_S7   :
            begin
                if (  P2_Flush  )
                begin
                    P2_InstQueueRd_Addr   =1;
                    P2_InstQueueWr_Addr   =1;
                    if (  P2_InstAddrPointer  <0)
                        P2_fWord   =-  P2_InstAddrPointer  ;
                    else
                        P2_fWord   =  P2_InstAddrPointer  ;
                    if (  P2_fWord  %2==1)
                        P2_InstQueueRd_Addr   =(  P2_InstQueueRd_Addr  +  P2_fWord  %4)%16;
                end
                if ((  P2_InstQueueLimit  -  P2_InstQueueRd_Addr  )<3)
                begin
                    P2_State2   =  P2_S8  ;
                    P2_InstQueueWr_Addr   =0;
                end
                else
                    P2_State2   =  P2_S9  ;
            end
            P2_S8   :
                if (  P2_InstQueueRd_Addr  <=  P2_InstQueueLimit  )
                begin
                    P2_InstQueue   [  P2_InstQueueWr_Addr  ]=  P2_InstQueue  [  P2_InstQueueRd_Addr  ];
                    P2_InstQueueRd_Addr   =(  P2_InstQueueRd_Addr  +1)%16;
                    P2_InstQueueWr_Addr   =(  P2_InstQueueWr_Addr  +1)%16;
                    P2_State2   =  P2_S8  ;
                end
                else
                begin
                    P2_InstQueueRd_Addr   =0;
                    P2_State2   =  P2_S9  ;
                end
            P2_S9   :
            begin
                P2_rEIP   <=  P2_PhyAddrPointer  ;
                P2_State2   =  P2_S1  ;
            end
        endcase
    end

    always @(  posedge    P2_CLOCK          or  posedge   P2_RESET  )
    begin :  P2_P2
        if (  P2_RESET  ==1'b1)
        begin
            P2_ByteEnable   <=4'b0000;
            P2_NonAligned   <=1'b0;
        end
        else
        case (  P2_DataWidth  )
            P2_WidthByte   :
            case (  P2_rEIP  %4)
                0 :
                    P2_ByteEnable   <=4'b1110;
                1 :
                    P2_ByteEnable   <=4'b1101;
                2 :
                    P2_ByteEnable   <=4'b1011;
                3 :
                    P2_ByteEnable   <=4'b0111;
                default :
                    ;
            endcase
            P2_WidthWord   :
            case (  P2_rEIP  %4)
                0 :
                begin
                    P2_ByteEnable   <=4'b1100;
                    P2_NonAligned   <=  P2_NotPending  ;
                end
                1 :
                begin
                    P2_ByteEnable   <=4'b1001;
                    P2_NonAligned   <=  P2_NotPending  ;
                end
                2 :
                begin
                    P2_ByteEnable   <=4'b0011;
                    P2_NonAligned   <=  P2_NotPending  ;
                end
                3 :
                begin
                    P2_ByteEnable   <=4'b0111;
                    P2_NonAligned   <=  P2_Pending  ;
                end
                default :
                    ;
            endcase
            P2_WidthDword   :
            case (  P2_rEIP  %4)
                0 :
                begin
                    P2_ByteEnable   <=4'b0000;
                    P2_NonAligned   <=  P2_NotPending  ;
                end
                1 :
                begin
                    P2_ByteEnable   <=4'b0001;
                    P2_NonAligned   <=  P2_Pending  ;
                end
                2 :
                begin
                    P2_NonAligned   <=  P2_Pending  ;
                    P2_ByteEnable   <=4'b0011;
                end
                3 :
                begin
                    P2_NonAligned   <=  P2_Pending  ;
                    P2_ByteEnable   <=4'b0111;
                end
                default :
                    ;
            endcase
            default :
                ;
        endcase
    end




    reg  P3_StateNA  ;
    reg  P3_StateBS16  ;
    reg  P3_RequestPending  ;
    reg  P3_NonAligned  ;
    reg  P3_ReadRequest  ;
    reg  P3_MemoryFetch  ;
    reg  P3_CodeFetch  ;
    reg[3:0]  P3_ByteEnable  ;
    integer  P3_DataWidth  ;
    reg[2:0]  P3_State  ;
    integer  P3_EAX  ;
    integer  P3_EBX  ;
    integer  P3_rEIP  ;
    always @(  posedge    P3_CLOCK          or  posedge   P3_RESET  )
    begin :  P3_P0
        if (  P3_RESET  ==1'b1)
        begin
            P3_BE_n   <=4'b0000;
            P3_Address   <=0;
            P3_W_R_n   <=1'b0;
            P3_D_C_n   <=1'b0;
            P3_M_IO_n   <=1'b0;
            P3_ADS_n   <=1'b0;
            P3_State   <=  P3_StateInit  ;
            P3_StateNA   <=1'b0;
            P3_StateBS16   <=1'b0;
            P3_DataWidth   <=0;
        end
        else
        case (  P3_State  )
            P3_StateInit   :
            begin
                P3_D_C_n   <=1'b1;
                P3_ADS_n   <=1'b1;
                P3_State   <=  P3_StateTi  ;
                P3_StateNA   <=1'b1;
                P3_StateBS16   <=1'b1;
                P3_DataWidth   <=2;
                P3_State   <=  P3_StateTi  ;
            end
            P3_StateTi   :
                if (  P3_RequestPending  ==  P3_Pending  )
                    P3_State   <=  P3_StateT1  ;
                else
                    if (  P3_HOLD  ==1'b1)
                        P3_State   <=  P3_StateTh  ;
                    else
                        P3_State   <=  P3_StateTi  ;
            P3_StateT1   :
            begin
                P3_Address   <=  P3_rEIP  /4%2**30;
                P3_BE_n   <=  P3_ByteEnable  ;
                P3_M_IO_n   <=  P3_MemoryFetch  ;
                if (  P3_ReadRequest  ==  P3_Pending  )
                    P3_W_R_n   <=1'b0;
                else
                    P3_W_R_n   <=1'b1;
                if (  P3_CodeFetch  ==  P3_Pending  )
                    P3_D_C_n   <=1'b0;
                else
                    P3_D_C_n   <=1'b1;
                P3_ADS_n   <=1'b0;
                P3_State   <=  P3_StateT2  ;
            end
            P3_StateT2   :
            begin
                if (  P3_READY_n  ==1'b0&  P3_HOLD  ==1'b0&  P3_RequestPending  ==  P3_Pending  )
                    P3_State   <=  P3_StateT1  ;
                else
                    if (  P3_READY_n  ==1'b1&  P3_NA_n  ==1'b1)
                        ;
                    else
                        if ((  P3_RequestPending  ==  P3_Pending  |  P3_HOLD  ==1'b1)&(  P3_READY_n  ==1'b1&  P3_NA_n  ==1'b0))
                            P3_State   <=  P3_StateT2I  ;
                        else
                            if (  P3_RequestPending  ==  P3_Pending  &  P3_HOLD  ==1'b0&  P3_READY_n  ==1'b1&  P3_NA_n  ==1'b0)
                                P3_State   <=  P3_StateT2P  ;
                            else
                                if (  P3_RequestPending  ==  P3_NotPending  &  P3_HOLD  ==1'b0&  P3_READY_n  ==1'b0)
                                    P3_State   <=  P3_StateTi  ;
                                else
                                    if (  P3_HOLD  ==1'b1&  P3_READY_n  ==1'b1)
                                        P3_State   <=  P3_StateTh  ;
                                    else
                                        P3_State   <=  P3_StateT2  ;
                P3_StateBS16   <=  P3_BS16_n  ;
                if (  P3_BS16_n  ==1'b0)
                    P3_DataWidth   <=  P3_WidthWord  ;
                else
                    P3_DataWidth   <=  P3_WidthDword  ;
                P3_StateNA   <=  P3_NA_n  ;
                P3_ADS_n   <=1'b1;
            end
            P3_StateT1P   :
            begin
                if (  P3_NA_n  ==1'b0&  P3_HOLD  ==1'b0&  P3_RequestPending  ==  P3_Pending  )
                    P3_State   <=  P3_StateT2P  ;
                else
                    if (  P3_NA_n  ==1'b0&(  P3_HOLD  ==1'b1|  P3_RequestPending  ==  P3_NotPending  ))
                        P3_State   <=  P3_StateT2I  ;
                    else
                        if (  P3_NA_n  ==1'b1)
                            P3_State   <=  P3_StateT2  ;
                        else
                            P3_State   <=  P3_StateT1P  ;
                P3_StateBS16   <=  P3_BS16_n  ;
                if (  P3_BS16_n  ==1'b0)
                    P3_DataWidth   <=  P3_WidthWord  ;
                else
                    P3_DataWidth   <=  P3_WidthDword  ;
                P3_StateNA   <=  P3_NA_n  ;
                P3_ADS_n   <=1'b1;
            end
            P3_StateTh   :
                if (  P3_HOLD  ==1'b0&  P3_RequestPending  ==  P3_Pending  )
                    P3_State   <=  P3_StateT1  ;
                else
                    if (  P3_HOLD  ==1'b0&  P3_RequestPending  ==  P3_NotPending  )
                        P3_State   <=  P3_StateTi  ;
                    else
                        P3_State   <=  P3_StateTh  ;
            P3_StateT2P   :
            begin
                P3_Address   <=  P3_rEIP  /2%2**30;
                P3_BE_n   <=  P3_ByteEnable  ;
                P3_M_IO_n   <=  P3_MemoryFetch  ;
                if (  P3_ReadRequest  ==  P3_Pending  )
                    P3_W_R_n   <=1'b0;
                else
                    P3_W_R_n   <=1'b1;
                if (  P3_CodeFetch  ==  P3_Pending  )
                    P3_D_C_n   <=1'b0;
                else
                    P3_D_C_n   <=1'b1;
                P3_ADS_n   <=1'b0;
                if (  P3_READY_n  ==1'b0)
                    P3_State   <=  P3_StateT1P  ;
                else
                    P3_State   <=  P3_StateT2P  ;
            end
            P3_StateT2I   :
                if (  P3_READY_n  ==1'b1&  P3_RequestPending  ==  P3_Pending  &  P3_HOLD  ==1'b0)
                    P3_State   <=  P3_StateT2P  ;
                else
                    if (  P3_READY_n  ==1'b0&  P3_HOLD  ==1'b1)
                        P3_State   <=  P3_StateTh  ;
                    else
                        if (  P3_READY_n  ==1'b0&  P3_HOLD  ==1'b0&  P3_RequestPending  ==  P3_Pending  )
                            P3_State   <=  P3_StateT1  ;
                        else
                            if (  P3_READY_n  ==1'b0&  P3_HOLD  ==1'b0&  P3_RequestPending  ==  P3_NotPending  )
                                P3_State   <=  P3_StateTi  ;
                            else
                                P3_State   <=  P3_StateT2I  ;
        endcase
    end

    always @(  posedge    P3_CLOCK          or  posedge   P3_RESET  )
    begin :  P3_P1
        if (  P3_RESET  ==1'b1)
        begin
            P3_State2   =  P3_Si  ;
            P3_InstQueue   ={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
            P3_InstQueueRd_Addr   =0;
            P3_InstQueueWr_Addr   =0;
            P3_InstAddrPointer   =0;
            P3_PhyAddrPointer   =0;
            P3_Extended   =1'b0;
            P3_More   =1'b0;
            P3_Flush   =1'b0;
            P3_lWord   =0;
            P3_uWord   =0;
            P3_fWord   =0;
            P3_CodeFetch   <=1'b0;
            P3_Datao   <=0;
            P3_EAX   <=0;
            P3_EBX   <=0;
            P3_rEIP   <=0;
            P3_ReadRequest   <=1'b0;
            P3_MemoryFetch   <=1'b0;
            P3_RequestPending   <=1'b0;
        end
        else
        case (  P3_State2  )
            P3_Si   :
            begin
                P3_PhyAddrPointer   =  P3_rEIP  ;
                P3_InstAddrPointer   =  P3_PhyAddrPointer  ;
                P3_State2   =  P3_S1  ;
                P3_rEIP   <=20'hFFFF0;
                P3_ReadRequest   <=1'b1;
                P3_MemoryFetch   <=1'b1;
                P3_RequestPending   <=1'b1;
            end
            P3_S1   :
            begin
                P3_RequestPending   <=  P3_Pending  ;
                P3_ReadRequest   <=  P3_Pending  ;
                P3_MemoryFetch   <=  P3_Pending  ;
                P3_CodeFetch   <=  P3_Pending  ;
                if (  P3_READY_n  ==1'b0)
                    P3_State2   =  P3_S2  ;
                else
                    P3_State2   =  P3_S1  ;
            end
            P3_S2   :
            begin
                P3_RequestPending   <=  P3_NotPending  ;
                P3_InstQueue   [  P3_InstQueueWr_Addr  ]=  P3_Datai  %(2**8);
                P3_InstQueueWr_Addr   =(  P3_InstQueueWr_Addr  +1)%16;
                P3_InstQueue   [  P3_InstQueueWr_Addr  ]=  P3_Datai  %2**8;
                P3_InstQueueWr_Addr   =(  P3_InstQueueWr_Addr  +1)%16;
                if (  P3_StateBS16  ==1'b1)
                begin
                    P3_InstQueue   [  P3_InstQueueWr_Addr  ]=(  P3_Datai  /(2**16))%(2**8);
                    P3_InstQueueWr_Addr   =(  P3_InstQueueWr_Addr  +1)%16;
                    P3_InstQueue   [  P3_InstQueueWr_Addr  ]=(  P3_Datai  /(2**24))%(2**8);
                    P3_InstQueueWr_Addr   =(  P3_InstQueueWr_Addr  +1)%16;
                    P3_PhyAddrPointer   =  P3_PhyAddrPointer  +4;
                    P3_State2   =  P3_S5  ;
                end
                else
                begin
                    P3_PhyAddrPointer   =  P3_PhyAddrPointer  +2;
                    if (  P3_PhyAddrPointer  <0)
                        P3_rEIP   <=-  P3_PhyAddrPointer  ;
                    else
                        P3_rEIP   <=  P3_PhyAddrPointer  ;
                    P3_State2   =  P3_S3  ;
                end
            end
            P3_S3   :
            begin
                P3_RequestPending   <=  P3_Pending  ;
                if (  P3_READY_n  ==1'b0)
                    P3_State2   =  P3_S4  ;
                else
                    P3_State2   =  P3_S3  ;
            end
            P3_S4   :
            begin
                P3_RequestPending   <=  P3_NotPending  ;
                P3_InstQueue   [  P3_InstQueueWr_Addr  ]=  P3_Datai  %(2**8);
                P3_InstQueueWr_Addr   =(  P3_InstQueueWr_Addr  +1)%16;
                P3_InstQueue   [  P3_InstQueueWr_Addr  ]=  P3_Datai  %(2**8);
                P3_InstQueueWr_Addr   =(  P3_InstQueueWr_Addr  +1)%16;
                P3_PhyAddrPointer   =  P3_PhyAddrPointer  +2;
                P3_State2   =  P3_S5  ;
            end
            P3_S5   :
            begin
                case (  P3_InstQueue  [  P3_InstQueueRd_Addr  ])
                    P3_NOP   :
                    begin
                        P3_InstAddrPointer   =  P3_InstAddrPointer  +1;
                        P3_InstQueueRd_Addr   =(  P3_InstQueueRd_Addr  +1)%16;
                        P3_Flush   =1'b0;
                        P3_More   =1'b0;
                    end
                    P3_OPsop   :
                    begin
                        P3_InstAddrPointer   =  P3_InstAddrPointer  +1;
                        P3_InstQueueRd_Addr   =(  P3_InstQueueRd_Addr  +1)%16;
                        P3_Extended   =1'b1;
                        P3_Flush   =1'b0;
                        P3_More   =1'b0;
                    end
                    P3_JMP_rel_short   :
                        if ((  P3_InstQueueWr_Addr  -  P3_InstQueueRd_Addr  )>=3)
                        begin
                            if (  P3_InstQueue  [(  P3_InstQueueRd_Addr  +1)%16]>127)
                            begin
                                P3_PhyAddrPointer   =  P3_InstAddrPointer  +1-(8'hFF-  P3_InstQueue  [(  P3_InstQueueRd_Addr  +1)%16]);
                                P3_InstAddrPointer   =  P3_PhyAddrPointer  ;
                            end
                            else
                            begin
                                P3_PhyAddrPointer   =  P3_InstAddrPointer  +2+  P3_InstQueue  [(  P3_InstQueueRd_Addr  +1)%16];
                                P3_InstAddrPointer   =  P3_PhyAddrPointer  ;
                            end
                            P3_Flush   =1'b1;
                            P3_More   =1'b0;
                        end
                        else
                        begin
                            P3_Flush   =1'b0;
                            P3_More   =1'b1;
                        end
                    P3_JMP_rel_near   :
                        if ((  P3_InstQueueWr_Addr  -  P3_InstQueueRd_Addr  )>=5)
                        begin
                            P3_PhyAddrPointer   =  P3_InstAddrPointer  +5+  P3_InstQueue  [(  P3_InstQueueRd_Addr  +1)%16];
                            P3_InstAddrPointer   =  P3_PhyAddrPointer  ;
                            P3_Flush   =1'b1;
                            P3_More   =1'b0;
                        end
                        else
                        begin
                            P3_Flush   =1'b0;
                            P3_More   =1'b1;
                        end
                    P3_JMP_intseg_immed   :
                    begin
                        P3_InstAddrPointer   =  P3_InstAddrPointer  +1;
                        P3_InstQueueRd_Addr   =(  P3_InstQueueRd_Addr  +1)%16;
                        P3_Flush   =1'b0;
                        P3_More   =1'b0;
                    end
                    P3_MOV_al_b   :
                    begin
                        P3_InstAddrPointer   =  P3_InstAddrPointer  +1;
                        P3_InstQueueRd_Addr   =(  P3_InstQueueRd_Addr  +1)%16;
                        P3_Flush   =1'b0;
                        P3_More   =1'b0;
                    end
                    P3_MOV_eax_dw   :
                        if ((  P3_InstQueueWr_Addr  -  P3_InstQueueRd_Addr  )>=5)
                        begin
                            P3_EAX   <=  P3_InstQueue  [(  P3_InstQueueRd_Addr  +4)%16]*(2**23)+  P3_InstQueue  [(  P3_InstQueueRd_Addr  +3)%16]*(2**16)+  P3_InstQueue  [(  P3_InstQueueRd_Addr  +2)%16]*(2**8)+  P3_InstQueue  [(  P3_InstQueueRd_Addr  +1)%16];
                            P3_More   =1'b0;
                            P3_Flush   =1'b0;
                            P3_InstAddrPointer   =  P3_InstAddrPointer  +5;
                            P3_InstQueueRd_Addr   =(  P3_InstQueueRd_Addr  +5)%16;
                        end
                        else
                        begin
                            P3_Flush   =1'b0;
                            P3_More   =1'b1;
                        end
                    P3_MOV_ebx_dw   :
                        if ((  P3_InstQueueWr_Addr  -  P3_InstQueueRd_Addr  )>=5)
                        begin
                            P3_EBX   <=  P3_InstQueue  [(  P3_InstQueueRd_Addr  +4)%16]*(2**23)+  P3_InstQueue  [(  P3_InstQueueRd_Addr  +3)%16]*(2**16)+  P3_InstQueue  [(  P3_InstQueueRd_Addr  +2)%16]*(2**8)+  P3_InstQueue  [(  P3_InstQueueRd_Addr  +1)%1];
                            P3_More   =1'b0;
                            P3_Flush   =1'b0;
                            P3_InstAddrPointer   =  P3_InstAddrPointer  +5;
                            P3_InstQueueRd_Addr   =(  P3_InstQueueRd_Addr  +5)%16;
                        end
                        else
                        begin
                            P3_Flush   =1'b0;
                            P3_More   =1'b1;
                        end
                    P3_MOV_eax_ebx   :
                        if ((  P3_InstQueueWr_Addr  -  P3_InstQueueRd_Addr  )>=2)
                        begin
                            if (  P3_EBX  <0)
                                P3_rEIP   <=-  P3_EBX  ;
                            else
                                P3_rEIP   <=  P3_EBX  ;
                            P3_RequestPending   <=  P3_Pending  ;
                            P3_ReadRequest   <=  P3_Pending  ;
                            P3_MemoryFetch   <=  P3_Pending  ;
                            P3_CodeFetch   <=  P3_NotPending  ;
                            if (  P3_READY_n  ==1'b0)
                            begin
                                P3_RequestPending   <=  P3_NotPending  ;
                                P3_uWord   =  P3_Datai  %(2**15);
                                if (  P3_StateBS16  ==1'b1)
                                    P3_lWord   =  P3_Datai  %(2**16);
                                else
                                begin
                                    P3_rEIP   <=  P3_rEIP  +2;
                                    P3_RequestPending   <=  P3_Pending  ;
                                    if (  P3_READY_n  ==1'b0)
                                    begin
                                        P3_RequestPending   <=  P3_NotPending  ;
                                        P3_lWord   =  P3_Datai  %(2**16);
                                    end
                                end
                                if (  P3_READY_n  ==1'b0)
                                begin
                                    P3_EAX   <=  P3_uWord  *(2**16)+  P3_lWord  ;
                                    P3_More   =1'b0;
                                    P3_Flush   =1'b0;
                                    P3_InstAddrPointer   =  P3_InstAddrPointer  +2;
                                    P3_InstQueueRd_Addr   =(  P3_InstQueueRd_Addr  +2)%16;
                                end
                            end
                        end
                        else
                        begin
                            P3_Flush   =1'b0;
                            P3_More   =1'b1;
                        end
                    P3_MOV_ebx_eax   :
                        if ((  P3_InstQueueWr_Addr  -  P3_InstQueueRd_Addr  )>=2)
                        begin
                            if (  P3_EBX  <0)
                                P3_rEIP   <=  P3_EBX  ;
                            else
                                P3_rEIP   <=  P3_EBX  ;
                            P3_lWord   =  P3_EAX  %(2**16);
                            P3_uWord   =(  P3_EAX  /(2**16))%(2**15);
                            P3_RequestPending   <=  P3_Pending  ;
                            P3_ReadRequest   <=  P3_NotPending  ;
                            P3_MemoryFetch   <=  P3_Pending  ;
                            P3_CodeFetch   <=  P3_NotPending  ;
                            if (  P3_State  ==  P3_StateT1  |  P3_State  ==  P3_StateT1P  )
                            begin
                                P3_Datao   <=(  P3_uWord  *(2**16)+  P3_lWord  );
                                if (  P3_READY_n  ==1'b0)
                                begin
                                    P3_RequestPending   <=  P3_NotPending  ;
                                    if (  P3_StateBS16  ==1'b0)
                                    begin
                                        P3_rEIP   <=  P3_rEIP  +2;
                                        P3_RequestPending   <=  P3_Pending  ;
                                        P3_ReadRequest   <=  P3_NotPending  ;
                                        P3_MemoryFetch   <=  P3_Pending  ;
                                        P3_CodeFetch   <=  P3_NotPending  ;
                                        P3_State2   =  P3_S6  ;
                                    end
                                    P3_More   =1'b0;
                                    P3_Flush   =1'b0;
                                    P3_InstAddrPointer   =  P3_InstAddrPointer  +2;
                                    P3_InstQueueRd_Addr   =(  P3_InstQueueRd_Addr  +2)%16;
                                end
                            end
                        end
                        else
                        begin
                            P3_Flush   =1'b0;
                            P3_More   =1'b1;
                        end
                    P3_IN_al   :
                        if ((  P3_InstQueueWr_Addr  -  P3_InstQueueRd_Addr  )>=2)
                        begin
                            P3_rEIP   <=  P3_InstQueueRd_Addr  +1;
                            P3_RequestPending   <=  P3_Pending  ;
                            P3_ReadRequest   <=  P3_Pending  ;
                            P3_MemoryFetch   <=  P3_NotPending  ;
                            P3_CodeFetch   <=  P3_NotPending  ;
                            if (  P3_READY_n  ==1'b0)
                            begin
                                P3_RequestPending   <=  P3_NotPending  ;
                                P3_EAX   <=  P3_Datai  ;
                                P3_InstAddrPointer   =  P3_InstAddrPointer  +2;
                                P3_InstQueueRd_Addr   =(  P3_InstQueueRd_Addr  +2);
                                P3_Flush   =1'b0;
                                P3_More   =1'b0;
                            end
                        end
                        else
                        begin
                            P3_Flush   =1'b0;
                            P3_More   =1'b1;
                        end
                    P3_OUT_al   :
                        if ((  P3_InstQueueWr_Addr  -  P3_InstQueueRd_Addr  )>=2)
                        begin
                            P3_rEIP   <=  P3_InstQueueRd_Addr  +1;
                            P3_RequestPending   <=  P3_Pending  ;
                            P3_ReadRequest   <=  P3_NotPending  ;
                            P3_MemoryFetch   <=  P3_NotPending  ;
                            P3_CodeFetch   <=  P3_NotPending  ;
                            if (  P3_State  ==  P3_StateT1  |  P3_State  ==  P3_StateT1P  )
                            begin
                                P3_fWord   =  P3_EAX  %(2**16);
                                P3_Datao   <=  P3_fWord  ;
                                if (  P3_READY_n  ==1'b0)
                                begin
                                    P3_RequestPending   <=  P3_NotPending  ;
                                    P3_InstAddrPointer   =  P3_InstAddrPointer  +2;
                                    P3_InstQueueRd_Addr   =(  P3_InstQueueRd_Addr  +2)%16;
                                    P3_Flush   =1'b0;
                                    P3_More   =1'b0;
                                end
                            end
                        end
                        else
                        begin
                            P3_Flush   =1'b0;
                            P3_More   =1'b1;
                        end
                    P3_ADD_al_b   :
                    begin
                        P3_InstAddrPointer   =  P3_InstAddrPointer  +1;
                        P3_InstQueueRd_Addr   =(  P3_InstQueueRd_Addr  +1)%16;
                        P3_Flush   =1'b0;
                        P3_More   =1'b0;
                    end
                    P3_ADD_ax_w   :
                    begin
                        P3_InstAddrPointer   =  P3_InstAddrPointer  +1;
                        P3_InstQueueRd_Addr   =(  P3_InstQueueRd_Addr  +1)%16;
                        P3_Flush   =1'b0;
                        P3_More   =1'b0;
                    end
                    P3_ROL_al_1   :
                    begin
                        P3_InstAddrPointer   =  P3_InstAddrPointer  +2;
                        P3_InstQueueRd_Addr   =(  P3_InstQueueRd_Addr  +2)%16;
                        P3_Flush   =1'b0;
                        P3_More   =1'b0;
                    end
                    P3_ROL_al_n   :
                    begin
                        P3_InstAddrPointer   =  P3_InstAddrPointer  +2;
                        P3_InstQueueRd_Addr   =(  P3_InstQueueRd_Addr  +2)%16;
                        P3_Flush   =1'b0;
                        P3_More   =1'b0;
                    end
                    P3_INC_eax   :
                    begin
                        P3_EAX   <=  P3_EAX  +1;
                        P3_InstAddrPointer   =  P3_InstAddrPointer  +1;
                        P3_InstQueueRd_Addr   =(  P3_InstQueueRd_Addr  +1)%16;
                        P3_Flush   =1'b0;
                        P3_More   =1'b0;
                    end
                    P3_INC_ebx   :
                    begin
                        P3_EBX   <=  P3_EBX  +1;
                        P3_InstAddrPointer   =  P3_InstAddrPointer  +1;
                        P3_InstQueueRd_Addr   =(  P3_InstQueueRd_Addr  +1)%16;
                        P3_Flush   =1'b0;
                        P3_More   =1'b0;
                    end
                    default :
                    begin
                        P3_InstAddrPointer   =  P3_InstAddrPointer  +1;
                        P3_InstQueueRd_Addr   =(  P3_InstQueueRd_Addr  +1)%16;
                        P3_Flush   =1'b0;
                        P3_More   =1'b0;
                    end
                endcase
                if ((~(  P3_InstQueueRd_Addr  <  P3_InstQueueWr_Addr  ))|(((  P3_InstQueueLimit  -  P3_InstQueueRd_Addr  )<4)|  P3_Flush  |  P3_More  ))
                    P3_State2   =  P3_S7  ;
            end
            P3_S6   :
            begin
                P3_Datao   <=(  P3_uWord  *(2**16)+  P3_lWord  );
                if (  P3_READY_n  ==1'b0)
                begin
                    P3_RequestPending   <=  P3_NotPending  ;
                    P3_State2   =  P3_S5  ;
                end
            end
            P3_S7   :
            begin
                if (  P3_Flush  )
                begin
                    P3_InstQueueRd_Addr   =1;
                    P3_InstQueueWr_Addr   =1;
                    if (  P3_InstAddrPointer  <0)
                        P3_fWord   =-  P3_InstAddrPointer  ;
                    else
                        P3_fWord   =  P3_InstAddrPointer  ;
                    if (  P3_fWord  %2==1)
                        P3_InstQueueRd_Addr   =(  P3_InstQueueRd_Addr  +  P3_fWord  %4)%16;
                end
                if ((  P3_InstQueueLimit  -  P3_InstQueueRd_Addr  )<3)
                begin
                    P3_State2   =  P3_S8  ;
                    P3_InstQueueWr_Addr   =0;
                end
                else
                    P3_State2   =  P3_S9  ;
            end
            P3_S8   :
                if (  P3_InstQueueRd_Addr  <=  P3_InstQueueLimit  )
                begin
                    P3_InstQueue   [  P3_InstQueueWr_Addr  ]=  P3_InstQueue  [  P3_InstQueueRd_Addr  ];
                    P3_InstQueueRd_Addr   =(  P3_InstQueueRd_Addr  +1)%16;
                    P3_InstQueueWr_Addr   =(  P3_InstQueueWr_Addr  +1)%16;
                    P3_State2   =  P3_S8  ;
                end
                else
                begin
                    P3_InstQueueRd_Addr   =0;
                    P3_State2   =  P3_S9  ;
                end
            P3_S9   :
            begin
                P3_rEIP   <=  P3_PhyAddrPointer  ;
                P3_State2   =  P3_S1  ;
            end
        endcase
    end

    always @(  posedge    P3_CLOCK          or  posedge   P3_RESET  )
    begin :  P3_P2
        if (  P3_RESET  ==1'b1)
        begin
            P3_ByteEnable   <=4'b0000;
            P3_NonAligned   <=1'b0;
        end
        else
        case (  P3_DataWidth  )
            P3_WidthByte   :
            case (  P3_rEIP  %4)
                0 :
                    P3_ByteEnable   <=4'b1110;
                1 :
                    P3_ByteEnable   <=4'b1101;
                2 :
                    P3_ByteEnable   <=4'b1011;
                3 :
                    P3_ByteEnable   <=4'b0111;
                default :
                    ;
            endcase
            P3_WidthWord   :
            case (  P3_rEIP  %4)
                0 :
                begin
                    P3_ByteEnable   <=4'b1100;
                    P3_NonAligned   <=  P3_NotPending  ;
                end
                1 :
                begin
                    P3_ByteEnable   <=4'b1001;
                    P3_NonAligned   <=  P3_NotPending  ;
                end
                2 :
                begin
                    P3_ByteEnable   <=4'b0011;
                    P3_NonAligned   <=  P3_NotPending  ;
                end
                3 :
                begin
                    P3_ByteEnable   <=4'b0111;
                    P3_NonAligned   <=  P3_Pending  ;
                end
                default :
                    ;
            endcase
            P3_WidthDword   :
            case (  P3_rEIP  %4)
                0 :
                begin
                    P3_ByteEnable   <=4'b0000;
                    P3_NonAligned   <=  P3_NotPending  ;
                end
                1 :
                begin
                    P3_ByteEnable   <=4'b0001;
                    P3_NonAligned   <=  P3_Pending  ;
                end
                2 :
                begin
                    P3_NonAligned   <=  P3_Pending  ;
                    P3_ByteEnable   <=4'b0011;
                end
                3 :
                begin
                    P3_NonAligned   <=  P3_Pending  ;
                    P3_ByteEnable   <=4'b0111;
                end
                default :
                    ;
            endcase
            default :
                ;
        endcase
    end

    assign be1 = P1_BE_n;
    assign addr1 = P1_Address;
    assign wr1 = P1_W_R_n;
    assign dc1 = P1_D_C_n;
    assign mio1 = P1_M_IO_n;
    assign ads1 = P1_ADS_n;
    assign P1_Datai = di1;
    assign do1 = P1_Datao;
    assign P1_CLOCK = clock;
    assign P1_NA_n = na;
    assign P1_BS16_n = bs16;
    assign P1_READY_n = rdy1;
    assign P1_HOLD = hold;
    assign P1_RESET = reset;
    assign be2 = P2_BE_n;
    assign addr2 = P2_Address;
    assign wr2 = P2_W_R_n;
    assign dc2 = P2_D_C_n;
    assign mio2 = P2_M_IO_n;
    assign ads2 = P2_ADS_n;
    assign P2_Datai = di2;
    assign do2 = P2_Datao;
    assign P2_CLOCK = clock;
    assign P2_NA_n = na;
    assign P2_BS16_n = bs16;
    assign P2_READY_n = rdy2;
    assign P2_HOLD = hold;
    assign P2_RESET = reset;
    assign be3 = P3_BE_n;
    assign addr3 = P3_Address;
    assign wr3 = P3_W_R_n;
    assign dc3 = P3_D_C_n;
    assign mio3 = P3_M_IO_n;
    assign ads3 = P3_ADS_n;
    assign P3_Datai = di3;
    assign do3 = P3_Datao;
    assign P3_CLOCK = clock;
    assign P3_NA_n = na;
    assign P3_BS16_n = bs16;
    assign P3_READY_n = rdy3;
    assign P3_HOLD = hold;
    assign P3_RESET = reset;

endmodule
