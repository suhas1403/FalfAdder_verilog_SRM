/*
 * Copyright (c) 2025 Suhas M
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_suhas1403_full_adder (
    /* verilator lint_off UNUSEDSIGNAL */
    input  wire [7:0] ui_in,    // Dedicated inputs
    /* verilator lint_on UNUSEDSIGNAL */

    output wire [7:0] uo_out,   // Dedicated outputs

    /* verilator lint_off UNUSED */
    input  wire [7:0] uio_in,   // IOs: Input path
    input  wire       ena,      // goes high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n,    // reset_n (active low)
    /* verilator lint_on UNUSED */

    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe    // IOs: Enable path (0=input, 1=output)
);

    // Input mapping
    wire A    = ui_in[0];
    wire B    = ui_in[1];
    wire Cin  = ui_in[2];

    // Full adder logic
    assign uo_out[0] = A ^ B ^ Cin;                     // Sum
    assign uo_out[1] = (A & B) | (B & Cin) | (A & Cin); // Carry

    // Unused outputs
    assign uo_out[7:2] = 6'b0;

    // No bidirectional IOs used
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule
