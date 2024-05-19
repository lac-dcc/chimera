// This program was cloned from: https://github.com/aolofsson/oh
// License: MIT License

//#############################################################################
//# Function: Clock Inverter                                                  #
//# Copyright: OH Project Authors. ALl rights Reserved.                       #
//# License:  MIT (see LICENSE file in OH repository)                         #
//#############################################################################

module asic_clkinv #(parameter PROP = "DEFAULT")  (
    input  a,
    output z
    );

   assign z = ~a;

endmodule
