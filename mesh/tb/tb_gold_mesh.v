`timescale 1ns/10ps

module tb_gold_mesh;

reg clk, reset;

// just instantiate with minimal connections to check wiring
gold_mesh uut (
    .clk(clk),
    .reset(reset),
    // tie off all PE ports for now
    .node00_pesi(1'b0), .node00_pero(1'b1), .node00_pedi(64'd0),
    .node01_pesi(1'b0), .node01_pero(1'b1), .node01_pedi(64'd0),
    .node02_pesi(1'b0), .node02_pero(1'b1), .node02_pedi(64'd0),
    .node03_pesi(1'b0), .node03_pero(1'b1), .node03_pedi(64'd0),
    .node10_pesi(1'b0), .node10_pero(1'b1), .node10_pedi(64'd0),
    .node11_pesi(1'b0), .node11_pero(1'b1), .node11_pedi(64'd0),
    .node12_pesi(1'b0), .node12_pero(1'b1), .node12_pedi(64'd0),
    .node13_pesi(1'b0), .node13_pero(1'b1), .node13_pedi(64'd0),
    .node20_pesi(1'b0), .node20_pero(1'b1), .node20_pedi(64'd0),
    .node21_pesi(1'b0), .node21_pero(1'b1), .node21_pedi(64'd0),
    .node22_pesi(1'b0), .node22_pero(1'b1), .node22_pedi(64'd0),
    .node23_pesi(1'b0), .node23_pero(1'b1), .node23_pedi(64'd0),
    .node30_pesi(1'b0), .node30_pero(1'b1), .node30_pedi(64'd0),
    .node31_pesi(1'b0), .node31_pero(1'b1), .node31_pedi(64'd0),
    .node32_pesi(1'b0), .node32_pero(1'b1), .node32_pedi(64'd0),
    .node33_pesi(1'b0), .node33_pero(1'b1), .node33_pedi(64'd0)
);

initial begin
    clk = 0;
    reset = 1;
    #10;
    reset = 0;
    #100;
    $finish;
end

always #2 clk = ~clk;

endmodule