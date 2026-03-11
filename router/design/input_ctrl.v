module input_ctrl (si, ri, di, do, polarity, forward_N, forward_S, forward_E, forward_W, forward_PE);
input si, ri;
input [63:0] di;
input polarity;
output forward_N, forward_S, forward_E, forward_W, forward_PE;
output [63:0] do;
endmodule