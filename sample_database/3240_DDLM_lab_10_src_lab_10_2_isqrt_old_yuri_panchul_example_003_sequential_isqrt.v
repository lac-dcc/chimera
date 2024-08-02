// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

// sequential

module isqrt
(
    input             clock,
    input             reset_n,
    input             run,
    input      [31:0] x,
    output reg        ready,
    output reg [15:0] y
);

    reg [31:0] m,  r_m;
    reg [31:0] tx, r_tx;
    reg [31:0] ty, r_ty;
    reg [31:0] b,  r_b;

    reg new_ready;

    always @*
    begin
        if (run)
        begin
            m  = 31'h4000_0000;
            tx = x;
            ty = 0;
        end
        else
        begin
            m  = r_m;
            tx = r_tx;
            ty = r_ty;
        end
    
        b  = ty |  m;
        ty = ty >> 1;
            
        if (tx >= b)
        begin
            tx = tx - b;
            ty = ty | m;
        end

        new_ready = m [0];
            
        m = m >> 2;
    end

    always @(posedge clock or negedge reset_n)
    begin
        if (! reset_n)
        begin
            ready <= 0;
            y     <= 0;
        end
        else if (new_ready)
        begin
            ready <= 1;
            y     <= ty [15:0];
        end
        else
        begin
            ready <= 0;

            r_m   <= m;
            r_tx  <= tx;
            r_ty  <= ty;
            r_b   <= b;

        end
    end

endmodule
