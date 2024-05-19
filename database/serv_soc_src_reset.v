// This program was cloned from: https://github.com/DaveBerkeley/serv_soc
// License: MIT License


module reset(
    input wire ck, 
    input wire rst_req,
    output wire rst
);

    parameter LENGTH = 5;

    localparam W = $clog2(LENGTH);

    // Reset generator
    reg [W:0] rst_reg = 0;

    always @(posedge ck) begin
        if (rst_req) begin
            rst_reg <= 0;
        end else begin
            if (rst_reg != LENGTH) begin
                rst_reg <= rst_reg + 1;;
            end
        end
    end

    assign rst = rst_reg != LENGTH;

endmodule

