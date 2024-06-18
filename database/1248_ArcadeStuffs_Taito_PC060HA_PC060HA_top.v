// This program was cloned from: https://github.com/ika-musume/ArcadeStuffs
// License: GNU General Public License v2.0

module PC060HA_top
(
    //reset signals
    input   wire            nIC,    //nRESET in
    output  wire            nROUT,  //nRESET out

    //slave control
    input   wire            SCLK,
    input   wire            nSCS,
    input   wire            nSRD,
    input   wire            nSWR,
    input   wire            SA0,
    inout   wire    [3:0]   SD,

    //master control
    input   wire            MCLK,
    input   wire            nMCS,
    input   wire            nMRD,
    input   wire            nMWR,
    input   wire            MA0,
    inout   wire    [3:0]   MD,

    //GPIOs
    input   wire            IN0,
    input   wire            IN1,
    output  wire            nNMI,
    output  reg             AMP
);


/*
    GLOBAL REGISTERS / NETS
*/
//RW signals
wire            slave_data_reg_read = nSCS | nSRD | ~SA0;    //active low
wire            slave_data_reg_write = nSCS | nSWR | ~SA0;   //active low
wire            master_data_reg_read = nMCS | nMRD | ~MA0;   //active low
wire            master_data_reg_write = nMCS | nMWR | ~MA0;  //active low

//data and page regs
wire    [2:0]   master_page_reg;
reg     [3:0]   master_to_slave_0 = 4'b0000;
reg     [3:0]   master_to_slave_1 = 4'b0000;
reg     [3:0]   master_to_slave_2 = 4'b0000;
reg     [3:0]   master_to_slave_3 = 4'b0000;

wire    [2:0]   slave_page_reg;
reg     [3:0]   slave_to_master_0 = 4'b0000;
reg     [3:0]   slave_to_master_1 = 4'b0000;
reg     [3:0]   slave_to_master_2 = 4'b0000;
reg     [3:0]   slave_to_master_3 = 4'b0000;




