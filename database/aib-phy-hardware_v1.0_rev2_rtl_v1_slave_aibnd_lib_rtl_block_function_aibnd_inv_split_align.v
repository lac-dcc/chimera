// This program was cloned from: https://github.com/chipsalliance/aib-phy-hardware
// License: Apache License 2.0

// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. 


module aibnd_inv_split_align ( din, dout, vccl, vssl );

  input din;
  output dout;
  input vssl;
  input vccl;


  assign dout = ~din ;

endmodule


