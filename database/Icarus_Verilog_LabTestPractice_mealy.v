`define S0 2'b00
`define S1 2'b01
`define S2 2'b10

module mealy(
    output outp,
    input inp,
    input reset,
    input clock
);

    reg [1:0] state;
    reg outp;

    always @(posedge clock or reset) begin

        if( reset ) begin
            state <= `S0;
            outp <= 1'b0;
        end

        else begin
            case (state)

                `S0 : begin
                        state <= (inp == 1) ? `S1 : `S2;
                        outp  <= (inp == 1) ? 1'b0 : 1'b0;
                      end

                `S1 : begin
                        state <= (inp == 1) ? `S0 : `S2;
                        outp  <= (inp == 1) ? 1'b1 : 1'b0;
                      end

                `S2 : begin
                        state <= (inp == 1) ? `S1 : `S0;
                        outp  <= (inp == 1) ? 1'b0 : 1'b1;
                      end

                default : begin
                            state <= `S0; 
                            outp<= 1'b0;
                          end  
            endcase
        end

    end

endmodule