/*
    INOUT DRIVER
*/
reg     [3:0]   SD_OUTLATCH = 4'd0;
assign          SD = ((slave_data_reg_read) == 1'b1) ? 4'bZZZZ : SD_OUTLATCH;
reg     [3:0]   MD_OUTLATCH = 4'd0;
assign          MD = ((master_data_reg_read) == 1'b1) ? 4'bZZZZ : MD_OUTLATCH;



/*
    INTERNAL RESET
*/
wire            reset_request = master_data_reg_write | ~(master_page_reg == 3'd4);
reg             internal_reset = 1'b1;
assign          nROUT = internal_reset & nIC;
always @(negedge nIC or posedge reset_request)
begin
    if(nIC == 1'b0) //DFF reset
    begin
        internal_reset <= ~1'b0;
    end
    else 
    begin
        internal_reset <= ~MD[0];
    end
end



/*
    FLAG CONTROL SIGNAL
*/ 
//slave side: set flag after writing slave data reg
wire            set_slave_side_half_full_flag = slave_data_reg_write | ~(slave_page_reg == 3'd1);                          //active low, slave does
wire            set_slave_side_full_flag = slave_data_reg_write | ~(slave_page_reg == 3'd3);                               //active low, slave does

//slave side: reset flag after reading master data reg
wire            reset_master_side_half_full_flag = nROUT & (slave_data_reg_read | ~(slave_page_reg == 3'd1));           //active low, slave does
wire            reset_master_side_full_flag = nROUT & (slave_data_reg_read | ~(slave_page_reg == 3'd3));                 //active low, slave does

//master side: set flag after writing master data reg
wire            set_master_side_half_full_flag = master_data_reg_write | ~(master_page_reg == 3'd1);                       //active low, master does
wire            set_master_side_full_flag = master_data_reg_write | ~(master_page_reg == 3'd3);                            //active low, master does

//master side: reset flag after reading master data reg
wire            reset_slave_side_half_full_flag = nROUT & (master_data_reg_read | ~(master_page_reg == 3'd1));           //active low, master does
wire            reset_slave_side_full_flag = nROUT & (master_data_reg_read | ~(master_page_reg == 3'd3));                //active low, master does



/*
    FLAG REGISTERS
*/
wire            slave_half_full_flag;
wire            slave_full_flag;
wire            master_half_full_flag;
wire            master_full_flag;

FlagToggler     SlaveHalfFull   (.nRESET(nROUT), .RESETTICK(reset_slave_side_half_full_flag),  .SETTICK(set_slave_side_half_full_flag),   .FLAGOUT(slave_half_full_flag));
FlagToggler     SlaveFull       (.nRESET(nROUT), .RESETTICK(reset_slave_side_full_flag),       .SETTICK(set_slave_side_full_flag),        .FLAGOUT(slave_full_flag));
FlagToggler     MasterHalfFull  (.nRESET(nROUT), .RESETTICK(reset_master_side_half_full_flag), .SETTICK(set_master_side_half_full_flag),  .FLAGOUT(master_half_full_flag));
FlagToggler     MasterFull      (.nRESET(nROUT), .RESETTICK(reset_master_side_full_flag),      .SETTICK(set_master_side_full_flag),       .FLAGOUT(master_full_flag));



/*
    PAGE REGISTER CONTROLLER
*/

PageRegisterController  Slave   (.nRESET(nROUT),    .CLK(SCLK), .nRD(nSRD), .nWR(nSWR), .nCS(nSCS), .MODE(SA0), .DATA(SD[2:0]), .PAGEREG(slave_page_reg));
PageRegisterController  Master  (.nRESET(nIC),      .CLK(MCLK), .nRD(nMRD), .nWR(nMWR), .nCS(nMCS), .MODE(MA0), .DATA(MD[2:0]), .PAGEREG(master_page_reg));



/*
    SLAVE ACCESSIBLE REGISTER ARRAY
*/
//read
always @(*)
begin
    case (slave_page_reg)
        3'd0: SD_OUTLATCH <= master_to_slave_0;
        3'd1: SD_OUTLATCH <= master_to_slave_1;
        3'd2: SD_OUTLATCH <= master_to_slave_2;
        3'd3: SD_OUTLATCH <= master_to_slave_3;
        3'd4: SD_OUTLATCH <= {slave_full_flag, slave_half_full_flag, master_full_flag, master_half_full_flag};
        3'd5: SD_OUTLATCH <= {2'b00, IN1, IN0};
        default: SD_OUTLATCH <= 4'b0000;
    endcase
end

//write
always @(negedge slave_data_reg_write)
begin
    if(slave_page_reg[2] == 1'b0)
	 begin
        case (slave_page_reg[1:0])
            2'd0: slave_to_master_0 <= SD;
            2'd1: slave_to_master_1 <= SD;
            2'd2: slave_to_master_2 <= SD;
            2'd3: slave_to_master_3 <= SD;
        endcase
    end
end

//power amp GPO
wire            power_amp_on = slave_data_reg_write | ~(slave_page_reg == 3'd4);

always @(negedge nROUT or posedge power_amp_on)
begin
    if(nROUT == 1'b0) //DFF clear
    begin
        AMP <= 1'b0;
    end
    else 
    begin
        AMP <= SD[0];
    end
end

//NMI on/off
wire            nmi_disable = nROUT & (slave_data_reg_write | ~(slave_page_reg == 3'd5));   //active low
wire            nmi_enable = slave_data_reg_write | ~(slave_page_reg == 3'd6);              //active low
wire            nmi_request;                                                                //active high
assign          nmi_request = master_half_full_flag | master_full_flag; //master half = 0, master full = 0
reg             nmi_toggle = 1'b0;                                                            //active high
assign          nNMI = ~(nmi_request & nmi_toggle);

always @(negedge nmi_disable or posedge nmi_enable)
begin
    if(nmi_disable == 1'b0) //DFF clear
    begin
        nmi_toggle <= 1'b0;
    end
    else 
    begin
        nmi_toggle <= 1'b1;
    end
end


/*
    MASTER ACCESSIBLE REGISTER ARRAY
*/
//read
always @(*)
begin
    case (master_page_reg)
        3'd0: MD_OUTLATCH <= slave_to_master_0;
        3'd1: MD_OUTLATCH <= slave_to_master_1;
        3'd2: MD_OUTLATCH <= slave_to_master_2;
        3'd3: MD_OUTLATCH <= slave_to_master_3;
        3'd4: MD_OUTLATCH <= {slave_full_flag, slave_half_full_flag, master_full_flag, master_half_full_flag};
        default: MD_OUTLATCH <= 4'b0000;
    endcase
end

//write
always @(negedge master_data_reg_write)
begin
    if(master_page_reg[2] == 1'b0)
	 begin
        case(master_page_reg[1:0])
            2'd0: master_to_slave_0 <= MD;
            2'd1: master_to_slave_1 <= MD;
            2'd2: master_to_slave_2 <= MD;
            2'd3: master_to_slave_3 <= MD;
        endcase
    end
end
endmodule