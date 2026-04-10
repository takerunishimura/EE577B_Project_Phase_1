`timescale 1ns/10ps

// Comment out for mesh mode, keep for torus mode
`define TORUS

module tb_torus_mesh;

`ifdef TORUS
    initial $display("TORUS MODE");
`else
    initial $display("MESH MODE");
`endif

reg clk, reset;

// Node 00
reg node00_pesi, node00_pero;
reg [63:0] node00_pedi;
wire node00_peri, node00_peso, node00_polarity;
wire [63:0] node00_pedo;

// Node 01
reg node01_pesi, node01_pero;
reg [63:0] node01_pedi;
wire node01_peri, node01_peso, node01_polarity;
wire [63:0] node01_pedo;

// Node 02
reg node02_pesi, node02_pero;
reg [63:0] node02_pedi;
wire node02_peri, node02_peso, node02_polarity;
wire [63:0] node02_pedo;

// Node 03
reg node03_pesi, node03_pero;
reg [63:0] node03_pedi;
wire node03_peri, node03_peso, node03_polarity;
wire [63:0] node03_pedo;

// Node 10
reg node10_pesi, node10_pero;
reg [63:0] node10_pedi;
wire node10_peri, node10_peso, node10_polarity;
wire [63:0] node10_pedo;

// Node 11
reg node11_pesi, node11_pero;
reg [63:0] node11_pedi;
wire node11_peri, node11_peso, node11_polarity;
wire [63:0] node11_pedo;

// Node 12
reg node12_pesi, node12_pero;
reg [63:0] node12_pedi;
wire node12_peri, node12_peso, node12_polarity;
wire [63:0] node12_pedo;

// Node 13
reg node13_pesi, node13_pero;
reg [63:0] node13_pedi;
wire node13_peri, node13_peso, node13_polarity;
wire [63:0] node13_pedo;

// Node 20
reg node20_pesi, node20_pero;
reg [63:0] node20_pedi;
wire node20_peri, node20_peso, node20_polarity;
wire [63:0] node20_pedo;

// Node 21
reg node21_pesi, node21_pero;
reg [63:0] node21_pedi;
wire node21_peri, node21_peso, node21_polarity;
wire [63:0] node21_pedo;

// Node 22
reg node22_pesi, node22_pero;
reg [63:0] node22_pedi;
wire node22_peri, node22_peso, node22_polarity;
wire [63:0] node22_pedo;

// Node 23
reg node23_pesi, node23_pero;
reg [63:0] node23_pedi;
wire node23_peri, node23_peso, node23_polarity;
wire [63:0] node23_pedo;

// Node 30
reg node30_pesi, node30_pero;
reg [63:0] node30_pedi;
wire node30_peri, node30_peso, node30_polarity;
wire [63:0] node30_pedo;

// Node 31
reg node31_pesi, node31_pero;
reg [63:0] node31_pedi;
wire node31_peri, node31_peso, node31_polarity;
wire [63:0] node31_pedo;

// Node 32
reg node32_pesi, node32_pero;
reg [63:0] node32_pedi;
wire node32_peri, node32_peso, node32_polarity;
wire [63:0] node32_pedo;

// Node 33
reg node33_pesi, node33_pero;
reg [63:0] node33_pedi;
wire node33_peri, node33_peso, node33_polarity;
wire [63:0] node33_pedo;

// hop count tracking
integer total_hops;
integer total_packets;
integer total_mesh_hops;

// DUT instantiation
`ifdef TORUS
torus_mesh uut (
`else
gold_mesh uut (
`endif
    .clk(clk), .reset(reset),
    .node00_pesi(node00_pesi), .node00_pero(node00_pero), .node00_pedi(node00_pedi),
    .node00_peri(node00_peri), .node00_peso(node00_peso), .node00_pedo(node00_pedo), .node00_polarity(node00_polarity),
    .node01_pesi(node01_pesi), .node01_pero(node01_pero), .node01_pedi(node01_pedi),
    .node01_peri(node01_peri), .node01_peso(node01_peso), .node01_pedo(node01_pedo), .node01_polarity(node01_polarity),
    .node02_pesi(node02_pesi), .node02_pero(node02_pero), .node02_pedi(node02_pedi),
    .node02_peri(node02_peri), .node02_peso(node02_peso), .node02_pedo(node02_pedo), .node02_polarity(node02_polarity),
    .node03_pesi(node03_pesi), .node03_pero(node03_pero), .node03_pedi(node03_pedi),
    .node03_peri(node03_peri), .node03_peso(node03_peso), .node03_pedo(node03_pedo), .node03_polarity(node03_polarity),
    .node10_pesi(node10_pesi), .node10_pero(node10_pero), .node10_pedi(node10_pedi),
    .node10_peri(node10_peri), .node10_peso(node10_peso), .node10_pedo(node10_pedo), .node10_polarity(node10_polarity),
    .node11_pesi(node11_pesi), .node11_pero(node11_pero), .node11_pedi(node11_pedi),
    .node11_peri(node11_peri), .node11_peso(node11_peso), .node11_pedo(node11_pedo), .node11_polarity(node11_polarity),
    .node12_pesi(node12_pesi), .node12_pero(node12_pero), .node12_pedi(node12_pedi),
    .node12_peri(node12_peri), .node12_peso(node12_peso), .node12_pedo(node12_pedo), .node12_polarity(node12_polarity),
    .node13_pesi(node13_pesi), .node13_pero(node13_pero), .node13_pedi(node13_pedi),
    .node13_peri(node13_peri), .node13_peso(node13_peso), .node13_pedo(node13_pedo), .node13_polarity(node13_polarity),
    .node20_pesi(node20_pesi), .node20_pero(node20_pero), .node20_pedi(node20_pedi),
    .node20_peri(node20_peri), .node20_peso(node20_peso), .node20_pedo(node20_pedo), .node20_polarity(node20_polarity),
    .node21_pesi(node21_pesi), .node21_pero(node21_pero), .node21_pedi(node21_pedi),
    .node21_peri(node21_peri), .node21_peso(node21_peso), .node21_pedo(node21_pedo), .node21_polarity(node21_polarity),
    .node22_pesi(node22_pesi), .node22_pero(node22_pero), .node22_pedi(node22_pedi),
    .node22_peri(node22_peri), .node22_peso(node22_peso), .node22_pedo(node22_pedo), .node22_polarity(node22_polarity),
    .node23_pesi(node23_pesi), .node23_pero(node23_pero), .node23_pedi(node23_pedi),
    .node23_peri(node23_peri), .node23_peso(node23_peso), .node23_pedo(node23_pedo), .node23_polarity(node23_polarity),
    .node30_pesi(node30_pesi), .node30_pero(node30_pero), .node30_pedi(node30_pedi),
    .node30_peri(node30_peri), .node30_peso(node30_peso), .node30_pedo(node30_pedo), .node30_polarity(node30_polarity),
    .node31_pesi(node31_pesi), .node31_pero(node31_pero), .node31_pedi(node31_pedi),
    .node31_peri(node31_peri), .node31_peso(node31_peso), .node31_pedo(node31_pedo), .node31_polarity(node31_polarity),
    .node32_pesi(node32_pesi), .node32_pero(node32_pero), .node32_pedi(node32_pedi),
    .node32_peri(node32_peri), .node32_peso(node32_peso), .node32_pedo(node32_pedo), .node32_polarity(node32_polarity),
    .node33_pesi(node33_pesi), .node33_pero(node33_pero), .node33_pedi(node33_pedi),
    .node33_peri(node33_peri), .node33_peso(node33_peso), .node33_pedo(node33_pedo), .node33_polarity(node33_polarity)
);

