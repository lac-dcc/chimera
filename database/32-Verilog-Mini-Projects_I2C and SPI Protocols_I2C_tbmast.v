module tbmast;

            // Inputs
            reg [6:0] address;
            reg [7:0] register;
            reg [7:0] data;
            reg [7:0] data_wr;
            reg clk;
            reg rw;

            // Outputs
            wire sda;
            wire scl;

            // Instantiate the Unit Under Test (UUT)
            master uut (
                        .address(address),
                        .register(register),
                        .clk(clk),
                        .rw(rw), 
                        .sda(sda),
                        .scl(scl),
                        .data(data),
                        .data_wr(data_wr)
            );

            initial begin
                        // Initialize Inputs
                        address = 105;
                        register = 7'b0100101;
                        clk = 0;
                        rw = 0;
                        data_wr = 20;

                        // Wait 100 ns for global reset to finish
                        #100;
       
                        // Add stimulus here

            end
      always
                        #1 clk = !clk;
endmodule
