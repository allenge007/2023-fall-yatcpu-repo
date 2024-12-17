FIRRTL version 1.2.0
circuit Top :
  module Memory :
    input clock : Clock
    input reset : Reset
    output io : { bundle : { flip address : UInt<32>, flip write_data : UInt<32>, flip write_enable : UInt<1>, flip write_strobe : UInt<1>[4], read_data : UInt<32>}, instruction : UInt<32>, flip instruction_address : UInt<32>, flip debug_read_address : UInt<32>, debug_read_data : UInt<32>} @[src/main/scala/peripheral/Memory.scala 56:14]

    smem mem : UInt<8>[4] [8192] @[src/main/scala/peripheral/Memory.scala 66:24]
    when io.bundle.write_enable : @[src/main/scala/peripheral/Memory.scala 67:32]
      wire write_data_vec : UInt<8>[4] @[src/main/scala/peripheral/Memory.scala 68:30]
      node _write_data_vec_0_T = bits(io.bundle.write_data, 7, 0) @[src/main/scala/peripheral/Memory.scala 70:48]
      write_data_vec[0] <= _write_data_vec_0_T @[src/main/scala/peripheral/Memory.scala 70:25]
      node _write_data_vec_1_T = bits(io.bundle.write_data, 15, 8) @[src/main/scala/peripheral/Memory.scala 70:48]
      write_data_vec[1] <= _write_data_vec_1_T @[src/main/scala/peripheral/Memory.scala 70:25]
      node _write_data_vec_2_T = bits(io.bundle.write_data, 23, 16) @[src/main/scala/peripheral/Memory.scala 70:48]
      write_data_vec[2] <= _write_data_vec_2_T @[src/main/scala/peripheral/Memory.scala 70:25]
      node _write_data_vec_3_T = bits(io.bundle.write_data, 31, 24) @[src/main/scala/peripheral/Memory.scala 70:48]
      write_data_vec[3] <= _write_data_vec_3_T @[src/main/scala/peripheral/Memory.scala 70:25]
      node _T = dshr(io.bundle.address, UInt<2>("h2")) @[src/main/scala/peripheral/Memory.scala 72:34]
      node _T_1 = bits(_T, 12, 0)
      write mport MPORT = mem[_T_1], clock
      when io.bundle.write_strobe[0] :
        MPORT[0] <= write_data_vec[0]
      when io.bundle.write_strobe[1] :
        MPORT[1] <= write_data_vec[1]
      when io.bundle.write_strobe[2] :
        MPORT[2] <= write_data_vec[2]
      when io.bundle.write_strobe[3] :
        MPORT[3] <= write_data_vec[3]
    node _io_bundle_read_data_T = dshr(io.bundle.address, UInt<2>("h2")) @[src/main/scala/peripheral/Memory.scala 74:54]
    wire _io_bundle_read_data_WIRE : UInt @[src/main/scala/peripheral/Memory.scala 74:34]
    _io_bundle_read_data_WIRE is invalid @[src/main/scala/peripheral/Memory.scala 74:34]
    when UInt<1>("h1") : @[src/main/scala/peripheral/Memory.scala 74:34]
      _io_bundle_read_data_WIRE <= _io_bundle_read_data_T @[src/main/scala/peripheral/Memory.scala 74:34]
      node _io_bundle_read_data_T_1 = or(_io_bundle_read_data_WIRE, UInt<13>("h0")) @[src/main/scala/peripheral/Memory.scala 74:34]
      node _io_bundle_read_data_T_2 = bits(_io_bundle_read_data_T_1, 12, 0) @[src/main/scala/peripheral/Memory.scala 74:34]
      read mport io_bundle_read_data_MPORT = mem[_io_bundle_read_data_T_2], clock @[src/main/scala/peripheral/Memory.scala 74:34]
    node io_bundle_read_data_lo = cat(io_bundle_read_data_MPORT[1], io_bundle_read_data_MPORT[0]) @[src/main/scala/peripheral/Memory.scala 74:78]
    node io_bundle_read_data_hi = cat(io_bundle_read_data_MPORT[3], io_bundle_read_data_MPORT[2]) @[src/main/scala/peripheral/Memory.scala 74:78]
    node _io_bundle_read_data_T_3 = cat(io_bundle_read_data_hi, io_bundle_read_data_lo) @[src/main/scala/peripheral/Memory.scala 74:78]
    io.bundle.read_data <= _io_bundle_read_data_T_3 @[src/main/scala/peripheral/Memory.scala 74:23]
    node _io_debug_read_data_T = dshr(io.debug_read_address, UInt<2>("h2")) @[src/main/scala/peripheral/Memory.scala 75:57]
    wire _io_debug_read_data_WIRE : UInt @[src/main/scala/peripheral/Memory.scala 75:33]
    _io_debug_read_data_WIRE is invalid @[src/main/scala/peripheral/Memory.scala 75:33]
    when UInt<1>("h1") : @[src/main/scala/peripheral/Memory.scala 75:33]
      _io_debug_read_data_WIRE <= _io_debug_read_data_T @[src/main/scala/peripheral/Memory.scala 75:33]
      node _io_debug_read_data_T_1 = or(_io_debug_read_data_WIRE, UInt<13>("h0")) @[src/main/scala/peripheral/Memory.scala 75:33]
      node _io_debug_read_data_T_2 = bits(_io_debug_read_data_T_1, 12, 0) @[src/main/scala/peripheral/Memory.scala 75:33]
      read mport io_debug_read_data_MPORT = mem[_io_debug_read_data_T_2], clock @[src/main/scala/peripheral/Memory.scala 75:33]
    node io_debug_read_data_lo = cat(io_debug_read_data_MPORT[1], io_debug_read_data_MPORT[0]) @[src/main/scala/peripheral/Memory.scala 75:81]
    node io_debug_read_data_hi = cat(io_debug_read_data_MPORT[3], io_debug_read_data_MPORT[2]) @[src/main/scala/peripheral/Memory.scala 75:81]
    node _io_debug_read_data_T_3 = cat(io_debug_read_data_hi, io_debug_read_data_lo) @[src/main/scala/peripheral/Memory.scala 75:81]
    io.debug_read_data <= _io_debug_read_data_T_3 @[src/main/scala/peripheral/Memory.scala 75:22]
    node _io_instruction_T = dshr(io.instruction_address, UInt<2>("h2")) @[src/main/scala/peripheral/Memory.scala 76:54]
    wire _io_instruction_WIRE : UInt @[src/main/scala/peripheral/Memory.scala 76:29]
    _io_instruction_WIRE is invalid @[src/main/scala/peripheral/Memory.scala 76:29]
    when UInt<1>("h1") : @[src/main/scala/peripheral/Memory.scala 76:29]
      _io_instruction_WIRE <= _io_instruction_T @[src/main/scala/peripheral/Memory.scala 76:29]
      node _io_instruction_T_1 = or(_io_instruction_WIRE, UInt<13>("h0")) @[src/main/scala/peripheral/Memory.scala 76:29]
      node _io_instruction_T_2 = bits(_io_instruction_T_1, 12, 0) @[src/main/scala/peripheral/Memory.scala 76:29]
      read mport io_instruction_MPORT = mem[_io_instruction_T_2], clock @[src/main/scala/peripheral/Memory.scala 76:29]
    node io_instruction_lo = cat(io_instruction_MPORT[1], io_instruction_MPORT[0]) @[src/main/scala/peripheral/Memory.scala 76:78]
    node io_instruction_hi = cat(io_instruction_MPORT[3], io_instruction_MPORT[2]) @[src/main/scala/peripheral/Memory.scala 76:78]
    node _io_instruction_T_3 = cat(io_instruction_hi, io_instruction_lo) @[src/main/scala/peripheral/Memory.scala 76:78]
    io.instruction <= _io_instruction_T_3 @[src/main/scala/peripheral/Memory.scala 76:18]

  module Timer :
    input clock : Clock
    input reset : Reset
    output io : { bundle : { flip address : UInt<32>, flip write_data : UInt<32>, flip write_enable : UInt<1>, flip write_strobe : UInt<1>[4], read_data : UInt<32>}, signal_interrupt : UInt<1>, debug_limit : UInt<32>, debug_enabled : UInt<1>} @[src/main/scala/peripheral/Timer.scala 22:14]

    reg count : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/peripheral/Timer.scala 30:22]
    reg limit : UInt<32>, clock with :
      reset => (reset, UInt<32>("h5f5e100")) @[src/main/scala/peripheral/Timer.scala 31:22]
    io.debug_limit <= limit @[src/main/scala/peripheral/Timer.scala 32:18]
    reg enabled : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[src/main/scala/peripheral/Timer.scala 33:24]
    io.debug_enabled <= enabled @[src/main/scala/peripheral/Timer.scala 34:20]
    node _io_bundle_read_data_T = eq(UInt<3>("h4"), io.bundle.address) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_bundle_read_data_T_1 = mux(_io_bundle_read_data_T, limit, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_bundle_read_data_T_2 = eq(UInt<4>("h8"), io.bundle.address) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_bundle_read_data_T_3 = mux(_io_bundle_read_data_T_2, enabled, _io_bundle_read_data_T_1) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    io.bundle.read_data <= _io_bundle_read_data_T_3 @[src/main/scala/peripheral/Timer.scala 36:23]
    when io.bundle.write_enable : @[src/main/scala/peripheral/Timer.scala 44:32]
      node _T = eq(io.bundle.address, UInt<3>("h4")) @[src/main/scala/peripheral/Timer.scala 45:28]
      when _T : @[src/main/scala/peripheral/Timer.scala 45:39]
        limit <= io.bundle.write_data @[src/main/scala/peripheral/Timer.scala 46:13]
        count <= UInt<1>("h0") @[src/main/scala/peripheral/Timer.scala 47:13]
      else :
        node _T_1 = eq(io.bundle.address, UInt<4>("h8")) @[src/main/scala/peripheral/Timer.scala 48:34]
        when _T_1 : @[src/main/scala/peripheral/Timer.scala 48:45]
          node _enabled_T = neq(io.bundle.write_data, UInt<1>("h0")) @[src/main/scala/peripheral/Timer.scala 49:39]
          enabled <= _enabled_T @[src/main/scala/peripheral/Timer.scala 49:15]
    node _io_signal_interrupt_T = sub(limit, UInt<4>("ha")) @[src/main/scala/peripheral/Timer.scala 53:54]
    node _io_signal_interrupt_T_1 = tail(_io_signal_interrupt_T, 1) @[src/main/scala/peripheral/Timer.scala 53:54]
    node _io_signal_interrupt_T_2 = geq(count, _io_signal_interrupt_T_1) @[src/main/scala/peripheral/Timer.scala 53:44]
    node _io_signal_interrupt_T_3 = and(enabled, _io_signal_interrupt_T_2) @[src/main/scala/peripheral/Timer.scala 53:34]
    io.signal_interrupt <= _io_signal_interrupt_T_3 @[src/main/scala/peripheral/Timer.scala 53:23]
    node _T_2 = geq(count, limit) @[src/main/scala/peripheral/Timer.scala 55:14]
    when _T_2 : @[src/main/scala/peripheral/Timer.scala 55:24]
      count <= UInt<1>("h0") @[src/main/scala/peripheral/Timer.scala 56:11]
    else :
      node _count_T = add(count, UInt<1>("h1")) @[src/main/scala/peripheral/Timer.scala 58:20]
      node _count_T_1 = tail(_count_T, 1) @[src/main/scala/peripheral/Timer.scala 58:20]
      count <= _count_T_1 @[src/main/scala/peripheral/Timer.scala 58:11]


  module Tx :
    input clock : Clock
    input reset : Reset
    output io : { txd : UInt<1>, flip channel : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/peripheral/UART.scala 30:14]

    reg shiftReg : UInt, clock with :
      reset => (reset, UInt<11>("h7ff")) @[src/main/scala/peripheral/UART.scala 38:25]
    reg cntReg : UInt<20>, clock with :
      reset => (reset, UInt<20>("h0")) @[src/main/scala/peripheral/UART.scala 39:23]
    reg bitsReg : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/peripheral/UART.scala 40:24]
    node _io_channel_ready_T = eq(cntReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 42:31]
    node _io_channel_ready_T_1 = eq(bitsReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 42:52]
    node _io_channel_ready_T_2 = and(_io_channel_ready_T, _io_channel_ready_T_1) @[src/main/scala/peripheral/UART.scala 42:40]
    io.channel.ready <= _io_channel_ready_T_2 @[src/main/scala/peripheral/UART.scala 42:20]
    node _io_txd_T = bits(shiftReg, 0, 0) @[src/main/scala/peripheral/UART.scala 43:21]
    io.txd <= _io_txd_T @[src/main/scala/peripheral/UART.scala 43:10]
    node _T = eq(cntReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 45:15]
    when _T : @[src/main/scala/peripheral/UART.scala 45:24]
      cntReg <= UInt<8>("hd8") @[src/main/scala/peripheral/UART.scala 47:12]
      node _T_1 = neq(bitsReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 48:18]
      when _T_1 : @[src/main/scala/peripheral/UART.scala 48:27]
        node shift = shr(shiftReg, 1) @[src/main/scala/peripheral/UART.scala 49:28]
        node _shiftReg_T = bits(shift, 9, 0) @[src/main/scala/peripheral/UART.scala 50:33]
        node _shiftReg_T_1 = cat(UInt<1>("h1"), _shiftReg_T) @[src/main/scala/peripheral/UART.scala 50:22]
        shiftReg <= _shiftReg_T_1 @[src/main/scala/peripheral/UART.scala 50:16]
        node _bitsReg_T = sub(bitsReg, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 51:26]
        node _bitsReg_T_1 = tail(_bitsReg_T, 1) @[src/main/scala/peripheral/UART.scala 51:26]
        bitsReg <= _bitsReg_T_1 @[src/main/scala/peripheral/UART.scala 51:15]
      else :
        when io.channel.valid : @[src/main/scala/peripheral/UART.scala 53:30]
          node _shiftReg_T_2 = cat(UInt<2>("h3"), io.channel.bits) @[src/main/scala/peripheral/UART.scala 54:28]
          node _shiftReg_T_3 = cat(_shiftReg_T_2, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 54:24]
          shiftReg <= _shiftReg_T_3 @[src/main/scala/peripheral/UART.scala 54:18]
          bitsReg <= UInt<4>("hb") @[src/main/scala/peripheral/UART.scala 55:17]
        else :
          shiftReg <= UInt<11>("h7ff") @[src/main/scala/peripheral/UART.scala 57:18]
    else :
      node _cntReg_T = sub(cntReg, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 62:22]
      node _cntReg_T_1 = tail(_cntReg_T, 1) @[src/main/scala/peripheral/UART.scala 62:22]
      cntReg <= _cntReg_T_1 @[src/main/scala/peripheral/UART.scala 62:12]


  module Buffer :
    input clock : Clock
    input reset : Reset
    output io : { flip in : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, out : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/peripheral/UART.scala 119:14]

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 125:25]
    reg dataReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/peripheral/UART.scala 126:24]
    node _io_in_ready_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 128:27]
    io.in.ready <= _io_in_ready_T @[src/main/scala/peripheral/UART.scala 128:15]
    node _io_out_valid_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 129:28]
    io.out.valid <= _io_out_valid_T @[src/main/scala/peripheral/UART.scala 129:16]
    node _T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 131:17]
    when _T : @[src/main/scala/peripheral/UART.scala 131:28]
      when io.in.valid : @[src/main/scala/peripheral/UART.scala 132:23]
        dataReg <= io.in.bits @[src/main/scala/peripheral/UART.scala 133:15]
        stateReg <= UInt<1>("h1") @[src/main/scala/peripheral/UART.scala 134:16]
    else :
      when io.out.ready : @[src/main/scala/peripheral/UART.scala 137:24]
        stateReg <= UInt<1>("h0") @[src/main/scala/peripheral/UART.scala 138:16]
    io.out.bits <= dataReg @[src/main/scala/peripheral/UART.scala 141:15]

  module BufferedTx :
    input clock : Clock
    input reset : Reset
    output io : { txd : UInt<1>, flip channel : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/peripheral/UART.scala 148:14]

    inst tx of Tx @[src/main/scala/peripheral/UART.scala 153:18]
    tx.clock <= clock
    tx.reset <= reset
    inst buf of Buffer @[src/main/scala/peripheral/UART.scala 154:19]
    buf.clock <= clock
    buf.reset <= reset
    buf.io.in <= io.channel @[src/main/scala/peripheral/UART.scala 156:13]
    tx.io.channel <= buf.io.out @[src/main/scala/peripheral/UART.scala 157:17]
    io.txd <= tx.io.txd @[src/main/scala/peripheral/UART.scala 158:10]

  module Rx :
    input clock : Clock
    input reset : Reset
    output io : { flip rxd : UInt<1>, channel : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/peripheral/UART.scala 75:14]

    reg rxReg_REG : UInt, clock with :
      reset => (reset, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 85:30]
    rxReg_REG <= io.rxd @[src/main/scala/peripheral/UART.scala 85:30]
    reg rxReg : UInt, clock with :
      reset => (reset, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 85:22]
    rxReg <= rxReg_REG @[src/main/scala/peripheral/UART.scala 85:22]
    reg shiftReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/peripheral/UART.scala 87:25]
    reg cntReg : UInt<20>, clock with :
      reset => (reset, UInt<20>("h0")) @[src/main/scala/peripheral/UART.scala 88:23]
    reg bitsReg : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/peripheral/UART.scala 89:24]
    reg valReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 90:23]
    node _T = neq(cntReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 92:15]
    when _T : @[src/main/scala/peripheral/UART.scala 92:24]
      node _cntReg_T = sub(cntReg, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 93:22]
      node _cntReg_T_1 = tail(_cntReg_T, 1) @[src/main/scala/peripheral/UART.scala 93:22]
      cntReg <= _cntReg_T_1 @[src/main/scala/peripheral/UART.scala 93:12]
    else :
      node _T_1 = neq(bitsReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 94:22]
      when _T_1 : @[src/main/scala/peripheral/UART.scala 94:31]
        cntReg <= UInt<8>("hd8") @[src/main/scala/peripheral/UART.scala 95:12]
        node _shiftReg_T = shr(shiftReg, 1) @[src/main/scala/peripheral/UART.scala 96:37]
        node _shiftReg_T_1 = cat(rxReg, _shiftReg_T) @[src/main/scala/peripheral/UART.scala 96:20]
        shiftReg <= _shiftReg_T_1 @[src/main/scala/peripheral/UART.scala 96:14]
        node _bitsReg_T = sub(bitsReg, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 97:24]
        node _bitsReg_T_1 = tail(_bitsReg_T, 1) @[src/main/scala/peripheral/UART.scala 97:24]
        bitsReg <= _bitsReg_T_1 @[src/main/scala/peripheral/UART.scala 97:13]
        node _T_2 = eq(bitsReg, UInt<1>("h1")) @[src/main/scala/peripheral/UART.scala 99:18]
        when _T_2 : @[src/main/scala/peripheral/UART.scala 99:27]
          valReg <= UInt<1>("h1") @[src/main/scala/peripheral/UART.scala 100:14]
      else :
        node _T_3 = eq(rxReg, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 102:20]
        when _T_3 : @[src/main/scala/peripheral/UART.scala 102:29]
          cntReg <= UInt<9>("h145") @[src/main/scala/peripheral/UART.scala 103:12]
          bitsReg <= UInt<4>("h8") @[src/main/scala/peripheral/UART.scala 104:13]
    node _T_4 = and(valReg, io.channel.ready) @[src/main/scala/peripheral/UART.scala 107:15]
    when _T_4 : @[src/main/scala/peripheral/UART.scala 107:36]
      valReg <= UInt<1>("h0") @[src/main/scala/peripheral/UART.scala 108:12]
    io.channel.bits <= shiftReg @[src/main/scala/peripheral/UART.scala 111:19]
    io.channel.valid <= valReg @[src/main/scala/peripheral/UART.scala 112:20]

  module Uart :
    input clock : Clock
    input reset : Reset
    output io : { bundle : { flip address : UInt<32>, flip write_data : UInt<32>, flip write_enable : UInt<1>, flip write_strobe : UInt<1>[4], read_data : UInt<32>}, flip rxd : UInt<1>, txd : UInt<1>, signal_interrupt : UInt<1>} @[src/main/scala/peripheral/UART.scala 162:14]

    reg interrupt : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 169:26]
    reg rxData : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 170:23]
    inst tx of BufferedTx @[src/main/scala/peripheral/UART.scala 172:18]
    tx.clock <= clock
    tx.reset <= reset
    inst rx of Rx @[src/main/scala/peripheral/UART.scala 173:18]
    rx.clock <= clock
    rx.reset <= reset
    io.bundle.read_data <= UInt<1>("h0") @[src/main/scala/peripheral/UART.scala 175:23]
    node _T = eq(io.bundle.address, UInt<3>("h4")) @[src/main/scala/peripheral/UART.scala 176:26]
    when _T : @[src/main/scala/peripheral/UART.scala 176:37]
      io.bundle.read_data <= UInt<17>("h1c200") @[src/main/scala/peripheral/UART.scala 177:25]
    else :
      node _T_1 = eq(io.bundle.address, UInt<4>("hc")) @[src/main/scala/peripheral/UART.scala 178:32]
      when _T_1 : @[src/main/scala/peripheral/UART.scala 178:43]
        io.bundle.read_data <= rxData @[src/main/scala/peripheral/UART.scala 179:25]
        interrupt <= UInt<1>("h0") @[src/main/scala/peripheral/UART.scala 180:15]
    tx.io.channel.valid <= UInt<1>("h0") @[src/main/scala/peripheral/UART.scala 183:23]
    tx.io.channel.bits <= UInt<1>("h0") @[src/main/scala/peripheral/UART.scala 184:22]
    when io.bundle.write_enable : @[src/main/scala/peripheral/UART.scala 185:32]
      node _T_2 = eq(io.bundle.address, UInt<4>("h8")) @[src/main/scala/peripheral/UART.scala 186:28]
      when _T_2 : @[src/main/scala/peripheral/UART.scala 186:39]
        node _interrupt_T = neq(io.bundle.write_data, UInt<1>("h0")) @[src/main/scala/peripheral/UART.scala 187:41]
        interrupt <= _interrupt_T @[src/main/scala/peripheral/UART.scala 187:17]
      else :
        node _T_3 = eq(io.bundle.address, UInt<5>("h10")) @[src/main/scala/peripheral/UART.scala 188:34]
        when _T_3 : @[src/main/scala/peripheral/UART.scala 188:46]
          tx.io.channel.valid <= UInt<1>("h1") @[src/main/scala/peripheral/UART.scala 189:27]
          tx.io.channel.bits <= io.bundle.write_data @[src/main/scala/peripheral/UART.scala 190:26]
    io.txd <= tx.io.txd @[src/main/scala/peripheral/UART.scala 194:10]
    rx.io.rxd <= io.rxd @[src/main/scala/peripheral/UART.scala 195:13]
    io.signal_interrupt <= interrupt @[src/main/scala/peripheral/UART.scala 197:23]
    rx.io.channel.ready <= UInt<1>("h0") @[src/main/scala/peripheral/UART.scala 198:23]
    when rx.io.channel.valid : @[src/main/scala/peripheral/UART.scala 199:29]
      rx.io.channel.ready <= UInt<1>("h1") @[src/main/scala/peripheral/UART.scala 200:25]
      rxData <= rx.io.channel.bits @[src/main/scala/peripheral/UART.scala 201:12]
      interrupt <= UInt<1>("h1") @[src/main/scala/peripheral/UART.scala 202:15]


  module Dummy :
    input clock : Clock
    input reset : Reset
    output io : { flip bundle : { flip address : UInt<32>, flip write_data : UInt<32>, flip write_enable : UInt<1>, flip write_strobe : UInt<1>[4], read_data : UInt<32>}} @[src/main/scala/peripheral/Dummy.scala 22:14]

    wire _WIRE : UInt<1>[4] @[src/main/scala/peripheral/Dummy.scala 25:36]
    _WIRE[0] <= UInt<1>("h0") @[src/main/scala/peripheral/Dummy.scala 25:36]
    _WIRE[1] <= UInt<1>("h0") @[src/main/scala/peripheral/Dummy.scala 25:36]
    _WIRE[2] <= UInt<1>("h0") @[src/main/scala/peripheral/Dummy.scala 25:36]
    _WIRE[3] <= UInt<1>("h0") @[src/main/scala/peripheral/Dummy.scala 25:36]
    io.bundle.write_strobe <= _WIRE @[src/main/scala/peripheral/Dummy.scala 25:26]
    io.bundle.write_data <= UInt<1>("h0") @[src/main/scala/peripheral/Dummy.scala 26:24]
    io.bundle.write_enable <= UInt<1>("h0") @[src/main/scala/peripheral/Dummy.scala 27:26]
    io.bundle.address <= UInt<1>("h0") @[src/main/scala/peripheral/Dummy.scala 28:21]

  module InstructionROM :
    input clock : Clock
    input reset : Reset
    output io : { flip address : UInt<32>, data : UInt<32>} @[src/main/scala/peripheral/InstructionROM.scala 28:14]

    cmem mem : UInt<32> [1050] @[src/main/scala/peripheral/InstructionROM.scala 34:16]
    node _io_data_T = bits(io.address, 10, 0) @[src/main/scala/peripheral/InstructionROM.scala 40:22]
    read mport io_data_MPORT = mem[_io_data_T], clock @[src/main/scala/peripheral/InstructionROM.scala 40:22]
    io.data <= io_data_MPORT @[src/main/scala/peripheral/InstructionROM.scala 40:11]

  module ROMLoader :
    input clock : Clock
    input reset : Reset
    output io : { flip bundle : { flip address : UInt<32>, flip write_data : UInt<32>, flip write_enable : UInt<1>, flip write_strobe : UInt<1>[4], read_data : UInt<32>}, rom_address : UInt<32>, flip rom_data : UInt<32>, flip load_address : UInt<32>, load_finished : UInt<1>} @[src/main/scala/peripheral/ROMLoader.scala 21:14]

    reg address : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/peripheral/ROMLoader.scala 31:24]
    reg valid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/peripheral/ROMLoader.scala 32:22]
    wire _WIRE : UInt<1>[4] @[src/main/scala/peripheral/ROMLoader.scala 34:36]
    _WIRE[0] <= UInt<1>("h0") @[src/main/scala/peripheral/ROMLoader.scala 34:36]
    _WIRE[1] <= UInt<1>("h0") @[src/main/scala/peripheral/ROMLoader.scala 34:36]
    _WIRE[2] <= UInt<1>("h0") @[src/main/scala/peripheral/ROMLoader.scala 34:36]
    _WIRE[3] <= UInt<1>("h0") @[src/main/scala/peripheral/ROMLoader.scala 34:36]
    io.bundle.write_strobe <= _WIRE @[src/main/scala/peripheral/ROMLoader.scala 34:26]
    io.bundle.address <= UInt<1>("h0") @[src/main/scala/peripheral/ROMLoader.scala 35:21]
    io.bundle.write_data <= UInt<1>("h0") @[src/main/scala/peripheral/ROMLoader.scala 36:24]
    io.bundle.write_enable <= UInt<1>("h0") @[src/main/scala/peripheral/ROMLoader.scala 37:26]
    node _T = leq(address, UInt<11>("h419")) @[src/main/scala/peripheral/ROMLoader.scala 38:16]
    when _T : @[src/main/scala/peripheral/ROMLoader.scala 38:37]
      io.bundle.write_enable <= UInt<1>("h1") @[src/main/scala/peripheral/ROMLoader.scala 39:28]
      io.bundle.write_data <= io.rom_data @[src/main/scala/peripheral/ROMLoader.scala 40:26]
      node _io_bundle_address_T = dshl(address, UInt<2>("h2")) @[src/main/scala/peripheral/ROMLoader.scala 41:35]
      node _io_bundle_address_T_1 = add(_io_bundle_address_T, io.load_address) @[src/main/scala/peripheral/ROMLoader.scala 41:50]
      node _io_bundle_address_T_2 = tail(_io_bundle_address_T_1, 1) @[src/main/scala/peripheral/ROMLoader.scala 41:50]
      io.bundle.address <= _io_bundle_address_T_2 @[src/main/scala/peripheral/ROMLoader.scala 41:23]
      wire _WIRE_1 : UInt<1>[4] @[src/main/scala/peripheral/ROMLoader.scala 42:38]
      _WIRE_1[0] <= UInt<1>("h1") @[src/main/scala/peripheral/ROMLoader.scala 42:38]
      _WIRE_1[1] <= UInt<1>("h1") @[src/main/scala/peripheral/ROMLoader.scala 42:38]
      _WIRE_1[2] <= UInt<1>("h1") @[src/main/scala/peripheral/ROMLoader.scala 42:38]
      _WIRE_1[3] <= UInt<1>("h1") @[src/main/scala/peripheral/ROMLoader.scala 42:38]
      io.bundle.write_strobe <= _WIRE_1 @[src/main/scala/peripheral/ROMLoader.scala 42:28]
      node _address_T = add(address, UInt<1>("h1")) @[src/main/scala/peripheral/ROMLoader.scala 43:24]
      node _address_T_1 = tail(_address_T, 1) @[src/main/scala/peripheral/ROMLoader.scala 43:24]
      address <= _address_T_1 @[src/main/scala/peripheral/ROMLoader.scala 43:13]
      node _T_1 = eq(address, UInt<11>("h419")) @[src/main/scala/peripheral/ROMLoader.scala 44:18]
      when _T_1 : @[src/main/scala/peripheral/ROMLoader.scala 44:40]
        valid <= UInt<1>("h1") @[src/main/scala/peripheral/ROMLoader.scala 45:13]
    io.load_finished <= valid @[src/main/scala/peripheral/ROMLoader.scala 48:20]
    io.rom_address <= address @[src/main/scala/peripheral/ROMLoader.scala 49:18]

  module Control :
    input clock : Clock
    input reset : Reset
    output io : { flip jump_flag : UInt<1>, flip jump_instruction_id : UInt<1>, flip rs1_id : UInt<5>, flip rs2_id : UInt<5>, flip memory_read_enable_ex : UInt<1>, flip rd_ex : UInt<5>, flip memory_read_enable_mem : UInt<1>, flip rd_mem : UInt<5>, if_flush : UInt<1>, id_flush : UInt<1>, pc_stall : UInt<1>, if_stall : UInt<1>} @[src/main/scala/riscv/core/fivestage_final/Control.scala 21:14]

    node _id_hazard_T = or(io.memory_read_enable_ex, io.jump_instruction_id) @[src/main/scala/riscv/core/fivestage_final/Control.scala 38:45]
    node _id_hazard_T_1 = neq(io.rd_ex, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage_final/Control.scala 38:84]
    node _id_hazard_T_2 = and(_id_hazard_T, _id_hazard_T_1) @[src/main/scala/riscv/core/fivestage_final/Control.scala 38:72]
    node _id_hazard_T_3 = eq(io.rd_ex, io.rs1_id) @[src/main/scala/riscv/core/fivestage_final/Control.scala 38:105]
    node _id_hazard_T_4 = eq(io.rd_ex, io.rs2_id) @[src/main/scala/riscv/core/fivestage_final/Control.scala 38:131]
    node _id_hazard_T_5 = or(_id_hazard_T_3, _id_hazard_T_4) @[src/main/scala/riscv/core/fivestage_final/Control.scala 38:119]
    node _id_hazard_T_6 = and(_id_hazard_T_2, _id_hazard_T_5) @[src/main/scala/riscv/core/fivestage_final/Control.scala 38:92]
    node _id_hazard_T_7 = and(io.jump_instruction_id, io.memory_read_enable_mem) @[src/main/scala/riscv/core/fivestage_final/Control.scala 39:28]
    node _id_hazard_T_8 = neq(io.rd_mem, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage_final/Control.scala 39:70]
    node _id_hazard_T_9 = and(_id_hazard_T_7, _id_hazard_T_8) @[src/main/scala/riscv/core/fivestage_final/Control.scala 39:57]
    node _id_hazard_T_10 = eq(io.rd_mem, io.rs1_id) @[src/main/scala/riscv/core/fivestage_final/Control.scala 39:92]
    node _id_hazard_T_11 = eq(io.rd_mem, io.rs2_id) @[src/main/scala/riscv/core/fivestage_final/Control.scala 39:119]
    node _id_hazard_T_12 = or(_id_hazard_T_10, _id_hazard_T_11) @[src/main/scala/riscv/core/fivestage_final/Control.scala 39:106]
    node _id_hazard_T_13 = and(_id_hazard_T_9, _id_hazard_T_12) @[src/main/scala/riscv/core/fivestage_final/Control.scala 39:78]
    node id_hazard = or(_id_hazard_T_6, _id_hazard_T_13) @[src/main/scala/riscv/core/fivestage_final/Control.scala 38:146]
    node _io_if_flush_T = eq(id_hazard, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage_final/Control.scala 40:34]
    node _io_if_flush_T_1 = and(io.jump_flag, _io_if_flush_T) @[src/main/scala/riscv/core/fivestage_final/Control.scala 40:31]
    io.if_flush <= _io_if_flush_T_1 @[src/main/scala/riscv/core/fivestage_final/Control.scala 40:15]
    io.id_flush <= id_hazard @[src/main/scala/riscv/core/fivestage_final/Control.scala 41:15]
    io.pc_stall <= id_hazard @[src/main/scala/riscv/core/fivestage_final/Control.scala 42:15]
    io.if_stall <= id_hazard @[src/main/scala/riscv/core/fivestage_final/Control.scala 43:15]

  module RegisterFile :
    input clock : Clock
    input reset : Reset
    output io : { flip write_enable : UInt<1>, flip write_address : UInt<5>, flip write_data : UInt<32>, flip read_address1 : UInt<5>, flip read_address2 : UInt<5>, read_data1 : UInt<32>, read_data2 : UInt<32>, flip debug_read_address : UInt<5>, debug_read_data : UInt<32>} @[src/main/scala/riscv/core/RegisterFile.scala 33:14]

    reg registers : UInt<32>[32], clock with :
      reset => (UInt<1>("h0"), registers) @[src/main/scala/riscv/core/RegisterFile.scala 46:22]
    node _T = asUInt(reset) @[src/main/scala/riscv/core/RegisterFile.scala 48:15]
    node _T_1 = eq(_T, UInt<1>("h0")) @[src/main/scala/riscv/core/RegisterFile.scala 48:8]
    when _T_1 : @[src/main/scala/riscv/core/RegisterFile.scala 48:23]
      node _T_2 = neq(io.write_address, UInt<1>("h0")) @[src/main/scala/riscv/core/RegisterFile.scala 49:46]
      node _T_3 = and(io.write_enable, _T_2) @[src/main/scala/riscv/core/RegisterFile.scala 49:26]
      when _T_3 : @[src/main/scala/riscv/core/RegisterFile.scala 49:55]
        registers[io.write_address] <= io.write_data @[src/main/scala/riscv/core/RegisterFile.scala 50:35]
    node _io_read_data1_T = eq(io.read_address1, UInt<1>("h0")) @[src/main/scala/riscv/core/RegisterFile.scala 57:25]
    node _io_read_data1_T_1 = eq(io.read_address1, io.write_address) @[src/main/scala/riscv/core/RegisterFile.scala 58:25]
    node _io_read_data1_T_2 = and(_io_read_data1_T_1, io.write_enable) @[src/main/scala/riscv/core/RegisterFile.scala 58:46]
    node _io_read_data1_T_3 = mux(_io_read_data1_T_2, io.write_data, registers[io.read_address1]) @[src/main/scala/chisel3/util/Mux.scala 141:16]
    node _io_read_data1_T_4 = mux(_io_read_data1_T, UInt<1>("h0"), _io_read_data1_T_3) @[src/main/scala/chisel3/util/Mux.scala 141:16]
    io.read_data1 <= _io_read_data1_T_4 @[src/main/scala/riscv/core/RegisterFile.scala 54:17]
    node _io_read_data2_T = eq(io.read_address2, UInt<1>("h0")) @[src/main/scala/riscv/core/RegisterFile.scala 65:25]
    node _io_read_data2_T_1 = eq(io.read_address2, io.write_address) @[src/main/scala/riscv/core/RegisterFile.scala 66:25]
    node _io_read_data2_T_2 = and(_io_read_data2_T_1, io.write_enable) @[src/main/scala/riscv/core/RegisterFile.scala 66:46]
    node _io_read_data2_T_3 = mux(_io_read_data2_T_2, io.write_data, registers[io.read_address2]) @[src/main/scala/chisel3/util/Mux.scala 141:16]
    node _io_read_data2_T_4 = mux(_io_read_data2_T, UInt<1>("h0"), _io_read_data2_T_3) @[src/main/scala/chisel3/util/Mux.scala 141:16]
    io.read_data2 <= _io_read_data2_T_4 @[src/main/scala/riscv/core/RegisterFile.scala 62:17]
    node _io_debug_read_data_T = eq(io.debug_read_address, UInt<1>("h0")) @[src/main/scala/riscv/core/RegisterFile.scala 73:30]
    node _io_debug_read_data_T_1 = eq(io.debug_read_address, io.write_address) @[src/main/scala/riscv/core/RegisterFile.scala 74:30]
    node _io_debug_read_data_T_2 = and(_io_debug_read_data_T_1, io.write_enable) @[src/main/scala/riscv/core/RegisterFile.scala 74:51]
    node _io_debug_read_data_T_3 = mux(_io_debug_read_data_T_2, io.write_data, registers[io.debug_read_address]) @[src/main/scala/chisel3/util/Mux.scala 141:16]
    node _io_debug_read_data_T_4 = mux(_io_debug_read_data_T, UInt<1>("h0"), _io_debug_read_data_T_3) @[src/main/scala/chisel3/util/Mux.scala 141:16]
    io.debug_read_data <= _io_debug_read_data_T_4 @[src/main/scala/riscv/core/RegisterFile.scala 70:22]

  module InstructionFetch :
    input clock : Clock
    input reset : Reset
    output io : { flip stall_flag_ctrl : UInt<1>, flip jump_flag_id : UInt<1>, flip jump_address_id : UInt<32>, flip rom_instruction : UInt<32>, flip instruction_valid : UInt<1>, instruction_address : UInt<32>, id_instruction : UInt<32>} @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 26:14]

    reg pc : UInt<32>, clock with :
      reset => (reset, UInt<32>("h1000")) @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 36:19]
    node _pc_T = add(pc, UInt<3>("h4")) @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 39:8]
    node _pc_T_1 = tail(_pc_T, 1) @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 39:8]
    node _pc_T_2 = eq(io.stall_flag_ctrl, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 41:27]
    node _pc_T_3 = and(io.jump_flag_id, _pc_T_2) @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 41:24]
    node _pc_T_4 = eq(io.instruction_valid, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 42:30]
    node _pc_T_5 = or(io.stall_flag_ctrl, _pc_T_4) @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 42:27]
    node _pc_T_6 = mux(_pc_T_5, pc, _pc_T_1) @[src/main/scala/chisel3/util/Mux.scala 141:16]
    node _pc_T_7 = mux(_pc_T_3, io.jump_address_id, _pc_T_6) @[src/main/scala/chisel3/util/Mux.scala 141:16]
    pc <= _pc_T_7 @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 38:6]
    io.instruction_address <= pc @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 46:26]
    node _io_id_instruction_T = mux(io.instruction_valid, io.rom_instruction, UInt<32>("h13")) @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 47:27]
    io.id_instruction <= _io_id_instruction_T @[src/main/scala/riscv/core/fivestage_final/InstructionFetch.scala 47:21]

  module PipelineRegister :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h13")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<32>("h13") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h1000")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<32>("h1000") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module IF2ID :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip instruction : UInt<32>, flip instruction_address : UInt<32>, flip interrupt_flag : UInt<32>, output_instruction : UInt<32>, output_instruction_address : UInt<32>, output_interrupt_flag : UInt<32>} @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 22:14]

    inst instruction of PipelineRegister @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 34:27]
    instruction.clock <= clock
    instruction.reset <= reset
    instruction.io.in <= io.instruction @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 35:21]
    instruction.io.stall <= io.stall @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 36:24]
    instruction.io.flush <= io.flush @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 37:24]
    io.output_instruction <= instruction.io.out @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 38:25]
    inst instruction_address of PipelineRegister_1 @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 40:35]
    instruction_address.clock <= clock
    instruction_address.reset <= reset
    instruction_address.io.in <= io.instruction_address @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 41:29]
    instruction_address.io.stall <= io.stall @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 42:32]
    instruction_address.io.flush <= io.flush @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 43:32]
    io.output_instruction_address <= instruction_address.io.out @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 44:33]
    inst interrupt_flag of PipelineRegister_2 @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 46:30]
    interrupt_flag.clock <= clock
    interrupt_flag.reset <= reset
    interrupt_flag.io.in <= io.interrupt_flag @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 47:24]
    interrupt_flag.io.stall <= io.stall @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 48:27]
    interrupt_flag.io.flush <= io.flush @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 49:27]
    io.output_interrupt_flag <= interrupt_flag.io.out @[src/main/scala/riscv/core/fivestage_final/IF2ID.scala 50:28]

  module InstructionDecode :
    input clock : Clock
    input reset : Reset
    output io : { flip instruction : UInt<32>, flip instruction_address : UInt<32>, flip reg1_data : UInt<32>, flip reg2_data : UInt<32>, flip forward_from_mem : UInt<32>, flip forward_from_wb : UInt<32>, flip reg1_forward : UInt<2>, flip reg2_forward : UInt<2>, flip interrupt_assert : UInt<1>, flip interrupt_handler_address : UInt<32>, regs_reg1_read_address : UInt<5>, regs_reg2_read_address : UInt<5>, ex_immediate : UInt<32>, ex_aluop1_source : UInt<1>, ex_aluop2_source : UInt<1>, ex_memory_read_enable : UInt<1>, ex_memory_write_enable : UInt<1>, ex_reg_write_source : UInt<2>, ex_reg_write_enable : UInt<1>, ex_reg_write_address : UInt<5>, ex_csr_address : UInt<12>, ex_csr_write_enable : UInt<1>, ctrl_jump_instruction : UInt<1>, clint_jump_flag : UInt<1>, clint_jump_address : UInt<32>, if_jump_flag : UInt<1>, if_jump_address : UInt<32>} @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 136:14]

    node opcode = bits(io.instruction, 6, 0) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 166:30]
    node funct3 = bits(io.instruction, 14, 12) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 167:30]
    node funct7 = bits(io.instruction, 31, 25) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 168:30]
    node rd = bits(io.instruction, 11, 7) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 169:26]
    node rs1 = bits(io.instruction, 19, 15) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 170:27]
    node rs2 = bits(io.instruction, 24, 20) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 171:27]
    node _io_regs_reg1_read_address_T = eq(opcode, UInt<6>("h37")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 173:43]
    node _io_regs_reg1_read_address_T_1 = mux(_io_regs_reg1_read_address_T, UInt<5>("h0"), rs1) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 173:35]
    io.regs_reg1_read_address <= _io_regs_reg1_read_address_T_1 @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 173:29]
    io.regs_reg2_read_address <= rs2 @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 174:29]
    node _io_ex_immediate_T = bits(io.instruction, 31, 31) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 177:32]
    node _io_ex_immediate_T_1 = bits(_io_ex_immediate_T, 0, 0) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 177:13]
    node _io_ex_immediate_T_2 = mux(_io_ex_immediate_T_1, UInt<20>("hfffff"), UInt<20>("h0")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 177:13]
    node _io_ex_immediate_T_3 = bits(io.instruction, 31, 20) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 177:53]
    node _io_ex_immediate_T_4 = cat(_io_ex_immediate_T_2, _io_ex_immediate_T_3) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 177:8]
    node _io_ex_immediate_T_5 = bits(io.instruction, 31, 31) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 179:56]
    node _io_ex_immediate_T_6 = bits(_io_ex_immediate_T_5, 0, 0) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 179:37]
    node _io_ex_immediate_T_7 = mux(_io_ex_immediate_T_6, UInt<21>("h1fffff"), UInt<21>("h0")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 179:37]
    node _io_ex_immediate_T_8 = bits(io.instruction, 30, 20) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 179:77]
    node _io_ex_immediate_T_9 = cat(_io_ex_immediate_T_7, _io_ex_immediate_T_8) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 179:32]
    node _io_ex_immediate_T_10 = bits(io.instruction, 31, 31) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 180:56]
    node _io_ex_immediate_T_11 = bits(_io_ex_immediate_T_10, 0, 0) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 180:37]
    node _io_ex_immediate_T_12 = mux(_io_ex_immediate_T_11, UInt<21>("h1fffff"), UInt<21>("h0")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 180:37]
    node _io_ex_immediate_T_13 = bits(io.instruction, 30, 20) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 180:77]
    node _io_ex_immediate_T_14 = cat(_io_ex_immediate_T_12, _io_ex_immediate_T_13) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 180:32]
    node _io_ex_immediate_T_15 = bits(io.instruction, 31, 31) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 181:55]
    node _io_ex_immediate_T_16 = bits(_io_ex_immediate_T_15, 0, 0) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 181:36]
    node _io_ex_immediate_T_17 = mux(_io_ex_immediate_T_16, UInt<21>("h1fffff"), UInt<21>("h0")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 181:36]
    node _io_ex_immediate_T_18 = bits(io.instruction, 30, 20) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 181:76]
    node _io_ex_immediate_T_19 = cat(_io_ex_immediate_T_17, _io_ex_immediate_T_18) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 181:31]
    node _io_ex_immediate_T_20 = bits(io.instruction, 31, 31) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 182:56]
    node _io_ex_immediate_T_21 = bits(_io_ex_immediate_T_20, 0, 0) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 182:37]
    node _io_ex_immediate_T_22 = mux(_io_ex_immediate_T_21, UInt<21>("h1fffff"), UInt<21>("h0")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 182:37]
    node _io_ex_immediate_T_23 = bits(io.instruction, 30, 25) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 182:77]
    node _io_ex_immediate_T_24 = bits(io.instruction, 11, 7) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 182:101]
    node io_ex_immediate_hi = cat(_io_ex_immediate_T_22, _io_ex_immediate_T_23) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 182:32]
    node _io_ex_immediate_T_25 = cat(io_ex_immediate_hi, _io_ex_immediate_T_24) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 182:32]
    node _io_ex_immediate_T_26 = bits(io.instruction, 31, 31) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 183:56]
    node _io_ex_immediate_T_27 = bits(_io_ex_immediate_T_26, 0, 0) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 183:37]
    node _io_ex_immediate_T_28 = mux(_io_ex_immediate_T_27, UInt<20>("hfffff"), UInt<20>("h0")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 183:37]
    node _io_ex_immediate_T_29 = bits(io.instruction, 7, 7) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 183:77]
    node _io_ex_immediate_T_30 = bits(io.instruction, 30, 25) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 183:96]
    node _io_ex_immediate_T_31 = bits(io.instruction, 11, 8) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 183:120]
    node io_ex_immediate_lo = cat(_io_ex_immediate_T_31, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 183:32]
    node io_ex_immediate_hi_hi = cat(_io_ex_immediate_T_28, _io_ex_immediate_T_29) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 183:32]
    node io_ex_immediate_hi_1 = cat(io_ex_immediate_hi_hi, _io_ex_immediate_T_30) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 183:32]
    node _io_ex_immediate_T_32 = cat(io_ex_immediate_hi_1, io_ex_immediate_lo) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 183:32]
    node _io_ex_immediate_T_33 = bits(io.instruction, 31, 12) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 184:45]
    node _io_ex_immediate_T_34 = cat(_io_ex_immediate_T_33, UInt<12>("h0")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 184:30]
    node _io_ex_immediate_T_35 = bits(io.instruction, 31, 12) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 185:47]
    node _io_ex_immediate_T_36 = cat(_io_ex_immediate_T_35, UInt<12>("h0")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 185:32]
    node _io_ex_immediate_T_37 = bits(io.instruction, 31, 31) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 186:54]
    node _io_ex_immediate_T_38 = bits(_io_ex_immediate_T_37, 0, 0) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 186:35]
    node _io_ex_immediate_T_39 = mux(_io_ex_immediate_T_38, UInt<12>("hfff"), UInt<12>("h0")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 186:35]
    node _io_ex_immediate_T_40 = bits(io.instruction, 19, 12) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 186:75]
    node _io_ex_immediate_T_41 = bits(io.instruction, 20, 20) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 186:99]
    node _io_ex_immediate_T_42 = bits(io.instruction, 30, 21) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 186:119]
    node io_ex_immediate_lo_1 = cat(_io_ex_immediate_T_42, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 186:30]
    node io_ex_immediate_hi_hi_1 = cat(_io_ex_immediate_T_39, _io_ex_immediate_T_40) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 186:30]
    node io_ex_immediate_hi_2 = cat(io_ex_immediate_hi_hi_1, _io_ex_immediate_T_41) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 186:30]
    node _io_ex_immediate_T_43 = cat(io_ex_immediate_hi_2, io_ex_immediate_lo_1) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 186:30]
    node _io_ex_immediate_T_44 = eq(UInt<5>("h13"), opcode) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ex_immediate_T_45 = mux(_io_ex_immediate_T_44, _io_ex_immediate_T_9, _io_ex_immediate_T_4) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ex_immediate_T_46 = eq(UInt<2>("h3"), opcode) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ex_immediate_T_47 = mux(_io_ex_immediate_T_46, _io_ex_immediate_T_14, _io_ex_immediate_T_45) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ex_immediate_T_48 = eq(UInt<7>("h67"), opcode) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ex_immediate_T_49 = mux(_io_ex_immediate_T_48, _io_ex_immediate_T_19, _io_ex_immediate_T_47) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ex_immediate_T_50 = eq(UInt<6>("h23"), opcode) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ex_immediate_T_51 = mux(_io_ex_immediate_T_50, _io_ex_immediate_T_25, _io_ex_immediate_T_49) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ex_immediate_T_52 = eq(UInt<7>("h63"), opcode) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ex_immediate_T_53 = mux(_io_ex_immediate_T_52, _io_ex_immediate_T_32, _io_ex_immediate_T_51) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ex_immediate_T_54 = eq(UInt<6>("h37"), opcode) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ex_immediate_T_55 = mux(_io_ex_immediate_T_54, _io_ex_immediate_T_34, _io_ex_immediate_T_53) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ex_immediate_T_56 = eq(UInt<5>("h17"), opcode) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ex_immediate_T_57 = mux(_io_ex_immediate_T_56, _io_ex_immediate_T_36, _io_ex_immediate_T_55) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ex_immediate_T_58 = eq(UInt<7>("h6f"), opcode) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ex_immediate_T_59 = mux(_io_ex_immediate_T_58, _io_ex_immediate_T_43, _io_ex_immediate_T_57) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    io.ex_immediate <= _io_ex_immediate_T_59 @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 175:19]
    node _io_ex_aluop1_source_T = eq(opcode, UInt<5>("h17")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 190:12]
    node _io_ex_aluop1_source_T_1 = eq(opcode, UInt<7>("h63")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 190:45]
    node _io_ex_aluop1_source_T_2 = or(_io_ex_aluop1_source_T, _io_ex_aluop1_source_T_1) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 190:35]
    node _io_ex_aluop1_source_T_3 = eq(opcode, UInt<7>("h6f")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 190:78]
    node _io_ex_aluop1_source_T_4 = or(_io_ex_aluop1_source_T_2, _io_ex_aluop1_source_T_3) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 190:68]
    node _io_ex_aluop1_source_T_5 = mux(_io_ex_aluop1_source_T_4, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 189:29]
    io.ex_aluop1_source <= _io_ex_aluop1_source_T_5 @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 189:23]
    node _io_ex_aluop2_source_T = eq(opcode, UInt<6>("h33")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 195:12]
    node _io_ex_aluop2_source_T_1 = mux(_io_ex_aluop2_source_T, UInt<1>("h0"), UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 194:29]
    io.ex_aluop2_source <= _io_ex_aluop2_source_T_1 @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 194:23]
    node _io_ex_memory_read_enable_T = eq(opcode, UInt<2>("h3")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 199:38]
    io.ex_memory_read_enable <= _io_ex_memory_read_enable_T @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 199:28]
    node _io_ex_memory_write_enable_T = eq(opcode, UInt<6>("h23")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 200:39]
    io.ex_memory_write_enable <= _io_ex_memory_write_enable_T @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 200:29]
    node _io_ex_reg_write_source_T = eq(UInt<2>("h3"), opcode) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ex_reg_write_source_T_1 = mux(_io_ex_reg_write_source_T, UInt<2>("h1"), UInt<2>("h0")) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ex_reg_write_source_T_2 = eq(UInt<7>("h73"), opcode) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ex_reg_write_source_T_3 = mux(_io_ex_reg_write_source_T_2, UInt<2>("h2"), _io_ex_reg_write_source_T_1) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ex_reg_write_source_T_4 = eq(UInt<7>("h6f"), opcode) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ex_reg_write_source_T_5 = mux(_io_ex_reg_write_source_T_4, UInt<2>("h3"), _io_ex_reg_write_source_T_3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ex_reg_write_source_T_6 = eq(UInt<7>("h67"), opcode) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ex_reg_write_source_T_7 = mux(_io_ex_reg_write_source_T_6, UInt<2>("h3"), _io_ex_reg_write_source_T_5) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    io.ex_reg_write_source <= _io_ex_reg_write_source_T_7 @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 201:26]
    node _io_ex_reg_write_enable_T = eq(opcode, UInt<6>("h33")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 211:37]
    node _io_ex_reg_write_enable_T_1 = eq(opcode, UInt<5>("h13")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 211:73]
    node _io_ex_reg_write_enable_T_2 = or(_io_ex_reg_write_enable_T, _io_ex_reg_write_enable_T_1) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 211:62]
    node _io_ex_reg_write_enable_T_3 = eq(opcode, UInt<2>("h3")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 212:13]
    node _io_ex_reg_write_enable_T_4 = or(_io_ex_reg_write_enable_T_2, _io_ex_reg_write_enable_T_3) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 211:97]
    node _io_ex_reg_write_enable_T_5 = eq(opcode, UInt<5>("h17")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 212:48]
    node _io_ex_reg_write_enable_T_6 = or(_io_ex_reg_write_enable_T_4, _io_ex_reg_write_enable_T_5) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 212:37]
    node _io_ex_reg_write_enable_T_7 = eq(opcode, UInt<6>("h37")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 212:83]
    node _io_ex_reg_write_enable_T_8 = or(_io_ex_reg_write_enable_T_6, _io_ex_reg_write_enable_T_7) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 212:72]
    node _io_ex_reg_write_enable_T_9 = eq(opcode, UInt<7>("h6f")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 213:13]
    node _io_ex_reg_write_enable_T_10 = or(_io_ex_reg_write_enable_T_8, _io_ex_reg_write_enable_T_9) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 212:105]
    node _io_ex_reg_write_enable_T_11 = eq(opcode, UInt<7>("h67")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 213:46]
    node _io_ex_reg_write_enable_T_12 = or(_io_ex_reg_write_enable_T_10, _io_ex_reg_write_enable_T_11) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 213:35]
    node _io_ex_reg_write_enable_T_13 = eq(opcode, UInt<7>("h73")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 213:80]
    node _io_ex_reg_write_enable_T_14 = or(_io_ex_reg_write_enable_T_12, _io_ex_reg_write_enable_T_13) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 213:69]
    io.ex_reg_write_enable <= _io_ex_reg_write_enable_T_14 @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 211:26]
    node _io_ex_reg_write_address_T = bits(io.instruction, 11, 7) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 214:44]
    io.ex_reg_write_address <= _io_ex_reg_write_address_T @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 214:27]
    node _io_ex_csr_address_T = bits(io.instruction, 31, 20) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 215:38]
    io.ex_csr_address <= _io_ex_csr_address_T @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 215:21]
    node _io_ex_csr_write_enable_T = eq(opcode, UInt<7>("h73")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 216:37]
    node _io_ex_csr_write_enable_T_1 = eq(funct3, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 217:12]
    node _io_ex_csr_write_enable_T_2 = eq(funct3, UInt<3>("h5")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 217:52]
    node _io_ex_csr_write_enable_T_3 = or(_io_ex_csr_write_enable_T_1, _io_ex_csr_write_enable_T_2) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 217:42]
    node _io_ex_csr_write_enable_T_4 = eq(funct3, UInt<2>("h2")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 218:14]
    node _io_ex_csr_write_enable_T_5 = or(_io_ex_csr_write_enable_T_3, _io_ex_csr_write_enable_T_4) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 217:83]
    node _io_ex_csr_write_enable_T_6 = eq(funct3, UInt<3>("h6")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 218:54]
    node _io_ex_csr_write_enable_T_7 = or(_io_ex_csr_write_enable_T_5, _io_ex_csr_write_enable_T_6) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 218:44]
    node _io_ex_csr_write_enable_T_8 = eq(funct3, UInt<2>("h3")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 219:14]
    node _io_ex_csr_write_enable_T_9 = or(_io_ex_csr_write_enable_T_7, _io_ex_csr_write_enable_T_8) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 218:85]
    node _io_ex_csr_write_enable_T_10 = eq(funct3, UInt<3>("h7")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 219:54]
    node _io_ex_csr_write_enable_T_11 = or(_io_ex_csr_write_enable_T_9, _io_ex_csr_write_enable_T_10) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 219:44]
    node _io_ex_csr_write_enable_T_12 = and(_io_ex_csr_write_enable_T, _io_ex_csr_write_enable_T_11) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 216:59]
    io.ex_csr_write_enable <= _io_ex_csr_write_enable_T_12 @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 216:26]
    node _reg1_data_T = eq(UInt<2>("h1"), io.reg1_forward) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _reg1_data_T_1 = mux(_reg1_data_T, io.forward_from_mem, io.reg1_data) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _reg1_data_T_2 = eq(UInt<2>("h2"), io.reg1_forward) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node reg1_data = mux(_reg1_data_T_2, io.forward_from_wb, _reg1_data_T_1) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _reg2_data_T = eq(UInt<2>("h1"), io.reg2_forward) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _reg2_data_T_1 = mux(_reg2_data_T, io.forward_from_mem, io.reg2_data) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _reg2_data_T_2 = eq(UInt<2>("h2"), io.reg2_forward) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node reg2_data = mux(_reg2_data_T_2, io.forward_from_wb, _reg2_data_T_1) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_ctrl_jump_instruction_T = eq(opcode, UInt<7>("h6f")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 239:39]
    node _io_ctrl_jump_instruction_T_1 = eq(opcode, UInt<7>("h67")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 240:13]
    node _io_ctrl_jump_instruction_T_2 = or(_io_ctrl_jump_instruction_T, _io_ctrl_jump_instruction_T_1) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 239:61]
    node _io_ctrl_jump_instruction_T_3 = eq(opcode, UInt<7>("h63")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 240:47]
    node _io_ctrl_jump_instruction_T_4 = or(_io_ctrl_jump_instruction_T_2, _io_ctrl_jump_instruction_T_3) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 240:36]
    io.ctrl_jump_instruction <= _io_ctrl_jump_instruction_T_4 @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 239:28]
    node _instruction_jump_flag_T = eq(opcode, UInt<7>("h6f")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 241:39]
    node _instruction_jump_flag_T_1 = eq(opcode, UInt<7>("h67")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 242:13]
    node _instruction_jump_flag_T_2 = or(_instruction_jump_flag_T, _instruction_jump_flag_T_1) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 241:61]
    node _instruction_jump_flag_T_3 = eq(opcode, UInt<7>("h63")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 243:13]
    node _instruction_jump_flag_T_4 = eq(reg1_data, reg2_data) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 247:45]
    node _instruction_jump_flag_T_5 = neq(reg1_data, reg2_data) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 248:45]
    node _instruction_jump_flag_T_6 = asSInt(reg1_data) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 249:45]
    node _instruction_jump_flag_T_7 = asSInt(reg2_data) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 249:64]
    node _instruction_jump_flag_T_8 = lt(_instruction_jump_flag_T_6, _instruction_jump_flag_T_7) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 249:52]
    node _instruction_jump_flag_T_9 = asSInt(reg1_data) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 250:45]
    node _instruction_jump_flag_T_10 = asSInt(reg2_data) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 250:65]
    node _instruction_jump_flag_T_11 = geq(_instruction_jump_flag_T_9, _instruction_jump_flag_T_10) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 250:52]
    node _instruction_jump_flag_T_12 = lt(reg1_data, reg2_data) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 251:53]
    node _instruction_jump_flag_T_13 = geq(reg1_data, reg2_data) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 252:53]
    node _instruction_jump_flag_T_14 = eq(UInt<1>("h0"), funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _instruction_jump_flag_T_15 = mux(_instruction_jump_flag_T_14, _instruction_jump_flag_T_4, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _instruction_jump_flag_T_16 = eq(UInt<1>("h1"), funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _instruction_jump_flag_T_17 = mux(_instruction_jump_flag_T_16, _instruction_jump_flag_T_5, _instruction_jump_flag_T_15) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _instruction_jump_flag_T_18 = eq(UInt<3>("h4"), funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _instruction_jump_flag_T_19 = mux(_instruction_jump_flag_T_18, _instruction_jump_flag_T_8, _instruction_jump_flag_T_17) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _instruction_jump_flag_T_20 = eq(UInt<3>("h5"), funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _instruction_jump_flag_T_21 = mux(_instruction_jump_flag_T_20, _instruction_jump_flag_T_11, _instruction_jump_flag_T_19) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _instruction_jump_flag_T_22 = eq(UInt<3>("h6"), funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _instruction_jump_flag_T_23 = mux(_instruction_jump_flag_T_22, _instruction_jump_flag_T_12, _instruction_jump_flag_T_21) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _instruction_jump_flag_T_24 = eq(UInt<3>("h7"), funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _instruction_jump_flag_T_25 = mux(_instruction_jump_flag_T_24, _instruction_jump_flag_T_13, _instruction_jump_flag_T_23) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _instruction_jump_flag_T_26 = and(_instruction_jump_flag_T_3, _instruction_jump_flag_T_25) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 243:37]
    node instruction_jump_flag = or(_instruction_jump_flag_T_2, _instruction_jump_flag_T_26) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 242:36]
    node _instruction_jump_address_T = eq(opcode, UInt<7>("h67")) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 255:63]
    node _instruction_jump_address_T_1 = mux(_instruction_jump_address_T, reg1_data, io.instruction_address) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 255:55]
    node _instruction_jump_address_T_2 = add(io.ex_immediate, _instruction_jump_address_T_1) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 255:50]
    node instruction_jump_address = tail(_instruction_jump_address_T_2, 1) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 255:50]
    io.clint_jump_flag <= instruction_jump_flag @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 256:22]
    io.clint_jump_address <= instruction_jump_address @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 257:25]
    node _io_if_jump_flag_T = or(io.interrupt_assert, instruction_jump_flag) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 258:42]
    io.if_jump_flag <= _io_if_jump_flag_T @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 258:19]
    node _io_if_jump_address_T = mux(io.interrupt_assert, io.interrupt_handler_address, instruction_jump_address) @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 259:28]
    io.if_jump_address <= _io_if_jump_address_T @[src/main/scala/riscv/core/fivestage_final/InstructionDecode.scala 259:22]

  module PipelineRegister_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h13")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<32>("h13") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_4 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h1000")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<32>("h1000") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_5 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<5>, out : UInt<5>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<5>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_6 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<5>, out : UInt<5>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<5>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_7 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_8 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<5>, out : UInt<5>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<5>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_9 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<2>, out : UInt<2>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<2>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_10 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_11 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_12 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_13 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_14 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_15 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_16 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<12>, out : UInt<12>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<12>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_17 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_18 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_19 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module ID2EX :
    input clock : Clock
    input reset : Reset
    output io : { flip flush : UInt<1>, flip instruction : UInt<32>, flip instruction_address : UInt<32>, flip regs_reg1_read_address : UInt<5>, flip regs_reg2_read_address : UInt<5>, flip regs_write_enable : UInt<1>, flip regs_write_address : UInt<5>, flip regs_write_source : UInt<2>, flip reg1_data : UInt<32>, flip reg2_data : UInt<32>, flip immediate : UInt<32>, flip aluop1_source : UInt<1>, flip aluop2_source : UInt<1>, flip csr_write_enable : UInt<1>, flip csr_address : UInt<12>, flip memory_read_enable : UInt<1>, flip memory_write_enable : UInt<1>, flip csr_read_data : UInt<32>, output_instruction : UInt<32>, output_instruction_address : UInt<32>, output_regs_reg1_read_address : UInt<5>, output_regs_reg2_read_address : UInt<5>, output_regs_write_enable : UInt<1>, output_regs_write_address : UInt<5>, output_regs_write_source : UInt<2>, output_reg1_data : UInt<32>, output_reg2_data : UInt<32>, output_immediate : UInt<32>, output_aluop1_source : UInt<1>, output_aluop2_source : UInt<1>, output_csr_write_enable : UInt<1>, output_csr_address : UInt<12>, output_memory_read_enable : UInt<1>, output_memory_write_enable : UInt<1>, output_csr_read_data : UInt<32>} @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 22:14]

    inst instruction of PipelineRegister_3 @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 62:27]
    instruction.clock <= clock
    instruction.reset <= reset
    instruction.io.in <= io.instruction @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 63:21]
    instruction.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 64:24]
    instruction.io.flush <= io.flush @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 65:24]
    io.output_instruction <= instruction.io.out @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 66:25]
    inst instruction_address of PipelineRegister_4 @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 68:35]
    instruction_address.clock <= clock
    instruction_address.reset <= reset
    instruction_address.io.in <= io.instruction_address @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 69:29]
    instruction_address.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 70:32]
    instruction_address.io.flush <= io.flush @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 71:32]
    io.output_instruction_address <= instruction_address.io.out @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 72:33]
    inst regs_reg1_read_address of PipelineRegister_5 @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 74:38]
    regs_reg1_read_address.clock <= clock
    regs_reg1_read_address.reset <= reset
    regs_reg1_read_address.io.in <= io.regs_reg1_read_address @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 75:32]
    regs_reg1_read_address.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 76:35]
    regs_reg1_read_address.io.flush <= io.flush @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 77:35]
    io.output_regs_reg1_read_address <= regs_reg1_read_address.io.out @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 78:36]
    inst regs_reg2_read_address of PipelineRegister_6 @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 80:38]
    regs_reg2_read_address.clock <= clock
    regs_reg2_read_address.reset <= reset
    regs_reg2_read_address.io.in <= io.regs_reg2_read_address @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 81:32]
    regs_reg2_read_address.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 82:35]
    regs_reg2_read_address.io.flush <= io.flush @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 83:35]
    io.output_regs_reg2_read_address <= regs_reg2_read_address.io.out @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 84:36]
    inst regs_write_enable of PipelineRegister_7 @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 86:33]
    regs_write_enable.clock <= clock
    regs_write_enable.reset <= reset
    regs_write_enable.io.in <= io.regs_write_enable @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 87:27]
    regs_write_enable.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 88:30]
    regs_write_enable.io.flush <= io.flush @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 89:30]
    io.output_regs_write_enable <= regs_write_enable.io.out @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 90:31]
    inst regs_write_address of PipelineRegister_8 @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 92:34]
    regs_write_address.clock <= clock
    regs_write_address.reset <= reset
    regs_write_address.io.in <= io.regs_write_address @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 93:28]
    regs_write_address.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 94:31]
    regs_write_address.io.flush <= io.flush @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 95:31]
    io.output_regs_write_address <= regs_write_address.io.out @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 96:32]
    inst regs_write_source of PipelineRegister_9 @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 98:33]
    regs_write_source.clock <= clock
    regs_write_source.reset <= reset
    regs_write_source.io.in <= io.regs_write_source @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 99:27]
    regs_write_source.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 100:30]
    regs_write_source.io.flush <= io.flush @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 101:30]
    io.output_regs_write_source <= regs_write_source.io.out @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 102:31]
    inst reg1_data of PipelineRegister_10 @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 104:25]
    reg1_data.clock <= clock
    reg1_data.reset <= reset
    reg1_data.io.in <= io.reg1_data @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 105:19]
    reg1_data.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 106:22]
    reg1_data.io.flush <= io.flush @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 107:22]
    io.output_reg1_data <= reg1_data.io.out @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 108:23]
    inst reg2_data of PipelineRegister_11 @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 110:25]
    reg2_data.clock <= clock
    reg2_data.reset <= reset
    reg2_data.io.in <= io.reg2_data @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 111:19]
    reg2_data.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 112:22]
    reg2_data.io.flush <= io.flush @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 113:22]
    io.output_reg2_data <= reg2_data.io.out @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 114:23]
    inst immediate of PipelineRegister_12 @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 116:25]
    immediate.clock <= clock
    immediate.reset <= reset
    immediate.io.in <= io.immediate @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 117:19]
    immediate.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 118:22]
    immediate.io.flush <= io.flush @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 119:22]
    io.output_immediate <= immediate.io.out @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 120:23]
    inst aluop1_source of PipelineRegister_13 @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 122:29]
    aluop1_source.clock <= clock
    aluop1_source.reset <= reset
    aluop1_source.io.in <= io.aluop1_source @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 123:23]
    aluop1_source.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 124:26]
    aluop1_source.io.flush <= io.flush @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 125:26]
    io.output_aluop1_source <= aluop1_source.io.out @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 126:27]
    inst aluop2_source of PipelineRegister_14 @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 128:29]
    aluop2_source.clock <= clock
    aluop2_source.reset <= reset
    aluop2_source.io.in <= io.aluop2_source @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 129:23]
    aluop2_source.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 130:26]
    aluop2_source.io.flush <= io.flush @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 131:26]
    io.output_aluop2_source <= aluop2_source.io.out @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 132:27]
    inst csr_write_enable of PipelineRegister_15 @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 134:32]
    csr_write_enable.clock <= clock
    csr_write_enable.reset <= reset
    csr_write_enable.io.in <= io.csr_write_enable @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 135:26]
    csr_write_enable.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 136:29]
    csr_write_enable.io.flush <= io.flush @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 137:29]
    io.output_csr_write_enable <= csr_write_enable.io.out @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 138:30]
    inst csr_address of PipelineRegister_16 @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 140:27]
    csr_address.clock <= clock
    csr_address.reset <= reset
    csr_address.io.in <= io.csr_address @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 141:21]
    csr_address.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 142:24]
    csr_address.io.flush <= io.flush @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 143:24]
    io.output_csr_address <= csr_address.io.out @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 144:25]
    inst memory_read_enable of PipelineRegister_17 @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 146:34]
    memory_read_enable.clock <= clock
    memory_read_enable.reset <= reset
    memory_read_enable.io.in <= io.memory_read_enable @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 147:28]
    memory_read_enable.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 148:31]
    memory_read_enable.io.flush <= io.flush @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 149:31]
    io.output_memory_read_enable <= memory_read_enable.io.out @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 150:32]
    inst memory_write_enable of PipelineRegister_18 @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 152:35]
    memory_write_enable.clock <= clock
    memory_write_enable.reset <= reset
    memory_write_enable.io.in <= io.memory_write_enable @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 153:29]
    memory_write_enable.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 154:32]
    memory_write_enable.io.flush <= io.flush @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 155:32]
    io.output_memory_write_enable <= memory_write_enable.io.out @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 156:33]
    inst csr_read_data of PipelineRegister_19 @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 158:29]
    csr_read_data.clock <= clock
    csr_read_data.reset <= reset
    csr_read_data.io.in <= io.csr_read_data @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 159:23]
    csr_read_data.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 160:26]
    csr_read_data.io.flush <= io.flush @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 161:26]
    io.output_csr_read_data <= csr_read_data.io.out @[src/main/scala/riscv/core/fivestage_final/ID2EX.scala 162:27]

  module ALU :
    input clock : Clock
    input reset : Reset
    output io : { flip func : UInt<4>, flip op1 : UInt<32>, flip op2 : UInt<32>, result : UInt<32>} @[src/main/scala/riscv/core/ALU.scala 27:14]

    io.result <= UInt<1>("h0") @[src/main/scala/riscv/core/ALU.scala 36:13]
    node _T = asUInt(UInt<1>("h1")) @[src/main/scala/riscv/core/ALU.scala 37:19]
    node _T_1 = asUInt(io.func) @[src/main/scala/riscv/core/ALU.scala 37:19]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/riscv/core/ALU.scala 37:19]
    when _T_2 : @[src/main/scala/riscv/core/ALU.scala 37:19]
      node _io_result_T = add(io.op1, io.op2) @[src/main/scala/riscv/core/ALU.scala 39:27]
      node _io_result_T_1 = tail(_io_result_T, 1) @[src/main/scala/riscv/core/ALU.scala 39:27]
      io.result <= _io_result_T_1 @[src/main/scala/riscv/core/ALU.scala 39:17]
    else :
      node _T_3 = asUInt(UInt<2>("h2")) @[src/main/scala/riscv/core/ALU.scala 37:19]
      node _T_4 = asUInt(io.func) @[src/main/scala/riscv/core/ALU.scala 37:19]
      node _T_5 = eq(_T_3, _T_4) @[src/main/scala/riscv/core/ALU.scala 37:19]
      when _T_5 : @[src/main/scala/riscv/core/ALU.scala 37:19]
        node _io_result_T_2 = sub(io.op1, io.op2) @[src/main/scala/riscv/core/ALU.scala 42:27]
        node _io_result_T_3 = tail(_io_result_T_2, 1) @[src/main/scala/riscv/core/ALU.scala 42:27]
        io.result <= _io_result_T_3 @[src/main/scala/riscv/core/ALU.scala 42:17]
      else :
        node _T_6 = asUInt(UInt<2>("h3")) @[src/main/scala/riscv/core/ALU.scala 37:19]
        node _T_7 = asUInt(io.func) @[src/main/scala/riscv/core/ALU.scala 37:19]
        node _T_8 = eq(_T_6, _T_7) @[src/main/scala/riscv/core/ALU.scala 37:19]
        when _T_8 : @[src/main/scala/riscv/core/ALU.scala 37:19]
          node _io_result_T_4 = bits(io.op2, 4, 0) @[src/main/scala/riscv/core/ALU.scala 45:36]
          node _io_result_T_5 = dshl(io.op1, _io_result_T_4) @[src/main/scala/riscv/core/ALU.scala 45:27]
          io.result <= _io_result_T_5 @[src/main/scala/riscv/core/ALU.scala 45:17]
        else :
          node _T_9 = asUInt(UInt<3>("h4")) @[src/main/scala/riscv/core/ALU.scala 37:19]
          node _T_10 = asUInt(io.func) @[src/main/scala/riscv/core/ALU.scala 37:19]
          node _T_11 = eq(_T_9, _T_10) @[src/main/scala/riscv/core/ALU.scala 37:19]
          when _T_11 : @[src/main/scala/riscv/core/ALU.scala 37:19]
            node _io_result_T_6 = asSInt(io.op1) @[src/main/scala/riscv/core/ALU.scala 48:27]
            node _io_result_T_7 = asSInt(io.op2) @[src/main/scala/riscv/core/ALU.scala 48:43]
            node _io_result_T_8 = lt(_io_result_T_6, _io_result_T_7) @[src/main/scala/riscv/core/ALU.scala 48:34]
            io.result <= _io_result_T_8 @[src/main/scala/riscv/core/ALU.scala 48:17]
          else :
            node _T_12 = asUInt(UInt<3>("h5")) @[src/main/scala/riscv/core/ALU.scala 37:19]
            node _T_13 = asUInt(io.func) @[src/main/scala/riscv/core/ALU.scala 37:19]
            node _T_14 = eq(_T_12, _T_13) @[src/main/scala/riscv/core/ALU.scala 37:19]
            when _T_14 : @[src/main/scala/riscv/core/ALU.scala 37:19]
              node _io_result_T_9 = xor(io.op1, io.op2) @[src/main/scala/riscv/core/ALU.scala 51:27]
              io.result <= _io_result_T_9 @[src/main/scala/riscv/core/ALU.scala 51:17]
            else :
              node _T_15 = asUInt(UInt<3>("h6")) @[src/main/scala/riscv/core/ALU.scala 37:19]
              node _T_16 = asUInt(io.func) @[src/main/scala/riscv/core/ALU.scala 37:19]
              node _T_17 = eq(_T_15, _T_16) @[src/main/scala/riscv/core/ALU.scala 37:19]
              when _T_17 : @[src/main/scala/riscv/core/ALU.scala 37:19]
                node _io_result_T_10 = or(io.op1, io.op2) @[src/main/scala/riscv/core/ALU.scala 54:27]
                io.result <= _io_result_T_10 @[src/main/scala/riscv/core/ALU.scala 54:17]
              else :
                node _T_18 = asUInt(UInt<3>("h7")) @[src/main/scala/riscv/core/ALU.scala 37:19]
                node _T_19 = asUInt(io.func) @[src/main/scala/riscv/core/ALU.scala 37:19]
                node _T_20 = eq(_T_18, _T_19) @[src/main/scala/riscv/core/ALU.scala 37:19]
                when _T_20 : @[src/main/scala/riscv/core/ALU.scala 37:19]
                  node _io_result_T_11 = and(io.op1, io.op2) @[src/main/scala/riscv/core/ALU.scala 57:27]
                  io.result <= _io_result_T_11 @[src/main/scala/riscv/core/ALU.scala 57:17]
                else :
                  node _T_21 = asUInt(UInt<4>("h8")) @[src/main/scala/riscv/core/ALU.scala 37:19]
                  node _T_22 = asUInt(io.func) @[src/main/scala/riscv/core/ALU.scala 37:19]
                  node _T_23 = eq(_T_21, _T_22) @[src/main/scala/riscv/core/ALU.scala 37:19]
                  when _T_23 : @[src/main/scala/riscv/core/ALU.scala 37:19]
                    node _io_result_T_12 = bits(io.op2, 4, 0) @[src/main/scala/riscv/core/ALU.scala 60:36]
                    node _io_result_T_13 = dshr(io.op1, _io_result_T_12) @[src/main/scala/riscv/core/ALU.scala 60:27]
                    io.result <= _io_result_T_13 @[src/main/scala/riscv/core/ALU.scala 60:17]
                  else :
                    node _T_24 = asUInt(UInt<4>("h9")) @[src/main/scala/riscv/core/ALU.scala 37:19]
                    node _T_25 = asUInt(io.func) @[src/main/scala/riscv/core/ALU.scala 37:19]
                    node _T_26 = eq(_T_24, _T_25) @[src/main/scala/riscv/core/ALU.scala 37:19]
                    when _T_26 : @[src/main/scala/riscv/core/ALU.scala 37:19]
                      node _io_result_T_14 = asSInt(io.op1) @[src/main/scala/riscv/core/ALU.scala 63:28]
                      node _io_result_T_15 = bits(io.op2, 4, 0) @[src/main/scala/riscv/core/ALU.scala 63:44]
                      node _io_result_T_16 = dshr(_io_result_T_14, _io_result_T_15) @[src/main/scala/riscv/core/ALU.scala 63:35]
                      node _io_result_T_17 = asUInt(_io_result_T_16) @[src/main/scala/riscv/core/ALU.scala 63:52]
                      io.result <= _io_result_T_17 @[src/main/scala/riscv/core/ALU.scala 63:17]
                    else :
                      node _T_27 = asUInt(UInt<4>("ha")) @[src/main/scala/riscv/core/ALU.scala 37:19]
                      node _T_28 = asUInt(io.func) @[src/main/scala/riscv/core/ALU.scala 37:19]
                      node _T_29 = eq(_T_27, _T_28) @[src/main/scala/riscv/core/ALU.scala 37:19]
                      when _T_29 : @[src/main/scala/riscv/core/ALU.scala 37:19]
                        node _io_result_T_18 = lt(io.op1, io.op2) @[src/main/scala/riscv/core/ALU.scala 66:27]
                        io.result <= _io_result_T_18 @[src/main/scala/riscv/core/ALU.scala 66:17]


  module ALUControl :
    input clock : Clock
    input reset : Reset
    output io : { flip opcode : UInt<7>, flip funct3 : UInt<3>, flip funct7 : UInt<7>, alu_funct : UInt<4>} @[src/main/scala/riscv/core/ALUControl.scala 22:14]

    io.alu_funct <= UInt<1>("h0") @[src/main/scala/riscv/core/ALUControl.scala 30:16]
    node _T = eq(UInt<5>("h13"), io.opcode) @[src/main/scala/riscv/core/ALUControl.scala 32:21]
    when _T : @[src/main/scala/riscv/core/ALUControl.scala 32:21]
      node _io_alu_funct_T = bits(io.funct7, 5, 5) @[src/main/scala/riscv/core/ALUControl.scala 45:49]
      node _io_alu_funct_T_1 = mux(_io_alu_funct_T, UInt<4>("h9"), UInt<4>("h8")) @[src/main/scala/riscv/core/ALUControl.scala 45:39]
      node _io_alu_funct_T_2 = eq(UInt<1>("h1"), io.funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_alu_funct_T_3 = mux(_io_alu_funct_T_2, UInt<2>("h3"), UInt<1>("h1")) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_alu_funct_T_4 = eq(UInt<2>("h2"), io.funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_alu_funct_T_5 = mux(_io_alu_funct_T_4, UInt<3>("h4"), _io_alu_funct_T_3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_alu_funct_T_6 = eq(UInt<2>("h3"), io.funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_alu_funct_T_7 = mux(_io_alu_funct_T_6, UInt<4>("ha"), _io_alu_funct_T_5) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_alu_funct_T_8 = eq(UInt<3>("h4"), io.funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_alu_funct_T_9 = mux(_io_alu_funct_T_8, UInt<3>("h5"), _io_alu_funct_T_7) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_alu_funct_T_10 = eq(UInt<3>("h6"), io.funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_alu_funct_T_11 = mux(_io_alu_funct_T_10, UInt<3>("h6"), _io_alu_funct_T_9) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_alu_funct_T_12 = eq(UInt<3>("h7"), io.funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_alu_funct_T_13 = mux(_io_alu_funct_T_12, UInt<3>("h7"), _io_alu_funct_T_11) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_alu_funct_T_14 = eq(UInt<3>("h5"), io.funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_alu_funct_T_15 = mux(_io_alu_funct_T_14, _io_alu_funct_T_1, _io_alu_funct_T_13) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      io.alu_funct <= _io_alu_funct_T_15 @[src/main/scala/riscv/core/ALUControl.scala 34:20]
    else :
      node _T_1 = eq(UInt<6>("h33"), io.opcode) @[src/main/scala/riscv/core/ALUControl.scala 32:21]
      when _T_1 : @[src/main/scala/riscv/core/ALUControl.scala 32:21]
        node _io_alu_funct_T_16 = bits(io.funct7, 5, 5) @[src/main/scala/riscv/core/ALUControl.scala 54:53]
        node _io_alu_funct_T_17 = mux(_io_alu_funct_T_16, UInt<2>("h2"), UInt<1>("h1")) @[src/main/scala/riscv/core/ALUControl.scala 54:43]
        node _io_alu_funct_T_18 = bits(io.funct7, 5, 5) @[src/main/scala/riscv/core/ALUControl.scala 61:48]
        node _io_alu_funct_T_19 = mux(_io_alu_funct_T_18, UInt<4>("h9"), UInt<4>("h8")) @[src/main/scala/riscv/core/ALUControl.scala 61:38]
        node _io_alu_funct_T_20 = eq(UInt<1>("h1"), io.funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _io_alu_funct_T_21 = mux(_io_alu_funct_T_20, UInt<2>("h3"), _io_alu_funct_T_17) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _io_alu_funct_T_22 = eq(UInt<2>("h2"), io.funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _io_alu_funct_T_23 = mux(_io_alu_funct_T_22, UInt<3>("h4"), _io_alu_funct_T_21) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _io_alu_funct_T_24 = eq(UInt<2>("h3"), io.funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _io_alu_funct_T_25 = mux(_io_alu_funct_T_24, UInt<4>("ha"), _io_alu_funct_T_23) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _io_alu_funct_T_26 = eq(UInt<3>("h4"), io.funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _io_alu_funct_T_27 = mux(_io_alu_funct_T_26, UInt<3>("h5"), _io_alu_funct_T_25) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _io_alu_funct_T_28 = eq(UInt<3>("h6"), io.funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _io_alu_funct_T_29 = mux(_io_alu_funct_T_28, UInt<3>("h6"), _io_alu_funct_T_27) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _io_alu_funct_T_30 = eq(UInt<3>("h7"), io.funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _io_alu_funct_T_31 = mux(_io_alu_funct_T_30, UInt<3>("h7"), _io_alu_funct_T_29) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _io_alu_funct_T_32 = eq(UInt<3>("h5"), io.funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        node _io_alu_funct_T_33 = mux(_io_alu_funct_T_32, _io_alu_funct_T_19, _io_alu_funct_T_31) @[src/main/scala/chisel3/util/Mux.scala 77:13]
        io.alu_funct <= _io_alu_funct_T_33 @[src/main/scala/riscv/core/ALUControl.scala 50:20]
      else :
        node _T_2 = eq(UInt<7>("h63"), io.opcode) @[src/main/scala/riscv/core/ALUControl.scala 32:21]
        when _T_2 : @[src/main/scala/riscv/core/ALUControl.scala 32:21]
          io.alu_funct <= UInt<1>("h1") @[src/main/scala/riscv/core/ALUControl.scala 66:20]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.opcode) @[src/main/scala/riscv/core/ALUControl.scala 32:21]
          when _T_3 : @[src/main/scala/riscv/core/ALUControl.scala 32:21]
            io.alu_funct <= UInt<1>("h1") @[src/main/scala/riscv/core/ALUControl.scala 69:20]
          else :
            node _T_4 = eq(UInt<6>("h23"), io.opcode) @[src/main/scala/riscv/core/ALUControl.scala 32:21]
            when _T_4 : @[src/main/scala/riscv/core/ALUControl.scala 32:21]
              io.alu_funct <= UInt<1>("h1") @[src/main/scala/riscv/core/ALUControl.scala 72:20]
            else :
              node _T_5 = eq(UInt<7>("h6f"), io.opcode) @[src/main/scala/riscv/core/ALUControl.scala 32:21]
              when _T_5 : @[src/main/scala/riscv/core/ALUControl.scala 32:21]
                io.alu_funct <= UInt<1>("h1") @[src/main/scala/riscv/core/ALUControl.scala 75:20]
              else :
                node _T_6 = eq(UInt<7>("h67"), io.opcode) @[src/main/scala/riscv/core/ALUControl.scala 32:21]
                when _T_6 : @[src/main/scala/riscv/core/ALUControl.scala 32:21]
                  io.alu_funct <= UInt<1>("h1") @[src/main/scala/riscv/core/ALUControl.scala 78:20]
                else :
                  node _T_7 = eq(UInt<6>("h37"), io.opcode) @[src/main/scala/riscv/core/ALUControl.scala 32:21]
                  when _T_7 : @[src/main/scala/riscv/core/ALUControl.scala 32:21]
                    io.alu_funct <= UInt<1>("h1") @[src/main/scala/riscv/core/ALUControl.scala 81:20]
                  else :
                    node _T_8 = eq(UInt<5>("h17"), io.opcode) @[src/main/scala/riscv/core/ALUControl.scala 32:21]
                    when _T_8 : @[src/main/scala/riscv/core/ALUControl.scala 32:21]
                      io.alu_funct <= UInt<1>("h1") @[src/main/scala/riscv/core/ALUControl.scala 84:20]


  module Execute :
    input clock : Clock
    input reset : Reset
    output io : { flip instruction : UInt<32>, flip instruction_address : UInt<32>, flip reg1_data : UInt<32>, flip reg2_data : UInt<32>, flip immediate : UInt<32>, flip aluop1_source : UInt<1>, flip aluop2_source : UInt<1>, flip csr_read_data : UInt<32>, flip forward_from_mem : UInt<32>, flip forward_from_wb : UInt<32>, flip reg1_forward : UInt<2>, flip reg2_forward : UInt<2>, mem_alu_result : UInt<32>, mem_reg2_data : UInt<32>, csr_write_data : UInt<32>} @[src/main/scala/riscv/core/fivestage_final/Execute.scala 24:14]

    node opcode = bits(io.instruction, 6, 0) @[src/main/scala/riscv/core/fivestage_final/Execute.scala 43:30]
    node funct3 = bits(io.instruction, 14, 12) @[src/main/scala/riscv/core/fivestage_final/Execute.scala 44:30]
    node funct7 = bits(io.instruction, 31, 25) @[src/main/scala/riscv/core/fivestage_final/Execute.scala 45:30]
    node uimm = bits(io.instruction, 19, 15) @[src/main/scala/riscv/core/fivestage_final/Execute.scala 46:28]
    inst alu of ALU @[src/main/scala/riscv/core/fivestage_final/Execute.scala 48:19]
    alu.clock <= clock
    alu.reset <= reset
    inst alu_ctrl of ALUControl @[src/main/scala/riscv/core/fivestage_final/Execute.scala 49:24]
    alu_ctrl.clock <= clock
    alu_ctrl.reset <= reset
    alu_ctrl.io.opcode <= opcode @[src/main/scala/riscv/core/fivestage_final/Execute.scala 51:22]
    alu_ctrl.io.funct3 <= funct3 @[src/main/scala/riscv/core/fivestage_final/Execute.scala 52:22]
    alu_ctrl.io.funct7 <= funct7 @[src/main/scala/riscv/core/fivestage_final/Execute.scala 53:22]
    alu.io.func <= alu_ctrl.io.alu_funct @[src/main/scala/riscv/core/fivestage_final/Execute.scala 54:15]
    node _reg1_data_T = eq(UInt<2>("h1"), io.reg1_forward) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _reg1_data_T_1 = mux(_reg1_data_T, io.forward_from_mem, io.reg1_data) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _reg1_data_T_2 = eq(UInt<2>("h2"), io.reg1_forward) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node reg1_data = mux(_reg1_data_T_2, io.forward_from_wb, _reg1_data_T_1) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _alu_io_op1_T = eq(io.aluop1_source, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage_final/Execute.scala 65:22]
    node _alu_io_op1_T_1 = mux(_alu_io_op1_T, io.instruction_address, reg1_data) @[src/main/scala/riscv/core/fivestage_final/Execute.scala 64:20]
    alu.io.op1 <= _alu_io_op1_T_1 @[src/main/scala/riscv/core/fivestage_final/Execute.scala 64:14]
    node _reg2_data_T = eq(UInt<2>("h1"), io.reg2_forward) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _reg2_data_T_1 = mux(_reg2_data_T, io.forward_from_mem, io.reg2_data) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _reg2_data_T_2 = eq(UInt<2>("h2"), io.reg2_forward) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node reg2_data = mux(_reg2_data_T_2, io.forward_from_wb, _reg2_data_T_1) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _alu_io_op2_T = eq(io.aluop2_source, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage_final/Execute.scala 79:22]
    node _alu_io_op2_T_1 = mux(_alu_io_op2_T, io.immediate, reg2_data) @[src/main/scala/riscv/core/fivestage_final/Execute.scala 78:20]
    alu.io.op2 <= _alu_io_op2_T_1 @[src/main/scala/riscv/core/fivestage_final/Execute.scala 78:14]
    io.mem_alu_result <= alu.io.result @[src/main/scala/riscv/core/fivestage_final/Execute.scala 83:21]
    io.mem_reg2_data <= reg2_data @[src/main/scala/riscv/core/fivestage_final/Execute.scala 84:20]
    node _io_csr_write_data_T = not(reg1_data) @[src/main/scala/riscv/core/fivestage_final/Execute.scala 87:54]
    node _io_csr_write_data_T_1 = and(io.csr_read_data, _io_csr_write_data_T) @[src/main/scala/riscv/core/fivestage_final/Execute.scala 87:52]
    node _io_csr_write_data_T_2 = or(io.csr_read_data, reg1_data) @[src/main/scala/riscv/core/fivestage_final/Execute.scala 88:52]
    node _io_csr_write_data_T_3 = cat(UInt<27>("h0"), uimm) @[src/main/scala/riscv/core/fivestage_final/Execute.scala 89:38]
    node _io_csr_write_data_T_4 = cat(UInt<27>("h0"), uimm) @[src/main/scala/riscv/core/fivestage_final/Execute.scala 90:59]
    node _io_csr_write_data_T_5 = not(_io_csr_write_data_T_4) @[src/main/scala/riscv/core/fivestage_final/Execute.scala 90:55]
    node _io_csr_write_data_T_6 = and(io.csr_read_data, _io_csr_write_data_T_5) @[src/main/scala/riscv/core/fivestage_final/Execute.scala 90:53]
    node _io_csr_write_data_T_7 = cat(UInt<27>("h0"), uimm) @[src/main/scala/riscv/core/fivestage_final/Execute.scala 91:57]
    node _io_csr_write_data_T_8 = or(io.csr_read_data, _io_csr_write_data_T_7) @[src/main/scala/riscv/core/fivestage_final/Execute.scala 91:53]
    node _io_csr_write_data_T_9 = eq(UInt<1>("h1"), funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_csr_write_data_T_10 = mux(_io_csr_write_data_T_9, reg1_data, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_csr_write_data_T_11 = eq(UInt<2>("h3"), funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_csr_write_data_T_12 = mux(_io_csr_write_data_T_11, _io_csr_write_data_T_1, _io_csr_write_data_T_10) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_csr_write_data_T_13 = eq(UInt<2>("h2"), funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_csr_write_data_T_14 = mux(_io_csr_write_data_T_13, _io_csr_write_data_T_2, _io_csr_write_data_T_12) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_csr_write_data_T_15 = eq(UInt<3>("h5"), funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_csr_write_data_T_16 = mux(_io_csr_write_data_T_15, _io_csr_write_data_T_3, _io_csr_write_data_T_14) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_csr_write_data_T_17 = eq(UInt<3>("h7"), funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_csr_write_data_T_18 = mux(_io_csr_write_data_T_17, _io_csr_write_data_T_6, _io_csr_write_data_T_16) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_csr_write_data_T_19 = eq(UInt<3>("h6"), funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_csr_write_data_T_20 = mux(_io_csr_write_data_T_19, _io_csr_write_data_T_8, _io_csr_write_data_T_18) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    io.csr_write_data <= _io_csr_write_data_T_20 @[src/main/scala/riscv/core/fivestage_final/Execute.scala 85:21]

  module PipelineRegister_20 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_21 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<2>, out : UInt<2>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<2>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_22 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<5>, out : UInt<5>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<5>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_23 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_24 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<3>, out : UInt<3>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_25 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_26 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_27 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_28 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_29 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module EX2MEM :
    input clock : Clock
    input reset : Reset
    output io : { flip regs_write_enable : UInt<1>, flip regs_write_source : UInt<2>, flip regs_write_address : UInt<32>, flip instruction_address : UInt<32>, flip funct3 : UInt<3>, flip reg2_data : UInt<32>, flip memory_read_enable : UInt<1>, flip memory_write_enable : UInt<1>, flip alu_result : UInt<32>, flip csr_read_data : UInt<32>, output_regs_write_enable : UInt<1>, output_regs_write_source : UInt<2>, output_regs_write_address : UInt<32>, output_instruction_address : UInt<32>, output_funct3 : UInt<32>, output_reg2_data : UInt<32>, output_memory_read_enable : UInt<1>, output_memory_write_enable : UInt<1>, output_alu_result : UInt<32>, output_csr_read_data : UInt<32>} @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 22:14]

    inst regs_write_enable of PipelineRegister_20 @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 49:33]
    regs_write_enable.clock <= clock
    regs_write_enable.reset <= reset
    regs_write_enable.io.in <= io.regs_write_enable @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 50:27]
    regs_write_enable.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 51:30]
    regs_write_enable.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 52:30]
    io.output_regs_write_enable <= regs_write_enable.io.out @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 53:31]
    inst regs_write_source of PipelineRegister_21 @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 55:33]
    regs_write_source.clock <= clock
    regs_write_source.reset <= reset
    regs_write_source.io.in <= io.regs_write_source @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 56:27]
    regs_write_source.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 57:30]
    regs_write_source.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 58:30]
    io.output_regs_write_source <= regs_write_source.io.out @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 59:31]
    inst regs_write_address of PipelineRegister_22 @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 61:34]
    regs_write_address.clock <= clock
    regs_write_address.reset <= reset
    regs_write_address.io.in <= io.regs_write_address @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 62:28]
    regs_write_address.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 63:31]
    regs_write_address.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 64:31]
    io.output_regs_write_address <= regs_write_address.io.out @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 65:32]
    inst instruction_address of PipelineRegister_23 @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 67:35]
    instruction_address.clock <= clock
    instruction_address.reset <= reset
    instruction_address.io.in <= io.instruction_address @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 68:29]
    instruction_address.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 69:32]
    instruction_address.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 70:32]
    io.output_instruction_address <= instruction_address.io.out @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 71:33]
    inst funct3 of PipelineRegister_24 @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 73:22]
    funct3.clock <= clock
    funct3.reset <= reset
    funct3.io.in <= io.funct3 @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 74:16]
    funct3.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 75:19]
    funct3.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 76:19]
    io.output_funct3 <= funct3.io.out @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 77:20]
    inst reg2_data of PipelineRegister_25 @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 79:25]
    reg2_data.clock <= clock
    reg2_data.reset <= reset
    reg2_data.io.in <= io.reg2_data @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 80:19]
    reg2_data.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 81:22]
    reg2_data.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 82:22]
    io.output_reg2_data <= reg2_data.io.out @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 83:23]
    inst alu_result of PipelineRegister_26 @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 85:26]
    alu_result.clock <= clock
    alu_result.reset <= reset
    alu_result.io.in <= io.alu_result @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 86:20]
    alu_result.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 87:23]
    alu_result.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 88:23]
    io.output_alu_result <= alu_result.io.out @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 89:24]
    inst memory_read_enable of PipelineRegister_27 @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 91:34]
    memory_read_enable.clock <= clock
    memory_read_enable.reset <= reset
    memory_read_enable.io.in <= io.memory_read_enable @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 92:28]
    memory_read_enable.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 93:31]
    memory_read_enable.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 94:31]
    io.output_memory_read_enable <= memory_read_enable.io.out @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 95:32]
    inst memory_write_enable of PipelineRegister_28 @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 97:35]
    memory_write_enable.clock <= clock
    memory_write_enable.reset <= reset
    memory_write_enable.io.in <= io.memory_write_enable @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 98:29]
    memory_write_enable.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 99:32]
    memory_write_enable.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 100:32]
    io.output_memory_write_enable <= memory_write_enable.io.out @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 101:33]
    inst csr_read_data of PipelineRegister_29 @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 103:29]
    csr_read_data.clock <= clock
    csr_read_data.reset <= reset
    csr_read_data.io.in <= io.csr_read_data @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 104:23]
    csr_read_data.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 105:26]
    csr_read_data.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 106:26]
    io.output_csr_read_data <= csr_read_data.io.out @[src/main/scala/riscv/core/fivestage_final/EX2MEM.scala 107:27]

  module MemoryAccess :
    input clock : Clock
    input reset : Reset
    output io : { flip alu_result : UInt<32>, flip reg2_data : UInt<32>, flip memory_read_enable : UInt<1>, flip memory_write_enable : UInt<1>, flip funct3 : UInt<3>, flip regs_write_source : UInt<2>, flip csr_read_data : UInt<32>, wb_memory_read_data : UInt<32>, forward_data : UInt<32>, flip bundle : { flip address : UInt<32>, flip write_data : UInt<32>, flip write_enable : UInt<1>, flip write_strobe : UInt<1>[4], read_data : UInt<32>}} @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 23:14]

    node mem_address_index = bits(io.alu_result, 1, 0) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 37:40]
    io.bundle.write_enable <= io.memory_write_enable @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 39:26]
    io.bundle.write_data <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 40:24]
    io.bundle.address <= io.alu_result @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 41:21]
    wire _WIRE : UInt<1>[4] @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 42:36]
    _WIRE[0] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 42:36]
    _WIRE[1] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 42:36]
    _WIRE[2] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 42:36]
    _WIRE[3] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 42:36]
    io.bundle.write_strobe <= _WIRE @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 42:26]
    io.wb_memory_read_data <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 43:26]
    when io.memory_read_enable : @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 45:31]
      node _io_wb_memory_read_data_T = bits(io.bundle.read_data, 31, 31) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 53:28]
      node _io_wb_memory_read_data_T_1 = bits(_io_wb_memory_read_data_T, 0, 0) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 53:19]
      node _io_wb_memory_read_data_T_2 = mux(_io_wb_memory_read_data_T_1, UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 53:19]
      node _io_wb_memory_read_data_T_3 = bits(io.bundle.read_data, 31, 24) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 53:39]
      node _io_wb_memory_read_data_T_4 = cat(_io_wb_memory_read_data_T_2, _io_wb_memory_read_data_T_3) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 53:14]
      node _io_wb_memory_read_data_T_5 = bits(io.bundle.read_data, 7, 7) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 55:37]
      node _io_wb_memory_read_data_T_6 = bits(_io_wb_memory_read_data_T_5, 0, 0) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 55:28]
      node _io_wb_memory_read_data_T_7 = mux(_io_wb_memory_read_data_T_6, UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 55:28]
      node _io_wb_memory_read_data_T_8 = bits(io.bundle.read_data, 7, 0) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 55:47]
      node _io_wb_memory_read_data_T_9 = cat(_io_wb_memory_read_data_T_7, _io_wb_memory_read_data_T_8) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 55:23]
      node _io_wb_memory_read_data_T_10 = bits(io.bundle.read_data, 15, 15) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 56:37]
      node _io_wb_memory_read_data_T_11 = bits(_io_wb_memory_read_data_T_10, 0, 0) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 56:28]
      node _io_wb_memory_read_data_T_12 = mux(_io_wb_memory_read_data_T_11, UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 56:28]
      node _io_wb_memory_read_data_T_13 = bits(io.bundle.read_data, 15, 8) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 56:48]
      node _io_wb_memory_read_data_T_14 = cat(_io_wb_memory_read_data_T_12, _io_wb_memory_read_data_T_13) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 56:23]
      node _io_wb_memory_read_data_T_15 = bits(io.bundle.read_data, 23, 23) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 57:37]
      node _io_wb_memory_read_data_T_16 = bits(_io_wb_memory_read_data_T_15, 0, 0) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 57:28]
      node _io_wb_memory_read_data_T_17 = mux(_io_wb_memory_read_data_T_16, UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 57:28]
      node _io_wb_memory_read_data_T_18 = bits(io.bundle.read_data, 23, 16) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 57:48]
      node _io_wb_memory_read_data_T_19 = cat(_io_wb_memory_read_data_T_17, _io_wb_memory_read_data_T_18) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 57:23]
      node _io_wb_memory_read_data_T_20 = eq(UInt<1>("h0"), mem_address_index) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_wb_memory_read_data_T_21 = mux(_io_wb_memory_read_data_T_20, _io_wb_memory_read_data_T_9, _io_wb_memory_read_data_T_4) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_wb_memory_read_data_T_22 = eq(UInt<1>("h1"), mem_address_index) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_wb_memory_read_data_T_23 = mux(_io_wb_memory_read_data_T_22, _io_wb_memory_read_data_T_14, _io_wb_memory_read_data_T_21) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_wb_memory_read_data_T_24 = eq(UInt<2>("h2"), mem_address_index) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_wb_memory_read_data_T_25 = mux(_io_wb_memory_read_data_T_24, _io_wb_memory_read_data_T_19, _io_wb_memory_read_data_T_23) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_wb_memory_read_data_T_26 = mux(UInt<1>("h0"), UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 62:19]
      node _io_wb_memory_read_data_T_27 = bits(io.bundle.read_data, 31, 24) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 62:34]
      node _io_wb_memory_read_data_T_28 = cat(_io_wb_memory_read_data_T_26, _io_wb_memory_read_data_T_27) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 62:14]
      node _io_wb_memory_read_data_T_29 = mux(UInt<1>("h0"), UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 64:28]
      node _io_wb_memory_read_data_T_30 = bits(io.bundle.read_data, 7, 0) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 64:43]
      node _io_wb_memory_read_data_T_31 = cat(_io_wb_memory_read_data_T_29, _io_wb_memory_read_data_T_30) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 64:23]
      node _io_wb_memory_read_data_T_32 = mux(UInt<1>("h0"), UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 65:28]
      node _io_wb_memory_read_data_T_33 = bits(io.bundle.read_data, 15, 8) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 65:43]
      node _io_wb_memory_read_data_T_34 = cat(_io_wb_memory_read_data_T_32, _io_wb_memory_read_data_T_33) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 65:23]
      node _io_wb_memory_read_data_T_35 = mux(UInt<1>("h0"), UInt<24>("hffffff"), UInt<24>("h0")) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 66:28]
      node _io_wb_memory_read_data_T_36 = bits(io.bundle.read_data, 23, 16) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 66:43]
      node _io_wb_memory_read_data_T_37 = cat(_io_wb_memory_read_data_T_35, _io_wb_memory_read_data_T_36) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 66:23]
      node _io_wb_memory_read_data_T_38 = eq(UInt<1>("h0"), mem_address_index) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_wb_memory_read_data_T_39 = mux(_io_wb_memory_read_data_T_38, _io_wb_memory_read_data_T_31, _io_wb_memory_read_data_T_28) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_wb_memory_read_data_T_40 = eq(UInt<1>("h1"), mem_address_index) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_wb_memory_read_data_T_41 = mux(_io_wb_memory_read_data_T_40, _io_wb_memory_read_data_T_34, _io_wb_memory_read_data_T_39) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_wb_memory_read_data_T_42 = eq(UInt<2>("h2"), mem_address_index) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_wb_memory_read_data_T_43 = mux(_io_wb_memory_read_data_T_42, _io_wb_memory_read_data_T_37, _io_wb_memory_read_data_T_41) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_wb_memory_read_data_T_44 = eq(mem_address_index, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 70:29]
      node _io_wb_memory_read_data_T_45 = bits(io.bundle.read_data, 15, 15) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 71:28]
      node _io_wb_memory_read_data_T_46 = bits(_io_wb_memory_read_data_T_45, 0, 0) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 71:19]
      node _io_wb_memory_read_data_T_47 = mux(_io_wb_memory_read_data_T_46, UInt<16>("hffff"), UInt<16>("h0")) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 71:19]
      node _io_wb_memory_read_data_T_48 = bits(io.bundle.read_data, 15, 0) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 71:39]
      node _io_wb_memory_read_data_T_49 = cat(_io_wb_memory_read_data_T_47, _io_wb_memory_read_data_T_48) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 71:14]
      node _io_wb_memory_read_data_T_50 = bits(io.bundle.read_data, 31, 31) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 72:28]
      node _io_wb_memory_read_data_T_51 = bits(_io_wb_memory_read_data_T_50, 0, 0) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 72:19]
      node _io_wb_memory_read_data_T_52 = mux(_io_wb_memory_read_data_T_51, UInt<16>("hffff"), UInt<16>("h0")) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 72:19]
      node _io_wb_memory_read_data_T_53 = bits(io.bundle.read_data, 31, 16) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 72:39]
      node _io_wb_memory_read_data_T_54 = cat(_io_wb_memory_read_data_T_52, _io_wb_memory_read_data_T_53) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 72:14]
      node _io_wb_memory_read_data_T_55 = mux(_io_wb_memory_read_data_T_44, _io_wb_memory_read_data_T_49, _io_wb_memory_read_data_T_54) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 69:36]
      node _io_wb_memory_read_data_T_56 = eq(mem_address_index, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 75:29]
      node _io_wb_memory_read_data_T_57 = mux(UInt<1>("h0"), UInt<16>("hffff"), UInt<16>("h0")) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 76:19]
      node _io_wb_memory_read_data_T_58 = bits(io.bundle.read_data, 15, 0) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 76:34]
      node _io_wb_memory_read_data_T_59 = cat(_io_wb_memory_read_data_T_57, _io_wb_memory_read_data_T_58) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 76:14]
      node _io_wb_memory_read_data_T_60 = mux(UInt<1>("h0"), UInt<16>("hffff"), UInt<16>("h0")) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 77:19]
      node _io_wb_memory_read_data_T_61 = bits(io.bundle.read_data, 31, 16) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 77:34]
      node _io_wb_memory_read_data_T_62 = cat(_io_wb_memory_read_data_T_60, _io_wb_memory_read_data_T_61) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 77:14]
      node _io_wb_memory_read_data_T_63 = mux(_io_wb_memory_read_data_T_56, _io_wb_memory_read_data_T_59, _io_wb_memory_read_data_T_62) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 74:37]
      node _io_wb_memory_read_data_T_64 = eq(UInt<1>("h0"), io.funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_wb_memory_read_data_T_65 = mux(_io_wb_memory_read_data_T_64, _io_wb_memory_read_data_T_25, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_wb_memory_read_data_T_66 = eq(UInt<3>("h4"), io.funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_wb_memory_read_data_T_67 = mux(_io_wb_memory_read_data_T_66, _io_wb_memory_read_data_T_43, _io_wb_memory_read_data_T_65) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_wb_memory_read_data_T_68 = eq(UInt<1>("h1"), io.funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_wb_memory_read_data_T_69 = mux(_io_wb_memory_read_data_T_68, _io_wb_memory_read_data_T_55, _io_wb_memory_read_data_T_67) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_wb_memory_read_data_T_70 = eq(UInt<3>("h5"), io.funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_wb_memory_read_data_T_71 = mux(_io_wb_memory_read_data_T_70, _io_wb_memory_read_data_T_63, _io_wb_memory_read_data_T_69) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_wb_memory_read_data_T_72 = eq(UInt<2>("h2"), io.funct3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_wb_memory_read_data_T_73 = mux(_io_wb_memory_read_data_T_72, io.bundle.read_data, _io_wb_memory_read_data_T_71) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      io.wb_memory_read_data <= _io_wb_memory_read_data_T_73 @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 47:28]
    else :
      when io.memory_write_enable : @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 82:38]
        io.bundle.write_data <= io.reg2_data @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 83:26]
        wire _WIRE_1 : UInt<1>[4] @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 84:38]
        _WIRE_1[0] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 84:38]
        _WIRE_1[1] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 84:38]
        _WIRE_1[2] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 84:38]
        _WIRE_1[3] <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 84:38]
        io.bundle.write_strobe <= _WIRE_1 @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 84:28]
        node _T = eq(io.funct3, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 85:20]
        when _T : @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 85:46]
          io.bundle.write_strobe[mem_address_index] <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 86:49]
          node _io_bundle_write_data_T = bits(io.reg2_data, 8, 0) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 87:43]
          node _io_bundle_write_data_T_1 = dshl(mem_address_index, UInt<2>("h3")) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 87:90]
          node _io_bundle_write_data_T_2 = dshl(_io_bundle_write_data_T, _io_bundle_write_data_T_1) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 87:68]
          io.bundle.write_data <= _io_bundle_write_data_T_2 @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 87:28]
        else :
          node _T_1 = eq(io.funct3, UInt<1>("h1")) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 88:26]
          when _T_1 : @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 88:52]
            node _T_2 = eq(mem_address_index, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 89:30]
            when _T_2 : @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 89:39]
              io.bundle.write_strobe[0] <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 91:37]
              io.bundle.write_strobe[1] <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 91:37]
              node _io_bundle_write_data_T_3 = bits(io.reg2_data, 16, 0) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 93:45]
              io.bundle.write_data <= _io_bundle_write_data_T_3 @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 93:30]
            else :
              io.bundle.write_strobe[2] <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 96:37]
              io.bundle.write_strobe[3] <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 96:37]
              node _io_bundle_write_data_T_4 = bits(io.reg2_data, 16, 0) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 98:45]
              node _io_bundle_write_data_T_5 = shl(_io_bundle_write_data_T_4, 16) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 98:96]
              io.bundle.write_data <= _io_bundle_write_data_T_5 @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 98:30]
          else :
            node _T_3 = eq(io.funct3, UInt<2>("h2")) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 101:26]
            when _T_3 : @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 101:52]
              io.bundle.write_strobe[0] <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 103:35]
              io.bundle.write_strobe[1] <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 103:35]
              io.bundle.write_strobe[2] <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 103:35]
              io.bundle.write_strobe[3] <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 103:35]
    node _io_forward_data_T = eq(io.regs_write_source, UInt<2>("h2")) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 108:47]
    node _io_forward_data_T_1 = mux(_io_forward_data_T, io.csr_read_data, io.alu_result) @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 108:25]
    io.forward_data <= _io_forward_data_T_1 @[src/main/scala/riscv/core/fivestage_final/MemoryAccess.scala 108:19]

  module PipelineRegister_30 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_31 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_32 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<1>, out : UInt<1>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_33 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<2>, out : UInt<2>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<2>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_34 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<5>, out : UInt<5>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<5>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_35 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module PipelineRegister_36 :
    input clock : Clock
    input reset : Reset
    output io : { flip stall : UInt<1>, flip flush : UInt<1>, flip in : UInt<32>, out : UInt<32>} @[src/main/scala/riscv/core/PipelineRegister.scala 21:14]

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 28:20]
    when io.flush : @[src/main/scala/riscv/core/PipelineRegister.scala 30:18]
      reg <= UInt<1>("h0") @[src/main/scala/riscv/core/PipelineRegister.scala 31:9]
    else :
      node _T = eq(io.stall, UInt<1>("h0")) @[src/main/scala/riscv/core/PipelineRegister.scala 32:14]
      when _T : @[src/main/scala/riscv/core/PipelineRegister.scala 32:25]
        reg <= io.in @[src/main/scala/riscv/core/PipelineRegister.scala 33:9]
    io.out <= reg @[src/main/scala/riscv/core/PipelineRegister.scala 35:10]

  module MEM2WB :
    input clock : Clock
    input reset : Reset
    output io : { flip instruction_address : UInt<32>, flip alu_result : UInt<32>, flip regs_write_enable : UInt<1>, flip regs_write_source : UInt<2>, flip regs_write_address : UInt<32>, flip memory_read_data : UInt<32>, flip csr_read_data : UInt<32>, output_instruction_address : UInt<32>, output_alu_result : UInt<32>, output_regs_write_enable : UInt<1>, output_regs_write_source : UInt<2>, output_regs_write_address : UInt<32>, output_memory_read_data : UInt<32>, output_csr_read_data : UInt<32>} @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 22:14]

    inst alu_result of PipelineRegister_30 @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 42:26]
    alu_result.clock <= clock
    alu_result.reset <= reset
    alu_result.io.in <= io.alu_result @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 43:20]
    alu_result.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 44:23]
    alu_result.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 45:23]
    io.output_alu_result <= alu_result.io.out @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 46:24]
    inst memory_read_data of PipelineRegister_31 @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 48:32]
    memory_read_data.clock <= clock
    memory_read_data.reset <= reset
    memory_read_data.io.in <= io.memory_read_data @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 49:26]
    memory_read_data.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 50:29]
    memory_read_data.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 51:29]
    io.output_memory_read_data <= memory_read_data.io.out @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 52:30]
    inst regs_write_enable of PipelineRegister_32 @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 54:33]
    regs_write_enable.clock <= clock
    regs_write_enable.reset <= reset
    regs_write_enable.io.in <= io.regs_write_enable @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 55:27]
    regs_write_enable.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 56:30]
    regs_write_enable.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 57:30]
    io.output_regs_write_enable <= regs_write_enable.io.out @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 58:31]
    inst regs_write_source of PipelineRegister_33 @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 60:33]
    regs_write_source.clock <= clock
    regs_write_source.reset <= reset
    regs_write_source.io.in <= io.regs_write_source @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 61:27]
    regs_write_source.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 62:30]
    regs_write_source.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 63:30]
    io.output_regs_write_source <= regs_write_source.io.out @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 64:31]
    inst regs_write_address of PipelineRegister_34 @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 66:34]
    regs_write_address.clock <= clock
    regs_write_address.reset <= reset
    regs_write_address.io.in <= io.regs_write_address @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 67:28]
    regs_write_address.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 68:31]
    regs_write_address.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 69:31]
    io.output_regs_write_address <= regs_write_address.io.out @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 70:32]
    inst instruction_address of PipelineRegister_35 @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 72:35]
    instruction_address.clock <= clock
    instruction_address.reset <= reset
    instruction_address.io.in <= io.instruction_address @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 73:29]
    instruction_address.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 74:32]
    instruction_address.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 75:32]
    io.output_instruction_address <= instruction_address.io.out @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 76:33]
    inst csr_read_data of PipelineRegister_36 @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 78:29]
    csr_read_data.clock <= clock
    csr_read_data.reset <= reset
    csr_read_data.io.in <= io.csr_read_data @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 79:23]
    csr_read_data.io.stall <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 80:26]
    csr_read_data.io.flush <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 81:26]
    io.output_csr_read_data <= csr_read_data.io.out @[src/main/scala/riscv/core/fivestage_final/MEM2WB.scala 82:27]

  module WriteBack :
    input clock : Clock
    input reset : Reset
    output io : { flip instruction_address : UInt<32>, flip alu_result : UInt<32>, flip memory_read_data : UInt<32>, flip regs_write_source : UInt<2>, flip csr_read_data : UInt<32>, regs_write_data : UInt<32>} @[src/main/scala/riscv/core/fivestage_final/WriteBack.scala 22:14]

    node _io_regs_write_data_T = add(io.instruction_address, UInt<3>("h4")) @[src/main/scala/riscv/core/fivestage_final/WriteBack.scala 37:72]
    node _io_regs_write_data_T_1 = tail(_io_regs_write_data_T, 1) @[src/main/scala/riscv/core/fivestage_final/WriteBack.scala 37:72]
    node _io_regs_write_data_T_2 = eq(UInt<2>("h1"), io.regs_write_source) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_regs_write_data_T_3 = mux(_io_regs_write_data_T_2, io.memory_read_data, io.alu_result) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_regs_write_data_T_4 = eq(UInt<2>("h2"), io.regs_write_source) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_regs_write_data_T_5 = mux(_io_regs_write_data_T_4, io.csr_read_data, _io_regs_write_data_T_3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_regs_write_data_T_6 = eq(UInt<2>("h3"), io.regs_write_source) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_regs_write_data_T_7 = mux(_io_regs_write_data_T_6, _io_regs_write_data_T_1, _io_regs_write_data_T_5) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    io.regs_write_data <= _io_regs_write_data_T_7 @[src/main/scala/riscv/core/fivestage_final/WriteBack.scala 31:22]

  module Forwarding :
    input clock : Clock
    input reset : Reset
    output io : { flip rs1_id : UInt<5>, flip rs2_id : UInt<5>, flip rs1_ex : UInt<5>, flip rs2_ex : UInt<5>, flip rd_mem : UInt<5>, flip reg_write_enable_mem : UInt<1>, flip rd_wb : UInt<5>, flip reg_write_enable_wb : UInt<1>, reg1_forward_id : UInt<2>, reg2_forward_id : UInt<2>, reg1_forward_ex : UInt<2>, reg2_forward_ex : UInt<2>} @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 27:14]

    node _T = neq(io.rd_mem, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 44:45]
    node _T_1 = and(io.reg_write_enable_mem, _T) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 44:32]
    node _T_2 = eq(io.rd_mem, io.rs1_id) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 44:66]
    node _T_3 = and(_T_1, _T_2) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 44:53]
    when _T_3 : @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 44:81]
      io.reg1_forward_id <= UInt<2>("h1") @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 45:24]
    else :
      node _T_4 = neq(io.rd_wb, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 46:49]
      node _T_5 = and(io.reg_write_enable_wb, _T_4) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 46:37]
      node _T_6 = eq(io.rd_wb, io.rs1_id) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 46:69]
      node _T_7 = and(_T_5, _T_6) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 46:57]
      when _T_7 : @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 46:84]
        io.reg1_forward_id <= UInt<2>("h2") @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 47:24]
      else :
        io.reg1_forward_id <= UInt<2>("h0") @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 49:24]
    node _T_8 = neq(io.rd_mem, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 52:45]
    node _T_9 = and(io.reg_write_enable_mem, _T_8) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 52:32]
    node _T_10 = eq(io.rd_mem, io.rs2_id) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 52:66]
    node _T_11 = and(_T_9, _T_10) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 52:53]
    when _T_11 : @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 52:81]
      io.reg2_forward_id <= UInt<2>("h1") @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 53:24]
    else :
      node _T_12 = neq(io.rd_wb, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 54:49]
      node _T_13 = and(io.reg_write_enable_wb, _T_12) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 54:37]
      node _T_14 = eq(io.rd_wb, io.rs2_id) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 54:69]
      node _T_15 = and(_T_13, _T_14) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 54:57]
      when _T_15 : @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 54:84]
        io.reg2_forward_id <= UInt<2>("h2") @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 55:24]
      else :
        io.reg2_forward_id <= UInt<2>("h0") @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 57:24]
    node _T_16 = neq(io.rd_mem, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 60:45]
    node _T_17 = and(io.reg_write_enable_mem, _T_16) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 60:32]
    node _T_18 = eq(io.rd_mem, io.rs1_ex) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 60:66]
    node _T_19 = and(_T_17, _T_18) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 60:53]
    when _T_19 : @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 60:81]
      io.reg1_forward_ex <= UInt<2>("h1") @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 61:24]
    else :
      node _T_20 = neq(io.rd_wb, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 62:49]
      node _T_21 = and(io.reg_write_enable_wb, _T_20) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 62:37]
      node _T_22 = eq(io.rd_wb, io.rs1_ex) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 62:69]
      node _T_23 = and(_T_21, _T_22) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 62:57]
      when _T_23 : @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 62:84]
        io.reg1_forward_ex <= UInt<2>("h2") @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 63:24]
      else :
        io.reg1_forward_ex <= UInt<2>("h0") @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 65:24]
    node _T_24 = neq(io.rd_mem, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 68:45]
    node _T_25 = and(io.reg_write_enable_mem, _T_24) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 68:32]
    node _T_26 = eq(io.rd_mem, io.rs2_ex) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 68:66]
    node _T_27 = and(_T_25, _T_26) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 68:53]
    when _T_27 : @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 68:81]
      io.reg2_forward_ex <= UInt<2>("h1") @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 69:24]
    else :
      node _T_28 = neq(io.rd_wb, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 70:49]
      node _T_29 = and(io.reg_write_enable_wb, _T_28) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 70:37]
      node _T_30 = eq(io.rd_wb, io.rs2_ex) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 70:69]
      node _T_31 = and(_T_29, _T_30) @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 70:57]
      when _T_31 : @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 70:84]
        io.reg2_forward_ex <= UInt<2>("h2") @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 71:24]
      else :
        io.reg2_forward_ex <= UInt<2>("h0") @[src/main/scala/riscv/core/fivestage_final/Forwarding.scala 73:24]


  module CLINT :
    input clock : Clock
    input reset : Reset
    output io : { flip interrupt_flag : UInt<32>, flip instruction_id : UInt<32>, flip instruction_address_if : UInt<32>, flip jump_flag : UInt<1>, flip jump_address : UInt<32>, id_interrupt_handler_address : UInt<32>, id_interrupt_assert : UInt<1>, csr_bundle : { flip mstatus : UInt<32>, flip mepc : UInt<32>, flip mcause : UInt<32>, flip mtvec : UInt<32>, mstatus_write_data : UInt<32>, mepc_write_data : UInt<32>, mcause_write_data : UInt<32>, direct_write_enable : UInt<1>}} @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 42:14]

    node interrupt_enable = bits(io.csr_bundle.mstatus, 3, 3) @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 56:47]
    node instruction_address = mux(io.jump_flag, io.jump_address, io.instruction_address_if) @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 57:32]
    node _mstatus_disable_interrupt_T = bits(io.csr_bundle.mstatus, 31, 4) @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 62:56]
    node _mstatus_disable_interrupt_T_1 = cat(_mstatus_disable_interrupt_T, UInt<1>("h0")) @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 62:64]
    node _mstatus_disable_interrupt_T_2 = bits(io.csr_bundle.mstatus, 2, 0) @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 62:100]
    node mstatus_disable_interrupt = cat(_mstatus_disable_interrupt_T_1, _mstatus_disable_interrupt_T_2) @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 62:76]
    node _mstatus_recover_interrupt_T = bits(io.csr_bundle.mstatus, 31, 4) @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 63:56]
    node _mstatus_recover_interrupt_T_1 = bits(io.csr_bundle.mstatus, 7, 7) @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 63:88]
    node _mstatus_recover_interrupt_T_2 = cat(_mstatus_recover_interrupt_T, _mstatus_recover_interrupt_T_1) @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 63:64]
    node _mstatus_recover_interrupt_T_3 = bits(io.csr_bundle.mstatus, 2, 0) @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 63:116]
    node mstatus_recover_interrupt = cat(_mstatus_recover_interrupt_T_2, _mstatus_recover_interrupt_T_3) @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 63:92]
    node _T = eq(io.instruction_id, UInt<32>("h73")) @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 65:26]
    node _T_1 = eq(io.instruction_id, UInt<32>("h100073")) @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 65:73]
    node _T_2 = or(_T, _T_1) @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 65:52]
    when _T_2 : @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 65:101]
      io.csr_bundle.mstatus_write_data <= mstatus_disable_interrupt @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 66:38]
      io.csr_bundle.mepc_write_data <= instruction_address @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 67:35]
      node _io_csr_bundle_mcause_write_data_T = eq(UInt<32>("h73"), io.instruction_id) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_csr_bundle_mcause_write_data_T_1 = mux(_io_csr_bundle_mcause_write_data_T, UInt<4>("hb"), UInt<4>("ha")) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_csr_bundle_mcause_write_data_T_2 = eq(UInt<32>("h100073"), io.instruction_id) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      node _io_csr_bundle_mcause_write_data_T_3 = mux(_io_csr_bundle_mcause_write_data_T_2, UInt<2>("h3"), _io_csr_bundle_mcause_write_data_T_1) @[src/main/scala/chisel3/util/Mux.scala 77:13]
      io.csr_bundle.mcause_write_data <= _io_csr_bundle_mcause_write_data_T_3 @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 68:37]
      io.csr_bundle.direct_write_enable <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 76:39]
      io.id_interrupt_assert <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 77:28]
      io.id_interrupt_handler_address <= io.csr_bundle.mtvec @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 78:37]
    else :
      node _T_3 = neq(io.interrupt_flag, UInt<8>("h0")) @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 79:32]
      node _T_4 = and(_T_3, interrupt_enable) @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 79:57]
      when _T_4 : @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 79:78]
        io.csr_bundle.mstatus_write_data <= mstatus_disable_interrupt @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 80:38]
        io.csr_bundle.mepc_write_data <= instruction_address @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 81:35]
        node _io_csr_bundle_mcause_write_data_T_4 = bits(io.interrupt_flag, 0, 0) @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 82:61]
        node _io_csr_bundle_mcause_write_data_T_5 = mux(_io_csr_bundle_mcause_write_data_T_4, UInt<32>("h80000007"), UInt<32>("h8000000b")) @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 82:43]
        io.csr_bundle.mcause_write_data <= _io_csr_bundle_mcause_write_data_T_5 @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 82:37]
        io.csr_bundle.direct_write_enable <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 83:39]
        io.id_interrupt_assert <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 84:28]
        io.id_interrupt_handler_address <= io.csr_bundle.mtvec @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 85:37]
      else :
        node _T_5 = eq(io.instruction_id, UInt<32>("h30200073")) @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 86:32]
        when _T_5 : @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 86:58]
          io.csr_bundle.mstatus_write_data <= mstatus_recover_interrupt @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 87:38]
          io.csr_bundle.mepc_write_data <= io.csr_bundle.mepc @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 88:35]
          io.csr_bundle.mcause_write_data <= io.csr_bundle.mcause @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 89:37]
          io.csr_bundle.direct_write_enable <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 90:39]
          io.id_interrupt_assert <= UInt<1>("h1") @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 91:28]
          io.id_interrupt_handler_address <= io.csr_bundle.mepc @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 92:37]
        else :
          io.csr_bundle.mstatus_write_data <= io.csr_bundle.mstatus @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 94:38]
          io.csr_bundle.mepc_write_data <= io.csr_bundle.mepc @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 95:35]
          io.csr_bundle.mcause_write_data <= io.csr_bundle.mcause @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 96:37]
          io.csr_bundle.direct_write_enable <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 97:39]
          io.id_interrupt_assert <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 98:28]
          io.id_interrupt_handler_address <= UInt<1>("h0") @[src/main/scala/riscv/core/fivestage_final/CLINT.scala 99:37]


  module CSR :
    input clock : Clock
    input reset : Reset
    output io : { flip reg_read_address_id : UInt<12>, flip reg_write_enable_ex : UInt<1>, flip reg_write_address_ex : UInt<12>, flip reg_write_data_ex : UInt<32>, id_reg_read_data : UInt<32>, flip clint_access_bundle : { flip mstatus : UInt<32>, flip mepc : UInt<32>, flip mcause : UInt<32>, flip mtvec : UInt<32>, mstatus_write_data : UInt<32>, mepc_write_data : UInt<32>, mcause_write_data : UInt<32>, direct_write_enable : UInt<1>}} @[src/main/scala/riscv/core/CSR.scala 36:14]

    reg mstatus : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/CSR.scala 47:24]
    reg mie : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/CSR.scala 48:20]
    reg mtvec : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/CSR.scala 49:22]
    reg mscratch : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/CSR.scala 50:25]
    reg mepc : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/CSR.scala 51:21]
    reg mcause : UInt<32>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/CSR.scala 52:23]
    reg cycles : UInt<64>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/riscv/core/CSR.scala 53:23]
    node _T = bits(cycles, 31, 0) @[src/main/scala/riscv/core/CSR.scala 62:35]
    node _T_1 = bits(cycles, 63, 32) @[src/main/scala/riscv/core/CSR.scala 63:35]
    node _cycles_T = add(cycles, UInt<1>("h1")) @[src/main/scala/riscv/core/CSR.scala 65:20]
    node _cycles_T_1 = tail(_cycles_T, 1) @[src/main/scala/riscv/core/CSR.scala 65:20]
    cycles <= _cycles_T_1 @[src/main/scala/riscv/core/CSR.scala 65:10]
    node _io_id_reg_read_data_T = eq(UInt<12>("h300"), io.reg_read_address_id) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_id_reg_read_data_T_1 = mux(_io_id_reg_read_data_T, mstatus, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_id_reg_read_data_T_2 = eq(UInt<12>("h304"), io.reg_read_address_id) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_id_reg_read_data_T_3 = mux(_io_id_reg_read_data_T_2, mie, _io_id_reg_read_data_T_1) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_id_reg_read_data_T_4 = eq(UInt<12>("h305"), io.reg_read_address_id) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_id_reg_read_data_T_5 = mux(_io_id_reg_read_data_T_4, mtvec, _io_id_reg_read_data_T_3) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_id_reg_read_data_T_6 = eq(UInt<12>("h340"), io.reg_read_address_id) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_id_reg_read_data_T_7 = mux(_io_id_reg_read_data_T_6, mscratch, _io_id_reg_read_data_T_5) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_id_reg_read_data_T_8 = eq(UInt<12>("h341"), io.reg_read_address_id) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_id_reg_read_data_T_9 = mux(_io_id_reg_read_data_T_8, mepc, _io_id_reg_read_data_T_7) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_id_reg_read_data_T_10 = eq(UInt<12>("h342"), io.reg_read_address_id) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_id_reg_read_data_T_11 = mux(_io_id_reg_read_data_T_10, mcause, _io_id_reg_read_data_T_9) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_id_reg_read_data_T_12 = eq(UInt<12>("hc00"), io.reg_read_address_id) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_id_reg_read_data_T_13 = mux(_io_id_reg_read_data_T_12, _T, _io_id_reg_read_data_T_11) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_id_reg_read_data_T_14 = eq(UInt<12>("hc80"), io.reg_read_address_id) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _io_id_reg_read_data_T_15 = mux(_io_id_reg_read_data_T_14, _T_1, _io_id_reg_read_data_T_13) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    io.id_reg_read_data <= _io_id_reg_read_data_T_15 @[src/main/scala/riscv/core/CSR.scala 69:23]
    node _io_clint_access_bundle_mstatus_T = eq(io.reg_write_address_ex, UInt<12>("h300")) @[src/main/scala/riscv/core/CSR.scala 71:91]
    node _io_clint_access_bundle_mstatus_T_1 = and(io.reg_write_enable_ex, _io_clint_access_bundle_mstatus_T) @[src/main/scala/riscv/core/CSR.scala 71:64]
    node _io_clint_access_bundle_mstatus_T_2 = mux(_io_clint_access_bundle_mstatus_T_1, io.reg_write_data_ex, mstatus) @[src/main/scala/riscv/core/CSR.scala 71:40]
    io.clint_access_bundle.mstatus <= _io_clint_access_bundle_mstatus_T_2 @[src/main/scala/riscv/core/CSR.scala 71:34]
    node _io_clint_access_bundle_mtvec_T = eq(io.reg_write_address_ex, UInt<12>("h305")) @[src/main/scala/riscv/core/CSR.scala 72:89]
    node _io_clint_access_bundle_mtvec_T_1 = and(io.reg_write_enable_ex, _io_clint_access_bundle_mtvec_T) @[src/main/scala/riscv/core/CSR.scala 72:62]
    node _io_clint_access_bundle_mtvec_T_2 = mux(_io_clint_access_bundle_mtvec_T_1, io.reg_write_data_ex, mtvec) @[src/main/scala/riscv/core/CSR.scala 72:38]
    io.clint_access_bundle.mtvec <= _io_clint_access_bundle_mtvec_T_2 @[src/main/scala/riscv/core/CSR.scala 72:32]
    node _io_clint_access_bundle_mcause_T = eq(io.reg_write_address_ex, UInt<12>("h342")) @[src/main/scala/riscv/core/CSR.scala 73:90]
    node _io_clint_access_bundle_mcause_T_1 = and(io.reg_write_enable_ex, _io_clint_access_bundle_mcause_T) @[src/main/scala/riscv/core/CSR.scala 73:63]
    node _io_clint_access_bundle_mcause_T_2 = mux(_io_clint_access_bundle_mcause_T_1, io.reg_write_data_ex, mcause) @[src/main/scala/riscv/core/CSR.scala 73:39]
    io.clint_access_bundle.mcause <= _io_clint_access_bundle_mcause_T_2 @[src/main/scala/riscv/core/CSR.scala 73:33]
    node _io_clint_access_bundle_mepc_T = eq(io.reg_write_address_ex, UInt<12>("h341")) @[src/main/scala/riscv/core/CSR.scala 74:88]
    node _io_clint_access_bundle_mepc_T_1 = and(io.reg_write_enable_ex, _io_clint_access_bundle_mepc_T) @[src/main/scala/riscv/core/CSR.scala 74:61]
    node _io_clint_access_bundle_mepc_T_2 = mux(_io_clint_access_bundle_mepc_T_1, io.reg_write_data_ex, mepc) @[src/main/scala/riscv/core/CSR.scala 74:37]
    io.clint_access_bundle.mepc <= _io_clint_access_bundle_mepc_T_2 @[src/main/scala/riscv/core/CSR.scala 74:31]
    when io.clint_access_bundle.direct_write_enable : @[src/main/scala/riscv/core/CSR.scala 76:52]
      mstatus <= io.clint_access_bundle.mstatus_write_data @[src/main/scala/riscv/core/CSR.scala 77:13]
      mepc <= io.clint_access_bundle.mepc_write_data @[src/main/scala/riscv/core/CSR.scala 78:10]
      mcause <= io.clint_access_bundle.mcause_write_data @[src/main/scala/riscv/core/CSR.scala 79:12]
    else :
      when io.reg_write_enable_ex : @[src/main/scala/riscv/core/CSR.scala 80:38]
        node _T_2 = eq(io.reg_write_address_ex, UInt<12>("h300")) @[src/main/scala/riscv/core/CSR.scala 81:34]
        when _T_2 : @[src/main/scala/riscv/core/CSR.scala 81:59]
          mstatus <= io.reg_write_data_ex @[src/main/scala/riscv/core/CSR.scala 82:15]
        else :
          node _T_3 = eq(io.reg_write_address_ex, UInt<12>("h341")) @[src/main/scala/riscv/core/CSR.scala 83:40]
          when _T_3 : @[src/main/scala/riscv/core/CSR.scala 83:62]
            mepc <= io.reg_write_data_ex @[src/main/scala/riscv/core/CSR.scala 84:12]
          else :
            node _T_4 = eq(io.reg_write_address_ex, UInt<12>("h342")) @[src/main/scala/riscv/core/CSR.scala 85:40]
            when _T_4 : @[src/main/scala/riscv/core/CSR.scala 85:64]
              mcause <= io.reg_write_data_ex @[src/main/scala/riscv/core/CSR.scala 86:14]
    when io.reg_write_enable_ex : @[src/main/scala/riscv/core/CSR.scala 90:32]
      node _T_5 = eq(io.reg_write_address_ex, UInt<12>("h304")) @[src/main/scala/riscv/core/CSR.scala 91:34]
      when _T_5 : @[src/main/scala/riscv/core/CSR.scala 91:55]
        mie <= io.reg_write_data_ex @[src/main/scala/riscv/core/CSR.scala 92:11]
      else :
        node _T_6 = eq(io.reg_write_address_ex, UInt<12>("h305")) @[src/main/scala/riscv/core/CSR.scala 93:40]
        when _T_6 : @[src/main/scala/riscv/core/CSR.scala 93:63]
          mtvec <= io.reg_write_data_ex @[src/main/scala/riscv/core/CSR.scala 94:13]
        else :
          node _T_7 = eq(io.reg_write_address_ex, UInt<12>("h340")) @[src/main/scala/riscv/core/CSR.scala 95:40]
          when _T_7 : @[src/main/scala/riscv/core/CSR.scala 95:66]
            mscratch <= io.reg_write_data_ex @[src/main/scala/riscv/core/CSR.scala 96:16]


  module CPU :
    input clock : Clock
    input reset : Reset
    output io : { instruction_address : UInt<32>, flip instruction : UInt<32>, flip instruction_valid : UInt<1>, flip memory_bundle : { flip address : UInt<32>, flip write_data : UInt<32>, flip write_enable : UInt<1>, flip write_strobe : UInt<1>[4], read_data : UInt<32>}, device_select : UInt<3>, flip interrupt_flag : UInt<32>, flip debug_read_address : UInt<5>, debug_read_data : UInt<32>} @[src/main/scala/riscv/core/fivestage_final/CPU.scala 22:14]

    inst ctrl of Control @[src/main/scala/riscv/core/fivestage_final/CPU.scala 24:20]
    ctrl.clock <= clock
    ctrl.reset <= reset
    inst regs of RegisterFile @[src/main/scala/riscv/core/fivestage_final/CPU.scala 25:20]
    regs.clock <= clock
    regs.reset <= reset
    inst inst_fetch of InstructionFetch @[src/main/scala/riscv/core/fivestage_final/CPU.scala 26:26]
    inst_fetch.clock <= clock
    inst_fetch.reset <= reset
    inst if2id of IF2ID @[src/main/scala/riscv/core/fivestage_final/CPU.scala 27:21]
    if2id.clock <= clock
    if2id.reset <= reset
    inst id of InstructionDecode @[src/main/scala/riscv/core/fivestage_final/CPU.scala 28:18]
    id.clock <= clock
    id.reset <= reset
    inst id2ex of ID2EX @[src/main/scala/riscv/core/fivestage_final/CPU.scala 29:21]
    id2ex.clock <= clock
    id2ex.reset <= reset
    inst ex of Execute @[src/main/scala/riscv/core/fivestage_final/CPU.scala 30:18]
    ex.clock <= clock
    ex.reset <= reset
    inst ex2mem of EX2MEM @[src/main/scala/riscv/core/fivestage_final/CPU.scala 31:22]
    ex2mem.clock <= clock
    ex2mem.reset <= reset
    inst mem of MemoryAccess @[src/main/scala/riscv/core/fivestage_final/CPU.scala 32:19]
    mem.clock <= clock
    mem.reset <= reset
    inst mem2wb of MEM2WB @[src/main/scala/riscv/core/fivestage_final/CPU.scala 33:22]
    mem2wb.clock <= clock
    mem2wb.reset <= reset
    inst wb of WriteBack @[src/main/scala/riscv/core/fivestage_final/CPU.scala 34:18]
    wb.clock <= clock
    wb.reset <= reset
    inst forwarding of Forwarding @[src/main/scala/riscv/core/fivestage_final/CPU.scala 35:26]
    forwarding.clock <= clock
    forwarding.reset <= reset
    inst clint of CLINT @[src/main/scala/riscv/core/fivestage_final/CPU.scala 36:21]
    clint.clock <= clock
    clint.reset <= reset
    inst csr_regs of CSR @[src/main/scala/riscv/core/fivestage_final/CPU.scala 37:24]
    csr_regs.clock <= clock
    csr_regs.reset <= reset
    ctrl.io.jump_flag <= id.io.if_jump_flag @[src/main/scala/riscv/core/fivestage_final/CPU.scala 39:21]
    ctrl.io.jump_instruction_id <= id.io.ctrl_jump_instruction @[src/main/scala/riscv/core/fivestage_final/CPU.scala 40:31]
    ctrl.io.rs1_id <= id.io.regs_reg1_read_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 41:18]
    ctrl.io.rs2_id <= id.io.regs_reg2_read_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 42:18]
    ctrl.io.memory_read_enable_ex <= id2ex.io.output_memory_read_enable @[src/main/scala/riscv/core/fivestage_final/CPU.scala 43:33]
    ctrl.io.rd_ex <= id2ex.io.output_regs_write_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 44:17]
    ctrl.io.memory_read_enable_mem <= ex2mem.io.output_memory_read_enable @[src/main/scala/riscv/core/fivestage_final/CPU.scala 45:34]
    ctrl.io.rd_mem <= ex2mem.io.output_regs_write_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 46:18]
    regs.io.write_enable <= mem2wb.io.output_regs_write_enable @[src/main/scala/riscv/core/fivestage_final/CPU.scala 48:24]
    regs.io.write_address <= mem2wb.io.output_regs_write_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 49:25]
    regs.io.write_data <= wb.io.regs_write_data @[src/main/scala/riscv/core/fivestage_final/CPU.scala 50:22]
    regs.io.read_address1 <= id.io.regs_reg1_read_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 51:25]
    regs.io.read_address2 <= id.io.regs_reg2_read_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 52:25]
    regs.io.debug_read_address <= io.debug_read_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 54:30]
    io.debug_read_data <= regs.io.debug_read_data @[src/main/scala/riscv/core/fivestage_final/CPU.scala 55:22]
    io.instruction_address <= inst_fetch.io.instruction_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 57:26]
    inst_fetch.io.stall_flag_ctrl <= ctrl.io.pc_stall @[src/main/scala/riscv/core/fivestage_final/CPU.scala 58:33]
    inst_fetch.io.jump_flag_id <= id.io.if_jump_flag @[src/main/scala/riscv/core/fivestage_final/CPU.scala 59:30]
    inst_fetch.io.jump_address_id <= id.io.if_jump_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 60:33]
    inst_fetch.io.rom_instruction <= io.instruction @[src/main/scala/riscv/core/fivestage_final/CPU.scala 61:33]
    inst_fetch.io.instruction_valid <= io.instruction_valid @[src/main/scala/riscv/core/fivestage_final/CPU.scala 62:35]
    if2id.io.stall <= ctrl.io.if_stall @[src/main/scala/riscv/core/fivestage_final/CPU.scala 64:18]
    if2id.io.flush <= ctrl.io.if_flush @[src/main/scala/riscv/core/fivestage_final/CPU.scala 65:18]
    if2id.io.instruction <= inst_fetch.io.id_instruction @[src/main/scala/riscv/core/fivestage_final/CPU.scala 66:24]
    if2id.io.instruction_address <= inst_fetch.io.instruction_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 67:32]
    if2id.io.interrupt_flag <= io.interrupt_flag @[src/main/scala/riscv/core/fivestage_final/CPU.scala 68:27]
    id.io.instruction <= if2id.io.output_instruction @[src/main/scala/riscv/core/fivestage_final/CPU.scala 70:21]
    id.io.instruction_address <= if2id.io.output_instruction_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 71:29]
    id.io.reg1_data <= regs.io.read_data1 @[src/main/scala/riscv/core/fivestage_final/CPU.scala 72:19]
    id.io.reg2_data <= regs.io.read_data2 @[src/main/scala/riscv/core/fivestage_final/CPU.scala 73:19]
    id.io.forward_from_mem <= mem.io.forward_data @[src/main/scala/riscv/core/fivestage_final/CPU.scala 74:26]
    id.io.forward_from_wb <= wb.io.regs_write_data @[src/main/scala/riscv/core/fivestage_final/CPU.scala 75:25]
    id.io.reg1_forward <= forwarding.io.reg1_forward_id @[src/main/scala/riscv/core/fivestage_final/CPU.scala 76:22]
    id.io.reg2_forward <= forwarding.io.reg2_forward_id @[src/main/scala/riscv/core/fivestage_final/CPU.scala 77:22]
    id.io.interrupt_assert <= clint.io.id_interrupt_assert @[src/main/scala/riscv/core/fivestage_final/CPU.scala 78:26]
    id.io.interrupt_handler_address <= clint.io.id_interrupt_handler_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 79:35]
    id2ex.io.flush <= ctrl.io.id_flush @[src/main/scala/riscv/core/fivestage_final/CPU.scala 81:18]
    id2ex.io.instruction <= if2id.io.output_instruction @[src/main/scala/riscv/core/fivestage_final/CPU.scala 82:24]
    id2ex.io.instruction_address <= if2id.io.output_instruction_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 83:32]
    id2ex.io.reg1_data <= regs.io.read_data1 @[src/main/scala/riscv/core/fivestage_final/CPU.scala 84:22]
    id2ex.io.reg2_data <= regs.io.read_data2 @[src/main/scala/riscv/core/fivestage_final/CPU.scala 85:22]
    id2ex.io.regs_reg1_read_address <= id.io.regs_reg1_read_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 86:35]
    id2ex.io.regs_reg2_read_address <= id.io.regs_reg2_read_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 87:35]
    id2ex.io.regs_write_enable <= id.io.ex_reg_write_enable @[src/main/scala/riscv/core/fivestage_final/CPU.scala 88:30]
    id2ex.io.regs_write_address <= id.io.ex_reg_write_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 89:31]
    id2ex.io.regs_write_source <= id.io.ex_reg_write_source @[src/main/scala/riscv/core/fivestage_final/CPU.scala 90:30]
    id2ex.io.immediate <= id.io.ex_immediate @[src/main/scala/riscv/core/fivestage_final/CPU.scala 91:22]
    id2ex.io.aluop1_source <= id.io.ex_aluop1_source @[src/main/scala/riscv/core/fivestage_final/CPU.scala 92:26]
    id2ex.io.aluop2_source <= id.io.ex_aluop2_source @[src/main/scala/riscv/core/fivestage_final/CPU.scala 93:26]
    id2ex.io.csr_write_enable <= id.io.ex_csr_write_enable @[src/main/scala/riscv/core/fivestage_final/CPU.scala 94:29]
    id2ex.io.csr_address <= id.io.ex_csr_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 95:24]
    id2ex.io.memory_read_enable <= id.io.ex_memory_read_enable @[src/main/scala/riscv/core/fivestage_final/CPU.scala 96:31]
    id2ex.io.memory_write_enable <= id.io.ex_memory_write_enable @[src/main/scala/riscv/core/fivestage_final/CPU.scala 97:32]
    id2ex.io.csr_read_data <= csr_regs.io.id_reg_read_data @[src/main/scala/riscv/core/fivestage_final/CPU.scala 98:26]
    ex.io.instruction <= id2ex.io.output_instruction @[src/main/scala/riscv/core/fivestage_final/CPU.scala 100:21]
    ex.io.instruction_address <= id2ex.io.output_instruction_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 101:29]
    ex.io.reg1_data <= id2ex.io.output_reg1_data @[src/main/scala/riscv/core/fivestage_final/CPU.scala 102:19]
    ex.io.reg2_data <= id2ex.io.output_reg2_data @[src/main/scala/riscv/core/fivestage_final/CPU.scala 103:19]
    ex.io.immediate <= id2ex.io.output_immediate @[src/main/scala/riscv/core/fivestage_final/CPU.scala 104:19]
    ex.io.aluop1_source <= id2ex.io.output_aluop1_source @[src/main/scala/riscv/core/fivestage_final/CPU.scala 105:23]
    ex.io.aluop2_source <= id2ex.io.output_aluop2_source @[src/main/scala/riscv/core/fivestage_final/CPU.scala 106:23]
    ex.io.csr_read_data <= id2ex.io.output_csr_read_data @[src/main/scala/riscv/core/fivestage_final/CPU.scala 107:23]
    ex.io.forward_from_mem <= mem.io.forward_data @[src/main/scala/riscv/core/fivestage_final/CPU.scala 108:26]
    ex.io.forward_from_wb <= wb.io.regs_write_data @[src/main/scala/riscv/core/fivestage_final/CPU.scala 109:25]
    ex.io.reg1_forward <= forwarding.io.reg1_forward_ex @[src/main/scala/riscv/core/fivestage_final/CPU.scala 110:22]
    ex.io.reg2_forward <= forwarding.io.reg2_forward_ex @[src/main/scala/riscv/core/fivestage_final/CPU.scala 111:22]
    ex2mem.io.regs_write_enable <= id2ex.io.output_regs_write_enable @[src/main/scala/riscv/core/fivestage_final/CPU.scala 113:31]
    ex2mem.io.regs_write_source <= id2ex.io.output_regs_write_source @[src/main/scala/riscv/core/fivestage_final/CPU.scala 114:31]
    ex2mem.io.regs_write_address <= id2ex.io.output_regs_write_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 115:32]
    ex2mem.io.instruction_address <= id2ex.io.output_instruction_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 116:33]
    node _ex2mem_io_funct3_T = bits(id2ex.io.output_instruction, 14, 12) @[src/main/scala/riscv/core/fivestage_final/CPU.scala 117:50]
    ex2mem.io.funct3 <= _ex2mem_io_funct3_T @[src/main/scala/riscv/core/fivestage_final/CPU.scala 117:20]
    ex2mem.io.reg2_data <= ex.io.mem_reg2_data @[src/main/scala/riscv/core/fivestage_final/CPU.scala 118:23]
    ex2mem.io.memory_read_enable <= id2ex.io.output_memory_read_enable @[src/main/scala/riscv/core/fivestage_final/CPU.scala 119:32]
    ex2mem.io.memory_write_enable <= id2ex.io.output_memory_write_enable @[src/main/scala/riscv/core/fivestage_final/CPU.scala 120:33]
    ex2mem.io.alu_result <= ex.io.mem_alu_result @[src/main/scala/riscv/core/fivestage_final/CPU.scala 121:24]
    ex2mem.io.csr_read_data <= id2ex.io.output_csr_read_data @[src/main/scala/riscv/core/fivestage_final/CPU.scala 122:27]
    mem.io.alu_result <= ex2mem.io.output_alu_result @[src/main/scala/riscv/core/fivestage_final/CPU.scala 124:21]
    mem.io.reg2_data <= ex2mem.io.output_reg2_data @[src/main/scala/riscv/core/fivestage_final/CPU.scala 125:20]
    mem.io.memory_read_enable <= ex2mem.io.output_memory_read_enable @[src/main/scala/riscv/core/fivestage_final/CPU.scala 126:29]
    mem.io.memory_write_enable <= ex2mem.io.output_memory_write_enable @[src/main/scala/riscv/core/fivestage_final/CPU.scala 127:30]
    mem.io.funct3 <= ex2mem.io.output_funct3 @[src/main/scala/riscv/core/fivestage_final/CPU.scala 128:17]
    mem.io.regs_write_source <= ex2mem.io.output_regs_write_source @[src/main/scala/riscv/core/fivestage_final/CPU.scala 129:28]
    mem.io.csr_read_data <= ex2mem.io.output_csr_read_data @[src/main/scala/riscv/core/fivestage_final/CPU.scala 130:24]
    node _io_device_select_T = bits(mem.io.bundle.address, 31, 29) @[src/main/scala/riscv/core/fivestage_final/CPU.scala 131:44]
    io.device_select <= _io_device_select_T @[src/main/scala/riscv/core/fivestage_final/CPU.scala 131:20]
    mem.io.bundle <= io.memory_bundle @[src/main/scala/riscv/core/fivestage_final/CPU.scala 132:20]
    node _io_memory_bundle_address_T = bits(mem.io.bundle.address, 28, 0) @[src/main/scala/riscv/core/fivestage_final/CPU.scala 133:94]
    node _io_memory_bundle_address_T_1 = cat(UInt<3>("h0"), _io_memory_bundle_address_T) @[src/main/scala/riscv/core/fivestage_final/CPU.scala 133:70]
    io.memory_bundle.address <= _io_memory_bundle_address_T_1 @[src/main/scala/riscv/core/fivestage_final/CPU.scala 133:28]
    mem2wb.io.instruction_address <= ex2mem.io.output_instruction_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 135:33]
    mem2wb.io.alu_result <= ex2mem.io.output_alu_result @[src/main/scala/riscv/core/fivestage_final/CPU.scala 136:24]
    mem2wb.io.regs_write_enable <= ex2mem.io.output_regs_write_enable @[src/main/scala/riscv/core/fivestage_final/CPU.scala 137:31]
    mem2wb.io.regs_write_source <= ex2mem.io.output_regs_write_source @[src/main/scala/riscv/core/fivestage_final/CPU.scala 138:31]
    mem2wb.io.regs_write_address <= ex2mem.io.output_regs_write_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 139:32]
    mem2wb.io.memory_read_data <= mem.io.wb_memory_read_data @[src/main/scala/riscv/core/fivestage_final/CPU.scala 140:30]
    mem2wb.io.csr_read_data <= ex2mem.io.output_csr_read_data @[src/main/scala/riscv/core/fivestage_final/CPU.scala 141:27]
    wb.io.instruction_address <= mem2wb.io.output_instruction_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 143:29]
    wb.io.alu_result <= mem2wb.io.output_alu_result @[src/main/scala/riscv/core/fivestage_final/CPU.scala 144:20]
    wb.io.memory_read_data <= mem2wb.io.output_memory_read_data @[src/main/scala/riscv/core/fivestage_final/CPU.scala 145:26]
    wb.io.regs_write_source <= mem2wb.io.output_regs_write_source @[src/main/scala/riscv/core/fivestage_final/CPU.scala 146:27]
    wb.io.csr_read_data <= mem2wb.io.output_csr_read_data @[src/main/scala/riscv/core/fivestage_final/CPU.scala 147:23]
    forwarding.io.rs1_id <= id.io.regs_reg1_read_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 149:24]
    forwarding.io.rs2_id <= id.io.regs_reg2_read_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 150:24]
    forwarding.io.rs1_ex <= id2ex.io.output_regs_reg1_read_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 151:24]
    forwarding.io.rs2_ex <= id2ex.io.output_regs_reg2_read_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 152:24]
    forwarding.io.rd_mem <= ex2mem.io.output_regs_write_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 153:24]
    forwarding.io.reg_write_enable_mem <= ex2mem.io.output_regs_write_enable @[src/main/scala/riscv/core/fivestage_final/CPU.scala 154:38]
    forwarding.io.rd_wb <= mem2wb.io.output_regs_write_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 155:23]
    forwarding.io.reg_write_enable_wb <= mem2wb.io.output_regs_write_enable @[src/main/scala/riscv/core/fivestage_final/CPU.scala 156:37]
    clint.io.instruction_address_if <= inst_fetch.io.instruction_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 158:35]
    clint.io.instruction_id <= if2id.io.output_instruction @[src/main/scala/riscv/core/fivestage_final/CPU.scala 159:27]
    clint.io.jump_flag <= id.io.clint_jump_flag @[src/main/scala/riscv/core/fivestage_final/CPU.scala 160:22]
    clint.io.jump_address <= id.io.clint_jump_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 161:25]
    clint.io.interrupt_flag <= if2id.io.output_interrupt_flag @[src/main/scala/riscv/core/fivestage_final/CPU.scala 162:27]
    csr_regs.io.clint_access_bundle <= clint.io.csr_bundle @[src/main/scala/riscv/core/fivestage_final/CPU.scala 163:23]
    csr_regs.io.reg_read_address_id <= id.io.ex_csr_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 165:35]
    csr_regs.io.reg_write_enable_ex <= id2ex.io.output_csr_write_enable @[src/main/scala/riscv/core/fivestage_final/CPU.scala 166:35]
    csr_regs.io.reg_write_address_ex <= id2ex.io.output_csr_address @[src/main/scala/riscv/core/fivestage_final/CPU.scala 167:36]
    csr_regs.io.reg_write_data_ex <= ex.io.csr_write_data @[src/main/scala/riscv/core/fivestage_final/CPU.scala 168:33]

  module CPU_1 :
    input clock : Clock
    input reset : Reset
    output io : { instruction_address : UInt<32>, flip instruction : UInt<32>, flip instruction_valid : UInt<1>, flip memory_bundle : { flip address : UInt<32>, flip write_data : UInt<32>, flip write_enable : UInt<1>, flip write_strobe : UInt<1>[4], read_data : UInt<32>}, device_select : UInt<3>, flip interrupt_flag : UInt<32>, flip debug_read_address : UInt<5>, debug_read_data : UInt<32>} @[src/main/scala/riscv/core/CPU.scala 25:14]

    inst cpu of CPU @[src/main/scala/riscv/core/CPU.scala 37:23]
    cpu.clock <= clock
    cpu.reset <= reset
    io.debug_read_data <= cpu.io.debug_read_data @[src/main/scala/riscv/core/CPU.scala 38:14]
    cpu.io.debug_read_address <= io.debug_read_address @[src/main/scala/riscv/core/CPU.scala 38:14]
    cpu.io.interrupt_flag <= io.interrupt_flag @[src/main/scala/riscv/core/CPU.scala 38:14]
    io.device_select <= cpu.io.device_select @[src/main/scala/riscv/core/CPU.scala 38:14]
    cpu.io.memory_bundle <= io.memory_bundle @[src/main/scala/riscv/core/CPU.scala 38:14]
    cpu.io.instruction_valid <= io.instruction_valid @[src/main/scala/riscv/core/CPU.scala 38:14]
    cpu.io.instruction <= io.instruction @[src/main/scala/riscv/core/CPU.scala 38:14]
    io.instruction_address <= cpu.io.instruction_address @[src/main/scala/riscv/core/CPU.scala 38:14]

  module Top :
    input clock : Clock
    input reset : UInt<1>
    output io : { tx : UInt<1>, flip rx : UInt<1>, led : UInt<1>} @[src/main/scala/board/z710/Top.scala 25:14]

    inst mem of Memory @[src/main/scala/board/z710/Top.scala 35:19]
    mem.clock <= clock
    mem.reset <= reset
    inst timer of Timer @[src/main/scala/board/z710/Top.scala 38:21]
    timer.clock <= clock
    timer.reset <= reset
    inst uart of Uart @[src/main/scala/board/z710/Top.scala 39:20]
    uart.clock <= clock
    uart.reset <= reset
    inst dummy of Dummy @[src/main/scala/board/z710/Top.scala 40:21]
    dummy.clock <= clock
    dummy.reset <= reset
    dummy.io.bundle <= mem.io.bundle @[src/main/scala/board/z710/Top.scala 43:17]
    mem.io.debug_read_address <= UInt<1>("h0") @[src/main/scala/board/z710/Top.scala 44:29]
    dummy.io.bundle <= timer.io.bundle @[src/main/scala/board/z710/Top.scala 45:19]
    dummy.io.bundle <= uart.io.bundle @[src/main/scala/board/z710/Top.scala 46:18]
    io.tx <= uart.io.txd @[src/main/scala/board/z710/Top.scala 47:9]
    uart.io.rxd <= io.rx @[src/main/scala/board/z710/Top.scala 48:15]
    inst instruction_rom of InstructionROM @[src/main/scala/board/z710/Top.scala 50:31]
    instruction_rom.clock <= clock
    instruction_rom.reset <= reset
    inst rom_loader of ROMLoader @[src/main/scala/board/z710/Top.scala 51:26]
    rom_loader.clock <= clock
    rom_loader.reset <= reset
    rom_loader.io.rom_data <= instruction_rom.io.data @[src/main/scala/board/z710/Top.scala 53:26]
    rom_loader.io.load_address <= UInt<32>("h1000") @[src/main/scala/board/z710/Top.scala 54:30]
    instruction_rom.io.address <= rom_loader.io.rom_address @[src/main/scala/board/z710/Top.scala 55:30]
    reg CPU_clkdiv : UInt<2>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/board/z710/Top.scala 57:27]
    wire CPU_tick : UInt<1> @[src/main/scala/board/z710/Top.scala 58:22]
    wire CPU_next : UInt<2> @[src/main/scala/board/z710/Top.scala 59:22]
    node _CPU_next_T = eq(CPU_clkdiv, UInt<2>("h3")) @[src/main/scala/board/z710/Top.scala 60:30]
    node _CPU_next_T_1 = add(CPU_clkdiv, UInt<1>("h1")) @[src/main/scala/board/z710/Top.scala 60:55]
    node _CPU_next_T_2 = tail(_CPU_next_T_1, 1) @[src/main/scala/board/z710/Top.scala 60:55]
    node _CPU_next_T_3 = mux(_CPU_next_T, UInt<1>("h0"), _CPU_next_T_2) @[src/main/scala/board/z710/Top.scala 60:18]
    CPU_next <= _CPU_next_T_3 @[src/main/scala/board/z710/Top.scala 60:12]
    node _CPU_tick_T = eq(CPU_clkdiv, UInt<1>("h0")) @[src/main/scala/board/z710/Top.scala 61:26]
    CPU_tick <= _CPU_tick_T @[src/main/scala/board/z710/Top.scala 61:12]
    CPU_clkdiv <= CPU_next @[src/main/scala/board/z710/Top.scala 62:14]
    node _T = asClock(CPU_tick) @[src/main/scala/board/z710/Top.scala 64:22]
    inst cpu of CPU_1 @[src/main/scala/board/z710/Top.scala 65:21]
    cpu.clock <= _T
    cpu.reset <= reset
    node _cpu_io_interrupt_flag_T = cat(uart.io.signal_interrupt, timer.io.signal_interrupt) @[src/main/scala/board/z710/Top.scala 66:33]
    cpu.io.interrupt_flag <= _cpu_io_interrupt_flag_T @[src/main/scala/board/z710/Top.scala 66:27]
    cpu.io.instruction_valid <= rom_loader.io.load_finished @[src/main/scala/board/z710/Top.scala 67:30]
    mem.io.instruction_address <= cpu.io.instruction_address @[src/main/scala/board/z710/Top.scala 68:32]
    cpu.io.instruction <= mem.io.instruction @[src/main/scala/board/z710/Top.scala 69:24]
    cpu.io.debug_read_address <= UInt<1>("h0") @[src/main/scala/board/z710/Top.scala 70:31]
    node _T_1 = eq(rom_loader.io.load_finished, UInt<1>("h0")) @[src/main/scala/board/z710/Top.scala 72:10]
    when _T_1 : @[src/main/scala/board/z710/Top.scala 72:40]
      rom_loader.io.bundle <= mem.io.bundle @[src/main/scala/board/z710/Top.scala 73:28]
      cpu.io.memory_bundle.read_data <= UInt<1>("h0") @[src/main/scala/board/z710/Top.scala 74:38]
    else :
      rom_loader.io.bundle.read_data <= UInt<1>("h0") @[src/main/scala/board/z710/Top.scala 76:38]
      node _T_2 = eq(cpu.io.device_select, UInt<3>("h4")) @[src/main/scala/board/z710/Top.scala 77:33]
      when _T_2 : @[src/main/scala/board/z710/Top.scala 77:42]
        cpu.io.memory_bundle <= timer.io.bundle @[src/main/scala/board/z710/Top.scala 78:30]
      else :
        node _T_3 = eq(cpu.io.device_select, UInt<2>("h2")) @[src/main/scala/board/z710/Top.scala 79:39]
        when _T_3 : @[src/main/scala/board/z710/Top.scala 79:48]
          cpu.io.memory_bundle <= uart.io.bundle @[src/main/scala/board/z710/Top.scala 80:30]
        else :
          cpu.io.memory_bundle <= mem.io.bundle @[src/main/scala/board/z710/Top.scala 82:30]
    reg led_count : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/board/z710/Top.scala 88:26]
    node _T_4 = geq(led_count, UInt<25>("h17d7840")) @[src/main/scala/board/z710/Top.scala 89:19]
    when _T_4 : @[src/main/scala/board/z710/Top.scala 89:36]
      led_count <= UInt<1>("h0") @[src/main/scala/board/z710/Top.scala 90:15]
    else :
      node _led_count_T = add(led_count, UInt<1>("h1")) @[src/main/scala/board/z710/Top.scala 92:28]
      node _led_count_T_1 = tail(_led_count_T, 1) @[src/main/scala/board/z710/Top.scala 92:28]
      led_count <= _led_count_T_1 @[src/main/scala/board/z710/Top.scala 92:15]
    node _io_led_T = shr(UInt<25>("h17d7840"), 1) @[src/main/scala/board/z710/Top.scala 94:41]
    node _io_led_T_1 = geq(led_count, _io_led_T) @[src/main/scala/board/z710/Top.scala 94:24]
    io.led <= _io_led_T_1 @[src/main/scala/board/z710/Top.scala 94:10]