always #2 clk = ~clk;

// global timeout
initial begin
    #200000;
    $display("GLOBAL TIMEOUT");
    $finish;
end

// =====================================================
// Function: count_hops_torus
// =====================================================
function integer count_hops_torus;
    input [1:0] sx, sy, dx, dy;
    integer distX_east, distX_west;
    integer distY_south, distY_north;
    integer hopsX, hopsY;
    begin
        distX_east = (dx - sx + 4) % 4;
        distX_west = (sx - dx + 4) % 4;
        hopsX = (distX_east <= distX_west) ? distX_east : distX_west;
        distY_south = (dy - sy + 4) % 4;
        distY_north = (sy - dy + 4) % 4;
        hopsY = (distY_south <= distY_north) ? distY_south : distY_north;
        count_hops_torus = hopsX + hopsY;
    end
endfunction

// =====================================================
// Function: count_hops_mesh
// =====================================================
function integer count_hops_mesh;
    input [1:0] sx, sy, dx, dy;
    begin
        count_hops_mesh = ((dx >= sx) ? (dx - sx) : (sx - dx)) +
                          ((dy >= sy) ? (dy - sy) : (sy - dy));
    end
endfunction

// =====================================================
// Task: compute_route
// =====================================================
task compute_route;
    input [1:0] sx, sy, dx, dy;
    output [3:0] hopX, hopY;
    output dirX, dirY;
    integer distX_east, distX_west;
    integer distY_south, distY_north;
    integer hopsX, hopsY;
    begin
        `ifdef TORUS
            distX_east = (dx - sx + 4) % 4;
            distX_west = (sx - dx + 4) % 4;
            if (distX_east <= distX_west) begin
                dirX = 1; hopsX = distX_east;
            end else begin
                dirX = 0; hopsX = distX_west;
            end
            distY_south = (dy - sy + 4) % 4;
            distY_north = (sy - dy + 4) % 4;
            if (distY_south <= distY_north) begin
                dirY = 0; hopsY = distY_south;
            end else begin
                dirY = 1; hopsY = distY_north;
            end
        `else
            if (dx >= sx) begin
                dirX = 1; hopsX = dx - sx;
            end else begin
                dirX = 0; hopsX = sx - dx;
            end
            if (dy >= sy) begin
                dirY = 0; hopsY = dy - sy;
            end else begin
                dirY = 1; hopsY = sy - dy;
            end
        `endif

        case (hopsX)
            0: hopX = 4'b0000;
            1: hopX = 4'b0001;
            2: hopX = 4'b0011;
            3: hopX = 4'b0111;
            default: hopX = 4'b0000;
        endcase

        case (hopsY)
            0: hopY = 4'b0000;
            1: hopY = 4'b0001;
            2: hopY = 4'b0011;
            3: hopY = 4'b0111;
            default: hopY = 4'b0000;
        endcase
    end
endtask

// =====================================================
// Task: build_packet
// =====================================================
task build_packet;
    input dirX, dirY;
    input [3:0] hopX, hopY;
    input [31:0] payload;
    output [63:0] packet;
    begin
        packet = {1'b0, dirX, dirY, 5'b00000, hopX, hopY, 16'h0000, payload};
    end
endtask

// =====================================================
// MAIN TEST
// =====================================================
initial begin
    clk = 0;
    reset = 1;
    total_hops = 0;
    total_packets = 0;
    total_mesh_hops = 0;

    node00_pesi = 0; node00_pedi = 64'd0; node00_pero = 1;
    node01_pesi = 0; node01_pedi = 64'd0; node01_pero = 1;
    node02_pesi = 0; node02_pedi = 64'd0; node02_pero = 1;
    node03_pesi = 0; node03_pedi = 64'd0; node03_pero = 1;
    node10_pesi = 0; node10_pedi = 64'd0; node10_pero = 1;
    node11_pesi = 0; node11_pedi = 64'd0; node11_pero = 1;
    node12_pesi = 0; node12_pedi = 64'd0; node12_pero = 1;
    node13_pesi = 0; node13_pedi = 64'd0; node13_pero = 1;
    node20_pesi = 0; node20_pedi = 64'd0; node20_pero = 1;
    node21_pesi = 0; node21_pedi = 64'd0; node21_pero = 1;
    node22_pesi = 0; node22_pedi = 64'd0; node22_pero = 1;
    node23_pesi = 0; node23_pedi = 64'd0; node23_pero = 1;
    node30_pesi = 0; node30_pedi = 64'd0; node30_pero = 1;
    node31_pesi = 0; node31_pedi = 64'd0; node31_pero = 1;
    node32_pesi = 0; node32_pedi = 64'd0; node32_pero = 1;
    node33_pesi = 0; node33_pedi = 64'd0; node33_pero = 1;

    @(posedge clk); @(posedge clk);
    reset = 0;
    @(posedge clk); #1;

    `ifdef TORUS
        $display("========================================");
        $display("  TORUS ROUTING - SHORTEST PATH");
        $display("========================================");
    `else
        $display("========================================");
        $display("  MESH ROUTING - STANDARD XY");
        $display("========================================");
    `endif
    $display("%-30s %10s %10s %10s", "Route", "Torus", "Mesh", "Saved");
    $display("--------------------------------------------------------------");

    // =====================================================
    // SECTION 1: OPPOSITE CORNER PAIRS
    // =====================================================
    $display("\n--- SECTION 1: OPPOSITE CORNER PAIRS ---");

    // TEST 1: node00 -> node33
    begin : test1
        reg [3:0] hX, hY;
        reg dX, dY;
        reg [63:0] pkt;
        integer t_hops, m_hops;
        compute_route(2'd0, 2'd0, 2'd3, 2'd3, hX, hY, dX, dY);
        t_hops = count_hops_torus(2'd0, 2'd0, 2'd3, 2'd3);
        m_hops = count_hops_mesh(2'd0, 2'd0, 2'd3, 2'd3);
        build_packet(dX, dY, hX, hY, 32'hAAAA_0001, pkt);
        $display("%-30s %10d %10d %10d", "node00->node33", t_hops, m_hops, m_hops-t_hops);
        total_hops = total_hops + t_hops;
        total_mesh_hops = total_mesh_hops + m_hops;
        total_packets = total_packets + 1;

        wait(node00_polarity == 0); #1;
        node00_pesi = 1; node00_pedi = pkt;
        @(posedge clk); #1;
        node00_pesi = 0; node00_pedi = 64'd0;
        wait(node33_peso == 1); #1;
        if (node33_pedo[31:0] == 32'hAAAA_0001)
            $display("[PASS] node33_pedo=%h", node33_pedo);
        else
            $display("[FAIL] node33_pedo=%h (expect AAAA_0001)", node33_pedo);
        repeat(50) @(posedge clk);
    end

    // TEST 2: node33 -> node00
    begin : test2
        reg [3:0] hX, hY;
        reg dX, dY;
        reg [63:0] pkt;
        integer t_hops, m_hops;
        compute_route(2'd3, 2'd3, 2'd0, 2'd0, hX, hY, dX, dY);
        t_hops = count_hops_torus(2'd3, 2'd3, 2'd0, 2'd0);
        m_hops = count_hops_mesh(2'd3, 2'd3, 2'd0, 2'd0);
        build_packet(dX, dY, hX, hY, 32'hBBBB_0002, pkt);
        $display("%-30s %10d %10d %10d", "node33->node00", t_hops, m_hops, m_hops-t_hops);
        total_hops = total_hops + t_hops;
        total_mesh_hops = total_mesh_hops + m_hops;
        total_packets = total_packets + 1;

        wait(node33_polarity == 0); #1;
        node33_pesi = 1; node33_pedi = pkt;
        @(posedge clk); #1;
        node33_pesi = 0; node33_pedi = 64'd0;
        wait(node00_peso == 1); #1;
        if (node00_pedo[31:0] == 32'hBBBB_0002)
            $display("[PASS] node00_pedo=%h", node00_pedo);
        else
            $display("[FAIL] node00_pedo=%h (expect BBBB_0002)", node00_pedo);
        repeat(50) @(posedge clk);
    end

    // TEST 3: node03 -> node30
    begin : test3
        reg [3:0] hX, hY;
        reg dX, dY;
        reg [63:0] pkt;
        integer t_hops, m_hops;
        compute_route(2'd3, 2'd0, 2'd0, 2'd3, hX, hY, dX, dY);
        t_hops = count_hops_torus(2'd3, 2'd0, 2'd0, 2'd3);
        m_hops = count_hops_mesh(2'd3, 2'd0, 2'd0, 2'd3);
        build_packet(dX, dY, hX, hY, 32'hCCCC_0003, pkt);
        $display("%-30s %10d %10d %10d", "node03->node30", t_hops, m_hops, m_hops-t_hops);
        total_hops = total_hops + t_hops;
        total_mesh_hops = total_mesh_hops + m_hops;
        total_packets = total_packets + 1;

        wait(node03_polarity == 0); #1;
        node03_pesi = 1; node03_pedi = pkt;
        @(posedge clk); #1;
        node03_pesi = 0; node03_pedi = 64'd0;
        wait(node30_peso == 1); #1;
        if (node30_pedo[31:0] == 32'hCCCC_0003)
            $display("[PASS] node30_pedo=%h", node30_pedo);
        else
            $display("[FAIL] node30_pedo=%h (expect CCCC_0003)", node30_pedo);
        repeat(50) @(posedge clk);
    end

    // TEST 4: node30 -> node03
    begin : test4
        reg [3:0] hX, hY;
        reg dX, dY;
        reg [63:0] pkt;
        integer t_hops, m_hops;
        compute_route(2'd0, 2'd3, 2'd3, 2'd0, hX, hY, dX, dY);
        t_hops = count_hops_torus(2'd0, 2'd3, 2'd3, 2'd0);
        m_hops = count_hops_mesh(2'd0, 2'd3, 2'd3, 2'd0);
        build_packet(dX, dY, hX, hY, 32'hDDDD_0004, pkt);
        $display("%-30s %10d %10d %10d", "node30->node03", t_hops, m_hops, m_hops-t_hops);
        total_hops = total_hops + t_hops;
        total_mesh_hops = total_mesh_hops + m_hops;
        total_packets = total_packets + 1;

        wait(node30_polarity == 0); #1;
        node30_pesi = 1; node30_pedi = pkt;
        @(posedge clk); #1;
        node30_pesi = 0; node30_pedi = 64'd0;
        wait(node03_peso == 1); #1;
        if (node03_pedo[31:0] == 32'hDDDD_0004)
            $display("[PASS] node03_pedo=%h", node03_pedo);
        else
            $display("[FAIL] node03_pedo=%h (expect DDDD_0004)", node03_pedo);
        repeat(50) @(posedge clk);
    end

    // =====================================================
    // SECTION 2: WRAP-AROUND LINK TESTS
    // =====================================================
    $display("\n--- SECTION 2: WRAP-AROUND LINK TESTS ---");

    // TEST 5: node00 -> node03
    begin : test5
        reg [3:0] hX, hY;
        reg dX, dY;
        reg [63:0] pkt;
        integer t_hops, m_hops;
        compute_route(2'd0, 2'd0, 2'd3, 2'd0, hX, hY, dX, dY);
        t_hops = count_hops_torus(2'd0, 2'd0, 2'd3, 2'd0);
        m_hops = count_hops_mesh(2'd0, 2'd0, 2'd3, 2'd0);
        build_packet(dX, dY, hX, hY, 32'hEEEE_0005, pkt);
        $display("%-30s %10d %10d %10d", "node00->node03", t_hops, m_hops, m_hops-t_hops);
        total_hops = total_hops + t_hops;
        total_mesh_hops = total_mesh_hops + m_hops;
        total_packets = total_packets + 1;

        wait(node00_polarity == 0); #1;
        node00_pesi = 1; node00_pedi = pkt;
        @(posedge clk); #1;
        node00_pesi = 0; node00_pedi = 64'd0;
        wait(node03_peso == 1); #1;
        if (node03_pedo[31:0] == 32'hEEEE_0005)
            $display("[PASS] node03_pedo=%h", node03_pedo);
        else
            $display("[FAIL] node03_pedo=%h (expect EEEE_0005)", node03_pedo);
        repeat(50) @(posedge clk);
    end

    // TEST 6: node00 -> node30
    begin : test6
        reg [3:0] hX, hY;
        reg dX, dY;
        reg [63:0] pkt;
        integer t_hops, m_hops;
        compute_route(2'd0, 2'd0, 2'd0, 2'd3, hX, hY, dX, dY);
        t_hops = count_hops_torus(2'd0, 2'd0, 2'd0, 2'd3);
        m_hops = count_hops_mesh(2'd0, 2'd0, 2'd0, 2'd3);
        build_packet(dX, dY, hX, hY, 32'hFFFF_0006, pkt);
        $display("%-30s %10d %10d %10d", "node00->node30", t_hops, m_hops, m_hops-t_hops);
        total_hops = total_hops + t_hops;
        total_mesh_hops = total_mesh_hops + m_hops;
        total_packets = total_packets + 1;

        wait(node00_polarity == 0); #1;
        node00_pesi = 1; node00_pedi = pkt;
        @(posedge clk); #1;
        node00_pesi = 0; node00_pedi = 64'd0;
        wait(node30_peso == 1); #1;
        if (node30_pedo[31:0] == 32'hFFFF_0006)
            $display("[PASS] node30_pedo=%h", node30_pedo);
        else
            $display("[FAIL] node30_pedo=%h (expect FFFF_0006)", node30_pedo);
        repeat(50) @(posedge clk);
    end

    // TEST 7: node10 -> node13
    begin : test7
        reg [3:0] hX, hY;
        reg dX, dY;
        reg [63:0] pkt;
        integer t_hops, m_hops;
        compute_route(2'd0, 2'd1, 2'd3, 2'd1, hX, hY, dX, dY);
        t_hops = count_hops_torus(2'd0, 2'd1, 2'd3, 2'd1);
        m_hops = count_hops_mesh(2'd0, 2'd1, 2'd3, 2'd1);
        build_packet(dX, dY, hX, hY, 32'h1111_0007, pkt);
        $display("%-30s %10d %10d %10d", "node10->node13", t_hops, m_hops, m_hops-t_hops);
        total_hops = total_hops + t_hops;
        total_mesh_hops = total_mesh_hops + m_hops;
        total_packets = total_packets + 1;

        wait(node10_polarity == 0); #1;
        node10_pesi = 1; node10_pedi = pkt;
        @(posedge clk); #1;
        node10_pesi = 0; node10_pedi = 64'd0;
        wait(node13_peso == 1); #1;
        if (node13_pedo[31:0] == 32'h1111_0007)
            $display("[PASS] node13_pedo=%h", node13_pedo);
        else
            $display("[FAIL] node13_pedo=%h (expect 1111_0007)", node13_pedo);
        repeat(50) @(posedge clk);
    end

    // TEST 8: node01 -> node31
    begin : test8
        reg [3:0] hX, hY;
        reg dX, dY;
        reg [63:0] pkt;
        integer t_hops, m_hops;
        compute_route(2'd1, 2'd0, 2'd1, 2'd3, hX, hY, dX, dY);
        t_hops = count_hops_torus(2'd1, 2'd0, 2'd1, 2'd3);
        m_hops = count_hops_mesh(2'd1, 2'd0, 2'd1, 2'd3);
        build_packet(dX, dY, hX, hY, 32'h2222_0008, pkt);
        $display("%-30s %10d %10d %10d", "node01->node31", t_hops, m_hops, m_hops-t_hops);
        total_hops = total_hops + t_hops;
        total_mesh_hops = total_mesh_hops + m_hops;
        total_packets = total_packets + 1;

        wait(node01_polarity == 0); #1;
        node01_pesi = 1; node01_pedi = pkt;
        @(posedge clk); #1;
        node01_pesi = 0; node01_pedi = 64'd0;
        wait(node31_peso == 1); #1;
        if (node31_pedo[31:0] == 32'h2222_0008)
            $display("[PASS] node31_pedo=%h", node31_pedo);
        else
            $display("[FAIL] node31_pedo=%h (expect 2222_0008)", node31_pedo);
        repeat(50) @(posedge clk);
    end

    // =====================================================
    // SECTION 3: BISECTION TRAFFIC
    // =====================================================
    $display("\n--- SECTION 3: BISECTION TRAFFIC (left->right) ---");

    // TEST 9: node00->node02 and node10->node12 simultaneously
    begin : test9
        reg [3:0] hX_a, hY_a, hX_b, hY_b;
        reg dX_a, dY_a, dX_b, dY_b;
        reg [63:0] pkt_a, pkt_b;
        integer t_hops_a, m_hops_a, t_hops_b, m_hops_b;
        compute_route(2'd0, 2'd0, 2'd2, 2'd0, hX_a, hY_a, dX_a, dY_a);
        compute_route(2'd0, 2'd1, 2'd2, 2'd1, hX_b, hY_b, dX_b, dY_b);
        t_hops_a = count_hops_torus(2'd0, 2'd0, 2'd2, 2'd0);
        m_hops_a = count_hops_mesh(2'd0, 2'd0, 2'd2, 2'd0);
        t_hops_b = count_hops_torus(2'd0, 2'd1, 2'd2, 2'd1);
        m_hops_b = count_hops_mesh(2'd0, 2'd1, 2'd2, 2'd1);
        build_packet(dX_a, dY_a, hX_a, hY_a, 32'h3333_0009, pkt_a);
        build_packet(dX_b, dY_b, hX_b, hY_b, 32'h4444_0009, pkt_b);
        $display("%-30s %10d %10d %10d", "node00->node02", t_hops_a, m_hops_a, m_hops_a-t_hops_a);
        $display("%-30s %10d %10d %10d", "node10->node12", t_hops_b, m_hops_b, m_hops_b-t_hops_b);
        total_hops = total_hops + t_hops_a + t_hops_b;
        total_mesh_hops = total_mesh_hops + m_hops_a + m_hops_b;
        total_packets = total_packets + 2;

        wait(node00_polarity == 0); #1;
        node00_pesi = 1; node00_pedi = pkt_a;
        node10_pesi = 1; node10_pedi = pkt_b;
        @(posedge clk); #1;
        node00_pesi = 0; node00_pedi = 64'd0;
        node10_pesi = 0; node10_pedi = 64'd0;

        wait(node02_peso == 1); #1;
        if (node02_pedo[31:0] == 32'h3333_0009)
            $display("[PASS] node02_pedo=%h", node02_pedo);
        else
            $display("[FAIL] node02_pedo=%h (expect 3333_0009)", node02_pedo);
        wait(node12_peso == 1); #1;
        if (node12_pedo[31:0] == 32'h4444_0009)
            $display("[PASS] node12_pedo=%h", node12_pedo);
        else
            $display("[FAIL] node12_pedo=%h (expect 4444_0009)", node12_pedo);
        repeat(50) @(posedge clk);
    end

    // =====================================================
    // SECTION 4: NEAREST NEIGHBOR
    // =====================================================
    $display("\n--- SECTION 4: NEAREST NEIGHBOR ---");

    // TEST 10: node11 -> node12
    begin : test10
        reg [3:0] hX, hY;
        reg dX, dY;
        reg [63:0] pkt;
        integer t_hops, m_hops;
        compute_route(2'd1, 2'd1, 2'd2, 2'd1, hX, hY, dX, dY);
        t_hops = count_hops_torus(2'd1, 2'd1, 2'd2, 2'd1);
        m_hops = count_hops_mesh(2'd1, 2'd1, 2'd2, 2'd1);
        build_packet(dX, dY, hX, hY, 32'h5555_0010, pkt);
        $display("%-30s %10d %10d %10d", "node11->node12", t_hops, m_hops, m_hops-t_hops);
        total_hops = total_hops + t_hops;
        total_mesh_hops = total_mesh_hops + m_hops;
        total_packets = total_packets + 1;

        wait(node11_polarity == 0); #1;
        node11_pesi = 1; node11_pedi = pkt;
        @(posedge clk); #1;
        node11_pesi = 0; node11_pedi = 64'd0;
        wait(node12_peso == 1); #1;
        if (node12_pedo[31:0] == 32'h5555_0010)
            $display("[PASS] node12_pedo=%h", node12_pedo);
        else
            $display("[FAIL] node12_pedo=%h (expect 5555_0010)", node12_pedo);
        repeat(50) @(posedge clk);
    end

    // TEST 11: node22 -> node21
    begin : test11
        reg [3:0] hX, hY;
        reg dX, dY;
        reg [63:0] pkt;
        integer t_hops, m_hops;
        compute_route(2'd2, 2'd2, 2'd1, 2'd2, hX, hY, dX, dY);
        t_hops = count_hops_torus(2'd2, 2'd2, 2'd1, 2'd2);
        m_hops = count_hops_mesh(2'd2, 2'd2, 2'd1, 2'd2);
        build_packet(dX, dY, hX, hY, 32'h6666_0011, pkt);
        $display("%-30s %10d %10d %10d", "node22->node21", t_hops, m_hops, m_hops-t_hops);
        total_hops = total_hops + t_hops;
        total_mesh_hops = total_mesh_hops + m_hops;
        total_packets = total_packets + 1;

        wait(node22_polarity == 0); #1;
        node22_pesi = 1; node22_pedi = pkt;
        @(posedge clk); #1;
        node22_pesi = 0; node22_pedi = 64'd0;
        wait(node21_peso == 1); #1;
        if (node21_pedo[31:0] == 32'h6666_0011)
            $display("[PASS] node21_pedo=%h", node21_pedo);
        else
            $display("[FAIL] node21_pedo=%h (expect 6666_0011)", node21_pedo);
        repeat(50) @(posedge clk);
    end

    // TEST 12: node11 -> node21
    begin : test12
        reg [3:0] hX, hY;
        reg dX, dY;
        reg [63:0] pkt;
        integer t_hops, m_hops;
        compute_route(2'd1, 2'd1, 2'd1, 2'd2, hX, hY, dX, dY);
        t_hops = count_hops_torus(2'd1, 2'd1, 2'd1, 2'd2);
        m_hops = count_hops_mesh(2'd1, 2'd1, 2'd1, 2'd2);
        build_packet(dX, dY, hX, hY, 32'h7777_0012, pkt);
        $display("%-30s %10d %10d %10d", "node11->node21", t_hops, m_hops, m_hops-t_hops);
        total_hops = total_hops + t_hops;
        total_mesh_hops = total_mesh_hops + m_hops;
        total_packets = total_packets + 1;

        wait(node11_polarity == 0); #1;
        node11_pesi = 1; node11_pedi = pkt;
        @(posedge clk); #1;
        node11_pesi = 0; node11_pedi = 64'd0;
        wait(node21_peso == 1); #1;
        if (node21_pedo[31:0] == 32'h7777_0012)
            $display("[PASS] node21_pedo=%h", node21_pedo);
        else
            $display("[FAIL] node21_pedo=%h (expect 7777_0012)", node21_pedo);
        repeat(50) @(posedge clk);
    end

    // TEST 13: node22 -> node12
    begin : test13
        reg [3:0] hX, hY;
        reg dX, dY;
        reg [63:0] pkt;
        integer t_hops, m_hops;
        compute_route(2'd2, 2'd2, 2'd2, 2'd1, hX, hY, dX, dY);
        t_hops = count_hops_torus(2'd2, 2'd2, 2'd2, 2'd1);
        m_hops = count_hops_mesh(2'd2, 2'd2, 2'd2, 2'd1);
        build_packet(dX, dY, hX, hY, 32'h8888_0013, pkt);
        $display("%-30s %10d %10d %10d", "node22->node12", t_hops, m_hops, m_hops-t_hops);
        total_hops = total_hops + t_hops;
        total_mesh_hops = total_mesh_hops + m_hops;
        total_packets = total_packets + 1;

        wait(node22_polarity == 0); #1;
        node22_pesi = 1; node22_pedi = pkt;
        @(posedge clk); #1;
        node22_pesi = 0; node22_pedi = 64'd0;
        wait(node12_peso == 1); #1;
        if (node12_pedo[31:0] == 32'h8888_0013)
            $display("[PASS] node12_pedo=%h", node12_pedo);
        else
            $display("[FAIL] node12_pedo=%h (expect 8888_0013)", node12_pedo);
        repeat(50) @(posedge clk);
    end

    // =====================================================
    // SECTION 5: CONTENTION
    // =====================================================
    $display("\n--- SECTION 5: CONTENTION ---");

    // TEST 14: node01 and node10 both -> node00
    begin : test14
        reg [3:0] hX_a, hY_a, hX_b, hY_b;
        reg dX_a, dY_a, dX_b, dY_b;
        reg [63:0] pkt_a, pkt_b;
        compute_route(2'd1, 2'd0, 2'd0, 2'd0, hX_a, hY_a, dX_a, dY_a);
        compute_route(2'd0, 2'd1, 2'd0, 2'd0, hX_b, hY_b, dX_b, dY_b);
        build_packet(dX_a, dY_a, hX_a, hY_a, 32'h9999_0014, pkt_a);
        build_packet(dX_b, dY_b, hX_b, hY_b, 32'hAAAA_0014, pkt_b);
        $display("TEST 14: node01->node00 and node10->node00 simultaneously (contention)");

        wait(node00_peso == 0);
        repeat(5) @(posedge clk); #1;

        wait(node01_polarity == 0); #1;
        node01_pesi = 1; node01_pedi = pkt_a;
        node10_pesi = 1; node10_pedi = pkt_b;
        @(posedge clk); #1;
        node01_pesi = 0; node01_pedi = 64'd0;
        node10_pesi = 0; node10_pedi = 64'd0;

        wait(node00_peso == 1); #1;
        $display("First packet at node00: %h", node00_pedo);
        if (node00_pedo[31:0] == 32'h9999_0014)
            $display("[INFO] node01 packet won arbitration");
        else if (node00_pedo[31:0] == 32'hAAAA_0014)
            $display("[INFO] node10 packet won arbitration");
        else
            $display("[FAIL] unexpected packet %h", node00_pedo);
        @(posedge clk); #1;

        wait(node00_peso == 1); #1;
        $display("Second packet at node00: %h", node00_pedo);
        if (node00_pedo[31:0] == 32'h9999_0014 || node00_pedo[31:0] == 32'hAAAA_0014)
            $display("[PASS] Both packets delivered - contention resolved correctly");
        else
            $display("[FAIL] unexpected packet %h", node00_pedo);
        repeat(50) @(posedge clk);
    end

    // =====================================================
    // SUMMARY
    // =====================================================
    $display("\n======================================================================");
    $display("  HOP COUNT COMPARISON SUMMARY");
    $display("======================================================================");
    $display("  %-28s %10s %10s %10s", "Metric", "Torus", "Mesh", "Saved");
    $display("  --------------------------------------------------------------");
    $display("  %-28s %10d %10d %10d", "Total hops", total_hops, total_mesh_hops, total_mesh_hops-total_hops);
    $display("  %-28s %10d.%0d %7d.%0d",
             "Average hops",
             total_hops/total_packets, (total_hops*10/total_packets)%10,
             total_mesh_hops/total_packets, (total_mesh_hops*10/total_packets)%10);
    $display("  %-28s %9d%%",
             "Hop reduction",
             (total_mesh_hops - total_hops)*100/total_mesh_hops);
    $display("======================================================================");
    $display("ALL TESTS COMPLETE");
    #20;
    $finish;
end

initial begin
    $dumpfile("tb_torus_mesh.vcd");
    $dumpvars(0, tb_torus_mesh);
end

endmodule