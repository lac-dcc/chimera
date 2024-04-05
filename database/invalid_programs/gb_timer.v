module timer(
    clockgb, resetn, overflow_int,
    address, indata, outdata, load, store,
    dtimer
);

input clockgb;
input resetn;
output overflow_int = overflow;

input [15:0] address;
input [7:0] indata;
output [7:0] outdata;
input load;
input store;

output [7:0] dtimer = timer;


reg [7:0] tma;
reg [7:0] tac;

reg [15:0] tdiv;
reg [7:0] timer;
reg [15:0] ndiv;
reg [7:0] ntimer;
reg increment;
reg overflow;

always @(*) begin
    ndiv = tdiv + 1'b1;
    
    case (tac[1:0])
    1: increment = !ndiv[3] && tdiv[3];
    2: increment = !ndiv[5] && tdiv[5];
    3: increment = !ndiv[7] && tdiv[7];
    0: increment = !ndiv[9] && tdiv[9];
    endcase
    
    if (tac[2] && increment) begin
        if ({1'b0, timer} + 1'b1 > 8'hff) begin
            overflow = 1'b1;
            ntimer = tma;
        end else begin
            overflow = 0;
            ntimer = timer + 1'b1;
        end
    end else begin
        overflow = 0;
        ntimer = timer;
    end
end


always @(posedge clockgb or negedge resetn) begin
    if (!resetn) begin
        timer <= 0;
        tdiv <= 0;
        tma <= 0;
        tac <= 0;
    end else begin
        tdiv <= ndiv;
        timer <= ntimer;
    
        if (timer_store) begin
            timer <= timer_indata;
        end
        if (tdiv_store) begin
            tdiv <= 0;
        end
        if (tma_store) begin
            tma <= tma_indata;
        end
        if (tac_store) begin
            tac <= tac_indata;
        end
    end
end


wire [7:0] tdiv_data;
wire tdiv_store;

rrmmap #(16'hff04) tdiv_mmap(
    clockgb, resetn,
    address, indata, tdiv_data, load, store,,, 
    tdiv[15:8],, tdiv_store
);

wire [7:0] timer_indata;
wire [7:0] timer_data;
wire timer_store;

rrmmap #(16'hff05) timer_mmap(
    clockgb, resetn,
    address, indata, timer_data, load, store,,
    timer_indata, timer,, timer_store
);

wire [7:0] tma_indata;
wire [7:0] tma_data;
wire tma_store;

rrmmap #(16'hff06) tma_mmap(
    clockgb, resetn,
    address, indata, tma_data, load, store,,
    tma_indata, tma,, tma_store
);

wire [7:0] tac_indata;
wire [7:0] tac_data;
wire tac_store;

rrmmap #(16'hff07) tac_mmap(
    clockgb, resetn,
    address, indata, tac_data, load, store,,
    tac_indata, tac,, tac_store
);

assign outdata = tdiv_data | timer_data | tma_data | tac_data;

endmodule
