/*
 * This file is protected by Copyright. Please refer to the COPYRIGHT file
 * distributed with this source distribution.
 *
 * This file is part of OpenCPI <http://www.opencpi.org>
 *
 * OpenCPI is free software: you can redistribute it and/or modify it under the
 * terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * OpenCPI is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

module cwd_internal(cwd, len_err);
parameter length = 100;
output reg[0:length*8-1] cwd;
output reg len_err;
initial
begin
  if ($value$plusargs("cwd=%s", cwd)) begin
    $display("Received CWD: %s", cwd);

    // Uncomment below to display CWD in hex for debugging
    //$display("Hex CWD: %h", cwd);

    // if the leftmost byte is not null, buffer may be too small, return error
    if (cwd[0:7] !== 8'h00) begin
      $display("No null characters found in CWD. Increase CWD_MAX_LENGTH");
      len_err = 1;
    end else
      len_err = 0;

  end
end
endmodule  

