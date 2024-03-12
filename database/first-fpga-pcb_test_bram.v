`default_nettype none
module bram
#(
    parameter ADDR_W    = 9,
    parameter DATA_W    = 8,
    parameter FILE      = "",
    parameter ZERO      = 0
)
(
    input wire                  r_clk,
    input wire                  w_clk,
    input wire [ADDR_W-1:0]     r_addr,
    input wire [ADDR_W-1:0]     w_addr,
    input wire                  w_en,
    input wire                  r_en,
    input wire [DATA_W-1:0]     w_data,
    output reg [DATA_W-1:0]     r_data
);

    reg [DATA_W-1:0] bram [(1 << ADDR_W)-1:0];

    integer j;
    initial begin
        if (FILE) $readmemh(FILE, bram);
        if (ZERO)
            for(j = 0; j < (2<<ADDR_W); j = j + 1)  begin
                bram[j] = 0;
            end
        `ifdef DEBUG
        r_data = 0;
        `endif
    end

    always @(posedge w_clk) begin
        if(w_en)
            bram[w_addr] <= w_data;
    end

    always @(posedge r_clk) begin
        if(r_en)
            r_data <= bram[r_addr];
    end

    `ifdef FORMAL
    // https://zipcpu.com/zipcpu/2018/07/13/memories.html
    
    reg f_past_valid = 0;
    always @(posedge r_clk)
        f_past_valid <= 1;

    // allow solver to pick any address
    (* anyconst *) wire [ADDR_W-1:0] f_addr;
    // make a data variable
    reg [DATA_W-1:0] f_data;

    // set data variable to whats in the bram
    initial begin
        assume(f_data == bram[f_addr]);
    end

    // always assert that the data at the address is correct
    always @(*)
        assert(bram[f_addr] == f_data);

    always @(posedge r_clk) 
        if ((f_past_valid)
            // if a read  
            &&($past(r_en))
            // and at the special address
            &&($past(r_addr == f_addr)))
        // assert the read gives correct answer
        assert(r_data == $past(f_data));

    always @(posedge w_clk)
            // if a write  
            if((w_en)
            // and at the special address
            &&(w_addr == f_addr))
        // update the data
        f_data <= w_data;
    `endif

endmodule
