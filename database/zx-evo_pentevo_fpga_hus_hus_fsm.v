// The main chopper for the HUS chip
//
// Start conditions, or: 1. FIFO is half-empty (fifo_used[7]=0)
//                       2. reload from CPU was done (reload_we[3]=1)
//
// Stop conditions, or:  1. reset occures (anyway)
//                       2. tick occures (
//                       3. FIFO is full

`include "../include/tune.v"


module hus_fsm(

// clocks
	input wire clk,

// controls
	input wire reset,
	input wire tick,
    input wire [31:0] reload,
	input wire reload_we,       // the MSB write strobe
	output wire tick_stb,
	output reg fsm_on,

// channel descriptors
    output wire [7:0] desc_addr,
    input wire [15:0] desc_data,

// FIFO
    output wire [15:0] fifo_data,
    output wire fifo_we,
	input wire fifo_full,
	input wire fifo_half,
    
// RAM interface
	output wire [20:0] ram_addr,
	input  wire [15:0] ram_data,    // data pins from DRAM
	output reg         ram_req,
	input  wire        ram_next
    
);


// FSM on/off control
    always @(posedge clk)
    reg fsm_en;
    
    begin
        if (reset)
        begin
            fsm_on <= 0;
            fsm_en <= 0;
        end
        else
        begin
            if (fifo_full)
                fsm_on <= 0;
            if (tick)
            begin
                fsm_on <= 0;
                fsm_en <= 0;
            end
            if (fifo_half & fsm_en)
                fsm_on <= 1;
            if (reload_we)
                fsm_en <= 1;
        end
    end

    
// RAM
    reg data_ready;
    reg [7:0] data;
    reg bsel;
    
    assign ram_addr = addr[21:1];      // this is for 16 DRAM on pentevo
    wire ram_pre_req = (state == );
    
    always @(posedge clk)
    begin
        if (reset)
        begin
            ram_req <= 0;
            ram_ready <= 0;
        end
        else
        begin
            if (ram_pre_req)        // FSM state
            begin
                ram_req <= 1;
                bsel <= addr[0];
            end
            if (ram_next)           // c2
            begin
                ram_ready <= 1;
                ram_req <= 0;
                data <= bsel ? ram_data[15:8] : ram_data[7:0];   // ATTENTION! This is 'raw' data from the DRAM pins. Valid at c2.
            end
        end
    end
    
    
// FSM
    reg [4:0] state;
    reg [4:0] chan;
    reg [23:0] addr;
    reg [13:0] sum_l;
    reg [13:0] sum_r;
    
// descriptors
    reg [2:0] dreg;
    assign desc_addr = {chan, dreg};

// 00
    wire ch_act = desc_data[7];
    wire [1:0] ch_loop = desc_data[1:0];
    wire [7:0] ch_saddrl = desc_data[15:8];
// 01
    wire [15:0] ch_saddrhx = desc_data[15:0];
// 02
    wire [15:0] ch_eaddrlh = desc_data[15:0];
// 03
    wire [7:0] ch_eaddrx = desc_data[7:0];
    wire [7:0] ch_laddrl = desc_data[15:8];
// 04
    wire [15:0] ch_laddrhx = desc_data[15:0];
// 05
    wire [15:0] ch_inc = desc_data[15:0];
// 06
    wire [6:0] ch_voll = desc_data[6:0];
    wire [6:0] ch_volr = desc_data[14:8];

    
// vars    
    reg [1:0] vreg;
    wire [6:0] vars_rd_addr = {chan, vreg};

// 00    
    wire [7:0] vr_int = vars_rd_data[7:0];
    wire [7:0] vr_addrl = vars_rd_data[15:8];
// 01
    wire [15:0] vr_addrhx = vars_rd_data[15:0];
// 02
    wire [11:0] vr_saddr = vars_rd_data[11:0];
    wire [1:0] vr_dp = vars_rd_data[15:14];
    
    wire [15:0] next_addr = reload[chan] ? desc_data : vars_rd_data;
    
// FIFO    
    assign fifo_we = (state == ) | (state == );
    assign fifo_data = (state == ) ? sum_l : sum_r;
    

    assign tick_stb = (state == );
    
    wire [4:0] state_next = state + 1;
    wire [4:0] chan_next = chan + 1;
    
    always @(posedge clk)
        if (!fsm_on)
            state <= 5'h00;
        else
        case (state)

5'h00:  begin               // begin of 32 iterations
            chan <= 0;
            sum_l <= 0;
            sum_r <= 0;
            dreg <= 0;
            vreg <= 0;
            state <= state_next;
        end
        
5'h01:  begin               // ready to load address for RAM (bits 0-7), if non-active channel - skip to next
            addr[7:0] <= next_addr[7:0];
            
            if (!ch_act)
                chan <= chan_next;
            else
                state <= state_next;
        end
        
5'h02:  begin
            addr[23:8] <= next_addr[15:0];
            state <= state_next;
        end
        
5'h03:  begin
        end
        
5'h04:  begin
        end
        
5'h05:  begin
        end
        
5'h06:  begin
        end
        
5'h07:  begin
        end
        
5'h08:  begin
        end
        
5'h09:  begin
        end
        
5'h0A:  begin
        end
        
5'h0B:  begin
        end
        
5'h0C:  begin
        end
        
5'h0D:  begin
        end
        
5'h0E:  begin
        end
        
5'h0F:  begin
        end
        
5'h10:  begin
        end
        
5'h11:  begin
        end
5'h12:
5'h13:
5'h14:
5'h15:
5'h16:
5'h17:
5'h18:
5'h19:
5'h1A:
5'h1B:
5'h1C:
5'h1D:
5'h1E:
5'h1F:
default:        
        endcase
    

// FSM vars
    wire [6:0] vars_wr_addr;
    wire [15:0] vars_rd_data;
    wire [15:0] vars_wr_data;
    wire vars_we;

    hus_vars hus_vars(
        .clock      (clk),
        .rdaddress  (vars_rd_addr),
        .q          (vars_rd_data),
        .wraddress  (vars_wr_addr),
        .data       (vars_wr_data),
        .wren       (vars_we)
    );



endmodule