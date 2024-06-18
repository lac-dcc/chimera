// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module Multiplier (input [4:0] x, w, output [9:0] m_res);

    wire [23:0] x_and_w;
    wire [18:0] cio;
    wire [11:0] temp;

    And A0(.A(x[0]), .B(w[0]), .out(m_res[0]));


    And A1(.A(x[0]), .B(w[1]), .out(x_and_w[0]));
    And A2(.A(x[1]), .B(w[0]), .out(x_and_w[1]));

    And A3(.A(x[2]), .B(w[0]), .out(x_and_w[2]));
    And A4(.A(x[1]), .B(w[1]), .out(x_and_w[3]));

    And A5(.A(x[3]), .B(w[0]), .out(x_and_w[4]));
    And A6(.A(x[2]), .B(w[1]), .out(x_and_w[5]));

    And A7(.A(x[4]), .B(w[0]), .out(x_and_w[6]));
    And A8(.A(x[3]), .B(w[1]), .out(x_and_w[7]));

    And A9(.A(x[0]), .B(w[2]), .out(x_and_w[8])); //HF
    And A10(.A(x[1]), .B(w[2]), .out(x_and_w[9]));
    And A11(.A(x[2]), .B(w[2]), .out(x_and_w[10]));
    And A12(.A(x[4]), .B(w[1]), .out(x_and_w[11]));

    And A13(.A(x[0]), .B(w[3]), .out(x_and_w[12])); //HF
    And A14(.A(x[1]), .B(w[3]), .out(x_and_w[13]));
    And A15(.A(x[3]), .B(w[2]), .out(x_and_w[14]));
    And A16(.A(x[4]), .B(w[2]), .out(x_and_w[15]));

    And A17(.A(x[0]), .B(w[4]), .out(x_and_w[16])); //HF
    And A18(.A(x[2]), .B(w[3]), .out(x_and_w[17]));
    And A19(.A(x[3]), .B(w[3]), .out(x_and_w[18]));
    And A20(.A(x[4]), .B(w[3]), .out(x_and_w[19]));

    And A21(.A(x[1]), .B(w[4]), .out(x_and_w[20])); //HF
    And A22(.A(x[2]), .B(w[4]), .out(x_and_w[21]));
    And A23(.A(x[3]), .B(w[4]), .out(x_and_w[22]));
    And A24(.A(x[4]), .B(w[4]), .out(x_and_w[23]));


    FullAdder F1(.A(x_and_w[0]), .B(x_and_w[1]), .carry_in(1'b0), .sum(m_res[1]), .carry_out(cio[0]));
    FullAdder F2(.A(x_and_w[2]), .B(x_and_w[3]), .carry_in(cio[0]), .sum(temp[0]), .carry_out(cio[1]));
    FullAdder F3(.A(x_and_w[4]), .B(x_and_w[5]), .carry_in(cio[1]), .sum(temp[1]), .carry_out(cio[2]));
    FullAdder F4(.A(x_and_w[6]), .B(x_and_w[7]), .carry_in(cio[2]), .sum(temp[2]), .carry_out(cio[3]));

    HalfAdder H1(.A(x_and_w[8]), .B(temp[0]), .sum(m_res[2]), .carry(cio[4]));
    FullAdder F5(.A(x_and_w[9]), .B(temp[1]), .carry_in(cio[4]), .sum(temp[3]), .carry_out(cio[5]));
    FullAdder F6(.A(x_and_w[10]), .B(temp[2]), .carry_in(cio[5]), .sum(temp[4]), .carry_out(cio[6]));
    FullAdder F7(.A(x_and_w[11]), .B(cio[3]), .carry_in(cio[6]), .sum(temp[5]), .carry_out(cio[7]));

    HalfAdder H2(.A(x_and_w[12]), .B(temp[3]), .sum(m_res[3]), .carry(cio[8]));
    FullAdder F8(.A(x_and_w[13]), .B(temp[4]), .carry_in(cio[8]), .sum(temp[6]), .carry_out(cio[9]));
    FullAdder F9(.A(x_and_w[14]), .B(temp[5]), .carry_in(cio[9]), .sum(temp[7]), .carry_out(cio[10]));
    FullAdder F10(.A(x_and_w[15]), .B(cio[7]), .carry_in(cio[10]), .sum(temp[8]), .carry_out(cio[11]));

    HalfAdder H3(.A(x_and_w[16]), .B(temp[6]), .sum(m_res[4]), .carry(cio[12]));
    FullAdder F11(.A(x_and_w[17]), .B(temp[7]), .carry_in(cio[12]), .sum(temp[9]), .carry_out(cio[13]));
    FullAdder F12(.A(x_and_w[18]), .B(temp[8]), .carry_in(cio[13]), .sum(temp[10]), .carry_out(cio[14]));
    FullAdder F13(.A(x_and_w[19]), .B(cio[11]), .carry_in(cio[14]), .sum(temp[11]), .carry_out(cio[15]));

    HalfAdder H4(.A(x_and_w[20]), .B(temp[9]), .sum(m_res[5]), .carry(cio[16]));
    FullAdder F14(.A(x_and_w[21]), .B(temp[10]), .carry_in(cio[16]), .sum(m_res[6]), .carry_out(cio[17]));
    FullAdder F15(.A(x_and_w[22]), .B(temp[11]), .carry_in(cio[17]), .sum(m_res[7]), .carry_out(cio[18]));
    FullAdder F16(.A(x_and_w[23]), .B(cio[15]), .carry_in(cio[18]), .sum(m_res[8]), .carry_out(m_res[9]));
endmodule