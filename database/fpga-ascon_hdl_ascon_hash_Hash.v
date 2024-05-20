// This program was cloned from: https://github.com/phn210/fpga-ascon
// License: MIT License

module Hash #(
    parameter r = 64,
    parameter a = 12,
    parameter b = 12,
    parameter h = 256,
    parameter l = 256,
    parameter y = 40
) (
    input           clk,
    input           rst,
    input [y-1:0]   message,
    input           start,

    output          ready,
    output [l-1:0]  hash
);
    // Constants
    parameter c = 320-r;
    parameter nz_m = ((y+1)%r == 0)? 0 : r-((y+1)%r);
    parameter Y = y+1+nz_m;
    parameter s = Y/r;
    parameter t = l/r;

    // Buffer Variables
    wire    [63:0]  IV;
    wire    [r-1:0] Sr;
    wire    [c-1:0] Sc;
    reg     [319:0] S;
    reg     [4:0]   rounds;
    wire    [4:0]   ctr;
    wire            permutation_ready;
    reg             permutation_start;
    reg     [319:0] P_in;
    wire    [319:0] P_out;
    reg     [t:0]   block_ctr;
    wire    [Y-1:0] M;
    reg     [h-1:0] H;
    reg             ready_1;
    reg     [2:0]   state;

    assign {Sr, Sc} = S;
    assign IV = r << 48 | a << 40 | (a-b) << 12 | h;
    assign M = {message, 1'b1, {nz_m{1'b0}}};
    assign hash = ready? H[h-1 -: l] : 0;
    assign ready = ready_1;

    // States
    parameter IDLE          = 'd0,
              INITIALIZE    = 'd1,
              ABSORB        = 'd2,
              SQUEEZE       = 'd3,
              DONE          = 'd4;

    always @(posedge clk) begin
        if(!rst) begin
            state <= IDLE;
            S <= 0;
            ready_1 <= 0;
            H <= 0;
            block_ctr <= 0;
        end
        else begin
            case (state)

                // Idle Stage
                IDLE: begin
                    S <= {IV, {c{1'b0}}};
                    ready_1 <= 0;
                    if(start)
                        state <= INITIALIZE;
                end 

                // Initialization
                INITIALIZE: begin
                    if(permutation_ready) begin
                        state <= ABSORB;
                        S <= P_out;
                    end
                end

                // Absorb Message
                ABSORB: begin
                    if(block_ctr == s-1) begin
                        state <= SQUEEZE;
                        S <= {Sr ^ M[r-1 : 0], Sc};
                    end
                    else if(permutation_ready && block_ctr != s)
                        S <= P_out;

                    if (block_ctr == s-1) 
                        block_ctr <= 0;
                    else if(permutation_ready && block_ctr != s)
                        block_ctr <= block_ctr + 1; 
                end

                // Squeeze Hash
                SQUEEZE: begin
                    if(permutation_ready && block_ctr == t-1) begin
                        state <= DONE;
                        block_ctr <= 0;
                        H[r-1 : 0] <= P_out[319 -: r];
                    end
                    else if(permutation_ready && block_ctr != t) begin
                        S <= P_out;
                        H[(t-block_ctr)*r-1 -: r] <= P_out[319 -: r];
                        block_ctr <= block_ctr + 1;
                    end
                end

                // Done Stage
                DONE: begin
                    ready_1 <= 1;
                    if(start)
                        state <= IDLE;
                end

                default: state <= IDLE;
            endcase
        end
    end

    always @(*) begin
        // Default Values
        P_in = 0;
        rounds = a;
        permutation_start = 0;

        case (state)
            INITIALIZE: begin
                P_in = S;
                rounds = a;
                permutation_start = (permutation_ready)? 1'b0: 1'b1;
            end

            ABSORB: begin
                P_in = {Sr^M[(s-block_ctr)*r-1 -: r], Sc};
                rounds = b;
                if(block_ctr == s-1)
                    permutation_start = 0;
                else
                    permutation_start = 1;
            end

            SQUEEZE: begin
                P_in = S;
                if(block_ctr == 0)
                    rounds = a;
                else
                    rounds = b;
                permutation_start = 1;
            end

        endcase
    end

    // Permutation block
    Permutation p1(
        .clk(clk),
        .rst(rst),
        .S(P_in),
        .out(P_out),
        .done(permutation_ready),
        .ctr(ctr),
        .rounds(rounds),
        .start(permutation_start)
    );

    // Round counter
    RoundCounter RC(
        clk,
        rst,
        permutation_start,
        permutation_ready,
        ctr
    );

endmodule