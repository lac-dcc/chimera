// This program was cloned from: https://github.com/RSPwFPGAs/qemu-hdl-cosim
// License: MIT License


module axireg
#(  parameter
    SADRW        =   32
,   SDATW        =   32
)
(
    input                       i_clk
,   input                       i_rst_n

,   input      [    SADRW -1:0] i_araddr
,   input                       i_arvalid
,   output reg                  o_arready

,   output reg [    SDATW -1:0] o_rdata
,   output reg [        2 -1:0] o_rresp
,   output reg                  o_rvalid
,   input                       i_rready
   
,   input      [    SADRW -1:0] i_awaddr
,   input                       i_awvalid
,   output reg                  o_awready

,   input      [    SDATW -1:0] i_wdata
,   input                       i_wvalid
,   input      [(SDATW/8) -1:0] i_wstrb
,   output reg                  o_wready

,   output reg [        2 -1:0] o_bresp
,   output reg                  o_bvalid
,   input                       i_bready

    // Control
,   output     [       20 -1:0] o_beat
,   output                      o_start
,   input                       i_done
,   output                      o_writeback
);

    //---------------------------------------------------------------------
    // Constant Declarations
    //---------------------------------------------------------------------

    localparam AXI_RESP_OK          = 2'b00;
    localparam AXI_RESP_SLVERR      = 2'b10;
    
    localparam WRITE_IDLE           = 0;
    localparam WRITE_RESPONSE       = 1;
    localparam WRITE_DATA           = 2;

    localparam READ_IDLE            = 0;
    localparam READ_RESPONSE        = 1;

    localparam CTRL_AW              = 12     ;
    localparam CTRL_BEAT            = 12'h100;
    localparam CTRL_START           = 12'h200;
    localparam CTRL_DONE            = 12'h300;
    localparam CTRL_WRITEBACK       = 12'h400;


    //---------------------------------------------------------------------
    // Reg/Wire
    //---------------------------------------------------------------------

    reg        [       20 -1:0] r_beat      , n_beat        ;
    reg                         r_start     , n_start       ;
    reg                         r_done      , n_done        ,   done_clear;
    reg                         r_writeback , n_writeback   ;

    reg        [           1:0] write_state             , write_state_next          ;
    reg        [           1:0] read_state              , read_state_next           ;
    reg        [     SADRW-1:0] read_addr               , read_addr_next            ;
    reg        [     SADRW-1:0] write_addr              , write_addr_next           ;
    reg        [           1:0]                           BRESP_next                ;


    integer i;

    always@(*)
    begin: COMBO
        n_done  = done_clear ? 1'b0 :
                  i_done     ? 1'b1 : r_done;
    end // COMBO_LOOP

    always@(*)
    begin: COMB_READ
        read_state_next = read_state    ;
        o_arready       = 1'b1          ;
        read_addr_next  = read_addr     ;
        o_rdata         = {(SDATW/ 4){4'hE}}; 
        o_rresp         = AXI_RESP_OK;
        o_rvalid        = 1'b0;
      
        case(read_state)
        READ_IDLE       : begin
            if(i_arvalid) begin
                read_addr_next  = i_araddr;
                read_state_next = READ_RESPONSE;
            end
        end        
        
        READ_RESPONSE   : begin
            o_rvalid    = 1'b1;
            o_arready   = 1'b0;

            case(read_addr[0+:CTRL_AW])
            CTRL_BEAT           : o_rdata = {{(SDATW-20){1'b0}},r_beat  };
            CTRL_DONE           : o_rdata = {{(SDATW- 1){1'b0}},r_done  };
            default             : o_rresp = AXI_RESP_SLVERR;
            endcase //  read_addr[0+:CTRL_AW]

            if(i_rready) begin
                read_state_next = READ_IDLE;
            end

        end // case: READ_RESPONSE

        endcase // read_state
    end // COMB_READ
   
    always@(*)
    begin: COMB_WRITE
        write_state_next    = write_state;
        write_addr_next     = write_addr;

        o_awready           = 1'b1;
        o_wready            = 1'b0;
        o_bvalid            = 1'b0;  
        BRESP_next          = o_bresp;

        n_beat              = r_beat;
        n_start             = 0; // pulse
        done_clear          = 0; // pulse
        n_writeback         = 0; // pulse

        case(write_state)
        WRITE_IDLE: begin
            write_addr_next = i_awaddr;
            if(i_awvalid) begin
                write_state_next = WRITE_DATA;
            end
        end // case: WRITE_IDLE

        WRITE_DATA: begin
            o_awready   = 1'b0;
            o_wready    = 1'b1;
            if(i_wvalid & (&i_wstrb)) begin

                    BRESP_next  = AXI_RESP_OK;
                    case(write_addr[0+:CTRL_AW])
                    CTRL_BEAT           : n_beat        = i_wdata[20-1:0]   ;
                    CTRL_START          : n_start       = i_wdata[0]        ;
                    CTRL_DONE           : done_clear    = i_wdata[0]        ;
                    CTRL_WRITEBACK      : n_writeback   = i_wdata[0]        ;
                    default             : BRESP_next    = AXI_RESP_SLVERR   ;
                    endcase //  write_addr[0+:CTRL_AW]

                write_state_next = WRITE_RESPONSE;
            end // if ( i_wvalid & (&i_wstrb) )
            else if ( i_wvalid & ~(&i_wstrb) ) begin
                BRESP_next  = AXI_RESP_OK;
                write_state_next = WRITE_RESPONSE;
            end
        end // case: WRITE_DATA

        WRITE_RESPONSE: begin
            o_awready   = 1'b0;
            o_bvalid    = 1'b1;
            if (i_bready) begin                    
                write_state_next = WRITE_IDLE;
            end
        end // case: WRITE_RESPONSE

        endcase // write_state
    end // COMB_WRITE

    always@(posedge i_clk or negedge i_rst_n) begin
        write_state <= (~i_rst_n) ? WRITE_IDLE  : write_state_next  ;
        read_state  <= (~i_rst_n) ? READ_IDLE   : read_state_next   ;
        read_addr   <= (~i_rst_n) ? 0           : read_addr_next    ;
        write_addr  <= (~i_rst_n) ? 0           : write_addr_next   ;
        o_bresp     <= (~i_rst_n) ? AXI_RESP_OK : BRESP_next        ;

        r_beat      <= (~i_rst_n) ? 0           : n_beat            ;
        r_start     <= (~i_rst_n) ? 0           : n_start           ;
        r_done      <= (~i_rst_n) ? 0           : n_done            ;
        r_writeback <= (~i_rst_n) ? 0           : n_writeback       ;
    end
   
    //---------------------------------------------------------------------
    // Primary Output Assignment
    //---------------------------------------------------------------------

    // Combo Out

    // Reg   Out
    assign o_beat               = r_beat            ;
    assign o_start              = r_start           ;
    assign o_writeback          = r_writeback       ;

endmodule

