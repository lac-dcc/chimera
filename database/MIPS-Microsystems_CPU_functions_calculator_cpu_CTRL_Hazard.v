module HARZARD_CTRL(A1_D,A2_D,ALU_B_Sel_D,both_D,single_D,md_D,A1_E,A2_E,A3_E,RFWe_E,Ready_E,load_E,Start,Busy,A1_M,A2_M,A3_M,RFWe_M,load_M,A3_W,RFWe_W,RS_D_Sel,RT_D_Sel,RS_E_Sel,RT_E_Sel,RS_M_Sel,RT_M_Sel,stall);
//Input
//D
    input [4:0] A1_D;
    input [4:0] A2_D;
    input [31:0] ALU_B_Sel_D; //judge whether A2 will be used to accelerate stall_load 
    input both_D;             //Ins_D needs to access both rs and rt
    input single_D;           //Ins_D only needs to access rs
    input md_D;

//E
    input [4:0] A1_E;
    input [4:0] A2_E;
    input [4:0] A3_E;  //reg to write in level EXE
    input RFWe_E;
    input Ready_E;     //forward E to D if ready
    input load_E;      //Ins_E needs to load value from DM
    input Start;
    input Busy;

//M
	input [4:0] A1_M;
    input [4:0] A2_M;
    input [4:0] A3_M;
    input RFWe_M;
	input load_M;

//W
    input [4:0] A3_W;
    input RFWe_W;

//Output
    output reg [31:0] RS_D_Sel;
    output reg [31:0] RT_D_Sel;
    output reg [31:0] RS_E_Sel;
    output reg [31:0] RT_E_Sel;
	output reg [31:0] RS_M_Sel;
    output reg [31:0] RT_M_Sel;

    output stall;

//Forward
    always @(*)
        begin
            RS_D_Sel=0;     //avoid latch
            RT_D_Sel=0;
            RS_E_Sel=0;
            RT_E_Sel=0;
			RS_M_Sel=0;
            RT_M_Sel=0;
        
            //RS_D
            if(A1_D==0)RS_D_Sel=0;          //forward $0 (i.e. RD1 originally)
            else if(RFWe_E&&Ready_E&&A1_D==A3_E)RS_D_Sel=1;   //RF_WD_E
            else if(RFWe_M&&A1_D==A3_M)RS_D_Sel=2;            //RF_WD_M
            else if(RFWe_W&&A1_D==A3_W)RS_D_Sel=3;            //RF_WD_W

            //RT_D
            if(A2_D==0)RT_D_Sel=0;         //forward $0
            else if(RFWe_E&&Ready_E&&A2_D==A3_E)RT_D_Sel=1;   //RF_WD_E
            else if(RFWe_M&&A2_D==A3_M)RT_D_Sel=2;            //RF_WD_M
            else if(RFWe_W&&A2_D==A3_W)RT_D_Sel=3;            //RF_WD_W

            //RS_E
            if(A1_E==0)RS_E_Sel=0;         //forward $0
            else if(RFWe_M&&A1_E==A3_M)RS_E_Sel=2;            //RF_WD_M
            else if(RFWe_W&&A1_E==A3_W)RS_E_Sel=3;            //RF_WD_W

            //RT_E
            if(A2_E==0)RT_E_Sel=0;         //forward $0
            else if(RFWe_M&&A2_E==A3_M)RT_E_Sel=2;            //RF_WD_M
            else if(RFWe_W&&A2_E==A3_W)RT_E_Sel=3;            //RF_WD_W

			//RS_M
			if(A1_M==0)RS_M_Sel=0;		   //forward $0
			else if(RFWe_W&&A1_M==A3_W)RS_M_Sel=3;			  //RF_WD_W

            //RT_M
            if(A2_M==0)RT_M_Sel=0;         //forward $0
            else if(RFWe_W&&A2_M==A3_W)RT_M_Sel=3;            //RF_WD_W

        end

//Stall
    reg stall_load;        //wait until value is loaded from DM
    reg stall_both;        //wait until both rs&rt values are ready
    reg stall_single;      //wait until as long as rs is ready
    reg stall_md;          //wait until md finishes calculation

    always @(*)
        begin
            stall_load=0;
            stall_both=0;
            stall_single=0;
            stall_md=0;

            //stall_load
            if(load_E&&A3_E!=0)		//when A3_E is 0, no need to stall. 
                begin
                    if(RFWe_E&&A1_D==A3_E)stall_load=1;
                    else if(RFWe_E&&A2_D==A3_E&&ALU_B_Sel_D==0)stall_load=1;  //ALU_B_Sel_D=0 means A2 will be used as ALU_B
                end

            //stall_both
            if(both_D)
                begin
                    if(RFWe_E&&!Ready_E&&((A1_D==A3_E)||(A2_D==A3_E))&&A3_E!=0)stall_both=1;
                    else if(RFWe_M&&load_M&&((A1_D==A3_M)||(A2_D==A3_M))&&A3_M!=0)stall_both=1;
                end

            //stall_single
            if(single_D)
                begin
                    if(RFWe_E&&!Ready_E&&(A1_D==A3_E)&&A3_E!=0)stall_single=1;
                    else if(RFWe_M&&load_M&&(A1_D==A3_M)&&A3_M!=0)stall_single=1;
                end

            //stall_md
            if((Start||Busy)&&md_D)stall_md=1;

        end

    assign stall=stall_load||stall_both||stall_single||stall_md;

endmodule
