
kernel/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000c117          	auipc	sp,0xc
    80000004:	8c013103          	ld	sp,-1856(sp) # 8000b8c0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	6505                	lui	a0,0x1
    8000000a:	f14025f3          	csrr	a1,mhartid
    8000000e:	0585                	addi	a1,a1,1
    80000010:	02b50533          	mul	a0,a0,a1
    80000014:	912a                	add	sp,sp,a0
    80000016:	1a4000ef          	jal	ra,800001ba <start>

000000008000001a <spin>:
    8000001a:	a001                	j	8000001a <spin>

000000008000001c <r_mhartid>:
// which hart (core) is this?
static inline uint64
r_mhartid()
{
    8000001c:	1101                	addi	sp,sp,-32
    8000001e:	ec22                	sd	s0,24(sp)
    80000020:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mhartid" : "=r" (x) );
    80000022:	f14027f3          	csrr	a5,mhartid
    80000026:	fef43423          	sd	a5,-24(s0)
  return x;
    8000002a:	fe843783          	ld	a5,-24(s0)
}
    8000002e:	853e                	mv	a0,a5
    80000030:	6462                	ld	s0,24(sp)
    80000032:	6105                	addi	sp,sp,32
    80000034:	8082                	ret

0000000080000036 <r_mstatus>:
#define MSTATUS_MPP_U (0L << 11)
#define MSTATUS_MIE (1L << 3)    // machine-mode interrupt enable.

static inline uint64
r_mstatus()
{
    80000036:	1101                	addi	sp,sp,-32
    80000038:	ec22                	sd	s0,24(sp)
    8000003a:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mstatus" : "=r" (x) );
    8000003c:	300027f3          	csrr	a5,mstatus
    80000040:	fef43423          	sd	a5,-24(s0)
  return x;
    80000044:	fe843783          	ld	a5,-24(s0)
}
    80000048:	853e                	mv	a0,a5
    8000004a:	6462                	ld	s0,24(sp)
    8000004c:	6105                	addi	sp,sp,32
    8000004e:	8082                	ret

0000000080000050 <w_mstatus>:

static inline void 
w_mstatus(uint64 x)
{
    80000050:	1101                	addi	sp,sp,-32
    80000052:	ec22                	sd	s0,24(sp)
    80000054:	1000                	addi	s0,sp,32
    80000056:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mstatus, %0" : : "r" (x));
    8000005a:	fe843783          	ld	a5,-24(s0)
    8000005e:	30079073          	csrw	mstatus,a5
}
    80000062:	0001                	nop
    80000064:	6462                	ld	s0,24(sp)
    80000066:	6105                	addi	sp,sp,32
    80000068:	8082                	ret

000000008000006a <w_mepc>:
// machine exception program counter, holds the
// instruction address to which a return from
// exception will go.
static inline void 
w_mepc(uint64 x)
{
    8000006a:	1101                	addi	sp,sp,-32
    8000006c:	ec22                	sd	s0,24(sp)
    8000006e:	1000                	addi	s0,sp,32
    80000070:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mepc, %0" : : "r" (x));
    80000074:	fe843783          	ld	a5,-24(s0)
    80000078:	34179073          	csrw	mepc,a5
}
    8000007c:	0001                	nop
    8000007e:	6462                	ld	s0,24(sp)
    80000080:	6105                	addi	sp,sp,32
    80000082:	8082                	ret

0000000080000084 <r_sie>:
#define SIE_SEIE (1L << 9) // external
#define SIE_STIE (1L << 5) // timer
#define SIE_SSIE (1L << 1) // software
static inline uint64
r_sie()
{
    80000084:	1101                	addi	sp,sp,-32
    80000086:	ec22                	sd	s0,24(sp)
    80000088:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, sie" : "=r" (x) );
    8000008a:	104027f3          	csrr	a5,sie
    8000008e:	fef43423          	sd	a5,-24(s0)
  return x;
    80000092:	fe843783          	ld	a5,-24(s0)
}
    80000096:	853e                	mv	a0,a5
    80000098:	6462                	ld	s0,24(sp)
    8000009a:	6105                	addi	sp,sp,32
    8000009c:	8082                	ret

000000008000009e <w_sie>:

static inline void 
w_sie(uint64 x)
{
    8000009e:	1101                	addi	sp,sp,-32
    800000a0:	ec22                	sd	s0,24(sp)
    800000a2:	1000                	addi	s0,sp,32
    800000a4:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sie, %0" : : "r" (x));
    800000a8:	fe843783          	ld	a5,-24(s0)
    800000ac:	10479073          	csrw	sie,a5
}
    800000b0:	0001                	nop
    800000b2:	6462                	ld	s0,24(sp)
    800000b4:	6105                	addi	sp,sp,32
    800000b6:	8082                	ret

00000000800000b8 <r_mie>:
#define MIE_MEIE (1L << 11) // external
#define MIE_MTIE (1L << 7)  // timer
#define MIE_MSIE (1L << 3)  // software
static inline uint64
r_mie()
{
    800000b8:	1101                	addi	sp,sp,-32
    800000ba:	ec22                	sd	s0,24(sp)
    800000bc:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mie" : "=r" (x) );
    800000be:	304027f3          	csrr	a5,mie
    800000c2:	fef43423          	sd	a5,-24(s0)
  return x;
    800000c6:	fe843783          	ld	a5,-24(s0)
}
    800000ca:	853e                	mv	a0,a5
    800000cc:	6462                	ld	s0,24(sp)
    800000ce:	6105                	addi	sp,sp,32
    800000d0:	8082                	ret

00000000800000d2 <w_mie>:

static inline void 
w_mie(uint64 x)
{
    800000d2:	1101                	addi	sp,sp,-32
    800000d4:	ec22                	sd	s0,24(sp)
    800000d6:	1000                	addi	s0,sp,32
    800000d8:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mie, %0" : : "r" (x));
    800000dc:	fe843783          	ld	a5,-24(s0)
    800000e0:	30479073          	csrw	mie,a5
}
    800000e4:	0001                	nop
    800000e6:	6462                	ld	s0,24(sp)
    800000e8:	6105                	addi	sp,sp,32
    800000ea:	8082                	ret

00000000800000ec <w_medeleg>:
  return x;
}

static inline void 
w_medeleg(uint64 x)
{
    800000ec:	1101                	addi	sp,sp,-32
    800000ee:	ec22                	sd	s0,24(sp)
    800000f0:	1000                	addi	s0,sp,32
    800000f2:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw medeleg, %0" : : "r" (x));
    800000f6:	fe843783          	ld	a5,-24(s0)
    800000fa:	30279073          	csrw	medeleg,a5
}
    800000fe:	0001                	nop
    80000100:	6462                	ld	s0,24(sp)
    80000102:	6105                	addi	sp,sp,32
    80000104:	8082                	ret

0000000080000106 <w_mideleg>:
  return x;
}

static inline void 
w_mideleg(uint64 x)
{
    80000106:	1101                	addi	sp,sp,-32
    80000108:	ec22                	sd	s0,24(sp)
    8000010a:	1000                	addi	s0,sp,32
    8000010c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mideleg, %0" : : "r" (x));
    80000110:	fe843783          	ld	a5,-24(s0)
    80000114:	30379073          	csrw	mideleg,a5
}
    80000118:	0001                	nop
    8000011a:	6462                	ld	s0,24(sp)
    8000011c:	6105                	addi	sp,sp,32
    8000011e:	8082                	ret

0000000080000120 <w_mtvec>:
}

// Machine-mode interrupt vector
static inline void 
w_mtvec(uint64 x)
{
    80000120:	1101                	addi	sp,sp,-32
    80000122:	ec22                	sd	s0,24(sp)
    80000124:	1000                	addi	s0,sp,32
    80000126:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mtvec, %0" : : "r" (x));
    8000012a:	fe843783          	ld	a5,-24(s0)
    8000012e:	30579073          	csrw	mtvec,a5
}
    80000132:	0001                	nop
    80000134:	6462                	ld	s0,24(sp)
    80000136:	6105                	addi	sp,sp,32
    80000138:	8082                	ret

000000008000013a <w_pmpcfg0>:

static inline void
w_pmpcfg0(uint64 x)
{
    8000013a:	1101                	addi	sp,sp,-32
    8000013c:	ec22                	sd	s0,24(sp)
    8000013e:	1000                	addi	s0,sp,32
    80000140:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw pmpcfg0, %0" : : "r" (x));
    80000144:	fe843783          	ld	a5,-24(s0)
    80000148:	3a079073          	csrw	pmpcfg0,a5
}
    8000014c:	0001                	nop
    8000014e:	6462                	ld	s0,24(sp)
    80000150:	6105                	addi	sp,sp,32
    80000152:	8082                	ret

0000000080000154 <w_pmpaddr0>:

static inline void
w_pmpaddr0(uint64 x)
{
    80000154:	1101                	addi	sp,sp,-32
    80000156:	ec22                	sd	s0,24(sp)
    80000158:	1000                	addi	s0,sp,32
    8000015a:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw pmpaddr0, %0" : : "r" (x));
    8000015e:	fe843783          	ld	a5,-24(s0)
    80000162:	3b079073          	csrw	pmpaddr0,a5
}
    80000166:	0001                	nop
    80000168:	6462                	ld	s0,24(sp)
    8000016a:	6105                	addi	sp,sp,32
    8000016c:	8082                	ret

000000008000016e <w_satp>:

// supervisor address translation and protection;
// holds the address of the page table.
static inline void 
w_satp(uint64 x)
{
    8000016e:	1101                	addi	sp,sp,-32
    80000170:	ec22                	sd	s0,24(sp)
    80000172:	1000                	addi	s0,sp,32
    80000174:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    80000178:	fe843783          	ld	a5,-24(s0)
    8000017c:	18079073          	csrw	satp,a5
}
    80000180:	0001                	nop
    80000182:	6462                	ld	s0,24(sp)
    80000184:	6105                	addi	sp,sp,32
    80000186:	8082                	ret

0000000080000188 <w_mscratch>:
  asm volatile("csrw sscratch, %0" : : "r" (x));
}

static inline void 
w_mscratch(uint64 x)
{
    80000188:	1101                	addi	sp,sp,-32
    8000018a:	ec22                	sd	s0,24(sp)
    8000018c:	1000                	addi	s0,sp,32
    8000018e:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mscratch, %0" : : "r" (x));
    80000192:	fe843783          	ld	a5,-24(s0)
    80000196:	34079073          	csrw	mscratch,a5
}
    8000019a:	0001                	nop
    8000019c:	6462                	ld	s0,24(sp)
    8000019e:	6105                	addi	sp,sp,32
    800001a0:	8082                	ret

00000000800001a2 <w_tp>:
  return x;
}

static inline void 
w_tp(uint64 x)
{
    800001a2:	1101                	addi	sp,sp,-32
    800001a4:	ec22                	sd	s0,24(sp)
    800001a6:	1000                	addi	s0,sp,32
    800001a8:	fea43423          	sd	a0,-24(s0)
  asm volatile("mv tp, %0" : : "r" (x));
    800001ac:	fe843783          	ld	a5,-24(s0)
    800001b0:	823e                	mv	tp,a5
}
    800001b2:	0001                	nop
    800001b4:	6462                	ld	s0,24(sp)
    800001b6:	6105                	addi	sp,sp,32
    800001b8:	8082                	ret

00000000800001ba <start>:
extern void timervec();

// entry.S jumps here in machine mode on stack0.
void
start()
{
    800001ba:	1101                	addi	sp,sp,-32
    800001bc:	ec06                	sd	ra,24(sp)
    800001be:	e822                	sd	s0,16(sp)
    800001c0:	1000                	addi	s0,sp,32
  // set M Previous Privilege mode to Supervisor, for mret.
  unsigned long x = r_mstatus();
    800001c2:	00000097          	auipc	ra,0x0
    800001c6:	e74080e7          	jalr	-396(ra) # 80000036 <r_mstatus>
    800001ca:	fea43423          	sd	a0,-24(s0)
  x &= ~MSTATUS_MPP_MASK;
    800001ce:	fe843703          	ld	a4,-24(s0)
    800001d2:	77f9                	lui	a5,0xffffe
    800001d4:	7ff78793          	addi	a5,a5,2047 # ffffffffffffe7ff <end+0xffffffff7ffd57ff>
    800001d8:	8ff9                	and	a5,a5,a4
    800001da:	fef43423          	sd	a5,-24(s0)
  x |= MSTATUS_MPP_S;
    800001de:	fe843703          	ld	a4,-24(s0)
    800001e2:	6785                	lui	a5,0x1
    800001e4:	80078793          	addi	a5,a5,-2048 # 800 <_entry-0x7ffff800>
    800001e8:	8fd9                	or	a5,a5,a4
    800001ea:	fef43423          	sd	a5,-24(s0)
  w_mstatus(x);
    800001ee:	fe843503          	ld	a0,-24(s0)
    800001f2:	00000097          	auipc	ra,0x0
    800001f6:	e5e080e7          	jalr	-418(ra) # 80000050 <w_mstatus>

  // set M Exception Program Counter to main, for mret.
  // requires gcc -mcmodel=medany
  w_mepc((uint64)main);
    800001fa:	00001797          	auipc	a5,0x1
    800001fe:	5fc78793          	addi	a5,a5,1532 # 800017f6 <main>
    80000202:	853e                	mv	a0,a5
    80000204:	00000097          	auipc	ra,0x0
    80000208:	e66080e7          	jalr	-410(ra) # 8000006a <w_mepc>

  // disable paging for now.
  w_satp(0);
    8000020c:	4501                	li	a0,0
    8000020e:	00000097          	auipc	ra,0x0
    80000212:	f60080e7          	jalr	-160(ra) # 8000016e <w_satp>

  // delegate all interrupts and exceptions to supervisor mode.
  w_medeleg(0xffff);
    80000216:	67c1                	lui	a5,0x10
    80000218:	fff78513          	addi	a0,a5,-1 # ffff <_entry-0x7fff0001>
    8000021c:	00000097          	auipc	ra,0x0
    80000220:	ed0080e7          	jalr	-304(ra) # 800000ec <w_medeleg>
  w_mideleg(0xffff);
    80000224:	67c1                	lui	a5,0x10
    80000226:	fff78513          	addi	a0,a5,-1 # ffff <_entry-0x7fff0001>
    8000022a:	00000097          	auipc	ra,0x0
    8000022e:	edc080e7          	jalr	-292(ra) # 80000106 <w_mideleg>
  w_sie(r_sie() | SIE_SEIE | SIE_STIE | SIE_SSIE);
    80000232:	00000097          	auipc	ra,0x0
    80000236:	e52080e7          	jalr	-430(ra) # 80000084 <r_sie>
    8000023a:	87aa                	mv	a5,a0
    8000023c:	2227e793          	ori	a5,a5,546
    80000240:	853e                	mv	a0,a5
    80000242:	00000097          	auipc	ra,0x0
    80000246:	e5c080e7          	jalr	-420(ra) # 8000009e <w_sie>

  // configure Physical Memory Protection to give supervisor mode
  // access to all of physical memory.
  w_pmpaddr0(0x3fffffffffffffull);
    8000024a:	57fd                	li	a5,-1
    8000024c:	00a7d513          	srli	a0,a5,0xa
    80000250:	00000097          	auipc	ra,0x0
    80000254:	f04080e7          	jalr	-252(ra) # 80000154 <w_pmpaddr0>
  w_pmpcfg0(0xf);
    80000258:	453d                	li	a0,15
    8000025a:	00000097          	auipc	ra,0x0
    8000025e:	ee0080e7          	jalr	-288(ra) # 8000013a <w_pmpcfg0>

  // ask for clock interrupts.
  timerinit();
    80000262:	00000097          	auipc	ra,0x0
    80000266:	032080e7          	jalr	50(ra) # 80000294 <timerinit>

  // keep each CPU's hartid in its tp register, for cpuid().
  int id = r_mhartid();
    8000026a:	00000097          	auipc	ra,0x0
    8000026e:	db2080e7          	jalr	-590(ra) # 8000001c <r_mhartid>
    80000272:	87aa                	mv	a5,a0
    80000274:	fef42223          	sw	a5,-28(s0)
  w_tp(id);
    80000278:	fe442783          	lw	a5,-28(s0)
    8000027c:	853e                	mv	a0,a5
    8000027e:	00000097          	auipc	ra,0x0
    80000282:	f24080e7          	jalr	-220(ra) # 800001a2 <w_tp>

  // switch to supervisor mode and jump to main().
  asm volatile("mret");
    80000286:	30200073          	mret
}
    8000028a:	0001                	nop
    8000028c:	60e2                	ld	ra,24(sp)
    8000028e:	6442                	ld	s0,16(sp)
    80000290:	6105                	addi	sp,sp,32
    80000292:	8082                	ret

0000000080000294 <timerinit>:
// which arrive at timervec in kernelvec.S,
// which turns them into software interrupts for
// devintr() in trap.c.
void
timerinit()
{
    80000294:	1101                	addi	sp,sp,-32
    80000296:	ec06                	sd	ra,24(sp)
    80000298:	e822                	sd	s0,16(sp)
    8000029a:	1000                	addi	s0,sp,32
  // each CPU has a separate source of timer interrupts.
  int id = r_mhartid();
    8000029c:	00000097          	auipc	ra,0x0
    800002a0:	d80080e7          	jalr	-640(ra) # 8000001c <r_mhartid>
    800002a4:	87aa                	mv	a5,a0
    800002a6:	fef42623          	sw	a5,-20(s0)

  // ask the CLINT for a timer interrupt.
  int interval = 1000000; // cycles; about 1/10th second in qemu.
    800002aa:	000f47b7          	lui	a5,0xf4
    800002ae:	2407879b          	addiw	a5,a5,576
    800002b2:	fef42423          	sw	a5,-24(s0)
  *(uint64*)CLINT_MTIMECMP(id) = *(uint64*)CLINT_MTIME + interval;
    800002b6:	0200c7b7          	lui	a5,0x200c
    800002ba:	17e1                	addi	a5,a5,-8
    800002bc:	6398                	ld	a4,0(a5)
    800002be:	fe842783          	lw	a5,-24(s0)
    800002c2:	fec42683          	lw	a3,-20(s0)
    800002c6:	0036969b          	slliw	a3,a3,0x3
    800002ca:	2681                	sext.w	a3,a3
    800002cc:	8636                	mv	a2,a3
    800002ce:	020046b7          	lui	a3,0x2004
    800002d2:	96b2                	add	a3,a3,a2
    800002d4:	97ba                	add	a5,a5,a4
    800002d6:	e29c                	sd	a5,0(a3)

  // prepare information in scratch[] for timervec.
  // scratch[0..2] : space for timervec to save registers.
  // scratch[3] : address of CLINT MTIMECMP register.
  // scratch[4] : desired interval (in cycles) between timer interrupts.
  uint64 *scratch = &timer_scratch[id][0];
    800002d8:	fec42703          	lw	a4,-20(s0)
    800002dc:	87ba                	mv	a5,a4
    800002de:	078a                	slli	a5,a5,0x2
    800002e0:	97ba                	add	a5,a5,a4
    800002e2:	078e                	slli	a5,a5,0x3
    800002e4:	00014717          	auipc	a4,0x14
    800002e8:	d4c70713          	addi	a4,a4,-692 # 80014030 <timer_scratch>
    800002ec:	97ba                	add	a5,a5,a4
    800002ee:	fef43023          	sd	a5,-32(s0)
  scratch[3] = CLINT_MTIMECMP(id);
    800002f2:	fec42783          	lw	a5,-20(s0)
    800002f6:	0037979b          	slliw	a5,a5,0x3
    800002fa:	2781                	sext.w	a5,a5
    800002fc:	873e                	mv	a4,a5
    800002fe:	020047b7          	lui	a5,0x2004
    80000302:	973e                	add	a4,a4,a5
    80000304:	fe043783          	ld	a5,-32(s0)
    80000308:	07e1                	addi	a5,a5,24
    8000030a:	e398                	sd	a4,0(a5)
  scratch[4] = interval;
    8000030c:	fe043783          	ld	a5,-32(s0)
    80000310:	02078793          	addi	a5,a5,32 # 2004020 <_entry-0x7dffbfe0>
    80000314:	fe842703          	lw	a4,-24(s0)
    80000318:	e398                	sd	a4,0(a5)
  w_mscratch((uint64)scratch);
    8000031a:	fe043783          	ld	a5,-32(s0)
    8000031e:	853e                	mv	a0,a5
    80000320:	00000097          	auipc	ra,0x0
    80000324:	e68080e7          	jalr	-408(ra) # 80000188 <w_mscratch>

  // set the machine-mode trap handler.
  w_mtvec((uint64)timervec);
    80000328:	00008797          	auipc	a5,0x8
    8000032c:	55878793          	addi	a5,a5,1368 # 80008880 <timervec>
    80000330:	853e                	mv	a0,a5
    80000332:	00000097          	auipc	ra,0x0
    80000336:	dee080e7          	jalr	-530(ra) # 80000120 <w_mtvec>

  // enable machine-mode interrupts.
  w_mstatus(r_mstatus() | MSTATUS_MIE);
    8000033a:	00000097          	auipc	ra,0x0
    8000033e:	cfc080e7          	jalr	-772(ra) # 80000036 <r_mstatus>
    80000342:	87aa                	mv	a5,a0
    80000344:	0087e793          	ori	a5,a5,8
    80000348:	853e                	mv	a0,a5
    8000034a:	00000097          	auipc	ra,0x0
    8000034e:	d06080e7          	jalr	-762(ra) # 80000050 <w_mstatus>

  // enable machine-mode timer interrupts.
  w_mie(r_mie() | MIE_MTIE);
    80000352:	00000097          	auipc	ra,0x0
    80000356:	d66080e7          	jalr	-666(ra) # 800000b8 <r_mie>
    8000035a:	87aa                	mv	a5,a0
    8000035c:	0807e793          	ori	a5,a5,128
    80000360:	853e                	mv	a0,a5
    80000362:	00000097          	auipc	ra,0x0
    80000366:	d70080e7          	jalr	-656(ra) # 800000d2 <w_mie>
}
    8000036a:	0001                	nop
    8000036c:	60e2                	ld	ra,24(sp)
    8000036e:	6442                	ld	s0,16(sp)
    80000370:	6105                	addi	sp,sp,32
    80000372:	8082                	ret

0000000080000374 <consputc>:
// called by printf, and to echo input characters,
// but not from write().
//
void
consputc(int c)
{
    80000374:	1101                	addi	sp,sp,-32
    80000376:	ec06                	sd	ra,24(sp)
    80000378:	e822                	sd	s0,16(sp)
    8000037a:	1000                	addi	s0,sp,32
    8000037c:	87aa                	mv	a5,a0
    8000037e:	fef42623          	sw	a5,-20(s0)
  if(c == BACKSPACE){
    80000382:	fec42783          	lw	a5,-20(s0)
    80000386:	0007871b          	sext.w	a4,a5
    8000038a:	10000793          	li	a5,256
    8000038e:	02f71363          	bne	a4,a5,800003b4 <consputc+0x40>
    // if the user typed backspace, overwrite with a space.
    uartputc_sync('\b'); uartputc_sync(' '); uartputc_sync('\b');
    80000392:	4521                	li	a0,8
    80000394:	00001097          	auipc	ra,0x1
    80000398:	aac080e7          	jalr	-1364(ra) # 80000e40 <uartputc_sync>
    8000039c:	02000513          	li	a0,32
    800003a0:	00001097          	auipc	ra,0x1
    800003a4:	aa0080e7          	jalr	-1376(ra) # 80000e40 <uartputc_sync>
    800003a8:	4521                	li	a0,8
    800003aa:	00001097          	auipc	ra,0x1
    800003ae:	a96080e7          	jalr	-1386(ra) # 80000e40 <uartputc_sync>
  } else {
    uartputc_sync(c);
  }
}
    800003b2:	a801                	j	800003c2 <consputc+0x4e>
    uartputc_sync(c);
    800003b4:	fec42783          	lw	a5,-20(s0)
    800003b8:	853e                	mv	a0,a5
    800003ba:	00001097          	auipc	ra,0x1
    800003be:	a86080e7          	jalr	-1402(ra) # 80000e40 <uartputc_sync>
}
    800003c2:	0001                	nop
    800003c4:	60e2                	ld	ra,24(sp)
    800003c6:	6442                	ld	s0,16(sp)
    800003c8:	6105                	addi	sp,sp,32
    800003ca:	8082                	ret

00000000800003cc <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    800003cc:	7179                	addi	sp,sp,-48
    800003ce:	f406                	sd	ra,40(sp)
    800003d0:	f022                	sd	s0,32(sp)
    800003d2:	1800                	addi	s0,sp,48
    800003d4:	87aa                	mv	a5,a0
    800003d6:	fcb43823          	sd	a1,-48(s0)
    800003da:	8732                	mv	a4,a2
    800003dc:	fcf42e23          	sw	a5,-36(s0)
    800003e0:	87ba                	mv	a5,a4
    800003e2:	fcf42c23          	sw	a5,-40(s0)
  int i;

  for(i = 0; i < n; i++){
    800003e6:	fe042623          	sw	zero,-20(s0)
    800003ea:	a0a1                	j	80000432 <consolewrite+0x66>
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    800003ec:	fec42703          	lw	a4,-20(s0)
    800003f0:	fd043783          	ld	a5,-48(s0)
    800003f4:	00f70633          	add	a2,a4,a5
    800003f8:	fdc42703          	lw	a4,-36(s0)
    800003fc:	feb40793          	addi	a5,s0,-21
    80000400:	4685                	li	a3,1
    80000402:	85ba                	mv	a1,a4
    80000404:	853e                	mv	a0,a5
    80000406:	00003097          	auipc	ra,0x3
    8000040a:	2ca080e7          	jalr	714(ra) # 800036d0 <either_copyin>
    8000040e:	87aa                	mv	a5,a0
    80000410:	873e                	mv	a4,a5
    80000412:	57fd                	li	a5,-1
    80000414:	02f70863          	beq	a4,a5,80000444 <consolewrite+0x78>
      break;
    uartputc(c);
    80000418:	feb44783          	lbu	a5,-21(s0)
    8000041c:	2781                	sext.w	a5,a5
    8000041e:	853e                	mv	a0,a5
    80000420:	00001097          	auipc	ra,0x1
    80000424:	960080e7          	jalr	-1696(ra) # 80000d80 <uartputc>
  for(i = 0; i < n; i++){
    80000428:	fec42783          	lw	a5,-20(s0)
    8000042c:	2785                	addiw	a5,a5,1
    8000042e:	fef42623          	sw	a5,-20(s0)
    80000432:	fec42703          	lw	a4,-20(s0)
    80000436:	fd842783          	lw	a5,-40(s0)
    8000043a:	2701                	sext.w	a4,a4
    8000043c:	2781                	sext.w	a5,a5
    8000043e:	faf747e3          	blt	a4,a5,800003ec <consolewrite+0x20>
    80000442:	a011                	j	80000446 <consolewrite+0x7a>
      break;
    80000444:	0001                	nop
  }

  return i;
    80000446:	fec42783          	lw	a5,-20(s0)
}
    8000044a:	853e                	mv	a0,a5
    8000044c:	70a2                	ld	ra,40(sp)
    8000044e:	7402                	ld	s0,32(sp)
    80000450:	6145                	addi	sp,sp,48
    80000452:	8082                	ret

0000000080000454 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80000454:	7179                	addi	sp,sp,-48
    80000456:	f406                	sd	ra,40(sp)
    80000458:	f022                	sd	s0,32(sp)
    8000045a:	1800                	addi	s0,sp,48
    8000045c:	87aa                	mv	a5,a0
    8000045e:	fcb43823          	sd	a1,-48(s0)
    80000462:	8732                	mv	a4,a2
    80000464:	fcf42e23          	sw	a5,-36(s0)
    80000468:	87ba                	mv	a5,a4
    8000046a:	fcf42c23          	sw	a5,-40(s0)
  uint target;
  int c;
  char cbuf;

  target = n;
    8000046e:	fd842783          	lw	a5,-40(s0)
    80000472:	fef42623          	sw	a5,-20(s0)
  acquire(&cons.lock);
    80000476:	00014517          	auipc	a0,0x14
    8000047a:	cfa50513          	addi	a0,a0,-774 # 80014170 <cons>
    8000047e:	00001097          	auipc	ra,0x1
    80000482:	df0080e7          	jalr	-528(ra) # 8000126e <acquire>
  while(n > 0){
    80000486:	a215                	j	800005aa <consoleread+0x156>
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
      if(myproc()->killed){
    80000488:	00002097          	auipc	ra,0x2
    8000048c:	390080e7          	jalr	912(ra) # 80002818 <myproc>
    80000490:	87aa                	mv	a5,a0
    80000492:	579c                	lw	a5,40(a5)
    80000494:	cb99                	beqz	a5,800004aa <consoleread+0x56>
        release(&cons.lock);
    80000496:	00014517          	auipc	a0,0x14
    8000049a:	cda50513          	addi	a0,a0,-806 # 80014170 <cons>
    8000049e:	00001097          	auipc	ra,0x1
    800004a2:	e34080e7          	jalr	-460(ra) # 800012d2 <release>
        return -1;
    800004a6:	57fd                	li	a5,-1
    800004a8:	aa25                	j	800005e0 <consoleread+0x18c>
      }
      sleep(&cons.r, &cons.lock);
    800004aa:	00014597          	auipc	a1,0x14
    800004ae:	cc658593          	addi	a1,a1,-826 # 80014170 <cons>
    800004b2:	00014517          	auipc	a0,0x14
    800004b6:	d5650513          	addi	a0,a0,-682 # 80014208 <cons+0x98>
    800004ba:	00003097          	auipc	ra,0x3
    800004be:	fea080e7          	jalr	-22(ra) # 800034a4 <sleep>
    while(cons.r == cons.w){
    800004c2:	00014797          	auipc	a5,0x14
    800004c6:	cae78793          	addi	a5,a5,-850 # 80014170 <cons>
    800004ca:	0987a703          	lw	a4,152(a5)
    800004ce:	00014797          	auipc	a5,0x14
    800004d2:	ca278793          	addi	a5,a5,-862 # 80014170 <cons>
    800004d6:	09c7a783          	lw	a5,156(a5)
    800004da:	faf707e3          	beq	a4,a5,80000488 <consoleread+0x34>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];
    800004de:	00014797          	auipc	a5,0x14
    800004e2:	c9278793          	addi	a5,a5,-878 # 80014170 <cons>
    800004e6:	0987a783          	lw	a5,152(a5)
    800004ea:	2781                	sext.w	a5,a5
    800004ec:	0017871b          	addiw	a4,a5,1
    800004f0:	0007069b          	sext.w	a3,a4
    800004f4:	00014717          	auipc	a4,0x14
    800004f8:	c7c70713          	addi	a4,a4,-900 # 80014170 <cons>
    800004fc:	08d72c23          	sw	a3,152(a4)
    80000500:	07f7f793          	andi	a5,a5,127
    80000504:	2781                	sext.w	a5,a5
    80000506:	00014717          	auipc	a4,0x14
    8000050a:	c6a70713          	addi	a4,a4,-918 # 80014170 <cons>
    8000050e:	1782                	slli	a5,a5,0x20
    80000510:	9381                	srli	a5,a5,0x20
    80000512:	97ba                	add	a5,a5,a4
    80000514:	0187c783          	lbu	a5,24(a5)
    80000518:	fef42423          	sw	a5,-24(s0)

    if(c == C('D')){  // end-of-file
    8000051c:	fe842783          	lw	a5,-24(s0)
    80000520:	0007871b          	sext.w	a4,a5
    80000524:	4791                	li	a5,4
    80000526:	02f71963          	bne	a4,a5,80000558 <consoleread+0x104>
      if(n < target){
    8000052a:	fd842703          	lw	a4,-40(s0)
    8000052e:	fec42783          	lw	a5,-20(s0)
    80000532:	2781                	sext.w	a5,a5
    80000534:	08f77163          	bgeu	a4,a5,800005b6 <consoleread+0x162>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        cons.r--;
    80000538:	00014797          	auipc	a5,0x14
    8000053c:	c3878793          	addi	a5,a5,-968 # 80014170 <cons>
    80000540:	0987a783          	lw	a5,152(a5)
    80000544:	37fd                	addiw	a5,a5,-1
    80000546:	0007871b          	sext.w	a4,a5
    8000054a:	00014797          	auipc	a5,0x14
    8000054e:	c2678793          	addi	a5,a5,-986 # 80014170 <cons>
    80000552:	08e7ac23          	sw	a4,152(a5)
      }
      break;
    80000556:	a085                	j	800005b6 <consoleread+0x162>
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    80000558:	fe842783          	lw	a5,-24(s0)
    8000055c:	0ff7f793          	andi	a5,a5,255
    80000560:	fef403a3          	sb	a5,-25(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80000564:	fe740713          	addi	a4,s0,-25
    80000568:	fdc42783          	lw	a5,-36(s0)
    8000056c:	4685                	li	a3,1
    8000056e:	863a                	mv	a2,a4
    80000570:	fd043583          	ld	a1,-48(s0)
    80000574:	853e                	mv	a0,a5
    80000576:	00003097          	auipc	ra,0x3
    8000057a:	0e6080e7          	jalr	230(ra) # 8000365c <either_copyout>
    8000057e:	87aa                	mv	a5,a0
    80000580:	873e                	mv	a4,a5
    80000582:	57fd                	li	a5,-1
    80000584:	02f70b63          	beq	a4,a5,800005ba <consoleread+0x166>
      break;

    dst++;
    80000588:	fd043783          	ld	a5,-48(s0)
    8000058c:	0785                	addi	a5,a5,1
    8000058e:	fcf43823          	sd	a5,-48(s0)
    --n;
    80000592:	fd842783          	lw	a5,-40(s0)
    80000596:	37fd                	addiw	a5,a5,-1
    80000598:	fcf42c23          	sw	a5,-40(s0)

    if(c == '\n'){
    8000059c:	fe842783          	lw	a5,-24(s0)
    800005a0:	0007871b          	sext.w	a4,a5
    800005a4:	47a9                	li	a5,10
    800005a6:	00f70c63          	beq	a4,a5,800005be <consoleread+0x16a>
  while(n > 0){
    800005aa:	fd842783          	lw	a5,-40(s0)
    800005ae:	2781                	sext.w	a5,a5
    800005b0:	f0f049e3          	bgtz	a5,800004c2 <consoleread+0x6e>
    800005b4:	a031                	j	800005c0 <consoleread+0x16c>
      break;
    800005b6:	0001                	nop
    800005b8:	a021                	j	800005c0 <consoleread+0x16c>
      break;
    800005ba:	0001                	nop
    800005bc:	a011                	j	800005c0 <consoleread+0x16c>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    800005be:	0001                	nop
    }
  }
  release(&cons.lock);
    800005c0:	00014517          	auipc	a0,0x14
    800005c4:	bb050513          	addi	a0,a0,-1104 # 80014170 <cons>
    800005c8:	00001097          	auipc	ra,0x1
    800005cc:	d0a080e7          	jalr	-758(ra) # 800012d2 <release>

  return target - n;
    800005d0:	fd842783          	lw	a5,-40(s0)
    800005d4:	fec42703          	lw	a4,-20(s0)
    800005d8:	40f707bb          	subw	a5,a4,a5
    800005dc:	2781                	sext.w	a5,a5
    800005de:	2781                	sext.w	a5,a5
}
    800005e0:	853e                	mv	a0,a5
    800005e2:	70a2                	ld	ra,40(sp)
    800005e4:	7402                	ld	s0,32(sp)
    800005e6:	6145                	addi	sp,sp,48
    800005e8:	8082                	ret

00000000800005ea <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    800005ea:	1101                	addi	sp,sp,-32
    800005ec:	ec06                	sd	ra,24(sp)
    800005ee:	e822                	sd	s0,16(sp)
    800005f0:	1000                	addi	s0,sp,32
    800005f2:	87aa                	mv	a5,a0
    800005f4:	fef42623          	sw	a5,-20(s0)
  acquire(&cons.lock);
    800005f8:	00014517          	auipc	a0,0x14
    800005fc:	b7850513          	addi	a0,a0,-1160 # 80014170 <cons>
    80000600:	00001097          	auipc	ra,0x1
    80000604:	c6e080e7          	jalr	-914(ra) # 8000126e <acquire>

  switch(c){
    80000608:	fec42783          	lw	a5,-20(s0)
    8000060c:	0007871b          	sext.w	a4,a5
    80000610:	07f00793          	li	a5,127
    80000614:	0cf70763          	beq	a4,a5,800006e2 <consoleintr+0xf8>
    80000618:	fec42783          	lw	a5,-20(s0)
    8000061c:	0007871b          	sext.w	a4,a5
    80000620:	07f00793          	li	a5,127
    80000624:	10e7c363          	blt	a5,a4,8000072a <consoleintr+0x140>
    80000628:	fec42783          	lw	a5,-20(s0)
    8000062c:	0007871b          	sext.w	a4,a5
    80000630:	47d5                	li	a5,21
    80000632:	06f70163          	beq	a4,a5,80000694 <consoleintr+0xaa>
    80000636:	fec42783          	lw	a5,-20(s0)
    8000063a:	0007871b          	sext.w	a4,a5
    8000063e:	47d5                	li	a5,21
    80000640:	0ee7c563          	blt	a5,a4,8000072a <consoleintr+0x140>
    80000644:	fec42783          	lw	a5,-20(s0)
    80000648:	0007871b          	sext.w	a4,a5
    8000064c:	47a1                	li	a5,8
    8000064e:	08f70a63          	beq	a4,a5,800006e2 <consoleintr+0xf8>
    80000652:	fec42783          	lw	a5,-20(s0)
    80000656:	0007871b          	sext.w	a4,a5
    8000065a:	47c1                	li	a5,16
    8000065c:	0cf71763          	bne	a4,a5,8000072a <consoleintr+0x140>
  case C('P'):  // Print process list.
    procdump();
    80000660:	00003097          	auipc	ra,0x3
    80000664:	0e4080e7          	jalr	228(ra) # 80003744 <procdump>
    break;
    80000668:	aac1                	j	80000838 <consoleintr+0x24e>
  case C('U'):  // Kill line.
    while(cons.e != cons.w &&
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
      cons.e--;
    8000066a:	00014797          	auipc	a5,0x14
    8000066e:	b0678793          	addi	a5,a5,-1274 # 80014170 <cons>
    80000672:	0a07a783          	lw	a5,160(a5)
    80000676:	37fd                	addiw	a5,a5,-1
    80000678:	0007871b          	sext.w	a4,a5
    8000067c:	00014797          	auipc	a5,0x14
    80000680:	af478793          	addi	a5,a5,-1292 # 80014170 <cons>
    80000684:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    80000688:	10000513          	li	a0,256
    8000068c:	00000097          	auipc	ra,0x0
    80000690:	ce8080e7          	jalr	-792(ra) # 80000374 <consputc>
    while(cons.e != cons.w &&
    80000694:	00014797          	auipc	a5,0x14
    80000698:	adc78793          	addi	a5,a5,-1316 # 80014170 <cons>
    8000069c:	0a07a703          	lw	a4,160(a5)
    800006a0:	00014797          	auipc	a5,0x14
    800006a4:	ad078793          	addi	a5,a5,-1328 # 80014170 <cons>
    800006a8:	09c7a783          	lw	a5,156(a5)
    800006ac:	18f70163          	beq	a4,a5,8000082e <consoleintr+0x244>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    800006b0:	00014797          	auipc	a5,0x14
    800006b4:	ac078793          	addi	a5,a5,-1344 # 80014170 <cons>
    800006b8:	0a07a783          	lw	a5,160(a5)
    800006bc:	37fd                	addiw	a5,a5,-1
    800006be:	2781                	sext.w	a5,a5
    800006c0:	07f7f793          	andi	a5,a5,127
    800006c4:	2781                	sext.w	a5,a5
    800006c6:	00014717          	auipc	a4,0x14
    800006ca:	aaa70713          	addi	a4,a4,-1366 # 80014170 <cons>
    800006ce:	1782                	slli	a5,a5,0x20
    800006d0:	9381                	srli	a5,a5,0x20
    800006d2:	97ba                	add	a5,a5,a4
    800006d4:	0187c783          	lbu	a5,24(a5)
    while(cons.e != cons.w &&
    800006d8:	873e                	mv	a4,a5
    800006da:	47a9                	li	a5,10
    800006dc:	f8f717e3          	bne	a4,a5,8000066a <consoleintr+0x80>
    }
    break;
    800006e0:	a2b9                	j	8000082e <consoleintr+0x244>
  case C('H'): // Backspace
  case '\x7f':
    if(cons.e != cons.w){
    800006e2:	00014797          	auipc	a5,0x14
    800006e6:	a8e78793          	addi	a5,a5,-1394 # 80014170 <cons>
    800006ea:	0a07a703          	lw	a4,160(a5)
    800006ee:	00014797          	auipc	a5,0x14
    800006f2:	a8278793          	addi	a5,a5,-1406 # 80014170 <cons>
    800006f6:	09c7a783          	lw	a5,156(a5)
    800006fa:	12f70c63          	beq	a4,a5,80000832 <consoleintr+0x248>
      cons.e--;
    800006fe:	00014797          	auipc	a5,0x14
    80000702:	a7278793          	addi	a5,a5,-1422 # 80014170 <cons>
    80000706:	0a07a783          	lw	a5,160(a5)
    8000070a:	37fd                	addiw	a5,a5,-1
    8000070c:	0007871b          	sext.w	a4,a5
    80000710:	00014797          	auipc	a5,0x14
    80000714:	a6078793          	addi	a5,a5,-1440 # 80014170 <cons>
    80000718:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    8000071c:	10000513          	li	a0,256
    80000720:	00000097          	auipc	ra,0x0
    80000724:	c54080e7          	jalr	-940(ra) # 80000374 <consputc>
    }
    break;
    80000728:	a229                	j	80000832 <consoleintr+0x248>
  default:
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    8000072a:	fec42783          	lw	a5,-20(s0)
    8000072e:	2781                	sext.w	a5,a5
    80000730:	10078363          	beqz	a5,80000836 <consoleintr+0x24c>
    80000734:	00014797          	auipc	a5,0x14
    80000738:	a3c78793          	addi	a5,a5,-1476 # 80014170 <cons>
    8000073c:	0a07a703          	lw	a4,160(a5)
    80000740:	00014797          	auipc	a5,0x14
    80000744:	a3078793          	addi	a5,a5,-1488 # 80014170 <cons>
    80000748:	0987a783          	lw	a5,152(a5)
    8000074c:	40f707bb          	subw	a5,a4,a5
    80000750:	2781                	sext.w	a5,a5
    80000752:	873e                	mv	a4,a5
    80000754:	07f00793          	li	a5,127
    80000758:	0ce7ef63          	bltu	a5,a4,80000836 <consoleintr+0x24c>
      c = (c == '\r') ? '\n' : c;
    8000075c:	fec42783          	lw	a5,-20(s0)
    80000760:	0007871b          	sext.w	a4,a5
    80000764:	47b5                	li	a5,13
    80000766:	00f70563          	beq	a4,a5,80000770 <consoleintr+0x186>
    8000076a:	fec42783          	lw	a5,-20(s0)
    8000076e:	a011                	j	80000772 <consoleintr+0x188>
    80000770:	47a9                	li	a5,10
    80000772:	fef42623          	sw	a5,-20(s0)

      // echo back to the user.
      consputc(c);
    80000776:	fec42783          	lw	a5,-20(s0)
    8000077a:	853e                	mv	a0,a5
    8000077c:	00000097          	auipc	ra,0x0
    80000780:	bf8080e7          	jalr	-1032(ra) # 80000374 <consputc>

      // store for consumption by consoleread().
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80000784:	00014797          	auipc	a5,0x14
    80000788:	9ec78793          	addi	a5,a5,-1556 # 80014170 <cons>
    8000078c:	0a07a783          	lw	a5,160(a5)
    80000790:	2781                	sext.w	a5,a5
    80000792:	0017871b          	addiw	a4,a5,1
    80000796:	0007069b          	sext.w	a3,a4
    8000079a:	00014717          	auipc	a4,0x14
    8000079e:	9d670713          	addi	a4,a4,-1578 # 80014170 <cons>
    800007a2:	0ad72023          	sw	a3,160(a4)
    800007a6:	07f7f793          	andi	a5,a5,127
    800007aa:	2781                	sext.w	a5,a5
    800007ac:	fec42703          	lw	a4,-20(s0)
    800007b0:	0ff77713          	andi	a4,a4,255
    800007b4:	00014697          	auipc	a3,0x14
    800007b8:	9bc68693          	addi	a3,a3,-1604 # 80014170 <cons>
    800007bc:	1782                	slli	a5,a5,0x20
    800007be:	9381                	srli	a5,a5,0x20
    800007c0:	97b6                	add	a5,a5,a3
    800007c2:	00e78c23          	sb	a4,24(a5)

      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    800007c6:	fec42783          	lw	a5,-20(s0)
    800007ca:	0007871b          	sext.w	a4,a5
    800007ce:	47a9                	li	a5,10
    800007d0:	02f70a63          	beq	a4,a5,80000804 <consoleintr+0x21a>
    800007d4:	fec42783          	lw	a5,-20(s0)
    800007d8:	0007871b          	sext.w	a4,a5
    800007dc:	4791                	li	a5,4
    800007de:	02f70363          	beq	a4,a5,80000804 <consoleintr+0x21a>
    800007e2:	00014797          	auipc	a5,0x14
    800007e6:	98e78793          	addi	a5,a5,-1650 # 80014170 <cons>
    800007ea:	0a07a703          	lw	a4,160(a5)
    800007ee:	00014797          	auipc	a5,0x14
    800007f2:	98278793          	addi	a5,a5,-1662 # 80014170 <cons>
    800007f6:	0987a783          	lw	a5,152(a5)
    800007fa:	0807879b          	addiw	a5,a5,128
    800007fe:	2781                	sext.w	a5,a5
    80000800:	02f71b63          	bne	a4,a5,80000836 <consoleintr+0x24c>
        // wake up consoleread() if a whole line (or end-of-file)
        // has arrived.
        cons.w = cons.e;
    80000804:	00014797          	auipc	a5,0x14
    80000808:	96c78793          	addi	a5,a5,-1684 # 80014170 <cons>
    8000080c:	0a07a703          	lw	a4,160(a5)
    80000810:	00014797          	auipc	a5,0x14
    80000814:	96078793          	addi	a5,a5,-1696 # 80014170 <cons>
    80000818:	08e7ae23          	sw	a4,156(a5)
        wakeup(&cons.r);
    8000081c:	00014517          	auipc	a0,0x14
    80000820:	9ec50513          	addi	a0,a0,-1556 # 80014208 <cons+0x98>
    80000824:	00003097          	auipc	ra,0x3
    80000828:	cfc080e7          	jalr	-772(ra) # 80003520 <wakeup>
      }
    }
    break;
    8000082c:	a029                	j	80000836 <consoleintr+0x24c>
    break;
    8000082e:	0001                	nop
    80000830:	a021                	j	80000838 <consoleintr+0x24e>
    break;
    80000832:	0001                	nop
    80000834:	a011                	j	80000838 <consoleintr+0x24e>
    break;
    80000836:	0001                	nop
  }
  
  release(&cons.lock);
    80000838:	00014517          	auipc	a0,0x14
    8000083c:	93850513          	addi	a0,a0,-1736 # 80014170 <cons>
    80000840:	00001097          	auipc	ra,0x1
    80000844:	a92080e7          	jalr	-1390(ra) # 800012d2 <release>
}
    80000848:	0001                	nop
    8000084a:	60e2                	ld	ra,24(sp)
    8000084c:	6442                	ld	s0,16(sp)
    8000084e:	6105                	addi	sp,sp,32
    80000850:	8082                	ret

0000000080000852 <consoleinit>:

void
consoleinit(void)
{
    80000852:	1141                	addi	sp,sp,-16
    80000854:	e406                	sd	ra,8(sp)
    80000856:	e022                	sd	s0,0(sp)
    80000858:	0800                	addi	s0,sp,16
  initlock(&cons.lock, "cons");
    8000085a:	0000a597          	auipc	a1,0xa
    8000085e:	7a658593          	addi	a1,a1,1958 # 8000b000 <etext>
    80000862:	00014517          	auipc	a0,0x14
    80000866:	90e50513          	addi	a0,a0,-1778 # 80014170 <cons>
    8000086a:	00001097          	auipc	ra,0x1
    8000086e:	9d4080e7          	jalr	-1580(ra) # 8000123e <initlock>

  uartinit();
    80000872:	00000097          	auipc	ra,0x0
    80000876:	494080e7          	jalr	1172(ra) # 80000d06 <uartinit>

  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    8000087a:	00024797          	auipc	a5,0x24
    8000087e:	ad678793          	addi	a5,a5,-1322 # 80024350 <devsw>
    80000882:	00000717          	auipc	a4,0x0
    80000886:	bd270713          	addi	a4,a4,-1070 # 80000454 <consoleread>
    8000088a:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    8000088c:	00024797          	auipc	a5,0x24
    80000890:	ac478793          	addi	a5,a5,-1340 # 80024350 <devsw>
    80000894:	00000717          	auipc	a4,0x0
    80000898:	b3870713          	addi	a4,a4,-1224 # 800003cc <consolewrite>
    8000089c:	ef98                	sd	a4,24(a5)
}
    8000089e:	0001                	nop
    800008a0:	60a2                	ld	ra,8(sp)
    800008a2:	6402                	ld	s0,0(sp)
    800008a4:	0141                	addi	sp,sp,16
    800008a6:	8082                	ret

00000000800008a8 <printint>:

static char digits[] = "0123456789abcdef";

static void
printint(int xx, int base, int sign)
{
    800008a8:	7139                	addi	sp,sp,-64
    800008aa:	fc06                	sd	ra,56(sp)
    800008ac:	f822                	sd	s0,48(sp)
    800008ae:	0080                	addi	s0,sp,64
    800008b0:	87aa                	mv	a5,a0
    800008b2:	86ae                	mv	a3,a1
    800008b4:	8732                	mv	a4,a2
    800008b6:	fcf42623          	sw	a5,-52(s0)
    800008ba:	87b6                	mv	a5,a3
    800008bc:	fcf42423          	sw	a5,-56(s0)
    800008c0:	87ba                	mv	a5,a4
    800008c2:	fcf42223          	sw	a5,-60(s0)
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    800008c6:	fc442783          	lw	a5,-60(s0)
    800008ca:	2781                	sext.w	a5,a5
    800008cc:	c78d                	beqz	a5,800008f6 <printint+0x4e>
    800008ce:	fcc42783          	lw	a5,-52(s0)
    800008d2:	01f7d79b          	srliw	a5,a5,0x1f
    800008d6:	0ff7f793          	andi	a5,a5,255
    800008da:	fcf42223          	sw	a5,-60(s0)
    800008de:	fc442783          	lw	a5,-60(s0)
    800008e2:	2781                	sext.w	a5,a5
    800008e4:	cb89                	beqz	a5,800008f6 <printint+0x4e>
    x = -xx;
    800008e6:	fcc42783          	lw	a5,-52(s0)
    800008ea:	40f007bb          	negw	a5,a5
    800008ee:	2781                	sext.w	a5,a5
    800008f0:	fef42423          	sw	a5,-24(s0)
    800008f4:	a029                	j	800008fe <printint+0x56>
  else
    x = xx;
    800008f6:	fcc42783          	lw	a5,-52(s0)
    800008fa:	fef42423          	sw	a5,-24(s0)

  i = 0;
    800008fe:	fe042623          	sw	zero,-20(s0)
  do {
    buf[i++] = digits[x % base];
    80000902:	fc842783          	lw	a5,-56(s0)
    80000906:	fe842703          	lw	a4,-24(s0)
    8000090a:	02f777bb          	remuw	a5,a4,a5
    8000090e:	0007861b          	sext.w	a2,a5
    80000912:	fec42783          	lw	a5,-20(s0)
    80000916:	0017871b          	addiw	a4,a5,1
    8000091a:	fee42623          	sw	a4,-20(s0)
    8000091e:	0000b697          	auipc	a3,0xb
    80000922:	e6268693          	addi	a3,a3,-414 # 8000b780 <digits>
    80000926:	02061713          	slli	a4,a2,0x20
    8000092a:	9301                	srli	a4,a4,0x20
    8000092c:	9736                	add	a4,a4,a3
    8000092e:	00074703          	lbu	a4,0(a4)
    80000932:	ff040693          	addi	a3,s0,-16
    80000936:	97b6                	add	a5,a5,a3
    80000938:	fee78423          	sb	a4,-24(a5)
  } while((x /= base) != 0);
    8000093c:	fc842783          	lw	a5,-56(s0)
    80000940:	fe842703          	lw	a4,-24(s0)
    80000944:	02f757bb          	divuw	a5,a4,a5
    80000948:	fef42423          	sw	a5,-24(s0)
    8000094c:	fe842783          	lw	a5,-24(s0)
    80000950:	2781                	sext.w	a5,a5
    80000952:	fbc5                	bnez	a5,80000902 <printint+0x5a>

  if(sign)
    80000954:	fc442783          	lw	a5,-60(s0)
    80000958:	2781                	sext.w	a5,a5
    8000095a:	cf85                	beqz	a5,80000992 <printint+0xea>
    buf[i++] = '-';
    8000095c:	fec42783          	lw	a5,-20(s0)
    80000960:	0017871b          	addiw	a4,a5,1
    80000964:	fee42623          	sw	a4,-20(s0)
    80000968:	ff040713          	addi	a4,s0,-16
    8000096c:	97ba                	add	a5,a5,a4
    8000096e:	02d00713          	li	a4,45
    80000972:	fee78423          	sb	a4,-24(a5)

  while(--i >= 0)
    80000976:	a831                	j	80000992 <printint+0xea>
    consputc(buf[i]);
    80000978:	fec42783          	lw	a5,-20(s0)
    8000097c:	ff040713          	addi	a4,s0,-16
    80000980:	97ba                	add	a5,a5,a4
    80000982:	fe87c783          	lbu	a5,-24(a5)
    80000986:	2781                	sext.w	a5,a5
    80000988:	853e                	mv	a0,a5
    8000098a:	00000097          	auipc	ra,0x0
    8000098e:	9ea080e7          	jalr	-1558(ra) # 80000374 <consputc>
  while(--i >= 0)
    80000992:	fec42783          	lw	a5,-20(s0)
    80000996:	37fd                	addiw	a5,a5,-1
    80000998:	fef42623          	sw	a5,-20(s0)
    8000099c:	fec42783          	lw	a5,-20(s0)
    800009a0:	2781                	sext.w	a5,a5
    800009a2:	fc07dbe3          	bgez	a5,80000978 <printint+0xd0>
}
    800009a6:	0001                	nop
    800009a8:	0001                	nop
    800009aa:	70e2                	ld	ra,56(sp)
    800009ac:	7442                	ld	s0,48(sp)
    800009ae:	6121                	addi	sp,sp,64
    800009b0:	8082                	ret

00000000800009b2 <printptr>:

static void
printptr(uint64 x)
{
    800009b2:	7179                	addi	sp,sp,-48
    800009b4:	f406                	sd	ra,40(sp)
    800009b6:	f022                	sd	s0,32(sp)
    800009b8:	1800                	addi	s0,sp,48
    800009ba:	fca43c23          	sd	a0,-40(s0)
  int i;
  consputc('0');
    800009be:	03000513          	li	a0,48
    800009c2:	00000097          	auipc	ra,0x0
    800009c6:	9b2080e7          	jalr	-1614(ra) # 80000374 <consputc>
  consputc('x');
    800009ca:	07800513          	li	a0,120
    800009ce:	00000097          	auipc	ra,0x0
    800009d2:	9a6080e7          	jalr	-1626(ra) # 80000374 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    800009d6:	fe042623          	sw	zero,-20(s0)
    800009da:	a81d                	j	80000a10 <printptr+0x5e>
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    800009dc:	fd843783          	ld	a5,-40(s0)
    800009e0:	93f1                	srli	a5,a5,0x3c
    800009e2:	0000b717          	auipc	a4,0xb
    800009e6:	d9e70713          	addi	a4,a4,-610 # 8000b780 <digits>
    800009ea:	97ba                	add	a5,a5,a4
    800009ec:	0007c783          	lbu	a5,0(a5)
    800009f0:	2781                	sext.w	a5,a5
    800009f2:	853e                	mv	a0,a5
    800009f4:	00000097          	auipc	ra,0x0
    800009f8:	980080e7          	jalr	-1664(ra) # 80000374 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    800009fc:	fec42783          	lw	a5,-20(s0)
    80000a00:	2785                	addiw	a5,a5,1
    80000a02:	fef42623          	sw	a5,-20(s0)
    80000a06:	fd843783          	ld	a5,-40(s0)
    80000a0a:	0792                	slli	a5,a5,0x4
    80000a0c:	fcf43c23          	sd	a5,-40(s0)
    80000a10:	fec42783          	lw	a5,-20(s0)
    80000a14:	873e                	mv	a4,a5
    80000a16:	47bd                	li	a5,15
    80000a18:	fce7f2e3          	bgeu	a5,a4,800009dc <printptr+0x2a>
}
    80000a1c:	0001                	nop
    80000a1e:	0001                	nop
    80000a20:	70a2                	ld	ra,40(sp)
    80000a22:	7402                	ld	s0,32(sp)
    80000a24:	6145                	addi	sp,sp,48
    80000a26:	8082                	ret

0000000080000a28 <printf>:

// Print to the console. only understands %d, %x, %p, %s.
void
printf(char *fmt, ...)
{
    80000a28:	7119                	addi	sp,sp,-128
    80000a2a:	fc06                	sd	ra,56(sp)
    80000a2c:	f822                	sd	s0,48(sp)
    80000a2e:	0080                	addi	s0,sp,64
    80000a30:	fca43423          	sd	a0,-56(s0)
    80000a34:	e40c                	sd	a1,8(s0)
    80000a36:	e810                	sd	a2,16(s0)
    80000a38:	ec14                	sd	a3,24(s0)
    80000a3a:	f018                	sd	a4,32(s0)
    80000a3c:	f41c                	sd	a5,40(s0)
    80000a3e:	03043823          	sd	a6,48(s0)
    80000a42:	03143c23          	sd	a7,56(s0)
  va_list ap;
  int i, c, locking;
  char *s;

  locking = pr.locking;
    80000a46:	00013797          	auipc	a5,0x13
    80000a4a:	7d278793          	addi	a5,a5,2002 # 80014218 <pr>
    80000a4e:	4f9c                	lw	a5,24(a5)
    80000a50:	fcf42e23          	sw	a5,-36(s0)
  if(locking)
    80000a54:	fdc42783          	lw	a5,-36(s0)
    80000a58:	2781                	sext.w	a5,a5
    80000a5a:	cb89                	beqz	a5,80000a6c <printf+0x44>
    acquire(&pr.lock);
    80000a5c:	00013517          	auipc	a0,0x13
    80000a60:	7bc50513          	addi	a0,a0,1980 # 80014218 <pr>
    80000a64:	00001097          	auipc	ra,0x1
    80000a68:	80a080e7          	jalr	-2038(ra) # 8000126e <acquire>

  if (fmt == 0)
    80000a6c:	fc843783          	ld	a5,-56(s0)
    80000a70:	eb89                	bnez	a5,80000a82 <printf+0x5a>
    panic("null fmt");
    80000a72:	0000a517          	auipc	a0,0xa
    80000a76:	59650513          	addi	a0,a0,1430 # 8000b008 <etext+0x8>
    80000a7a:	00000097          	auipc	ra,0x0
    80000a7e:	204080e7          	jalr	516(ra) # 80000c7e <panic>

  va_start(ap, fmt);
    80000a82:	04040793          	addi	a5,s0,64
    80000a86:	fcf43023          	sd	a5,-64(s0)
    80000a8a:	fc043783          	ld	a5,-64(s0)
    80000a8e:	fc878793          	addi	a5,a5,-56
    80000a92:	fcf43823          	sd	a5,-48(s0)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80000a96:	fe042623          	sw	zero,-20(s0)
    80000a9a:	a24d                	j	80000c3c <printf+0x214>
    if(c != '%'){
    80000a9c:	fd842783          	lw	a5,-40(s0)
    80000aa0:	0007871b          	sext.w	a4,a5
    80000aa4:	02500793          	li	a5,37
    80000aa8:	00f70a63          	beq	a4,a5,80000abc <printf+0x94>
      consputc(c);
    80000aac:	fd842783          	lw	a5,-40(s0)
    80000ab0:	853e                	mv	a0,a5
    80000ab2:	00000097          	auipc	ra,0x0
    80000ab6:	8c2080e7          	jalr	-1854(ra) # 80000374 <consputc>
      continue;
    80000aba:	aaa5                	j	80000c32 <printf+0x20a>
    }
    c = fmt[++i] & 0xff;
    80000abc:	fec42783          	lw	a5,-20(s0)
    80000ac0:	2785                	addiw	a5,a5,1
    80000ac2:	fef42623          	sw	a5,-20(s0)
    80000ac6:	fec42783          	lw	a5,-20(s0)
    80000aca:	fc843703          	ld	a4,-56(s0)
    80000ace:	97ba                	add	a5,a5,a4
    80000ad0:	0007c783          	lbu	a5,0(a5)
    80000ad4:	fcf42c23          	sw	a5,-40(s0)
    if(c == 0)
    80000ad8:	fd842783          	lw	a5,-40(s0)
    80000adc:	2781                	sext.w	a5,a5
    80000ade:	16078e63          	beqz	a5,80000c5a <printf+0x232>
      break;
    switch(c){
    80000ae2:	fd842783          	lw	a5,-40(s0)
    80000ae6:	0007871b          	sext.w	a4,a5
    80000aea:	07800793          	li	a5,120
    80000aee:	08f70963          	beq	a4,a5,80000b80 <printf+0x158>
    80000af2:	fd842783          	lw	a5,-40(s0)
    80000af6:	0007871b          	sext.w	a4,a5
    80000afa:	07800793          	li	a5,120
    80000afe:	10e7cc63          	blt	a5,a4,80000c16 <printf+0x1ee>
    80000b02:	fd842783          	lw	a5,-40(s0)
    80000b06:	0007871b          	sext.w	a4,a5
    80000b0a:	07300793          	li	a5,115
    80000b0e:	0af70563          	beq	a4,a5,80000bb8 <printf+0x190>
    80000b12:	fd842783          	lw	a5,-40(s0)
    80000b16:	0007871b          	sext.w	a4,a5
    80000b1a:	07300793          	li	a5,115
    80000b1e:	0ee7cc63          	blt	a5,a4,80000c16 <printf+0x1ee>
    80000b22:	fd842783          	lw	a5,-40(s0)
    80000b26:	0007871b          	sext.w	a4,a5
    80000b2a:	07000793          	li	a5,112
    80000b2e:	06f70863          	beq	a4,a5,80000b9e <printf+0x176>
    80000b32:	fd842783          	lw	a5,-40(s0)
    80000b36:	0007871b          	sext.w	a4,a5
    80000b3a:	07000793          	li	a5,112
    80000b3e:	0ce7cc63          	blt	a5,a4,80000c16 <printf+0x1ee>
    80000b42:	fd842783          	lw	a5,-40(s0)
    80000b46:	0007871b          	sext.w	a4,a5
    80000b4a:	02500793          	li	a5,37
    80000b4e:	0af70d63          	beq	a4,a5,80000c08 <printf+0x1e0>
    80000b52:	fd842783          	lw	a5,-40(s0)
    80000b56:	0007871b          	sext.w	a4,a5
    80000b5a:	06400793          	li	a5,100
    80000b5e:	0af71c63          	bne	a4,a5,80000c16 <printf+0x1ee>
    case 'd':
      printint(va_arg(ap, int), 10, 1);
    80000b62:	fd043783          	ld	a5,-48(s0)
    80000b66:	00878713          	addi	a4,a5,8
    80000b6a:	fce43823          	sd	a4,-48(s0)
    80000b6e:	439c                	lw	a5,0(a5)
    80000b70:	4605                	li	a2,1
    80000b72:	45a9                	li	a1,10
    80000b74:	853e                	mv	a0,a5
    80000b76:	00000097          	auipc	ra,0x0
    80000b7a:	d32080e7          	jalr	-718(ra) # 800008a8 <printint>
      break;
    80000b7e:	a855                	j	80000c32 <printf+0x20a>
    case 'x':
      printint(va_arg(ap, int), 16, 1);
    80000b80:	fd043783          	ld	a5,-48(s0)
    80000b84:	00878713          	addi	a4,a5,8
    80000b88:	fce43823          	sd	a4,-48(s0)
    80000b8c:	439c                	lw	a5,0(a5)
    80000b8e:	4605                	li	a2,1
    80000b90:	45c1                	li	a1,16
    80000b92:	853e                	mv	a0,a5
    80000b94:	00000097          	auipc	ra,0x0
    80000b98:	d14080e7          	jalr	-748(ra) # 800008a8 <printint>
      break;
    80000b9c:	a859                	j	80000c32 <printf+0x20a>
    case 'p':
      printptr(va_arg(ap, uint64));
    80000b9e:	fd043783          	ld	a5,-48(s0)
    80000ba2:	00878713          	addi	a4,a5,8
    80000ba6:	fce43823          	sd	a4,-48(s0)
    80000baa:	639c                	ld	a5,0(a5)
    80000bac:	853e                	mv	a0,a5
    80000bae:	00000097          	auipc	ra,0x0
    80000bb2:	e04080e7          	jalr	-508(ra) # 800009b2 <printptr>
      break;
    80000bb6:	a8b5                	j	80000c32 <printf+0x20a>
    case 's':
      if((s = va_arg(ap, char*)) == 0)
    80000bb8:	fd043783          	ld	a5,-48(s0)
    80000bbc:	00878713          	addi	a4,a5,8
    80000bc0:	fce43823          	sd	a4,-48(s0)
    80000bc4:	639c                	ld	a5,0(a5)
    80000bc6:	fef43023          	sd	a5,-32(s0)
    80000bca:	fe043783          	ld	a5,-32(s0)
    80000bce:	e79d                	bnez	a5,80000bfc <printf+0x1d4>
        s = "(null)";
    80000bd0:	0000a797          	auipc	a5,0xa
    80000bd4:	44878793          	addi	a5,a5,1096 # 8000b018 <etext+0x18>
    80000bd8:	fef43023          	sd	a5,-32(s0)
      for(; *s; s++)
    80000bdc:	a005                	j	80000bfc <printf+0x1d4>
        consputc(*s);
    80000bde:	fe043783          	ld	a5,-32(s0)
    80000be2:	0007c783          	lbu	a5,0(a5)
    80000be6:	2781                	sext.w	a5,a5
    80000be8:	853e                	mv	a0,a5
    80000bea:	fffff097          	auipc	ra,0xfffff
    80000bee:	78a080e7          	jalr	1930(ra) # 80000374 <consputc>
      for(; *s; s++)
    80000bf2:	fe043783          	ld	a5,-32(s0)
    80000bf6:	0785                	addi	a5,a5,1
    80000bf8:	fef43023          	sd	a5,-32(s0)
    80000bfc:	fe043783          	ld	a5,-32(s0)
    80000c00:	0007c783          	lbu	a5,0(a5)
    80000c04:	ffe9                	bnez	a5,80000bde <printf+0x1b6>
      break;
    80000c06:	a035                	j	80000c32 <printf+0x20a>
    case '%':
      consputc('%');
    80000c08:	02500513          	li	a0,37
    80000c0c:	fffff097          	auipc	ra,0xfffff
    80000c10:	768080e7          	jalr	1896(ra) # 80000374 <consputc>
      break;
    80000c14:	a839                	j	80000c32 <printf+0x20a>
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
    80000c16:	02500513          	li	a0,37
    80000c1a:	fffff097          	auipc	ra,0xfffff
    80000c1e:	75a080e7          	jalr	1882(ra) # 80000374 <consputc>
      consputc(c);
    80000c22:	fd842783          	lw	a5,-40(s0)
    80000c26:	853e                	mv	a0,a5
    80000c28:	fffff097          	auipc	ra,0xfffff
    80000c2c:	74c080e7          	jalr	1868(ra) # 80000374 <consputc>
      break;
    80000c30:	0001                	nop
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80000c32:	fec42783          	lw	a5,-20(s0)
    80000c36:	2785                	addiw	a5,a5,1
    80000c38:	fef42623          	sw	a5,-20(s0)
    80000c3c:	fec42783          	lw	a5,-20(s0)
    80000c40:	fc843703          	ld	a4,-56(s0)
    80000c44:	97ba                	add	a5,a5,a4
    80000c46:	0007c783          	lbu	a5,0(a5)
    80000c4a:	fcf42c23          	sw	a5,-40(s0)
    80000c4e:	fd842783          	lw	a5,-40(s0)
    80000c52:	2781                	sext.w	a5,a5
    80000c54:	e40794e3          	bnez	a5,80000a9c <printf+0x74>
    80000c58:	a011                	j	80000c5c <printf+0x234>
      break;
    80000c5a:	0001                	nop
    }
  }

  if(locking)
    80000c5c:	fdc42783          	lw	a5,-36(s0)
    80000c60:	2781                	sext.w	a5,a5
    80000c62:	cb89                	beqz	a5,80000c74 <printf+0x24c>
    release(&pr.lock);
    80000c64:	00013517          	auipc	a0,0x13
    80000c68:	5b450513          	addi	a0,a0,1460 # 80014218 <pr>
    80000c6c:	00000097          	auipc	ra,0x0
    80000c70:	666080e7          	jalr	1638(ra) # 800012d2 <release>
}
    80000c74:	0001                	nop
    80000c76:	70e2                	ld	ra,56(sp)
    80000c78:	7442                	ld	s0,48(sp)
    80000c7a:	6109                	addi	sp,sp,128
    80000c7c:	8082                	ret

0000000080000c7e <panic>:

void
panic(char *s)
{
    80000c7e:	1101                	addi	sp,sp,-32
    80000c80:	ec06                	sd	ra,24(sp)
    80000c82:	e822                	sd	s0,16(sp)
    80000c84:	1000                	addi	s0,sp,32
    80000c86:	fea43423          	sd	a0,-24(s0)
  pr.locking = 0;
    80000c8a:	00013797          	auipc	a5,0x13
    80000c8e:	58e78793          	addi	a5,a5,1422 # 80014218 <pr>
    80000c92:	0007ac23          	sw	zero,24(a5)
  printf("panic: ");
    80000c96:	0000a517          	auipc	a0,0xa
    80000c9a:	38a50513          	addi	a0,a0,906 # 8000b020 <etext+0x20>
    80000c9e:	00000097          	auipc	ra,0x0
    80000ca2:	d8a080e7          	jalr	-630(ra) # 80000a28 <printf>
  printf(s);
    80000ca6:	fe843503          	ld	a0,-24(s0)
    80000caa:	00000097          	auipc	ra,0x0
    80000cae:	d7e080e7          	jalr	-642(ra) # 80000a28 <printf>
  printf("\n");
    80000cb2:	0000a517          	auipc	a0,0xa
    80000cb6:	37650513          	addi	a0,a0,886 # 8000b028 <etext+0x28>
    80000cba:	00000097          	auipc	ra,0x0
    80000cbe:	d6e080e7          	jalr	-658(ra) # 80000a28 <printf>
  panicked = 1; // freeze uart output from other CPUs
    80000cc2:	0000b797          	auipc	a5,0xb
    80000cc6:	33e78793          	addi	a5,a5,830 # 8000c000 <panicked>
    80000cca:	4705                	li	a4,1
    80000ccc:	c398                	sw	a4,0(a5)
  for(;;)
    80000cce:	a001                	j	80000cce <panic+0x50>

0000000080000cd0 <printfinit>:
    ;
}

void
printfinit(void)
{
    80000cd0:	1141                	addi	sp,sp,-16
    80000cd2:	e406                	sd	ra,8(sp)
    80000cd4:	e022                	sd	s0,0(sp)
    80000cd6:	0800                	addi	s0,sp,16
  initlock(&pr.lock, "pr");
    80000cd8:	0000a597          	auipc	a1,0xa
    80000cdc:	35858593          	addi	a1,a1,856 # 8000b030 <etext+0x30>
    80000ce0:	00013517          	auipc	a0,0x13
    80000ce4:	53850513          	addi	a0,a0,1336 # 80014218 <pr>
    80000ce8:	00000097          	auipc	ra,0x0
    80000cec:	556080e7          	jalr	1366(ra) # 8000123e <initlock>
  pr.locking = 1;
    80000cf0:	00013797          	auipc	a5,0x13
    80000cf4:	52878793          	addi	a5,a5,1320 # 80014218 <pr>
    80000cf8:	4705                	li	a4,1
    80000cfa:	cf98                	sw	a4,24(a5)
}
    80000cfc:	0001                	nop
    80000cfe:	60a2                	ld	ra,8(sp)
    80000d00:	6402                	ld	s0,0(sp)
    80000d02:	0141                	addi	sp,sp,16
    80000d04:	8082                	ret

0000000080000d06 <uartinit>:

void uartstart();

void
uartinit(void)
{
    80000d06:	1141                	addi	sp,sp,-16
    80000d08:	e406                	sd	ra,8(sp)
    80000d0a:	e022                	sd	s0,0(sp)
    80000d0c:	0800                	addi	s0,sp,16
  // disable interrupts.
  WriteReg(IER, 0x00);
    80000d0e:	100007b7          	lui	a5,0x10000
    80000d12:	0785                	addi	a5,a5,1
    80000d14:	00078023          	sb	zero,0(a5) # 10000000 <_entry-0x70000000>

  // special mode to set baud rate.
  WriteReg(LCR, LCR_BAUD_LATCH);
    80000d18:	100007b7          	lui	a5,0x10000
    80000d1c:	078d                	addi	a5,a5,3
    80000d1e:	f8000713          	li	a4,-128
    80000d22:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // LSB for baud rate of 38.4K.
  WriteReg(0, 0x03);
    80000d26:	100007b7          	lui	a5,0x10000
    80000d2a:	470d                	li	a4,3
    80000d2c:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // MSB for baud rate of 38.4K.
  WriteReg(1, 0x00);
    80000d30:	100007b7          	lui	a5,0x10000
    80000d34:	0785                	addi	a5,a5,1
    80000d36:	00078023          	sb	zero,0(a5) # 10000000 <_entry-0x70000000>

  // leave set-baud mode,
  // and set word length to 8 bits, no parity.
  WriteReg(LCR, LCR_EIGHT_BITS);
    80000d3a:	100007b7          	lui	a5,0x10000
    80000d3e:	078d                	addi	a5,a5,3
    80000d40:	470d                	li	a4,3
    80000d42:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // reset and enable FIFOs.
  WriteReg(FCR, FCR_FIFO_ENABLE | FCR_FIFO_CLEAR);
    80000d46:	100007b7          	lui	a5,0x10000
    80000d4a:	0789                	addi	a5,a5,2
    80000d4c:	471d                	li	a4,7
    80000d4e:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // enable transmit and receive interrupts.
  WriteReg(IER, IER_TX_ENABLE | IER_RX_ENABLE);
    80000d52:	100007b7          	lui	a5,0x10000
    80000d56:	0785                	addi	a5,a5,1
    80000d58:	470d                	li	a4,3
    80000d5a:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  initlock(&uart_tx_lock, "uart");
    80000d5e:	0000a597          	auipc	a1,0xa
    80000d62:	2da58593          	addi	a1,a1,730 # 8000b038 <etext+0x38>
    80000d66:	00013517          	auipc	a0,0x13
    80000d6a:	4d250513          	addi	a0,a0,1234 # 80014238 <uart_tx_lock>
    80000d6e:	00000097          	auipc	ra,0x0
    80000d72:	4d0080e7          	jalr	1232(ra) # 8000123e <initlock>
}
    80000d76:	0001                	nop
    80000d78:	60a2                	ld	ra,8(sp)
    80000d7a:	6402                	ld	s0,0(sp)
    80000d7c:	0141                	addi	sp,sp,16
    80000d7e:	8082                	ret

0000000080000d80 <uartputc>:
// because it may block, it can't be called
// from interrupts; it's only suitable for use
// by write().
void
uartputc(int c)
{
    80000d80:	1101                	addi	sp,sp,-32
    80000d82:	ec06                	sd	ra,24(sp)
    80000d84:	e822                	sd	s0,16(sp)
    80000d86:	1000                	addi	s0,sp,32
    80000d88:	87aa                	mv	a5,a0
    80000d8a:	fef42623          	sw	a5,-20(s0)
  acquire(&uart_tx_lock);
    80000d8e:	00013517          	auipc	a0,0x13
    80000d92:	4aa50513          	addi	a0,a0,1194 # 80014238 <uart_tx_lock>
    80000d96:	00000097          	auipc	ra,0x0
    80000d9a:	4d8080e7          	jalr	1240(ra) # 8000126e <acquire>

  if(panicked){
    80000d9e:	0000b797          	auipc	a5,0xb
    80000da2:	26278793          	addi	a5,a5,610 # 8000c000 <panicked>
    80000da6:	439c                	lw	a5,0(a5)
    80000da8:	2781                	sext.w	a5,a5
    80000daa:	c391                	beqz	a5,80000dae <uartputc+0x2e>
    for(;;)
    80000dac:	a001                	j	80000dac <uartputc+0x2c>
      ;
  }

  while(1){
    if(uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE){
    80000dae:	0000b797          	auipc	a5,0xb
    80000db2:	26278793          	addi	a5,a5,610 # 8000c010 <uart_tx_r>
    80000db6:	639c                	ld	a5,0(a5)
    80000db8:	02078713          	addi	a4,a5,32
    80000dbc:	0000b797          	auipc	a5,0xb
    80000dc0:	24c78793          	addi	a5,a5,588 # 8000c008 <uart_tx_w>
    80000dc4:	639c                	ld	a5,0(a5)
    80000dc6:	00f71f63          	bne	a4,a5,80000de4 <uartputc+0x64>
      // buffer is full.
      // wait for uartstart() to open up space in the buffer.
      sleep(&uart_tx_r, &uart_tx_lock);
    80000dca:	00013597          	auipc	a1,0x13
    80000dce:	46e58593          	addi	a1,a1,1134 # 80014238 <uart_tx_lock>
    80000dd2:	0000b517          	auipc	a0,0xb
    80000dd6:	23e50513          	addi	a0,a0,574 # 8000c010 <uart_tx_r>
    80000dda:	00002097          	auipc	ra,0x2
    80000dde:	6ca080e7          	jalr	1738(ra) # 800034a4 <sleep>
    80000de2:	b7f1                	j	80000dae <uartputc+0x2e>
    } else {
      uart_tx_buf[uart_tx_w % UART_TX_BUF_SIZE] = c;
    80000de4:	0000b797          	auipc	a5,0xb
    80000de8:	22478793          	addi	a5,a5,548 # 8000c008 <uart_tx_w>
    80000dec:	639c                	ld	a5,0(a5)
    80000dee:	8bfd                	andi	a5,a5,31
    80000df0:	fec42703          	lw	a4,-20(s0)
    80000df4:	0ff77713          	andi	a4,a4,255
    80000df8:	00013697          	auipc	a3,0x13
    80000dfc:	45868693          	addi	a3,a3,1112 # 80014250 <uart_tx_buf>
    80000e00:	97b6                	add	a5,a5,a3
    80000e02:	00e78023          	sb	a4,0(a5)
      uart_tx_w += 1;
    80000e06:	0000b797          	auipc	a5,0xb
    80000e0a:	20278793          	addi	a5,a5,514 # 8000c008 <uart_tx_w>
    80000e0e:	639c                	ld	a5,0(a5)
    80000e10:	00178713          	addi	a4,a5,1
    80000e14:	0000b797          	auipc	a5,0xb
    80000e18:	1f478793          	addi	a5,a5,500 # 8000c008 <uart_tx_w>
    80000e1c:	e398                	sd	a4,0(a5)
      uartstart();
    80000e1e:	00000097          	auipc	ra,0x0
    80000e22:	084080e7          	jalr	132(ra) # 80000ea2 <uartstart>
      release(&uart_tx_lock);
    80000e26:	00013517          	auipc	a0,0x13
    80000e2a:	41250513          	addi	a0,a0,1042 # 80014238 <uart_tx_lock>
    80000e2e:	00000097          	auipc	ra,0x0
    80000e32:	4a4080e7          	jalr	1188(ra) # 800012d2 <release>
      return;
    80000e36:	0001                	nop
    }
  }
}
    80000e38:	60e2                	ld	ra,24(sp)
    80000e3a:	6442                	ld	s0,16(sp)
    80000e3c:	6105                	addi	sp,sp,32
    80000e3e:	8082                	ret

0000000080000e40 <uartputc_sync>:
// use interrupts, for use by kernel printf() and
// to echo characters. it spins waiting for the uart's
// output register to be empty.
void
uartputc_sync(int c)
{
    80000e40:	1101                	addi	sp,sp,-32
    80000e42:	ec06                	sd	ra,24(sp)
    80000e44:	e822                	sd	s0,16(sp)
    80000e46:	1000                	addi	s0,sp,32
    80000e48:	87aa                	mv	a5,a0
    80000e4a:	fef42623          	sw	a5,-20(s0)
  push_off();
    80000e4e:	00000097          	auipc	ra,0x0
    80000e52:	51e080e7          	jalr	1310(ra) # 8000136c <push_off>

  if(panicked){
    80000e56:	0000b797          	auipc	a5,0xb
    80000e5a:	1aa78793          	addi	a5,a5,426 # 8000c000 <panicked>
    80000e5e:	439c                	lw	a5,0(a5)
    80000e60:	2781                	sext.w	a5,a5
    80000e62:	c391                	beqz	a5,80000e66 <uartputc_sync+0x26>
    for(;;)
    80000e64:	a001                	j	80000e64 <uartputc_sync+0x24>
      ;
  }

  // wait for Transmit Holding Empty to be set in LSR.
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    80000e66:	0001                	nop
    80000e68:	100007b7          	lui	a5,0x10000
    80000e6c:	0795                	addi	a5,a5,5
    80000e6e:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000e72:	0ff7f793          	andi	a5,a5,255
    80000e76:	2781                	sext.w	a5,a5
    80000e78:	0207f793          	andi	a5,a5,32
    80000e7c:	2781                	sext.w	a5,a5
    80000e7e:	d7ed                	beqz	a5,80000e68 <uartputc_sync+0x28>
    ;
  WriteReg(THR, c);
    80000e80:	100007b7          	lui	a5,0x10000
    80000e84:	fec42703          	lw	a4,-20(s0)
    80000e88:	0ff77713          	andi	a4,a4,255
    80000e8c:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  pop_off();
    80000e90:	00000097          	auipc	ra,0x0
    80000e94:	534080e7          	jalr	1332(ra) # 800013c4 <pop_off>
}
    80000e98:	0001                	nop
    80000e9a:	60e2                	ld	ra,24(sp)
    80000e9c:	6442                	ld	s0,16(sp)
    80000e9e:	6105                	addi	sp,sp,32
    80000ea0:	8082                	ret

0000000080000ea2 <uartstart>:
// in the transmit buffer, send it.
// caller must hold uart_tx_lock.
// called from both the top- and bottom-half.
void
uartstart()
{
    80000ea2:	1101                	addi	sp,sp,-32
    80000ea4:	ec06                	sd	ra,24(sp)
    80000ea6:	e822                	sd	s0,16(sp)
    80000ea8:	1000                	addi	s0,sp,32
  while(1){
    if(uart_tx_w == uart_tx_r){
    80000eaa:	0000b797          	auipc	a5,0xb
    80000eae:	15e78793          	addi	a5,a5,350 # 8000c008 <uart_tx_w>
    80000eb2:	6398                	ld	a4,0(a5)
    80000eb4:	0000b797          	auipc	a5,0xb
    80000eb8:	15c78793          	addi	a5,a5,348 # 8000c010 <uart_tx_r>
    80000ebc:	639c                	ld	a5,0(a5)
    80000ebe:	06f70a63          	beq	a4,a5,80000f32 <uartstart+0x90>
      // transmit buffer is empty.
      return;
    }
    
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    80000ec2:	100007b7          	lui	a5,0x10000
    80000ec6:	0795                	addi	a5,a5,5
    80000ec8:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000ecc:	0ff7f793          	andi	a5,a5,255
    80000ed0:	2781                	sext.w	a5,a5
    80000ed2:	0207f793          	andi	a5,a5,32
    80000ed6:	2781                	sext.w	a5,a5
    80000ed8:	cfb9                	beqz	a5,80000f36 <uartstart+0x94>
      // so we cannot give it another byte.
      // it will interrupt when it's ready for a new byte.
      return;
    }
    
    int c = uart_tx_buf[uart_tx_r % UART_TX_BUF_SIZE];
    80000eda:	0000b797          	auipc	a5,0xb
    80000ede:	13678793          	addi	a5,a5,310 # 8000c010 <uart_tx_r>
    80000ee2:	639c                	ld	a5,0(a5)
    80000ee4:	8bfd                	andi	a5,a5,31
    80000ee6:	00013717          	auipc	a4,0x13
    80000eea:	36a70713          	addi	a4,a4,874 # 80014250 <uart_tx_buf>
    80000eee:	97ba                	add	a5,a5,a4
    80000ef0:	0007c783          	lbu	a5,0(a5)
    80000ef4:	fef42623          	sw	a5,-20(s0)
    uart_tx_r += 1;
    80000ef8:	0000b797          	auipc	a5,0xb
    80000efc:	11878793          	addi	a5,a5,280 # 8000c010 <uart_tx_r>
    80000f00:	639c                	ld	a5,0(a5)
    80000f02:	00178713          	addi	a4,a5,1
    80000f06:	0000b797          	auipc	a5,0xb
    80000f0a:	10a78793          	addi	a5,a5,266 # 8000c010 <uart_tx_r>
    80000f0e:	e398                	sd	a4,0(a5)
    
    // maybe uartputc() is waiting for space in the buffer.
    wakeup(&uart_tx_r);
    80000f10:	0000b517          	auipc	a0,0xb
    80000f14:	10050513          	addi	a0,a0,256 # 8000c010 <uart_tx_r>
    80000f18:	00002097          	auipc	ra,0x2
    80000f1c:	608080e7          	jalr	1544(ra) # 80003520 <wakeup>
    
    WriteReg(THR, c);
    80000f20:	100007b7          	lui	a5,0x10000
    80000f24:	fec42703          	lw	a4,-20(s0)
    80000f28:	0ff77713          	andi	a4,a4,255
    80000f2c:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>
  while(1){
    80000f30:	bfad                	j	80000eaa <uartstart+0x8>
      return;
    80000f32:	0001                	nop
    80000f34:	a011                	j	80000f38 <uartstart+0x96>
      return;
    80000f36:	0001                	nop
  }
}
    80000f38:	60e2                	ld	ra,24(sp)
    80000f3a:	6442                	ld	s0,16(sp)
    80000f3c:	6105                	addi	sp,sp,32
    80000f3e:	8082                	ret

0000000080000f40 <uartgetc>:

// read one input character from the UART.
// return -1 if none is waiting.
int
uartgetc(void)
{
    80000f40:	1141                	addi	sp,sp,-16
    80000f42:	e422                	sd	s0,8(sp)
    80000f44:	0800                	addi	s0,sp,16
  if(ReadReg(LSR) & 0x01){
    80000f46:	100007b7          	lui	a5,0x10000
    80000f4a:	0795                	addi	a5,a5,5
    80000f4c:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000f50:	0ff7f793          	andi	a5,a5,255
    80000f54:	2781                	sext.w	a5,a5
    80000f56:	8b85                	andi	a5,a5,1
    80000f58:	2781                	sext.w	a5,a5
    80000f5a:	cb89                	beqz	a5,80000f6c <uartgetc+0x2c>
    // input data is ready.
    return ReadReg(RHR);
    80000f5c:	100007b7          	lui	a5,0x10000
    80000f60:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000f64:	0ff7f793          	andi	a5,a5,255
    80000f68:	2781                	sext.w	a5,a5
    80000f6a:	a011                	j	80000f6e <uartgetc+0x2e>
  } else {
    return -1;
    80000f6c:	57fd                	li	a5,-1
  }
}
    80000f6e:	853e                	mv	a0,a5
    80000f70:	6422                	ld	s0,8(sp)
    80000f72:	0141                	addi	sp,sp,16
    80000f74:	8082                	ret

0000000080000f76 <uartintr>:
// handle a uart interrupt, raised because input has
// arrived, or the uart is ready for more output, or
// both. called from trap.c.
void
uartintr(void)
{
    80000f76:	1101                	addi	sp,sp,-32
    80000f78:	ec06                	sd	ra,24(sp)
    80000f7a:	e822                	sd	s0,16(sp)
    80000f7c:	1000                	addi	s0,sp,32
  // read and process incoming characters.
  while(1){
    int c = uartgetc();
    80000f7e:	00000097          	auipc	ra,0x0
    80000f82:	fc2080e7          	jalr	-62(ra) # 80000f40 <uartgetc>
    80000f86:	87aa                	mv	a5,a0
    80000f88:	fef42623          	sw	a5,-20(s0)
    if(c == -1)
    80000f8c:	fec42783          	lw	a5,-20(s0)
    80000f90:	0007871b          	sext.w	a4,a5
    80000f94:	57fd                	li	a5,-1
    80000f96:	00f70a63          	beq	a4,a5,80000faa <uartintr+0x34>
      break;
    consoleintr(c);
    80000f9a:	fec42783          	lw	a5,-20(s0)
    80000f9e:	853e                	mv	a0,a5
    80000fa0:	fffff097          	auipc	ra,0xfffff
    80000fa4:	64a080e7          	jalr	1610(ra) # 800005ea <consoleintr>
  while(1){
    80000fa8:	bfd9                	j	80000f7e <uartintr+0x8>
      break;
    80000faa:	0001                	nop
  }

  // send buffered characters.
  acquire(&uart_tx_lock);
    80000fac:	00013517          	auipc	a0,0x13
    80000fb0:	28c50513          	addi	a0,a0,652 # 80014238 <uart_tx_lock>
    80000fb4:	00000097          	auipc	ra,0x0
    80000fb8:	2ba080e7          	jalr	698(ra) # 8000126e <acquire>
  uartstart();
    80000fbc:	00000097          	auipc	ra,0x0
    80000fc0:	ee6080e7          	jalr	-282(ra) # 80000ea2 <uartstart>
  release(&uart_tx_lock);
    80000fc4:	00013517          	auipc	a0,0x13
    80000fc8:	27450513          	addi	a0,a0,628 # 80014238 <uart_tx_lock>
    80000fcc:	00000097          	auipc	ra,0x0
    80000fd0:	306080e7          	jalr	774(ra) # 800012d2 <release>
}
    80000fd4:	0001                	nop
    80000fd6:	60e2                	ld	ra,24(sp)
    80000fd8:	6442                	ld	s0,16(sp)
    80000fda:	6105                	addi	sp,sp,32
    80000fdc:	8082                	ret

0000000080000fde <kinit>:
  struct run *freelist;
} kmem;

void
kinit()
{
    80000fde:	1141                	addi	sp,sp,-16
    80000fe0:	e406                	sd	ra,8(sp)
    80000fe2:	e022                	sd	s0,0(sp)
    80000fe4:	0800                	addi	s0,sp,16
  initlock(&kmem.lock, "kmem");
    80000fe6:	0000a597          	auipc	a1,0xa
    80000fea:	05a58593          	addi	a1,a1,90 # 8000b040 <etext+0x40>
    80000fee:	00013517          	auipc	a0,0x13
    80000ff2:	28250513          	addi	a0,a0,642 # 80014270 <kmem>
    80000ff6:	00000097          	auipc	ra,0x0
    80000ffa:	248080e7          	jalr	584(ra) # 8000123e <initlock>
  freerange(end, (void*)PHYSTOP);
    80000ffe:	47c5                	li	a5,17
    80001000:	01b79593          	slli	a1,a5,0x1b
    80001004:	00028517          	auipc	a0,0x28
    80001008:	ffc50513          	addi	a0,a0,-4 # 80029000 <end>
    8000100c:	00000097          	auipc	ra,0x0
    80001010:	012080e7          	jalr	18(ra) # 8000101e <freerange>
}
    80001014:	0001                	nop
    80001016:	60a2                	ld	ra,8(sp)
    80001018:	6402                	ld	s0,0(sp)
    8000101a:	0141                	addi	sp,sp,16
    8000101c:	8082                	ret

000000008000101e <freerange>:

void
freerange(void *pa_start, void *pa_end)
{
    8000101e:	7179                	addi	sp,sp,-48
    80001020:	f406                	sd	ra,40(sp)
    80001022:	f022                	sd	s0,32(sp)
    80001024:	1800                	addi	s0,sp,48
    80001026:	fca43c23          	sd	a0,-40(s0)
    8000102a:	fcb43823          	sd	a1,-48(s0)
  char *p;
  p = (char*)PGROUNDUP((uint64)pa_start);
    8000102e:	fd843703          	ld	a4,-40(s0)
    80001032:	6785                	lui	a5,0x1
    80001034:	17fd                	addi	a5,a5,-1
    80001036:	973e                	add	a4,a4,a5
    80001038:	77fd                	lui	a5,0xfffff
    8000103a:	8ff9                	and	a5,a5,a4
    8000103c:	fef43423          	sd	a5,-24(s0)
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    80001040:	a829                	j	8000105a <freerange+0x3c>
    kfree(p);
    80001042:	fe843503          	ld	a0,-24(s0)
    80001046:	00000097          	auipc	ra,0x0
    8000104a:	030080e7          	jalr	48(ra) # 80001076 <kfree>
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    8000104e:	fe843703          	ld	a4,-24(s0)
    80001052:	6785                	lui	a5,0x1
    80001054:	97ba                	add	a5,a5,a4
    80001056:	fef43423          	sd	a5,-24(s0)
    8000105a:	fe843703          	ld	a4,-24(s0)
    8000105e:	6785                	lui	a5,0x1
    80001060:	97ba                	add	a5,a5,a4
    80001062:	fd043703          	ld	a4,-48(s0)
    80001066:	fcf77ee3          	bgeu	a4,a5,80001042 <freerange+0x24>
}
    8000106a:	0001                	nop
    8000106c:	0001                	nop
    8000106e:	70a2                	ld	ra,40(sp)
    80001070:	7402                	ld	s0,32(sp)
    80001072:	6145                	addi	sp,sp,48
    80001074:	8082                	ret

0000000080001076 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(void *pa)
{
    80001076:	7179                	addi	sp,sp,-48
    80001078:	f406                	sd	ra,40(sp)
    8000107a:	f022                	sd	s0,32(sp)
    8000107c:	1800                	addi	s0,sp,48
    8000107e:	fca43c23          	sd	a0,-40(s0)
  struct run *r;

  if(((uint64)pa % PGSIZE) != 0 || (char*)pa < end || (uint64)pa >= PHYSTOP)
    80001082:	fd843703          	ld	a4,-40(s0)
    80001086:	6785                	lui	a5,0x1
    80001088:	17fd                	addi	a5,a5,-1
    8000108a:	8ff9                	and	a5,a5,a4
    8000108c:	ef99                	bnez	a5,800010aa <kfree+0x34>
    8000108e:	fd843703          	ld	a4,-40(s0)
    80001092:	00028797          	auipc	a5,0x28
    80001096:	f6e78793          	addi	a5,a5,-146 # 80029000 <end>
    8000109a:	00f76863          	bltu	a4,a5,800010aa <kfree+0x34>
    8000109e:	fd843703          	ld	a4,-40(s0)
    800010a2:	47c5                	li	a5,17
    800010a4:	07ee                	slli	a5,a5,0x1b
    800010a6:	00f76a63          	bltu	a4,a5,800010ba <kfree+0x44>
    panic("kfree");
    800010aa:	0000a517          	auipc	a0,0xa
    800010ae:	f9e50513          	addi	a0,a0,-98 # 8000b048 <etext+0x48>
    800010b2:	00000097          	auipc	ra,0x0
    800010b6:	bcc080e7          	jalr	-1076(ra) # 80000c7e <panic>

  // Fill with junk to catch dangling refs.
  memset(pa, 1, PGSIZE);
    800010ba:	6605                	lui	a2,0x1
    800010bc:	4585                	li	a1,1
    800010be:	fd843503          	ld	a0,-40(s0)
    800010c2:	00000097          	auipc	ra,0x0
    800010c6:	380080e7          	jalr	896(ra) # 80001442 <memset>

  r = (struct run*)pa;
    800010ca:	fd843783          	ld	a5,-40(s0)
    800010ce:	fef43423          	sd	a5,-24(s0)

  acquire(&kmem.lock);
    800010d2:	00013517          	auipc	a0,0x13
    800010d6:	19e50513          	addi	a0,a0,414 # 80014270 <kmem>
    800010da:	00000097          	auipc	ra,0x0
    800010de:	194080e7          	jalr	404(ra) # 8000126e <acquire>
  r->next = kmem.freelist;
    800010e2:	00013797          	auipc	a5,0x13
    800010e6:	18e78793          	addi	a5,a5,398 # 80014270 <kmem>
    800010ea:	6f98                	ld	a4,24(a5)
    800010ec:	fe843783          	ld	a5,-24(s0)
    800010f0:	e398                	sd	a4,0(a5)
  kmem.freelist = r;
    800010f2:	00013797          	auipc	a5,0x13
    800010f6:	17e78793          	addi	a5,a5,382 # 80014270 <kmem>
    800010fa:	fe843703          	ld	a4,-24(s0)
    800010fe:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    80001100:	00013517          	auipc	a0,0x13
    80001104:	17050513          	addi	a0,a0,368 # 80014270 <kmem>
    80001108:	00000097          	auipc	ra,0x0
    8000110c:	1ca080e7          	jalr	458(ra) # 800012d2 <release>
}
    80001110:	0001                	nop
    80001112:	70a2                	ld	ra,40(sp)
    80001114:	7402                	ld	s0,32(sp)
    80001116:	6145                	addi	sp,sp,48
    80001118:	8082                	ret

000000008000111a <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
void *
kalloc(void)
{
    8000111a:	1101                	addi	sp,sp,-32
    8000111c:	ec06                	sd	ra,24(sp)
    8000111e:	e822                	sd	s0,16(sp)
    80001120:	1000                	addi	s0,sp,32
  struct run *r;

  acquire(&kmem.lock);
    80001122:	00013517          	auipc	a0,0x13
    80001126:	14e50513          	addi	a0,a0,334 # 80014270 <kmem>
    8000112a:	00000097          	auipc	ra,0x0
    8000112e:	144080e7          	jalr	324(ra) # 8000126e <acquire>
  r = kmem.freelist;
    80001132:	00013797          	auipc	a5,0x13
    80001136:	13e78793          	addi	a5,a5,318 # 80014270 <kmem>
    8000113a:	6f9c                	ld	a5,24(a5)
    8000113c:	fef43423          	sd	a5,-24(s0)
  if(r)
    80001140:	fe843783          	ld	a5,-24(s0)
    80001144:	cb89                	beqz	a5,80001156 <kalloc+0x3c>
    kmem.freelist = r->next;
    80001146:	fe843783          	ld	a5,-24(s0)
    8000114a:	6398                	ld	a4,0(a5)
    8000114c:	00013797          	auipc	a5,0x13
    80001150:	12478793          	addi	a5,a5,292 # 80014270 <kmem>
    80001154:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    80001156:	00013517          	auipc	a0,0x13
    8000115a:	11a50513          	addi	a0,a0,282 # 80014270 <kmem>
    8000115e:	00000097          	auipc	ra,0x0
    80001162:	174080e7          	jalr	372(ra) # 800012d2 <release>

  if(r)
    80001166:	fe843783          	ld	a5,-24(s0)
    8000116a:	cb89                	beqz	a5,8000117c <kalloc+0x62>
    memset((char*)r, 5, PGSIZE); // fill with junk
    8000116c:	6605                	lui	a2,0x1
    8000116e:	4595                	li	a1,5
    80001170:	fe843503          	ld	a0,-24(s0)
    80001174:	00000097          	auipc	ra,0x0
    80001178:	2ce080e7          	jalr	718(ra) # 80001442 <memset>
  return (void*)r;
    8000117c:	fe843783          	ld	a5,-24(s0)
}
    80001180:	853e                	mv	a0,a5
    80001182:	60e2                	ld	ra,24(sp)
    80001184:	6442                	ld	s0,16(sp)
    80001186:	6105                	addi	sp,sp,32
    80001188:	8082                	ret

000000008000118a <r_sstatus>:
{
    8000118a:	1101                	addi	sp,sp,-32
    8000118c:	ec22                	sd	s0,24(sp)
    8000118e:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80001190:	100027f3          	csrr	a5,sstatus
    80001194:	fef43423          	sd	a5,-24(s0)
  return x;
    80001198:	fe843783          	ld	a5,-24(s0)
}
    8000119c:	853e                	mv	a0,a5
    8000119e:	6462                	ld	s0,24(sp)
    800011a0:	6105                	addi	sp,sp,32
    800011a2:	8082                	ret

00000000800011a4 <w_sstatus>:
{
    800011a4:	1101                	addi	sp,sp,-32
    800011a6:	ec22                	sd	s0,24(sp)
    800011a8:	1000                	addi	s0,sp,32
    800011aa:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800011ae:	fe843783          	ld	a5,-24(s0)
    800011b2:	10079073          	csrw	sstatus,a5
}
    800011b6:	0001                	nop
    800011b8:	6462                	ld	s0,24(sp)
    800011ba:	6105                	addi	sp,sp,32
    800011bc:	8082                	ret

00000000800011be <intr_on>:
{
    800011be:	1141                	addi	sp,sp,-16
    800011c0:	e406                	sd	ra,8(sp)
    800011c2:	e022                	sd	s0,0(sp)
    800011c4:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800011c6:	00000097          	auipc	ra,0x0
    800011ca:	fc4080e7          	jalr	-60(ra) # 8000118a <r_sstatus>
    800011ce:	87aa                	mv	a5,a0
    800011d0:	0027e793          	ori	a5,a5,2
    800011d4:	853e                	mv	a0,a5
    800011d6:	00000097          	auipc	ra,0x0
    800011da:	fce080e7          	jalr	-50(ra) # 800011a4 <w_sstatus>
}
    800011de:	0001                	nop
    800011e0:	60a2                	ld	ra,8(sp)
    800011e2:	6402                	ld	s0,0(sp)
    800011e4:	0141                	addi	sp,sp,16
    800011e6:	8082                	ret

00000000800011e8 <intr_off>:
{
    800011e8:	1141                	addi	sp,sp,-16
    800011ea:	e406                	sd	ra,8(sp)
    800011ec:	e022                	sd	s0,0(sp)
    800011ee:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    800011f0:	00000097          	auipc	ra,0x0
    800011f4:	f9a080e7          	jalr	-102(ra) # 8000118a <r_sstatus>
    800011f8:	87aa                	mv	a5,a0
    800011fa:	9bf5                	andi	a5,a5,-3
    800011fc:	853e                	mv	a0,a5
    800011fe:	00000097          	auipc	ra,0x0
    80001202:	fa6080e7          	jalr	-90(ra) # 800011a4 <w_sstatus>
}
    80001206:	0001                	nop
    80001208:	60a2                	ld	ra,8(sp)
    8000120a:	6402                	ld	s0,0(sp)
    8000120c:	0141                	addi	sp,sp,16
    8000120e:	8082                	ret

0000000080001210 <intr_get>:
{
    80001210:	1101                	addi	sp,sp,-32
    80001212:	ec06                	sd	ra,24(sp)
    80001214:	e822                	sd	s0,16(sp)
    80001216:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80001218:	00000097          	auipc	ra,0x0
    8000121c:	f72080e7          	jalr	-142(ra) # 8000118a <r_sstatus>
    80001220:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80001224:	fe843783          	ld	a5,-24(s0)
    80001228:	8b89                	andi	a5,a5,2
    8000122a:	00f037b3          	snez	a5,a5
    8000122e:	0ff7f793          	andi	a5,a5,255
    80001232:	2781                	sext.w	a5,a5
}
    80001234:	853e                	mv	a0,a5
    80001236:	60e2                	ld	ra,24(sp)
    80001238:	6442                	ld	s0,16(sp)
    8000123a:	6105                	addi	sp,sp,32
    8000123c:	8082                	ret

000000008000123e <initlock>:
#include "proc.h"
#include "defs.h"

void
initlock(struct spinlock *lk, char *name)
{
    8000123e:	1101                	addi	sp,sp,-32
    80001240:	ec22                	sd	s0,24(sp)
    80001242:	1000                	addi	s0,sp,32
    80001244:	fea43423          	sd	a0,-24(s0)
    80001248:	feb43023          	sd	a1,-32(s0)
  lk->name = name;
    8000124c:	fe843783          	ld	a5,-24(s0)
    80001250:	fe043703          	ld	a4,-32(s0)
    80001254:	e798                	sd	a4,8(a5)
  lk->locked = 0;
    80001256:	fe843783          	ld	a5,-24(s0)
    8000125a:	0007a023          	sw	zero,0(a5)
  lk->cpu = 0;
    8000125e:	fe843783          	ld	a5,-24(s0)
    80001262:	0007b823          	sd	zero,16(a5)
}
    80001266:	0001                	nop
    80001268:	6462                	ld	s0,24(sp)
    8000126a:	6105                	addi	sp,sp,32
    8000126c:	8082                	ret

000000008000126e <acquire>:

// Acquire the lock.
// Loops (spins) until the lock is acquired.
void
acquire(struct spinlock *lk)
{
    8000126e:	1101                	addi	sp,sp,-32
    80001270:	ec06                	sd	ra,24(sp)
    80001272:	e822                	sd	s0,16(sp)
    80001274:	1000                	addi	s0,sp,32
    80001276:	fea43423          	sd	a0,-24(s0)
  push_off(); // disable interrupts to avoid deadlock.
    8000127a:	00000097          	auipc	ra,0x0
    8000127e:	0f2080e7          	jalr	242(ra) # 8000136c <push_off>
  if(holding(lk))
    80001282:	fe843503          	ld	a0,-24(s0)
    80001286:	00000097          	auipc	ra,0x0
    8000128a:	0a2080e7          	jalr	162(ra) # 80001328 <holding>
    8000128e:	87aa                	mv	a5,a0
    80001290:	cb89                	beqz	a5,800012a2 <acquire+0x34>
    panic("acquire");
    80001292:	0000a517          	auipc	a0,0xa
    80001296:	dbe50513          	addi	a0,a0,-578 # 8000b050 <etext+0x50>
    8000129a:	00000097          	auipc	ra,0x0
    8000129e:	9e4080e7          	jalr	-1564(ra) # 80000c7e <panic>

  // On RISC-V, sync_lock_test_and_set turns into an atomic swap:
  //   a5 = 1
  //   s1 = &lk->locked
  //   amoswap.w.aq a5, a5, (s1)
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    800012a2:	0001                	nop
    800012a4:	fe843783          	ld	a5,-24(s0)
    800012a8:	4705                	li	a4,1
    800012aa:	0ce7a72f          	amoswap.w.aq	a4,a4,(a5)
    800012ae:	0007079b          	sext.w	a5,a4
    800012b2:	fbed                	bnez	a5,800012a4 <acquire+0x36>

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen strictly after the lock is acquired.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    800012b4:	0ff0000f          	fence

  // Record info about lock acquisition for holding() and debugging.
  lk->cpu = mycpu();
    800012b8:	00001097          	auipc	ra,0x1
    800012bc:	522080e7          	jalr	1314(ra) # 800027da <mycpu>
    800012c0:	872a                	mv	a4,a0
    800012c2:	fe843783          	ld	a5,-24(s0)
    800012c6:	eb98                	sd	a4,16(a5)
}
    800012c8:	0001                	nop
    800012ca:	60e2                	ld	ra,24(sp)
    800012cc:	6442                	ld	s0,16(sp)
    800012ce:	6105                	addi	sp,sp,32
    800012d0:	8082                	ret

00000000800012d2 <release>:

// Release the lock.
void
release(struct spinlock *lk)
{
    800012d2:	1101                	addi	sp,sp,-32
    800012d4:	ec06                	sd	ra,24(sp)
    800012d6:	e822                	sd	s0,16(sp)
    800012d8:	1000                	addi	s0,sp,32
    800012da:	fea43423          	sd	a0,-24(s0)
  if(!holding(lk))
    800012de:	fe843503          	ld	a0,-24(s0)
    800012e2:	00000097          	auipc	ra,0x0
    800012e6:	046080e7          	jalr	70(ra) # 80001328 <holding>
    800012ea:	87aa                	mv	a5,a0
    800012ec:	eb89                	bnez	a5,800012fe <release+0x2c>
    panic("release");
    800012ee:	0000a517          	auipc	a0,0xa
    800012f2:	d6a50513          	addi	a0,a0,-662 # 8000b058 <etext+0x58>
    800012f6:	00000097          	auipc	ra,0x0
    800012fa:	988080e7          	jalr	-1656(ra) # 80000c7e <panic>

  lk->cpu = 0;
    800012fe:	fe843783          	ld	a5,-24(s0)
    80001302:	0007b823          	sd	zero,16(a5)
  // past this point, to ensure that all the stores in the critical
  // section are visible to other CPUs before the lock is released,
  // and that loads in the critical section occur strictly before
  // the lock is released.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    80001306:	0ff0000f          	fence
  // implies that an assignment might be implemented with
  // multiple store instructions.
  // On RISC-V, sync_lock_release turns into an atomic swap:
  //   s1 = &lk->locked
  //   amoswap.w zero, zero, (s1)
  __sync_lock_release(&lk->locked);
    8000130a:	fe843783          	ld	a5,-24(s0)
    8000130e:	0f50000f          	fence	iorw,ow
    80001312:	0807a02f          	amoswap.w	zero,zero,(a5)

  pop_off();
    80001316:	00000097          	auipc	ra,0x0
    8000131a:	0ae080e7          	jalr	174(ra) # 800013c4 <pop_off>
}
    8000131e:	0001                	nop
    80001320:	60e2                	ld	ra,24(sp)
    80001322:	6442                	ld	s0,16(sp)
    80001324:	6105                	addi	sp,sp,32
    80001326:	8082                	ret

0000000080001328 <holding>:

// Check whether this cpu is holding the lock.
// Interrupts must be off.
int
holding(struct spinlock *lk)
{
    80001328:	7139                	addi	sp,sp,-64
    8000132a:	fc06                	sd	ra,56(sp)
    8000132c:	f822                	sd	s0,48(sp)
    8000132e:	f426                	sd	s1,40(sp)
    80001330:	0080                	addi	s0,sp,64
    80001332:	fca43423          	sd	a0,-56(s0)
  int r;
  r = (lk->locked && lk->cpu == mycpu());
    80001336:	fc843783          	ld	a5,-56(s0)
    8000133a:	439c                	lw	a5,0(a5)
    8000133c:	cf89                	beqz	a5,80001356 <holding+0x2e>
    8000133e:	fc843783          	ld	a5,-56(s0)
    80001342:	6b84                	ld	s1,16(a5)
    80001344:	00001097          	auipc	ra,0x1
    80001348:	496080e7          	jalr	1174(ra) # 800027da <mycpu>
    8000134c:	87aa                	mv	a5,a0
    8000134e:	00f49463          	bne	s1,a5,80001356 <holding+0x2e>
    80001352:	4785                	li	a5,1
    80001354:	a011                	j	80001358 <holding+0x30>
    80001356:	4781                	li	a5,0
    80001358:	fcf42e23          	sw	a5,-36(s0)
  return r;
    8000135c:	fdc42783          	lw	a5,-36(s0)
}
    80001360:	853e                	mv	a0,a5
    80001362:	70e2                	ld	ra,56(sp)
    80001364:	7442                	ld	s0,48(sp)
    80001366:	74a2                	ld	s1,40(sp)
    80001368:	6121                	addi	sp,sp,64
    8000136a:	8082                	ret

000000008000136c <push_off>:
// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
// are initially off, then push_off, pop_off leaves them off.

void
push_off(void)
{
    8000136c:	1101                	addi	sp,sp,-32
    8000136e:	ec06                	sd	ra,24(sp)
    80001370:	e822                	sd	s0,16(sp)
    80001372:	1000                	addi	s0,sp,32
  int old = intr_get();
    80001374:	00000097          	auipc	ra,0x0
    80001378:	e9c080e7          	jalr	-356(ra) # 80001210 <intr_get>
    8000137c:	87aa                	mv	a5,a0
    8000137e:	fef42623          	sw	a5,-20(s0)

  intr_off();
    80001382:	00000097          	auipc	ra,0x0
    80001386:	e66080e7          	jalr	-410(ra) # 800011e8 <intr_off>
  if(mycpu()->noff == 0)
    8000138a:	00001097          	auipc	ra,0x1
    8000138e:	450080e7          	jalr	1104(ra) # 800027da <mycpu>
    80001392:	87aa                	mv	a5,a0
    80001394:	5fbc                	lw	a5,120(a5)
    80001396:	eb89                	bnez	a5,800013a8 <push_off+0x3c>
    mycpu()->intena = old;
    80001398:	00001097          	auipc	ra,0x1
    8000139c:	442080e7          	jalr	1090(ra) # 800027da <mycpu>
    800013a0:	872a                	mv	a4,a0
    800013a2:	fec42783          	lw	a5,-20(s0)
    800013a6:	df7c                	sw	a5,124(a4)
  mycpu()->noff += 1;
    800013a8:	00001097          	auipc	ra,0x1
    800013ac:	432080e7          	jalr	1074(ra) # 800027da <mycpu>
    800013b0:	87aa                	mv	a5,a0
    800013b2:	5fb8                	lw	a4,120(a5)
    800013b4:	2705                	addiw	a4,a4,1
    800013b6:	2701                	sext.w	a4,a4
    800013b8:	dfb8                	sw	a4,120(a5)
}
    800013ba:	0001                	nop
    800013bc:	60e2                	ld	ra,24(sp)
    800013be:	6442                	ld	s0,16(sp)
    800013c0:	6105                	addi	sp,sp,32
    800013c2:	8082                	ret

00000000800013c4 <pop_off>:

void
pop_off(void)
{
    800013c4:	1101                	addi	sp,sp,-32
    800013c6:	ec06                	sd	ra,24(sp)
    800013c8:	e822                	sd	s0,16(sp)
    800013ca:	1000                	addi	s0,sp,32
  struct cpu *c = mycpu();
    800013cc:	00001097          	auipc	ra,0x1
    800013d0:	40e080e7          	jalr	1038(ra) # 800027da <mycpu>
    800013d4:	fea43423          	sd	a0,-24(s0)
  if(intr_get())
    800013d8:	00000097          	auipc	ra,0x0
    800013dc:	e38080e7          	jalr	-456(ra) # 80001210 <intr_get>
    800013e0:	87aa                	mv	a5,a0
    800013e2:	cb89                	beqz	a5,800013f4 <pop_off+0x30>
    panic("pop_off - interruptible");
    800013e4:	0000a517          	auipc	a0,0xa
    800013e8:	c7c50513          	addi	a0,a0,-900 # 8000b060 <etext+0x60>
    800013ec:	00000097          	auipc	ra,0x0
    800013f0:	892080e7          	jalr	-1902(ra) # 80000c7e <panic>
  if(c->noff < 1)
    800013f4:	fe843783          	ld	a5,-24(s0)
    800013f8:	5fbc                	lw	a5,120(a5)
    800013fa:	00f04a63          	bgtz	a5,8000140e <pop_off+0x4a>
    panic("pop_off");
    800013fe:	0000a517          	auipc	a0,0xa
    80001402:	c7a50513          	addi	a0,a0,-902 # 8000b078 <etext+0x78>
    80001406:	00000097          	auipc	ra,0x0
    8000140a:	878080e7          	jalr	-1928(ra) # 80000c7e <panic>
  c->noff -= 1;
    8000140e:	fe843783          	ld	a5,-24(s0)
    80001412:	5fbc                	lw	a5,120(a5)
    80001414:	37fd                	addiw	a5,a5,-1
    80001416:	0007871b          	sext.w	a4,a5
    8000141a:	fe843783          	ld	a5,-24(s0)
    8000141e:	dfb8                	sw	a4,120(a5)
  if(c->noff == 0 && c->intena)
    80001420:	fe843783          	ld	a5,-24(s0)
    80001424:	5fbc                	lw	a5,120(a5)
    80001426:	eb89                	bnez	a5,80001438 <pop_off+0x74>
    80001428:	fe843783          	ld	a5,-24(s0)
    8000142c:	5ffc                	lw	a5,124(a5)
    8000142e:	c789                	beqz	a5,80001438 <pop_off+0x74>
    intr_on();
    80001430:	00000097          	auipc	ra,0x0
    80001434:	d8e080e7          	jalr	-626(ra) # 800011be <intr_on>
}
    80001438:	0001                	nop
    8000143a:	60e2                	ld	ra,24(sp)
    8000143c:	6442                	ld	s0,16(sp)
    8000143e:	6105                	addi	sp,sp,32
    80001440:	8082                	ret

0000000080001442 <memset>:
#include "types.h"

void*
memset(void *dst, int c, uint n)
{
    80001442:	7179                	addi	sp,sp,-48
    80001444:	f422                	sd	s0,40(sp)
    80001446:	1800                	addi	s0,sp,48
    80001448:	fca43c23          	sd	a0,-40(s0)
    8000144c:	87ae                	mv	a5,a1
    8000144e:	8732                	mv	a4,a2
    80001450:	fcf42a23          	sw	a5,-44(s0)
    80001454:	87ba                	mv	a5,a4
    80001456:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
    8000145a:	fd843783          	ld	a5,-40(s0)
    8000145e:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
    80001462:	fe042623          	sw	zero,-20(s0)
    80001466:	a00d                	j	80001488 <memset+0x46>
    cdst[i] = c;
    80001468:	fec42783          	lw	a5,-20(s0)
    8000146c:	fe043703          	ld	a4,-32(s0)
    80001470:	97ba                	add	a5,a5,a4
    80001472:	fd442703          	lw	a4,-44(s0)
    80001476:	0ff77713          	andi	a4,a4,255
    8000147a:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
    8000147e:	fec42783          	lw	a5,-20(s0)
    80001482:	2785                	addiw	a5,a5,1
    80001484:	fef42623          	sw	a5,-20(s0)
    80001488:	fec42703          	lw	a4,-20(s0)
    8000148c:	fd042783          	lw	a5,-48(s0)
    80001490:	2781                	sext.w	a5,a5
    80001492:	fcf76be3          	bltu	a4,a5,80001468 <memset+0x26>
  }
  return dst;
    80001496:	fd843783          	ld	a5,-40(s0)
}
    8000149a:	853e                	mv	a0,a5
    8000149c:	7422                	ld	s0,40(sp)
    8000149e:	6145                	addi	sp,sp,48
    800014a0:	8082                	ret

00000000800014a2 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
    800014a2:	7139                	addi	sp,sp,-64
    800014a4:	fc22                	sd	s0,56(sp)
    800014a6:	0080                	addi	s0,sp,64
    800014a8:	fca43c23          	sd	a0,-40(s0)
    800014ac:	fcb43823          	sd	a1,-48(s0)
    800014b0:	87b2                	mv	a5,a2
    800014b2:	fcf42623          	sw	a5,-52(s0)
  const uchar *s1, *s2;

  s1 = v1;
    800014b6:	fd843783          	ld	a5,-40(s0)
    800014ba:	fef43423          	sd	a5,-24(s0)
  s2 = v2;
    800014be:	fd043783          	ld	a5,-48(s0)
    800014c2:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    800014c6:	a0a1                	j	8000150e <memcmp+0x6c>
    if(*s1 != *s2)
    800014c8:	fe843783          	ld	a5,-24(s0)
    800014cc:	0007c703          	lbu	a4,0(a5)
    800014d0:	fe043783          	ld	a5,-32(s0)
    800014d4:	0007c783          	lbu	a5,0(a5)
    800014d8:	02f70163          	beq	a4,a5,800014fa <memcmp+0x58>
      return *s1 - *s2;
    800014dc:	fe843783          	ld	a5,-24(s0)
    800014e0:	0007c783          	lbu	a5,0(a5)
    800014e4:	0007871b          	sext.w	a4,a5
    800014e8:	fe043783          	ld	a5,-32(s0)
    800014ec:	0007c783          	lbu	a5,0(a5)
    800014f0:	2781                	sext.w	a5,a5
    800014f2:	40f707bb          	subw	a5,a4,a5
    800014f6:	2781                	sext.w	a5,a5
    800014f8:	a01d                	j	8000151e <memcmp+0x7c>
    s1++, s2++;
    800014fa:	fe843783          	ld	a5,-24(s0)
    800014fe:	0785                	addi	a5,a5,1
    80001500:	fef43423          	sd	a5,-24(s0)
    80001504:	fe043783          	ld	a5,-32(s0)
    80001508:	0785                	addi	a5,a5,1
    8000150a:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    8000150e:	fcc42783          	lw	a5,-52(s0)
    80001512:	fff7871b          	addiw	a4,a5,-1
    80001516:	fce42623          	sw	a4,-52(s0)
    8000151a:	f7dd                	bnez	a5,800014c8 <memcmp+0x26>
  }

  return 0;
    8000151c:	4781                	li	a5,0
}
    8000151e:	853e                	mv	a0,a5
    80001520:	7462                	ld	s0,56(sp)
    80001522:	6121                	addi	sp,sp,64
    80001524:	8082                	ret

0000000080001526 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
    80001526:	7139                	addi	sp,sp,-64
    80001528:	fc22                	sd	s0,56(sp)
    8000152a:	0080                	addi	s0,sp,64
    8000152c:	fca43c23          	sd	a0,-40(s0)
    80001530:	fcb43823          	sd	a1,-48(s0)
    80001534:	87b2                	mv	a5,a2
    80001536:	fcf42623          	sw	a5,-52(s0)
  const char *s;
  char *d;

  if(n == 0)
    8000153a:	fcc42783          	lw	a5,-52(s0)
    8000153e:	2781                	sext.w	a5,a5
    80001540:	e781                	bnez	a5,80001548 <memmove+0x22>
    return dst;
    80001542:	fd843783          	ld	a5,-40(s0)
    80001546:	a855                	j	800015fa <memmove+0xd4>
  
  s = src;
    80001548:	fd043783          	ld	a5,-48(s0)
    8000154c:	fef43423          	sd	a5,-24(s0)
  d = dst;
    80001550:	fd843783          	ld	a5,-40(s0)
    80001554:	fef43023          	sd	a5,-32(s0)
  if(s < d && s + n > d){
    80001558:	fe843703          	ld	a4,-24(s0)
    8000155c:	fe043783          	ld	a5,-32(s0)
    80001560:	08f77463          	bgeu	a4,a5,800015e8 <memmove+0xc2>
    80001564:	fcc46783          	lwu	a5,-52(s0)
    80001568:	fe843703          	ld	a4,-24(s0)
    8000156c:	97ba                	add	a5,a5,a4
    8000156e:	fe043703          	ld	a4,-32(s0)
    80001572:	06f77b63          	bgeu	a4,a5,800015e8 <memmove+0xc2>
    s += n;
    80001576:	fcc46783          	lwu	a5,-52(s0)
    8000157a:	fe843703          	ld	a4,-24(s0)
    8000157e:	97ba                	add	a5,a5,a4
    80001580:	fef43423          	sd	a5,-24(s0)
    d += n;
    80001584:	fcc46783          	lwu	a5,-52(s0)
    80001588:	fe043703          	ld	a4,-32(s0)
    8000158c:	97ba                	add	a5,a5,a4
    8000158e:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
    80001592:	a01d                	j	800015b8 <memmove+0x92>
      *--d = *--s;
    80001594:	fe843783          	ld	a5,-24(s0)
    80001598:	17fd                	addi	a5,a5,-1
    8000159a:	fef43423          	sd	a5,-24(s0)
    8000159e:	fe043783          	ld	a5,-32(s0)
    800015a2:	17fd                	addi	a5,a5,-1
    800015a4:	fef43023          	sd	a5,-32(s0)
    800015a8:	fe843783          	ld	a5,-24(s0)
    800015ac:	0007c703          	lbu	a4,0(a5)
    800015b0:	fe043783          	ld	a5,-32(s0)
    800015b4:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    800015b8:	fcc42783          	lw	a5,-52(s0)
    800015bc:	fff7871b          	addiw	a4,a5,-1
    800015c0:	fce42623          	sw	a4,-52(s0)
    800015c4:	fbe1                	bnez	a5,80001594 <memmove+0x6e>
  if(s < d && s + n > d){
    800015c6:	a805                	j	800015f6 <memmove+0xd0>
  } else
    while(n-- > 0)
      *d++ = *s++;
    800015c8:	fe843703          	ld	a4,-24(s0)
    800015cc:	00170793          	addi	a5,a4,1
    800015d0:	fef43423          	sd	a5,-24(s0)
    800015d4:	fe043783          	ld	a5,-32(s0)
    800015d8:	00178693          	addi	a3,a5,1
    800015dc:	fed43023          	sd	a3,-32(s0)
    800015e0:	00074703          	lbu	a4,0(a4)
    800015e4:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    800015e8:	fcc42783          	lw	a5,-52(s0)
    800015ec:	fff7871b          	addiw	a4,a5,-1
    800015f0:	fce42623          	sw	a4,-52(s0)
    800015f4:	fbf1                	bnez	a5,800015c8 <memmove+0xa2>

  return dst;
    800015f6:	fd843783          	ld	a5,-40(s0)
}
    800015fa:	853e                	mv	a0,a5
    800015fc:	7462                	ld	s0,56(sp)
    800015fe:	6121                	addi	sp,sp,64
    80001600:	8082                	ret

0000000080001602 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
    80001602:	7179                	addi	sp,sp,-48
    80001604:	f406                	sd	ra,40(sp)
    80001606:	f022                	sd	s0,32(sp)
    80001608:	1800                	addi	s0,sp,48
    8000160a:	fea43423          	sd	a0,-24(s0)
    8000160e:	feb43023          	sd	a1,-32(s0)
    80001612:	87b2                	mv	a5,a2
    80001614:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
    80001618:	fdc42783          	lw	a5,-36(s0)
    8000161c:	863e                	mv	a2,a5
    8000161e:	fe043583          	ld	a1,-32(s0)
    80001622:	fe843503          	ld	a0,-24(s0)
    80001626:	00000097          	auipc	ra,0x0
    8000162a:	f00080e7          	jalr	-256(ra) # 80001526 <memmove>
    8000162e:	87aa                	mv	a5,a0
}
    80001630:	853e                	mv	a0,a5
    80001632:	70a2                	ld	ra,40(sp)
    80001634:	7402                	ld	s0,32(sp)
    80001636:	6145                	addi	sp,sp,48
    80001638:	8082                	ret

000000008000163a <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
    8000163a:	7179                	addi	sp,sp,-48
    8000163c:	f422                	sd	s0,40(sp)
    8000163e:	1800                	addi	s0,sp,48
    80001640:	fea43423          	sd	a0,-24(s0)
    80001644:	feb43023          	sd	a1,-32(s0)
    80001648:	87b2                	mv	a5,a2
    8000164a:	fcf42e23          	sw	a5,-36(s0)
  while(n > 0 && *p && *p == *q)
    8000164e:	a005                	j	8000166e <strncmp+0x34>
    n--, p++, q++;
    80001650:	fdc42783          	lw	a5,-36(s0)
    80001654:	37fd                	addiw	a5,a5,-1
    80001656:	fcf42e23          	sw	a5,-36(s0)
    8000165a:	fe843783          	ld	a5,-24(s0)
    8000165e:	0785                	addi	a5,a5,1
    80001660:	fef43423          	sd	a5,-24(s0)
    80001664:	fe043783          	ld	a5,-32(s0)
    80001668:	0785                	addi	a5,a5,1
    8000166a:	fef43023          	sd	a5,-32(s0)
  while(n > 0 && *p && *p == *q)
    8000166e:	fdc42783          	lw	a5,-36(s0)
    80001672:	2781                	sext.w	a5,a5
    80001674:	c385                	beqz	a5,80001694 <strncmp+0x5a>
    80001676:	fe843783          	ld	a5,-24(s0)
    8000167a:	0007c783          	lbu	a5,0(a5)
    8000167e:	cb99                	beqz	a5,80001694 <strncmp+0x5a>
    80001680:	fe843783          	ld	a5,-24(s0)
    80001684:	0007c703          	lbu	a4,0(a5)
    80001688:	fe043783          	ld	a5,-32(s0)
    8000168c:	0007c783          	lbu	a5,0(a5)
    80001690:	fcf700e3          	beq	a4,a5,80001650 <strncmp+0x16>
  if(n == 0)
    80001694:	fdc42783          	lw	a5,-36(s0)
    80001698:	2781                	sext.w	a5,a5
    8000169a:	e399                	bnez	a5,800016a0 <strncmp+0x66>
    return 0;
    8000169c:	4781                	li	a5,0
    8000169e:	a839                	j	800016bc <strncmp+0x82>
  return (uchar)*p - (uchar)*q;
    800016a0:	fe843783          	ld	a5,-24(s0)
    800016a4:	0007c783          	lbu	a5,0(a5)
    800016a8:	0007871b          	sext.w	a4,a5
    800016ac:	fe043783          	ld	a5,-32(s0)
    800016b0:	0007c783          	lbu	a5,0(a5)
    800016b4:	2781                	sext.w	a5,a5
    800016b6:	40f707bb          	subw	a5,a4,a5
    800016ba:	2781                	sext.w	a5,a5
}
    800016bc:	853e                	mv	a0,a5
    800016be:	7422                	ld	s0,40(sp)
    800016c0:	6145                	addi	sp,sp,48
    800016c2:	8082                	ret

00000000800016c4 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
    800016c4:	7139                	addi	sp,sp,-64
    800016c6:	fc22                	sd	s0,56(sp)
    800016c8:	0080                	addi	s0,sp,64
    800016ca:	fca43c23          	sd	a0,-40(s0)
    800016ce:	fcb43823          	sd	a1,-48(s0)
    800016d2:	87b2                	mv	a5,a2
    800016d4:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    800016d8:	fd843783          	ld	a5,-40(s0)
    800016dc:	fef43423          	sd	a5,-24(s0)
  while(n-- > 0 && (*s++ = *t++) != 0)
    800016e0:	0001                	nop
    800016e2:	fcc42783          	lw	a5,-52(s0)
    800016e6:	fff7871b          	addiw	a4,a5,-1
    800016ea:	fce42623          	sw	a4,-52(s0)
    800016ee:	02f05e63          	blez	a5,8000172a <strncpy+0x66>
    800016f2:	fd043703          	ld	a4,-48(s0)
    800016f6:	00170793          	addi	a5,a4,1
    800016fa:	fcf43823          	sd	a5,-48(s0)
    800016fe:	fd843783          	ld	a5,-40(s0)
    80001702:	00178693          	addi	a3,a5,1
    80001706:	fcd43c23          	sd	a3,-40(s0)
    8000170a:	00074703          	lbu	a4,0(a4)
    8000170e:	00e78023          	sb	a4,0(a5)
    80001712:	0007c783          	lbu	a5,0(a5)
    80001716:	f7f1                	bnez	a5,800016e2 <strncpy+0x1e>
    ;
  while(n-- > 0)
    80001718:	a809                	j	8000172a <strncpy+0x66>
    *s++ = 0;
    8000171a:	fd843783          	ld	a5,-40(s0)
    8000171e:	00178713          	addi	a4,a5,1
    80001722:	fce43c23          	sd	a4,-40(s0)
    80001726:	00078023          	sb	zero,0(a5)
  while(n-- > 0)
    8000172a:	fcc42783          	lw	a5,-52(s0)
    8000172e:	fff7871b          	addiw	a4,a5,-1
    80001732:	fce42623          	sw	a4,-52(s0)
    80001736:	fef042e3          	bgtz	a5,8000171a <strncpy+0x56>
  return os;
    8000173a:	fe843783          	ld	a5,-24(s0)
}
    8000173e:	853e                	mv	a0,a5
    80001740:	7462                	ld	s0,56(sp)
    80001742:	6121                	addi	sp,sp,64
    80001744:	8082                	ret

0000000080001746 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
    80001746:	7139                	addi	sp,sp,-64
    80001748:	fc22                	sd	s0,56(sp)
    8000174a:	0080                	addi	s0,sp,64
    8000174c:	fca43c23          	sd	a0,-40(s0)
    80001750:	fcb43823          	sd	a1,-48(s0)
    80001754:	87b2                	mv	a5,a2
    80001756:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    8000175a:	fd843783          	ld	a5,-40(s0)
    8000175e:	fef43423          	sd	a5,-24(s0)
  if(n <= 0)
    80001762:	fcc42783          	lw	a5,-52(s0)
    80001766:	2781                	sext.w	a5,a5
    80001768:	00f04563          	bgtz	a5,80001772 <safestrcpy+0x2c>
    return os;
    8000176c:	fe843783          	ld	a5,-24(s0)
    80001770:	a0a1                	j	800017b8 <safestrcpy+0x72>
  while(--n > 0 && (*s++ = *t++) != 0)
    80001772:	fcc42783          	lw	a5,-52(s0)
    80001776:	37fd                	addiw	a5,a5,-1
    80001778:	fcf42623          	sw	a5,-52(s0)
    8000177c:	fcc42783          	lw	a5,-52(s0)
    80001780:	2781                	sext.w	a5,a5
    80001782:	02f05563          	blez	a5,800017ac <safestrcpy+0x66>
    80001786:	fd043703          	ld	a4,-48(s0)
    8000178a:	00170793          	addi	a5,a4,1
    8000178e:	fcf43823          	sd	a5,-48(s0)
    80001792:	fd843783          	ld	a5,-40(s0)
    80001796:	00178693          	addi	a3,a5,1
    8000179a:	fcd43c23          	sd	a3,-40(s0)
    8000179e:	00074703          	lbu	a4,0(a4)
    800017a2:	00e78023          	sb	a4,0(a5)
    800017a6:	0007c783          	lbu	a5,0(a5)
    800017aa:	f7e1                	bnez	a5,80001772 <safestrcpy+0x2c>
    ;
  *s = 0;
    800017ac:	fd843783          	ld	a5,-40(s0)
    800017b0:	00078023          	sb	zero,0(a5)
  return os;
    800017b4:	fe843783          	ld	a5,-24(s0)
}
    800017b8:	853e                	mv	a0,a5
    800017ba:	7462                	ld	s0,56(sp)
    800017bc:	6121                	addi	sp,sp,64
    800017be:	8082                	ret

00000000800017c0 <strlen>:

int
strlen(const char *s)
{
    800017c0:	7179                	addi	sp,sp,-48
    800017c2:	f422                	sd	s0,40(sp)
    800017c4:	1800                	addi	s0,sp,48
    800017c6:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
    800017ca:	fe042623          	sw	zero,-20(s0)
    800017ce:	a031                	j	800017da <strlen+0x1a>
    800017d0:	fec42783          	lw	a5,-20(s0)
    800017d4:	2785                	addiw	a5,a5,1
    800017d6:	fef42623          	sw	a5,-20(s0)
    800017da:	fec42783          	lw	a5,-20(s0)
    800017de:	fd843703          	ld	a4,-40(s0)
    800017e2:	97ba                	add	a5,a5,a4
    800017e4:	0007c783          	lbu	a5,0(a5)
    800017e8:	f7e5                	bnez	a5,800017d0 <strlen+0x10>
    ;
  return n;
    800017ea:	fec42783          	lw	a5,-20(s0)
}
    800017ee:	853e                	mv	a0,a5
    800017f0:	7422                	ld	s0,40(sp)
    800017f2:	6145                	addi	sp,sp,48
    800017f4:	8082                	ret

00000000800017f6 <main>:
volatile static int started = 0;

// start() jumps here in supervisor mode on all CPUs.
void
main()
{
    800017f6:	1141                	addi	sp,sp,-16
    800017f8:	e406                	sd	ra,8(sp)
    800017fa:	e022                	sd	s0,0(sp)
    800017fc:	0800                	addi	s0,sp,16
  if(cpuid() == 0){
    800017fe:	00001097          	auipc	ra,0x1
    80001802:	fb8080e7          	jalr	-72(ra) # 800027b6 <cpuid>
    80001806:	87aa                	mv	a5,a0
    80001808:	efd5                	bnez	a5,800018c4 <main+0xce>
    consoleinit();
    8000180a:	fffff097          	auipc	ra,0xfffff
    8000180e:	048080e7          	jalr	72(ra) # 80000852 <consoleinit>
    printfinit();
    80001812:	fffff097          	auipc	ra,0xfffff
    80001816:	4be080e7          	jalr	1214(ra) # 80000cd0 <printfinit>
    printf("\n");
    8000181a:	0000a517          	auipc	a0,0xa
    8000181e:	86650513          	addi	a0,a0,-1946 # 8000b080 <etext+0x80>
    80001822:	fffff097          	auipc	ra,0xfffff
    80001826:	206080e7          	jalr	518(ra) # 80000a28 <printf>
    printf("xv6 kernel is booting\n");
    8000182a:	0000a517          	auipc	a0,0xa
    8000182e:	85e50513          	addi	a0,a0,-1954 # 8000b088 <etext+0x88>
    80001832:	fffff097          	auipc	ra,0xfffff
    80001836:	1f6080e7          	jalr	502(ra) # 80000a28 <printf>
    printf("\n");
    8000183a:	0000a517          	auipc	a0,0xa
    8000183e:	84650513          	addi	a0,a0,-1978 # 8000b080 <etext+0x80>
    80001842:	fffff097          	auipc	ra,0xfffff
    80001846:	1e6080e7          	jalr	486(ra) # 80000a28 <printf>
    kinit();         // physical page allocator
    8000184a:	fffff097          	auipc	ra,0xfffff
    8000184e:	794080e7          	jalr	1940(ra) # 80000fde <kinit>
    kvminit();       // create kernel page table
    80001852:	00000097          	auipc	ra,0x0
    80001856:	1f4080e7          	jalr	500(ra) # 80001a46 <kvminit>
    kvminithart();   // turn on paging
    8000185a:	00000097          	auipc	ra,0x0
    8000185e:	212080e7          	jalr	530(ra) # 80001a6c <kvminithart>
    procinit();      // process table
    80001862:	00001097          	auipc	ra,0x1
    80001866:	e8e080e7          	jalr	-370(ra) # 800026f0 <procinit>
    trapinit();      // trap vectors
    8000186a:	00002097          	auipc	ra,0x2
    8000186e:	1c2080e7          	jalr	450(ra) # 80003a2c <trapinit>
    trapinithart();  // install kernel trap vector
    80001872:	00002097          	auipc	ra,0x2
    80001876:	1e4080e7          	jalr	484(ra) # 80003a56 <trapinithart>
    plicinit();      // set up interrupt controller
    8000187a:	00007097          	auipc	ra,0x7
    8000187e:	030080e7          	jalr	48(ra) # 800088aa <plicinit>
    plicinithart();  // ask PLIC for device interrupts
    80001882:	00007097          	auipc	ra,0x7
    80001886:	04c080e7          	jalr	76(ra) # 800088ce <plicinithart>
    binit();         // buffer cache
    8000188a:	00003097          	auipc	ra,0x3
    8000188e:	c48080e7          	jalr	-952(ra) # 800044d2 <binit>
    iinit();         // inode table
    80001892:	00003097          	auipc	ra,0x3
    80001896:	494080e7          	jalr	1172(ra) # 80004d26 <iinit>
    fileinit();      // file table
    8000189a:	00005097          	auipc	ra,0x5
    8000189e:	e36080e7          	jalr	-458(ra) # 800066d0 <fileinit>
    virtio_disk_init(); // emulated hard disk
    800018a2:	00007097          	auipc	ra,0x7
    800018a6:	100080e7          	jalr	256(ra) # 800089a2 <virtio_disk_init>
    userinit();      // first user process
    800018aa:	00001097          	auipc	ra,0x1
    800018ae:	2ee080e7          	jalr	750(ra) # 80002b98 <userinit>
    __sync_synchronize();
    800018b2:	0ff0000f          	fence
    started = 1;
    800018b6:	00013797          	auipc	a5,0x13
    800018ba:	9da78793          	addi	a5,a5,-1574 # 80014290 <started>
    800018be:	4705                	li	a4,1
    800018c0:	c398                	sw	a4,0(a5)
    800018c2:	a0a9                	j	8000190c <main+0x116>
  } else {
    while(started == 0)
    800018c4:	0001                	nop
    800018c6:	00013797          	auipc	a5,0x13
    800018ca:	9ca78793          	addi	a5,a5,-1590 # 80014290 <started>
    800018ce:	439c                	lw	a5,0(a5)
    800018d0:	2781                	sext.w	a5,a5
    800018d2:	dbf5                	beqz	a5,800018c6 <main+0xd0>
      ;
    __sync_synchronize();
    800018d4:	0ff0000f          	fence
    printf("hart %d starting\n", cpuid());
    800018d8:	00001097          	auipc	ra,0x1
    800018dc:	ede080e7          	jalr	-290(ra) # 800027b6 <cpuid>
    800018e0:	87aa                	mv	a5,a0
    800018e2:	85be                	mv	a1,a5
    800018e4:	00009517          	auipc	a0,0x9
    800018e8:	7bc50513          	addi	a0,a0,1980 # 8000b0a0 <etext+0xa0>
    800018ec:	fffff097          	auipc	ra,0xfffff
    800018f0:	13c080e7          	jalr	316(ra) # 80000a28 <printf>
    kvminithart();    // turn on paging
    800018f4:	00000097          	auipc	ra,0x0
    800018f8:	178080e7          	jalr	376(ra) # 80001a6c <kvminithart>
    trapinithart();   // install kernel trap vector
    800018fc:	00002097          	auipc	ra,0x2
    80001900:	15a080e7          	jalr	346(ra) # 80003a56 <trapinithart>
    plicinithart();   // ask PLIC for device interrupts
    80001904:	00007097          	auipc	ra,0x7
    80001908:	fca080e7          	jalr	-54(ra) # 800088ce <plicinithart>
  }

 // changeSchedulingAlgorithm(2);
  scheduler();
    8000190c:	00002097          	auipc	ra,0x2
    80001910:	944080e7          	jalr	-1724(ra) # 80003250 <scheduler>

0000000080001914 <w_satp>:
{
    80001914:	1101                	addi	sp,sp,-32
    80001916:	ec22                	sd	s0,24(sp)
    80001918:	1000                	addi	s0,sp,32
    8000191a:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    8000191e:	fe843783          	ld	a5,-24(s0)
    80001922:	18079073          	csrw	satp,a5
}
    80001926:	0001                	nop
    80001928:	6462                	ld	s0,24(sp)
    8000192a:	6105                	addi	sp,sp,32
    8000192c:	8082                	ret

000000008000192e <sfence_vma>:
}

// flush the TLB.
static inline void
sfence_vma()
{
    8000192e:	1141                	addi	sp,sp,-16
    80001930:	e422                	sd	s0,8(sp)
    80001932:	0800                	addi	s0,sp,16
  // the zero, zero means flush all TLB entries.
  asm volatile("sfence.vma zero, zero");
    80001934:	12000073          	sfence.vma
}
    80001938:	0001                	nop
    8000193a:	6422                	ld	s0,8(sp)
    8000193c:	0141                	addi	sp,sp,16
    8000193e:	8082                	ret

0000000080001940 <kvmmake>:
extern char trampoline[]; // trampoline.S

// Make a direct-map page table for the kernel.
pagetable_t
kvmmake(void)
{
    80001940:	1101                	addi	sp,sp,-32
    80001942:	ec06                	sd	ra,24(sp)
    80001944:	e822                	sd	s0,16(sp)
    80001946:	1000                	addi	s0,sp,32
  pagetable_t kpgtbl;

  kpgtbl = (pagetable_t) kalloc();
    80001948:	fffff097          	auipc	ra,0xfffff
    8000194c:	7d2080e7          	jalr	2002(ra) # 8000111a <kalloc>
    80001950:	fea43423          	sd	a0,-24(s0)
  memset(kpgtbl, 0, PGSIZE);
    80001954:	6605                	lui	a2,0x1
    80001956:	4581                	li	a1,0
    80001958:	fe843503          	ld	a0,-24(s0)
    8000195c:	00000097          	auipc	ra,0x0
    80001960:	ae6080e7          	jalr	-1306(ra) # 80001442 <memset>

  // uart registers
  kvmmap(kpgtbl, UART0, UART0, PGSIZE, PTE_R | PTE_W);
    80001964:	4719                	li	a4,6
    80001966:	6685                	lui	a3,0x1
    80001968:	10000637          	lui	a2,0x10000
    8000196c:	100005b7          	lui	a1,0x10000
    80001970:	fe843503          	ld	a0,-24(s0)
    80001974:	00000097          	auipc	ra,0x0
    80001978:	298080e7          	jalr	664(ra) # 80001c0c <kvmmap>

  // virtio mmio disk interface
  kvmmap(kpgtbl, VIRTIO0, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    8000197c:	4719                	li	a4,6
    8000197e:	6685                	lui	a3,0x1
    80001980:	10001637          	lui	a2,0x10001
    80001984:	100015b7          	lui	a1,0x10001
    80001988:	fe843503          	ld	a0,-24(s0)
    8000198c:	00000097          	auipc	ra,0x0
    80001990:	280080e7          	jalr	640(ra) # 80001c0c <kvmmap>

  // PLIC
  kvmmap(kpgtbl, PLIC, PLIC, 0x400000, PTE_R | PTE_W);
    80001994:	4719                	li	a4,6
    80001996:	004006b7          	lui	a3,0x400
    8000199a:	0c000637          	lui	a2,0xc000
    8000199e:	0c0005b7          	lui	a1,0xc000
    800019a2:	fe843503          	ld	a0,-24(s0)
    800019a6:	00000097          	auipc	ra,0x0
    800019aa:	266080e7          	jalr	614(ra) # 80001c0c <kvmmap>

  // map kernel text executable and read-only.
  kvmmap(kpgtbl, KERNBASE, KERNBASE, (uint64)etext-KERNBASE, PTE_R | PTE_X);
    800019ae:	00009717          	auipc	a4,0x9
    800019b2:	65270713          	addi	a4,a4,1618 # 8000b000 <etext>
    800019b6:	800007b7          	lui	a5,0x80000
    800019ba:	97ba                	add	a5,a5,a4
    800019bc:	4729                	li	a4,10
    800019be:	86be                	mv	a3,a5
    800019c0:	4785                	li	a5,1
    800019c2:	01f79613          	slli	a2,a5,0x1f
    800019c6:	4785                	li	a5,1
    800019c8:	01f79593          	slli	a1,a5,0x1f
    800019cc:	fe843503          	ld	a0,-24(s0)
    800019d0:	00000097          	auipc	ra,0x0
    800019d4:	23c080e7          	jalr	572(ra) # 80001c0c <kvmmap>

  // map kernel data and the physical RAM we'll make use of.
  kvmmap(kpgtbl, (uint64)etext, (uint64)etext, PHYSTOP-(uint64)etext, PTE_R | PTE_W);
    800019d8:	00009597          	auipc	a1,0x9
    800019dc:	62858593          	addi	a1,a1,1576 # 8000b000 <etext>
    800019e0:	00009617          	auipc	a2,0x9
    800019e4:	62060613          	addi	a2,a2,1568 # 8000b000 <etext>
    800019e8:	00009797          	auipc	a5,0x9
    800019ec:	61878793          	addi	a5,a5,1560 # 8000b000 <etext>
    800019f0:	4745                	li	a4,17
    800019f2:	076e                	slli	a4,a4,0x1b
    800019f4:	40f707b3          	sub	a5,a4,a5
    800019f8:	4719                	li	a4,6
    800019fa:	86be                	mv	a3,a5
    800019fc:	fe843503          	ld	a0,-24(s0)
    80001a00:	00000097          	auipc	ra,0x0
    80001a04:	20c080e7          	jalr	524(ra) # 80001c0c <kvmmap>

  // map the trampoline for trap entry/exit to
  // the highest virtual address in the kernel.
  kvmmap(kpgtbl, TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80001a08:	00008797          	auipc	a5,0x8
    80001a0c:	5f878793          	addi	a5,a5,1528 # 8000a000 <_trampoline>
    80001a10:	4729                	li	a4,10
    80001a12:	6685                	lui	a3,0x1
    80001a14:	863e                	mv	a2,a5
    80001a16:	040007b7          	lui	a5,0x4000
    80001a1a:	17fd                	addi	a5,a5,-1
    80001a1c:	00c79593          	slli	a1,a5,0xc
    80001a20:	fe843503          	ld	a0,-24(s0)
    80001a24:	00000097          	auipc	ra,0x0
    80001a28:	1e8080e7          	jalr	488(ra) # 80001c0c <kvmmap>

  // map kernel stacks
  proc_mapstacks(kpgtbl);
    80001a2c:	fe843503          	ld	a0,-24(s0)
    80001a30:	00001097          	auipc	ra,0x1
    80001a34:	c04080e7          	jalr	-1020(ra) # 80002634 <proc_mapstacks>
  
  return kpgtbl;
    80001a38:	fe843783          	ld	a5,-24(s0)
}
    80001a3c:	853e                	mv	a0,a5
    80001a3e:	60e2                	ld	ra,24(sp)
    80001a40:	6442                	ld	s0,16(sp)
    80001a42:	6105                	addi	sp,sp,32
    80001a44:	8082                	ret

0000000080001a46 <kvminit>:

// Initialize the one kernel_pagetable
void
kvminit(void)
{
    80001a46:	1141                	addi	sp,sp,-16
    80001a48:	e406                	sd	ra,8(sp)
    80001a4a:	e022                	sd	s0,0(sp)
    80001a4c:	0800                	addi	s0,sp,16
  kernel_pagetable = kvmmake();
    80001a4e:	00000097          	auipc	ra,0x0
    80001a52:	ef2080e7          	jalr	-270(ra) # 80001940 <kvmmake>
    80001a56:	872a                	mv	a4,a0
    80001a58:	0000a797          	auipc	a5,0xa
    80001a5c:	5c078793          	addi	a5,a5,1472 # 8000c018 <kernel_pagetable>
    80001a60:	e398                	sd	a4,0(a5)
}
    80001a62:	0001                	nop
    80001a64:	60a2                	ld	ra,8(sp)
    80001a66:	6402                	ld	s0,0(sp)
    80001a68:	0141                	addi	sp,sp,16
    80001a6a:	8082                	ret

0000000080001a6c <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    80001a6c:	1141                	addi	sp,sp,-16
    80001a6e:	e406                	sd	ra,8(sp)
    80001a70:	e022                	sd	s0,0(sp)
    80001a72:	0800                	addi	s0,sp,16
  w_satp(MAKE_SATP(kernel_pagetable));
    80001a74:	0000a797          	auipc	a5,0xa
    80001a78:	5a478793          	addi	a5,a5,1444 # 8000c018 <kernel_pagetable>
    80001a7c:	639c                	ld	a5,0(a5)
    80001a7e:	00c7d713          	srli	a4,a5,0xc
    80001a82:	57fd                	li	a5,-1
    80001a84:	17fe                	slli	a5,a5,0x3f
    80001a86:	8fd9                	or	a5,a5,a4
    80001a88:	853e                	mv	a0,a5
    80001a8a:	00000097          	auipc	ra,0x0
    80001a8e:	e8a080e7          	jalr	-374(ra) # 80001914 <w_satp>
  sfence_vma();
    80001a92:	00000097          	auipc	ra,0x0
    80001a96:	e9c080e7          	jalr	-356(ra) # 8000192e <sfence_vma>
}
    80001a9a:	0001                	nop
    80001a9c:	60a2                	ld	ra,8(sp)
    80001a9e:	6402                	ld	s0,0(sp)
    80001aa0:	0141                	addi	sp,sp,16
    80001aa2:	8082                	ret

0000000080001aa4 <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80001aa4:	7139                	addi	sp,sp,-64
    80001aa6:	fc06                	sd	ra,56(sp)
    80001aa8:	f822                	sd	s0,48(sp)
    80001aaa:	0080                	addi	s0,sp,64
    80001aac:	fca43c23          	sd	a0,-40(s0)
    80001ab0:	fcb43823          	sd	a1,-48(s0)
    80001ab4:	87b2                	mv	a5,a2
    80001ab6:	fcf42623          	sw	a5,-52(s0)
  if(va >= MAXVA)
    80001aba:	fd043703          	ld	a4,-48(s0)
    80001abe:	57fd                	li	a5,-1
    80001ac0:	83e9                	srli	a5,a5,0x1a
    80001ac2:	00e7fa63          	bgeu	a5,a4,80001ad6 <walk+0x32>
    panic("walk");
    80001ac6:	00009517          	auipc	a0,0x9
    80001aca:	5f250513          	addi	a0,a0,1522 # 8000b0b8 <etext+0xb8>
    80001ace:	fffff097          	auipc	ra,0xfffff
    80001ad2:	1b0080e7          	jalr	432(ra) # 80000c7e <panic>

  for(int level = 2; level > 0; level--) {
    80001ad6:	4789                	li	a5,2
    80001ad8:	fef42623          	sw	a5,-20(s0)
    80001adc:	a849                	j	80001b6e <walk+0xca>
    pte_t *pte = &pagetable[PX(level, va)];
    80001ade:	fec42703          	lw	a4,-20(s0)
    80001ae2:	87ba                	mv	a5,a4
    80001ae4:	0037979b          	slliw	a5,a5,0x3
    80001ae8:	9fb9                	addw	a5,a5,a4
    80001aea:	2781                	sext.w	a5,a5
    80001aec:	27b1                	addiw	a5,a5,12
    80001aee:	2781                	sext.w	a5,a5
    80001af0:	873e                	mv	a4,a5
    80001af2:	fd043783          	ld	a5,-48(s0)
    80001af6:	00e7d7b3          	srl	a5,a5,a4
    80001afa:	1ff7f793          	andi	a5,a5,511
    80001afe:	078e                	slli	a5,a5,0x3
    80001b00:	fd843703          	ld	a4,-40(s0)
    80001b04:	97ba                	add	a5,a5,a4
    80001b06:	fef43023          	sd	a5,-32(s0)
    if(*pte & PTE_V) {
    80001b0a:	fe043783          	ld	a5,-32(s0)
    80001b0e:	639c                	ld	a5,0(a5)
    80001b10:	8b85                	andi	a5,a5,1
    80001b12:	cb89                	beqz	a5,80001b24 <walk+0x80>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80001b14:	fe043783          	ld	a5,-32(s0)
    80001b18:	639c                	ld	a5,0(a5)
    80001b1a:	83a9                	srli	a5,a5,0xa
    80001b1c:	07b2                	slli	a5,a5,0xc
    80001b1e:	fcf43c23          	sd	a5,-40(s0)
    80001b22:	a089                	j	80001b64 <walk+0xc0>
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == 0)
    80001b24:	fcc42783          	lw	a5,-52(s0)
    80001b28:	2781                	sext.w	a5,a5
    80001b2a:	cb91                	beqz	a5,80001b3e <walk+0x9a>
    80001b2c:	fffff097          	auipc	ra,0xfffff
    80001b30:	5ee080e7          	jalr	1518(ra) # 8000111a <kalloc>
    80001b34:	fca43c23          	sd	a0,-40(s0)
    80001b38:	fd843783          	ld	a5,-40(s0)
    80001b3c:	e399                	bnez	a5,80001b42 <walk+0x9e>
        return 0;
    80001b3e:	4781                	li	a5,0
    80001b40:	a0a9                	j	80001b8a <walk+0xe6>
      memset(pagetable, 0, PGSIZE);
    80001b42:	6605                	lui	a2,0x1
    80001b44:	4581                	li	a1,0
    80001b46:	fd843503          	ld	a0,-40(s0)
    80001b4a:	00000097          	auipc	ra,0x0
    80001b4e:	8f8080e7          	jalr	-1800(ra) # 80001442 <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80001b52:	fd843783          	ld	a5,-40(s0)
    80001b56:	83b1                	srli	a5,a5,0xc
    80001b58:	07aa                	slli	a5,a5,0xa
    80001b5a:	0017e713          	ori	a4,a5,1
    80001b5e:	fe043783          	ld	a5,-32(s0)
    80001b62:	e398                	sd	a4,0(a5)
  for(int level = 2; level > 0; level--) {
    80001b64:	fec42783          	lw	a5,-20(s0)
    80001b68:	37fd                	addiw	a5,a5,-1
    80001b6a:	fef42623          	sw	a5,-20(s0)
    80001b6e:	fec42783          	lw	a5,-20(s0)
    80001b72:	2781                	sext.w	a5,a5
    80001b74:	f6f045e3          	bgtz	a5,80001ade <walk+0x3a>
    }
  }
  return &pagetable[PX(0, va)];
    80001b78:	fd043783          	ld	a5,-48(s0)
    80001b7c:	83b1                	srli	a5,a5,0xc
    80001b7e:	1ff7f793          	andi	a5,a5,511
    80001b82:	078e                	slli	a5,a5,0x3
    80001b84:	fd843703          	ld	a4,-40(s0)
    80001b88:	97ba                	add	a5,a5,a4
}
    80001b8a:	853e                	mv	a0,a5
    80001b8c:	70e2                	ld	ra,56(sp)
    80001b8e:	7442                	ld	s0,48(sp)
    80001b90:	6121                	addi	sp,sp,64
    80001b92:	8082                	ret

0000000080001b94 <walkaddr>:
// Look up a virtual address, return the physical address,
// or 0 if not mapped.
// Can only be used to look up user pages.
uint64
walkaddr(pagetable_t pagetable, uint64 va)
{
    80001b94:	7179                	addi	sp,sp,-48
    80001b96:	f406                	sd	ra,40(sp)
    80001b98:	f022                	sd	s0,32(sp)
    80001b9a:	1800                	addi	s0,sp,48
    80001b9c:	fca43c23          	sd	a0,-40(s0)
    80001ba0:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80001ba4:	fd043703          	ld	a4,-48(s0)
    80001ba8:	57fd                	li	a5,-1
    80001baa:	83e9                	srli	a5,a5,0x1a
    80001bac:	00e7f463          	bgeu	a5,a4,80001bb4 <walkaddr+0x20>
    return 0;
    80001bb0:	4781                	li	a5,0
    80001bb2:	a881                	j	80001c02 <walkaddr+0x6e>

  pte = walk(pagetable, va, 0);
    80001bb4:	4601                	li	a2,0
    80001bb6:	fd043583          	ld	a1,-48(s0)
    80001bba:	fd843503          	ld	a0,-40(s0)
    80001bbe:	00000097          	auipc	ra,0x0
    80001bc2:	ee6080e7          	jalr	-282(ra) # 80001aa4 <walk>
    80001bc6:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    80001bca:	fe843783          	ld	a5,-24(s0)
    80001bce:	e399                	bnez	a5,80001bd4 <walkaddr+0x40>
    return 0;
    80001bd0:	4781                	li	a5,0
    80001bd2:	a805                	j	80001c02 <walkaddr+0x6e>
  if((*pte & PTE_V) == 0)
    80001bd4:	fe843783          	ld	a5,-24(s0)
    80001bd8:	639c                	ld	a5,0(a5)
    80001bda:	8b85                	andi	a5,a5,1
    80001bdc:	e399                	bnez	a5,80001be2 <walkaddr+0x4e>
    return 0;
    80001bde:	4781                	li	a5,0
    80001be0:	a00d                	j	80001c02 <walkaddr+0x6e>
  if((*pte & PTE_U) == 0)
    80001be2:	fe843783          	ld	a5,-24(s0)
    80001be6:	639c                	ld	a5,0(a5)
    80001be8:	8bc1                	andi	a5,a5,16
    80001bea:	e399                	bnez	a5,80001bf0 <walkaddr+0x5c>
    return 0;
    80001bec:	4781                	li	a5,0
    80001bee:	a811                	j	80001c02 <walkaddr+0x6e>
  pa = PTE2PA(*pte);
    80001bf0:	fe843783          	ld	a5,-24(s0)
    80001bf4:	639c                	ld	a5,0(a5)
    80001bf6:	83a9                	srli	a5,a5,0xa
    80001bf8:	07b2                	slli	a5,a5,0xc
    80001bfa:	fef43023          	sd	a5,-32(s0)
  return pa;
    80001bfe:	fe043783          	ld	a5,-32(s0)
}
    80001c02:	853e                	mv	a0,a5
    80001c04:	70a2                	ld	ra,40(sp)
    80001c06:	7402                	ld	s0,32(sp)
    80001c08:	6145                	addi	sp,sp,48
    80001c0a:	8082                	ret

0000000080001c0c <kvmmap>:
// add a mapping to the kernel page table.
// only used when booting.
// does not flush TLB or enable paging.
void
kvmmap(pagetable_t kpgtbl, uint64 va, uint64 pa, uint64 sz, int perm)
{
    80001c0c:	7139                	addi	sp,sp,-64
    80001c0e:	fc06                	sd	ra,56(sp)
    80001c10:	f822                	sd	s0,48(sp)
    80001c12:	0080                	addi	s0,sp,64
    80001c14:	fea43423          	sd	a0,-24(s0)
    80001c18:	feb43023          	sd	a1,-32(s0)
    80001c1c:	fcc43c23          	sd	a2,-40(s0)
    80001c20:	fcd43823          	sd	a3,-48(s0)
    80001c24:	87ba                	mv	a5,a4
    80001c26:	fcf42623          	sw	a5,-52(s0)
  if(mappages(kpgtbl, va, sz, pa, perm) != 0)
    80001c2a:	fcc42783          	lw	a5,-52(s0)
    80001c2e:	873e                	mv	a4,a5
    80001c30:	fd843683          	ld	a3,-40(s0)
    80001c34:	fd043603          	ld	a2,-48(s0)
    80001c38:	fe043583          	ld	a1,-32(s0)
    80001c3c:	fe843503          	ld	a0,-24(s0)
    80001c40:	00000097          	auipc	ra,0x0
    80001c44:	026080e7          	jalr	38(ra) # 80001c66 <mappages>
    80001c48:	87aa                	mv	a5,a0
    80001c4a:	cb89                	beqz	a5,80001c5c <kvmmap+0x50>
    panic("kvmmap");
    80001c4c:	00009517          	auipc	a0,0x9
    80001c50:	47450513          	addi	a0,a0,1140 # 8000b0c0 <etext+0xc0>
    80001c54:	fffff097          	auipc	ra,0xfffff
    80001c58:	02a080e7          	jalr	42(ra) # 80000c7e <panic>
}
    80001c5c:	0001                	nop
    80001c5e:	70e2                	ld	ra,56(sp)
    80001c60:	7442                	ld	s0,48(sp)
    80001c62:	6121                	addi	sp,sp,64
    80001c64:	8082                	ret

0000000080001c66 <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80001c66:	711d                	addi	sp,sp,-96
    80001c68:	ec86                	sd	ra,88(sp)
    80001c6a:	e8a2                	sd	s0,80(sp)
    80001c6c:	1080                	addi	s0,sp,96
    80001c6e:	fca43423          	sd	a0,-56(s0)
    80001c72:	fcb43023          	sd	a1,-64(s0)
    80001c76:	fac43c23          	sd	a2,-72(s0)
    80001c7a:	fad43823          	sd	a3,-80(s0)
    80001c7e:	87ba                	mv	a5,a4
    80001c80:	faf42623          	sw	a5,-84(s0)
  uint64 a, last;
  pte_t *pte;

  if(size == 0)
    80001c84:	fb843783          	ld	a5,-72(s0)
    80001c88:	eb89                	bnez	a5,80001c9a <mappages+0x34>
    panic("mappages: size");
    80001c8a:	00009517          	auipc	a0,0x9
    80001c8e:	43e50513          	addi	a0,a0,1086 # 8000b0c8 <etext+0xc8>
    80001c92:	fffff097          	auipc	ra,0xfffff
    80001c96:	fec080e7          	jalr	-20(ra) # 80000c7e <panic>
  
  a = PGROUNDDOWN(va);
    80001c9a:	fc043703          	ld	a4,-64(s0)
    80001c9e:	77fd                	lui	a5,0xfffff
    80001ca0:	8ff9                	and	a5,a5,a4
    80001ca2:	fef43423          	sd	a5,-24(s0)
  last = PGROUNDDOWN(va + size - 1);
    80001ca6:	fc043703          	ld	a4,-64(s0)
    80001caa:	fb843783          	ld	a5,-72(s0)
    80001cae:	97ba                	add	a5,a5,a4
    80001cb0:	fff78713          	addi	a4,a5,-1 # ffffffffffffefff <end+0xffffffff7ffd5fff>
    80001cb4:	77fd                	lui	a5,0xfffff
    80001cb6:	8ff9                	and	a5,a5,a4
    80001cb8:	fef43023          	sd	a5,-32(s0)
  for(;;){
    if((pte = walk(pagetable, a, 1)) == 0)
    80001cbc:	4605                	li	a2,1
    80001cbe:	fe843583          	ld	a1,-24(s0)
    80001cc2:	fc843503          	ld	a0,-56(s0)
    80001cc6:	00000097          	auipc	ra,0x0
    80001cca:	dde080e7          	jalr	-546(ra) # 80001aa4 <walk>
    80001cce:	fca43c23          	sd	a0,-40(s0)
    80001cd2:	fd843783          	ld	a5,-40(s0)
    80001cd6:	e399                	bnez	a5,80001cdc <mappages+0x76>
      return -1;
    80001cd8:	57fd                	li	a5,-1
    80001cda:	a085                	j	80001d3a <mappages+0xd4>
    if(*pte & PTE_V)
    80001cdc:	fd843783          	ld	a5,-40(s0)
    80001ce0:	639c                	ld	a5,0(a5)
    80001ce2:	8b85                	andi	a5,a5,1
    80001ce4:	cb89                	beqz	a5,80001cf6 <mappages+0x90>
      panic("mappages: remap");
    80001ce6:	00009517          	auipc	a0,0x9
    80001cea:	3f250513          	addi	a0,a0,1010 # 8000b0d8 <etext+0xd8>
    80001cee:	fffff097          	auipc	ra,0xfffff
    80001cf2:	f90080e7          	jalr	-112(ra) # 80000c7e <panic>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80001cf6:	fb043783          	ld	a5,-80(s0)
    80001cfa:	83b1                	srli	a5,a5,0xc
    80001cfc:	00a79713          	slli	a4,a5,0xa
    80001d00:	fac42783          	lw	a5,-84(s0)
    80001d04:	8fd9                	or	a5,a5,a4
    80001d06:	0017e713          	ori	a4,a5,1
    80001d0a:	fd843783          	ld	a5,-40(s0)
    80001d0e:	e398                	sd	a4,0(a5)
    if(a == last)
    80001d10:	fe843703          	ld	a4,-24(s0)
    80001d14:	fe043783          	ld	a5,-32(s0)
    80001d18:	00f70f63          	beq	a4,a5,80001d36 <mappages+0xd0>
      break;
    a += PGSIZE;
    80001d1c:	fe843703          	ld	a4,-24(s0)
    80001d20:	6785                	lui	a5,0x1
    80001d22:	97ba                	add	a5,a5,a4
    80001d24:	fef43423          	sd	a5,-24(s0)
    pa += PGSIZE;
    80001d28:	fb043703          	ld	a4,-80(s0)
    80001d2c:	6785                	lui	a5,0x1
    80001d2e:	97ba                	add	a5,a5,a4
    80001d30:	faf43823          	sd	a5,-80(s0)
    if((pte = walk(pagetable, a, 1)) == 0)
    80001d34:	b761                	j	80001cbc <mappages+0x56>
      break;
    80001d36:	0001                	nop
  }
  return 0;
    80001d38:	4781                	li	a5,0
}
    80001d3a:	853e                	mv	a0,a5
    80001d3c:	60e6                	ld	ra,88(sp)
    80001d3e:	6446                	ld	s0,80(sp)
    80001d40:	6125                	addi	sp,sp,96
    80001d42:	8082                	ret

0000000080001d44 <uvmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
uvmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80001d44:	715d                	addi	sp,sp,-80
    80001d46:	e486                	sd	ra,72(sp)
    80001d48:	e0a2                	sd	s0,64(sp)
    80001d4a:	0880                	addi	s0,sp,80
    80001d4c:	fca43423          	sd	a0,-56(s0)
    80001d50:	fcb43023          	sd	a1,-64(s0)
    80001d54:	fac43c23          	sd	a2,-72(s0)
    80001d58:	87b6                	mv	a5,a3
    80001d5a:	faf42a23          	sw	a5,-76(s0)
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80001d5e:	fc043703          	ld	a4,-64(s0)
    80001d62:	6785                	lui	a5,0x1
    80001d64:	17fd                	addi	a5,a5,-1
    80001d66:	8ff9                	and	a5,a5,a4
    80001d68:	cb89                	beqz	a5,80001d7a <uvmunmap+0x36>
    panic("uvmunmap: not aligned");
    80001d6a:	00009517          	auipc	a0,0x9
    80001d6e:	37e50513          	addi	a0,a0,894 # 8000b0e8 <etext+0xe8>
    80001d72:	fffff097          	auipc	ra,0xfffff
    80001d76:	f0c080e7          	jalr	-244(ra) # 80000c7e <panic>

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001d7a:	fc043783          	ld	a5,-64(s0)
    80001d7e:	fef43423          	sd	a5,-24(s0)
    80001d82:	a045                	j	80001e22 <uvmunmap+0xde>
    if((pte = walk(pagetable, a, 0)) == 0)
    80001d84:	4601                	li	a2,0
    80001d86:	fe843583          	ld	a1,-24(s0)
    80001d8a:	fc843503          	ld	a0,-56(s0)
    80001d8e:	00000097          	auipc	ra,0x0
    80001d92:	d16080e7          	jalr	-746(ra) # 80001aa4 <walk>
    80001d96:	fea43023          	sd	a0,-32(s0)
    80001d9a:	fe043783          	ld	a5,-32(s0)
    80001d9e:	eb89                	bnez	a5,80001db0 <uvmunmap+0x6c>
      panic("uvmunmap: walk");
    80001da0:	00009517          	auipc	a0,0x9
    80001da4:	36050513          	addi	a0,a0,864 # 8000b100 <etext+0x100>
    80001da8:	fffff097          	auipc	ra,0xfffff
    80001dac:	ed6080e7          	jalr	-298(ra) # 80000c7e <panic>
    if((*pte & PTE_V) == 0)
    80001db0:	fe043783          	ld	a5,-32(s0)
    80001db4:	639c                	ld	a5,0(a5)
    80001db6:	8b85                	andi	a5,a5,1
    80001db8:	eb89                	bnez	a5,80001dca <uvmunmap+0x86>
      panic("uvmunmap: not mapped");
    80001dba:	00009517          	auipc	a0,0x9
    80001dbe:	35650513          	addi	a0,a0,854 # 8000b110 <etext+0x110>
    80001dc2:	fffff097          	auipc	ra,0xfffff
    80001dc6:	ebc080e7          	jalr	-324(ra) # 80000c7e <panic>
    if(PTE_FLAGS(*pte) == PTE_V)
    80001dca:	fe043783          	ld	a5,-32(s0)
    80001dce:	639c                	ld	a5,0(a5)
    80001dd0:	3ff7f713          	andi	a4,a5,1023
    80001dd4:	4785                	li	a5,1
    80001dd6:	00f71a63          	bne	a4,a5,80001dea <uvmunmap+0xa6>
      panic("uvmunmap: not a leaf");
    80001dda:	00009517          	auipc	a0,0x9
    80001dde:	34e50513          	addi	a0,a0,846 # 8000b128 <etext+0x128>
    80001de2:	fffff097          	auipc	ra,0xfffff
    80001de6:	e9c080e7          	jalr	-356(ra) # 80000c7e <panic>
    if(do_free){
    80001dea:	fb442783          	lw	a5,-76(s0)
    80001dee:	2781                	sext.w	a5,a5
    80001df0:	cf99                	beqz	a5,80001e0e <uvmunmap+0xca>
      uint64 pa = PTE2PA(*pte);
    80001df2:	fe043783          	ld	a5,-32(s0)
    80001df6:	639c                	ld	a5,0(a5)
    80001df8:	83a9                	srli	a5,a5,0xa
    80001dfa:	07b2                	slli	a5,a5,0xc
    80001dfc:	fcf43c23          	sd	a5,-40(s0)
      kfree((void*)pa);
    80001e00:	fd843783          	ld	a5,-40(s0)
    80001e04:	853e                	mv	a0,a5
    80001e06:	fffff097          	auipc	ra,0xfffff
    80001e0a:	270080e7          	jalr	624(ra) # 80001076 <kfree>
    }
    *pte = 0;
    80001e0e:	fe043783          	ld	a5,-32(s0)
    80001e12:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001e16:	fe843703          	ld	a4,-24(s0)
    80001e1a:	6785                	lui	a5,0x1
    80001e1c:	97ba                	add	a5,a5,a4
    80001e1e:	fef43423          	sd	a5,-24(s0)
    80001e22:	fb843783          	ld	a5,-72(s0)
    80001e26:	00c79713          	slli	a4,a5,0xc
    80001e2a:	fc043783          	ld	a5,-64(s0)
    80001e2e:	97ba                	add	a5,a5,a4
    80001e30:	fe843703          	ld	a4,-24(s0)
    80001e34:	f4f768e3          	bltu	a4,a5,80001d84 <uvmunmap+0x40>
  }
}
    80001e38:	0001                	nop
    80001e3a:	0001                	nop
    80001e3c:	60a6                	ld	ra,72(sp)
    80001e3e:	6406                	ld	s0,64(sp)
    80001e40:	6161                	addi	sp,sp,80
    80001e42:	8082                	ret

0000000080001e44 <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    80001e44:	1101                	addi	sp,sp,-32
    80001e46:	ec06                	sd	ra,24(sp)
    80001e48:	e822                	sd	s0,16(sp)
    80001e4a:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    80001e4c:	fffff097          	auipc	ra,0xfffff
    80001e50:	2ce080e7          	jalr	718(ra) # 8000111a <kalloc>
    80001e54:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80001e58:	fe843783          	ld	a5,-24(s0)
    80001e5c:	e399                	bnez	a5,80001e62 <uvmcreate+0x1e>
    return 0;
    80001e5e:	4781                	li	a5,0
    80001e60:	a819                	j	80001e76 <uvmcreate+0x32>
  memset(pagetable, 0, PGSIZE);
    80001e62:	6605                	lui	a2,0x1
    80001e64:	4581                	li	a1,0
    80001e66:	fe843503          	ld	a0,-24(s0)
    80001e6a:	fffff097          	auipc	ra,0xfffff
    80001e6e:	5d8080e7          	jalr	1496(ra) # 80001442 <memset>
  return pagetable;
    80001e72:	fe843783          	ld	a5,-24(s0)
}
    80001e76:	853e                	mv	a0,a5
    80001e78:	60e2                	ld	ra,24(sp)
    80001e7a:	6442                	ld	s0,16(sp)
    80001e7c:	6105                	addi	sp,sp,32
    80001e7e:	8082                	ret

0000000080001e80 <uvminit>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvminit(pagetable_t pagetable, uchar *src, uint sz)
{
    80001e80:	7139                	addi	sp,sp,-64
    80001e82:	fc06                	sd	ra,56(sp)
    80001e84:	f822                	sd	s0,48(sp)
    80001e86:	0080                	addi	s0,sp,64
    80001e88:	fca43c23          	sd	a0,-40(s0)
    80001e8c:	fcb43823          	sd	a1,-48(s0)
    80001e90:	87b2                	mv	a5,a2
    80001e92:	fcf42623          	sw	a5,-52(s0)
  char *mem;

  if(sz >= PGSIZE)
    80001e96:	fcc42783          	lw	a5,-52(s0)
    80001e9a:	0007871b          	sext.w	a4,a5
    80001e9e:	6785                	lui	a5,0x1
    80001ea0:	00f76a63          	bltu	a4,a5,80001eb4 <uvminit+0x34>
    panic("inituvm: more than a page");
    80001ea4:	00009517          	auipc	a0,0x9
    80001ea8:	29c50513          	addi	a0,a0,668 # 8000b140 <etext+0x140>
    80001eac:	fffff097          	auipc	ra,0xfffff
    80001eb0:	dd2080e7          	jalr	-558(ra) # 80000c7e <panic>
  mem = kalloc();
    80001eb4:	fffff097          	auipc	ra,0xfffff
    80001eb8:	266080e7          	jalr	614(ra) # 8000111a <kalloc>
    80001ebc:	fea43423          	sd	a0,-24(s0)
  memset(mem, 0, PGSIZE);
    80001ec0:	6605                	lui	a2,0x1
    80001ec2:	4581                	li	a1,0
    80001ec4:	fe843503          	ld	a0,-24(s0)
    80001ec8:	fffff097          	auipc	ra,0xfffff
    80001ecc:	57a080e7          	jalr	1402(ra) # 80001442 <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    80001ed0:	fe843783          	ld	a5,-24(s0)
    80001ed4:	4779                	li	a4,30
    80001ed6:	86be                	mv	a3,a5
    80001ed8:	6605                	lui	a2,0x1
    80001eda:	4581                	li	a1,0
    80001edc:	fd843503          	ld	a0,-40(s0)
    80001ee0:	00000097          	auipc	ra,0x0
    80001ee4:	d86080e7          	jalr	-634(ra) # 80001c66 <mappages>
  memmove(mem, src, sz);
    80001ee8:	fcc42783          	lw	a5,-52(s0)
    80001eec:	863e                	mv	a2,a5
    80001eee:	fd043583          	ld	a1,-48(s0)
    80001ef2:	fe843503          	ld	a0,-24(s0)
    80001ef6:	fffff097          	auipc	ra,0xfffff
    80001efa:	630080e7          	jalr	1584(ra) # 80001526 <memmove>
}
    80001efe:	0001                	nop
    80001f00:	70e2                	ld	ra,56(sp)
    80001f02:	7442                	ld	s0,48(sp)
    80001f04:	6121                	addi	sp,sp,64
    80001f06:	8082                	ret

0000000080001f08 <uvmalloc>:

// Allocate PTEs and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
uint64
uvmalloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    80001f08:	7139                	addi	sp,sp,-64
    80001f0a:	fc06                	sd	ra,56(sp)
    80001f0c:	f822                	sd	s0,48(sp)
    80001f0e:	0080                	addi	s0,sp,64
    80001f10:	fca43c23          	sd	a0,-40(s0)
    80001f14:	fcb43823          	sd	a1,-48(s0)
    80001f18:	fcc43423          	sd	a2,-56(s0)
  char *mem;
  uint64 a;

  if(newsz < oldsz)
    80001f1c:	fc843703          	ld	a4,-56(s0)
    80001f20:	fd043783          	ld	a5,-48(s0)
    80001f24:	00f77563          	bgeu	a4,a5,80001f2e <uvmalloc+0x26>
    return oldsz;
    80001f28:	fd043783          	ld	a5,-48(s0)
    80001f2c:	a85d                	j	80001fe2 <uvmalloc+0xda>

  oldsz = PGROUNDUP(oldsz);
    80001f2e:	fd043703          	ld	a4,-48(s0)
    80001f32:	6785                	lui	a5,0x1
    80001f34:	17fd                	addi	a5,a5,-1
    80001f36:	973e                	add	a4,a4,a5
    80001f38:	77fd                	lui	a5,0xfffff
    80001f3a:	8ff9                	and	a5,a5,a4
    80001f3c:	fcf43823          	sd	a5,-48(s0)
  for(a = oldsz; a < newsz; a += PGSIZE){
    80001f40:	fd043783          	ld	a5,-48(s0)
    80001f44:	fef43423          	sd	a5,-24(s0)
    80001f48:	a069                	j	80001fd2 <uvmalloc+0xca>
    mem = kalloc();
    80001f4a:	fffff097          	auipc	ra,0xfffff
    80001f4e:	1d0080e7          	jalr	464(ra) # 8000111a <kalloc>
    80001f52:	fea43023          	sd	a0,-32(s0)
    if(mem == 0){
    80001f56:	fe043783          	ld	a5,-32(s0)
    80001f5a:	ef89                	bnez	a5,80001f74 <uvmalloc+0x6c>
      uvmdealloc(pagetable, a, oldsz);
    80001f5c:	fd043603          	ld	a2,-48(s0)
    80001f60:	fe843583          	ld	a1,-24(s0)
    80001f64:	fd843503          	ld	a0,-40(s0)
    80001f68:	00000097          	auipc	ra,0x0
    80001f6c:	084080e7          	jalr	132(ra) # 80001fec <uvmdealloc>
      return 0;
    80001f70:	4781                	li	a5,0
    80001f72:	a885                	j	80001fe2 <uvmalloc+0xda>
    }
    memset(mem, 0, PGSIZE);
    80001f74:	6605                	lui	a2,0x1
    80001f76:	4581                	li	a1,0
    80001f78:	fe043503          	ld	a0,-32(s0)
    80001f7c:	fffff097          	auipc	ra,0xfffff
    80001f80:	4c6080e7          	jalr	1222(ra) # 80001442 <memset>
    if(mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R|PTE_U) != 0){
    80001f84:	fe043783          	ld	a5,-32(s0)
    80001f88:	4779                	li	a4,30
    80001f8a:	86be                	mv	a3,a5
    80001f8c:	6605                	lui	a2,0x1
    80001f8e:	fe843583          	ld	a1,-24(s0)
    80001f92:	fd843503          	ld	a0,-40(s0)
    80001f96:	00000097          	auipc	ra,0x0
    80001f9a:	cd0080e7          	jalr	-816(ra) # 80001c66 <mappages>
    80001f9e:	87aa                	mv	a5,a0
    80001fa0:	c39d                	beqz	a5,80001fc6 <uvmalloc+0xbe>
      kfree(mem);
    80001fa2:	fe043503          	ld	a0,-32(s0)
    80001fa6:	fffff097          	auipc	ra,0xfffff
    80001faa:	0d0080e7          	jalr	208(ra) # 80001076 <kfree>
      uvmdealloc(pagetable, a, oldsz);
    80001fae:	fd043603          	ld	a2,-48(s0)
    80001fb2:	fe843583          	ld	a1,-24(s0)
    80001fb6:	fd843503          	ld	a0,-40(s0)
    80001fba:	00000097          	auipc	ra,0x0
    80001fbe:	032080e7          	jalr	50(ra) # 80001fec <uvmdealloc>
      return 0;
    80001fc2:	4781                	li	a5,0
    80001fc4:	a839                	j	80001fe2 <uvmalloc+0xda>
  for(a = oldsz; a < newsz; a += PGSIZE){
    80001fc6:	fe843703          	ld	a4,-24(s0)
    80001fca:	6785                	lui	a5,0x1
    80001fcc:	97ba                	add	a5,a5,a4
    80001fce:	fef43423          	sd	a5,-24(s0)
    80001fd2:	fe843703          	ld	a4,-24(s0)
    80001fd6:	fc843783          	ld	a5,-56(s0)
    80001fda:	f6f768e3          	bltu	a4,a5,80001f4a <uvmalloc+0x42>
    }
  }
  return newsz;
    80001fde:	fc843783          	ld	a5,-56(s0)
}
    80001fe2:	853e                	mv	a0,a5
    80001fe4:	70e2                	ld	ra,56(sp)
    80001fe6:	7442                	ld	s0,48(sp)
    80001fe8:	6121                	addi	sp,sp,64
    80001fea:	8082                	ret

0000000080001fec <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    80001fec:	7139                	addi	sp,sp,-64
    80001fee:	fc06                	sd	ra,56(sp)
    80001ff0:	f822                	sd	s0,48(sp)
    80001ff2:	0080                	addi	s0,sp,64
    80001ff4:	fca43c23          	sd	a0,-40(s0)
    80001ff8:	fcb43823          	sd	a1,-48(s0)
    80001ffc:	fcc43423          	sd	a2,-56(s0)
  if(newsz >= oldsz)
    80002000:	fc843703          	ld	a4,-56(s0)
    80002004:	fd043783          	ld	a5,-48(s0)
    80002008:	00f76563          	bltu	a4,a5,80002012 <uvmdealloc+0x26>
    return oldsz;
    8000200c:	fd043783          	ld	a5,-48(s0)
    80002010:	a885                	j	80002080 <uvmdealloc+0x94>

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    80002012:	fc843703          	ld	a4,-56(s0)
    80002016:	6785                	lui	a5,0x1
    80002018:	17fd                	addi	a5,a5,-1
    8000201a:	973e                	add	a4,a4,a5
    8000201c:	77fd                	lui	a5,0xfffff
    8000201e:	8f7d                	and	a4,a4,a5
    80002020:	fd043683          	ld	a3,-48(s0)
    80002024:	6785                	lui	a5,0x1
    80002026:	17fd                	addi	a5,a5,-1
    80002028:	96be                	add	a3,a3,a5
    8000202a:	77fd                	lui	a5,0xfffff
    8000202c:	8ff5                	and	a5,a5,a3
    8000202e:	04f77763          	bgeu	a4,a5,8000207c <uvmdealloc+0x90>
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    80002032:	fd043703          	ld	a4,-48(s0)
    80002036:	6785                	lui	a5,0x1
    80002038:	17fd                	addi	a5,a5,-1
    8000203a:	973e                	add	a4,a4,a5
    8000203c:	77fd                	lui	a5,0xfffff
    8000203e:	8f7d                	and	a4,a4,a5
    80002040:	fc843683          	ld	a3,-56(s0)
    80002044:	6785                	lui	a5,0x1
    80002046:	17fd                	addi	a5,a5,-1
    80002048:	96be                	add	a3,a3,a5
    8000204a:	77fd                	lui	a5,0xfffff
    8000204c:	8ff5                	and	a5,a5,a3
    8000204e:	40f707b3          	sub	a5,a4,a5
    80002052:	83b1                	srli	a5,a5,0xc
    80002054:	fef42623          	sw	a5,-20(s0)
    uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    80002058:	fc843703          	ld	a4,-56(s0)
    8000205c:	6785                	lui	a5,0x1
    8000205e:	17fd                	addi	a5,a5,-1
    80002060:	973e                	add	a4,a4,a5
    80002062:	77fd                	lui	a5,0xfffff
    80002064:	8ff9                	and	a5,a5,a4
    80002066:	fec42703          	lw	a4,-20(s0)
    8000206a:	4685                	li	a3,1
    8000206c:	863a                	mv	a2,a4
    8000206e:	85be                	mv	a1,a5
    80002070:	fd843503          	ld	a0,-40(s0)
    80002074:	00000097          	auipc	ra,0x0
    80002078:	cd0080e7          	jalr	-816(ra) # 80001d44 <uvmunmap>
  }

  return newsz;
    8000207c:	fc843783          	ld	a5,-56(s0)
}
    80002080:	853e                	mv	a0,a5
    80002082:	70e2                	ld	ra,56(sp)
    80002084:	7442                	ld	s0,48(sp)
    80002086:	6121                	addi	sp,sp,64
    80002088:	8082                	ret

000000008000208a <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    8000208a:	7139                	addi	sp,sp,-64
    8000208c:	fc06                	sd	ra,56(sp)
    8000208e:	f822                	sd	s0,48(sp)
    80002090:	0080                	addi	s0,sp,64
    80002092:	fca43423          	sd	a0,-56(s0)
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    80002096:	fe042623          	sw	zero,-20(s0)
    8000209a:	a88d                	j	8000210c <freewalk+0x82>
    pte_t pte = pagetable[i];
    8000209c:	fec42783          	lw	a5,-20(s0)
    800020a0:	078e                	slli	a5,a5,0x3
    800020a2:	fc843703          	ld	a4,-56(s0)
    800020a6:	97ba                	add	a5,a5,a4
    800020a8:	639c                	ld	a5,0(a5)
    800020aa:	fef43023          	sd	a5,-32(s0)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    800020ae:	fe043783          	ld	a5,-32(s0)
    800020b2:	8b85                	andi	a5,a5,1
    800020b4:	cb9d                	beqz	a5,800020ea <freewalk+0x60>
    800020b6:	fe043783          	ld	a5,-32(s0)
    800020ba:	8bb9                	andi	a5,a5,14
    800020bc:	e79d                	bnez	a5,800020ea <freewalk+0x60>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    800020be:	fe043783          	ld	a5,-32(s0)
    800020c2:	83a9                	srli	a5,a5,0xa
    800020c4:	07b2                	slli	a5,a5,0xc
    800020c6:	fcf43c23          	sd	a5,-40(s0)
      freewalk((pagetable_t)child);
    800020ca:	fd843783          	ld	a5,-40(s0)
    800020ce:	853e                	mv	a0,a5
    800020d0:	00000097          	auipc	ra,0x0
    800020d4:	fba080e7          	jalr	-70(ra) # 8000208a <freewalk>
      pagetable[i] = 0;
    800020d8:	fec42783          	lw	a5,-20(s0)
    800020dc:	078e                	slli	a5,a5,0x3
    800020de:	fc843703          	ld	a4,-56(s0)
    800020e2:	97ba                	add	a5,a5,a4
    800020e4:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0xffffffff7ffd6000>
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    800020e8:	a829                	j	80002102 <freewalk+0x78>
    } else if(pte & PTE_V){
    800020ea:	fe043783          	ld	a5,-32(s0)
    800020ee:	8b85                	andi	a5,a5,1
    800020f0:	cb89                	beqz	a5,80002102 <freewalk+0x78>
      panic("freewalk: leaf");
    800020f2:	00009517          	auipc	a0,0x9
    800020f6:	06e50513          	addi	a0,a0,110 # 8000b160 <etext+0x160>
    800020fa:	fffff097          	auipc	ra,0xfffff
    800020fe:	b84080e7          	jalr	-1148(ra) # 80000c7e <panic>
  for(int i = 0; i < 512; i++){
    80002102:	fec42783          	lw	a5,-20(s0)
    80002106:	2785                	addiw	a5,a5,1
    80002108:	fef42623          	sw	a5,-20(s0)
    8000210c:	fec42783          	lw	a5,-20(s0)
    80002110:	0007871b          	sext.w	a4,a5
    80002114:	1ff00793          	li	a5,511
    80002118:	f8e7d2e3          	bge	a5,a4,8000209c <freewalk+0x12>
    }
  }
  kfree((void*)pagetable);
    8000211c:	fc843503          	ld	a0,-56(s0)
    80002120:	fffff097          	auipc	ra,0xfffff
    80002124:	f56080e7          	jalr	-170(ra) # 80001076 <kfree>
}
    80002128:	0001                	nop
    8000212a:	70e2                	ld	ra,56(sp)
    8000212c:	7442                	ld	s0,48(sp)
    8000212e:	6121                	addi	sp,sp,64
    80002130:	8082                	ret

0000000080002132 <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    80002132:	1101                	addi	sp,sp,-32
    80002134:	ec06                	sd	ra,24(sp)
    80002136:	e822                	sd	s0,16(sp)
    80002138:	1000                	addi	s0,sp,32
    8000213a:	fea43423          	sd	a0,-24(s0)
    8000213e:	feb43023          	sd	a1,-32(s0)
  if(sz > 0)
    80002142:	fe043783          	ld	a5,-32(s0)
    80002146:	c385                	beqz	a5,80002166 <uvmfree+0x34>
    uvmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    80002148:	fe043703          	ld	a4,-32(s0)
    8000214c:	6785                	lui	a5,0x1
    8000214e:	17fd                	addi	a5,a5,-1
    80002150:	97ba                	add	a5,a5,a4
    80002152:	83b1                	srli	a5,a5,0xc
    80002154:	4685                	li	a3,1
    80002156:	863e                	mv	a2,a5
    80002158:	4581                	li	a1,0
    8000215a:	fe843503          	ld	a0,-24(s0)
    8000215e:	00000097          	auipc	ra,0x0
    80002162:	be6080e7          	jalr	-1050(ra) # 80001d44 <uvmunmap>
  freewalk(pagetable);
    80002166:	fe843503          	ld	a0,-24(s0)
    8000216a:	00000097          	auipc	ra,0x0
    8000216e:	f20080e7          	jalr	-224(ra) # 8000208a <freewalk>
}
    80002172:	0001                	nop
    80002174:	60e2                	ld	ra,24(sp)
    80002176:	6442                	ld	s0,16(sp)
    80002178:	6105                	addi	sp,sp,32
    8000217a:	8082                	ret

000000008000217c <uvmcopy>:
// physical memory.
// returns 0 on success, -1 on failure.
// frees any allocated pages on failure.
int
uvmcopy(pagetable_t old, pagetable_t new, uint64 sz)
{
    8000217c:	711d                	addi	sp,sp,-96
    8000217e:	ec86                	sd	ra,88(sp)
    80002180:	e8a2                	sd	s0,80(sp)
    80002182:	1080                	addi	s0,sp,96
    80002184:	faa43c23          	sd	a0,-72(s0)
    80002188:	fab43823          	sd	a1,-80(s0)
    8000218c:	fac43423          	sd	a2,-88(s0)
  pte_t *pte;
  uint64 pa, i;
  uint flags;
  char *mem;

  for(i = 0; i < sz; i += PGSIZE){
    80002190:	fe043423          	sd	zero,-24(s0)
    80002194:	a0d9                	j	8000225a <uvmcopy+0xde>
    if((pte = walk(old, i, 0)) == 0)
    80002196:	4601                	li	a2,0
    80002198:	fe843583          	ld	a1,-24(s0)
    8000219c:	fb843503          	ld	a0,-72(s0)
    800021a0:	00000097          	auipc	ra,0x0
    800021a4:	904080e7          	jalr	-1788(ra) # 80001aa4 <walk>
    800021a8:	fea43023          	sd	a0,-32(s0)
    800021ac:	fe043783          	ld	a5,-32(s0)
    800021b0:	eb89                	bnez	a5,800021c2 <uvmcopy+0x46>
      panic("uvmcopy: pte should exist");
    800021b2:	00009517          	auipc	a0,0x9
    800021b6:	fbe50513          	addi	a0,a0,-66 # 8000b170 <etext+0x170>
    800021ba:	fffff097          	auipc	ra,0xfffff
    800021be:	ac4080e7          	jalr	-1340(ra) # 80000c7e <panic>
    if((*pte & PTE_V) == 0)
    800021c2:	fe043783          	ld	a5,-32(s0)
    800021c6:	639c                	ld	a5,0(a5)
    800021c8:	8b85                	andi	a5,a5,1
    800021ca:	eb89                	bnez	a5,800021dc <uvmcopy+0x60>
      panic("uvmcopy: page not present");
    800021cc:	00009517          	auipc	a0,0x9
    800021d0:	fc450513          	addi	a0,a0,-60 # 8000b190 <etext+0x190>
    800021d4:	fffff097          	auipc	ra,0xfffff
    800021d8:	aaa080e7          	jalr	-1366(ra) # 80000c7e <panic>
    pa = PTE2PA(*pte);
    800021dc:	fe043783          	ld	a5,-32(s0)
    800021e0:	639c                	ld	a5,0(a5)
    800021e2:	83a9                	srli	a5,a5,0xa
    800021e4:	07b2                	slli	a5,a5,0xc
    800021e6:	fcf43c23          	sd	a5,-40(s0)
    flags = PTE_FLAGS(*pte);
    800021ea:	fe043783          	ld	a5,-32(s0)
    800021ee:	639c                	ld	a5,0(a5)
    800021f0:	2781                	sext.w	a5,a5
    800021f2:	3ff7f793          	andi	a5,a5,1023
    800021f6:	fcf42a23          	sw	a5,-44(s0)
    if((mem = kalloc()) == 0)
    800021fa:	fffff097          	auipc	ra,0xfffff
    800021fe:	f20080e7          	jalr	-224(ra) # 8000111a <kalloc>
    80002202:	fca43423          	sd	a0,-56(s0)
    80002206:	fc843783          	ld	a5,-56(s0)
    8000220a:	c3a5                	beqz	a5,8000226a <uvmcopy+0xee>
      goto err;
    memmove(mem, (char*)pa, PGSIZE);
    8000220c:	fd843783          	ld	a5,-40(s0)
    80002210:	6605                	lui	a2,0x1
    80002212:	85be                	mv	a1,a5
    80002214:	fc843503          	ld	a0,-56(s0)
    80002218:	fffff097          	auipc	ra,0xfffff
    8000221c:	30e080e7          	jalr	782(ra) # 80001526 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0){
    80002220:	fc843783          	ld	a5,-56(s0)
    80002224:	fd442703          	lw	a4,-44(s0)
    80002228:	86be                	mv	a3,a5
    8000222a:	6605                	lui	a2,0x1
    8000222c:	fe843583          	ld	a1,-24(s0)
    80002230:	fb043503          	ld	a0,-80(s0)
    80002234:	00000097          	auipc	ra,0x0
    80002238:	a32080e7          	jalr	-1486(ra) # 80001c66 <mappages>
    8000223c:	87aa                	mv	a5,a0
    8000223e:	cb81                	beqz	a5,8000224e <uvmcopy+0xd2>
      kfree(mem);
    80002240:	fc843503          	ld	a0,-56(s0)
    80002244:	fffff097          	auipc	ra,0xfffff
    80002248:	e32080e7          	jalr	-462(ra) # 80001076 <kfree>
      goto err;
    8000224c:	a005                	j	8000226c <uvmcopy+0xf0>
  for(i = 0; i < sz; i += PGSIZE){
    8000224e:	fe843703          	ld	a4,-24(s0)
    80002252:	6785                	lui	a5,0x1
    80002254:	97ba                	add	a5,a5,a4
    80002256:	fef43423          	sd	a5,-24(s0)
    8000225a:	fe843703          	ld	a4,-24(s0)
    8000225e:	fa843783          	ld	a5,-88(s0)
    80002262:	f2f76ae3          	bltu	a4,a5,80002196 <uvmcopy+0x1a>
    }
  }
  return 0;
    80002266:	4781                	li	a5,0
    80002268:	a839                	j	80002286 <uvmcopy+0x10a>
      goto err;
    8000226a:	0001                	nop

 err:
  uvmunmap(new, 0, i / PGSIZE, 1);
    8000226c:	fe843783          	ld	a5,-24(s0)
    80002270:	83b1                	srli	a5,a5,0xc
    80002272:	4685                	li	a3,1
    80002274:	863e                	mv	a2,a5
    80002276:	4581                	li	a1,0
    80002278:	fb043503          	ld	a0,-80(s0)
    8000227c:	00000097          	auipc	ra,0x0
    80002280:	ac8080e7          	jalr	-1336(ra) # 80001d44 <uvmunmap>
  return -1;
    80002284:	57fd                	li	a5,-1
}
    80002286:	853e                	mv	a0,a5
    80002288:	60e6                	ld	ra,88(sp)
    8000228a:	6446                	ld	s0,80(sp)
    8000228c:	6125                	addi	sp,sp,96
    8000228e:	8082                	ret

0000000080002290 <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    80002290:	7179                	addi	sp,sp,-48
    80002292:	f406                	sd	ra,40(sp)
    80002294:	f022                	sd	s0,32(sp)
    80002296:	1800                	addi	s0,sp,48
    80002298:	fca43c23          	sd	a0,-40(s0)
    8000229c:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    800022a0:	4601                	li	a2,0
    800022a2:	fd043583          	ld	a1,-48(s0)
    800022a6:	fd843503          	ld	a0,-40(s0)
    800022aa:	fffff097          	auipc	ra,0xfffff
    800022ae:	7fa080e7          	jalr	2042(ra) # 80001aa4 <walk>
    800022b2:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    800022b6:	fe843783          	ld	a5,-24(s0)
    800022ba:	eb89                	bnez	a5,800022cc <uvmclear+0x3c>
    panic("uvmclear");
    800022bc:	00009517          	auipc	a0,0x9
    800022c0:	ef450513          	addi	a0,a0,-268 # 8000b1b0 <etext+0x1b0>
    800022c4:	fffff097          	auipc	ra,0xfffff
    800022c8:	9ba080e7          	jalr	-1606(ra) # 80000c7e <panic>
  *pte &= ~PTE_U;
    800022cc:	fe843783          	ld	a5,-24(s0)
    800022d0:	639c                	ld	a5,0(a5)
    800022d2:	fef7f713          	andi	a4,a5,-17
    800022d6:	fe843783          	ld	a5,-24(s0)
    800022da:	e398                	sd	a4,0(a5)
}
    800022dc:	0001                	nop
    800022de:	70a2                	ld	ra,40(sp)
    800022e0:	7402                	ld	s0,32(sp)
    800022e2:	6145                	addi	sp,sp,48
    800022e4:	8082                	ret

00000000800022e6 <copyout>:
// Copy from kernel to user.
// Copy len bytes from src to virtual address dstva in a given page table.
// Return 0 on success, -1 on error.
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
    800022e6:	715d                	addi	sp,sp,-80
    800022e8:	e486                	sd	ra,72(sp)
    800022ea:	e0a2                	sd	s0,64(sp)
    800022ec:	0880                	addi	s0,sp,80
    800022ee:	fca43423          	sd	a0,-56(s0)
    800022f2:	fcb43023          	sd	a1,-64(s0)
    800022f6:	fac43c23          	sd	a2,-72(s0)
    800022fa:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800022fe:	a055                	j	800023a2 <copyout+0xbc>
    va0 = PGROUNDDOWN(dstva);
    80002300:	fc043703          	ld	a4,-64(s0)
    80002304:	77fd                	lui	a5,0xfffff
    80002306:	8ff9                	and	a5,a5,a4
    80002308:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    8000230c:	fe043583          	ld	a1,-32(s0)
    80002310:	fc843503          	ld	a0,-56(s0)
    80002314:	00000097          	auipc	ra,0x0
    80002318:	880080e7          	jalr	-1920(ra) # 80001b94 <walkaddr>
    8000231c:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    80002320:	fd843783          	ld	a5,-40(s0)
    80002324:	e399                	bnez	a5,8000232a <copyout+0x44>
      return -1;
    80002326:	57fd                	li	a5,-1
    80002328:	a049                	j	800023aa <copyout+0xc4>
    n = PGSIZE - (dstva - va0);
    8000232a:	fe043703          	ld	a4,-32(s0)
    8000232e:	fc043783          	ld	a5,-64(s0)
    80002332:	8f1d                	sub	a4,a4,a5
    80002334:	6785                	lui	a5,0x1
    80002336:	97ba                	add	a5,a5,a4
    80002338:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    8000233c:	fe843703          	ld	a4,-24(s0)
    80002340:	fb043783          	ld	a5,-80(s0)
    80002344:	00e7f663          	bgeu	a5,a4,80002350 <copyout+0x6a>
      n = len;
    80002348:	fb043783          	ld	a5,-80(s0)
    8000234c:	fef43423          	sd	a5,-24(s0)
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    80002350:	fc043703          	ld	a4,-64(s0)
    80002354:	fe043783          	ld	a5,-32(s0)
    80002358:	8f1d                	sub	a4,a4,a5
    8000235a:	fd843783          	ld	a5,-40(s0)
    8000235e:	97ba                	add	a5,a5,a4
    80002360:	873e                	mv	a4,a5
    80002362:	fe843783          	ld	a5,-24(s0)
    80002366:	2781                	sext.w	a5,a5
    80002368:	863e                	mv	a2,a5
    8000236a:	fb843583          	ld	a1,-72(s0)
    8000236e:	853a                	mv	a0,a4
    80002370:	fffff097          	auipc	ra,0xfffff
    80002374:	1b6080e7          	jalr	438(ra) # 80001526 <memmove>

    len -= n;
    80002378:	fb043703          	ld	a4,-80(s0)
    8000237c:	fe843783          	ld	a5,-24(s0)
    80002380:	40f707b3          	sub	a5,a4,a5
    80002384:	faf43823          	sd	a5,-80(s0)
    src += n;
    80002388:	fb843703          	ld	a4,-72(s0)
    8000238c:	fe843783          	ld	a5,-24(s0)
    80002390:	97ba                	add	a5,a5,a4
    80002392:	faf43c23          	sd	a5,-72(s0)
    dstva = va0 + PGSIZE;
    80002396:	fe043703          	ld	a4,-32(s0)
    8000239a:	6785                	lui	a5,0x1
    8000239c:	97ba                	add	a5,a5,a4
    8000239e:	fcf43023          	sd	a5,-64(s0)
  while(len > 0){
    800023a2:	fb043783          	ld	a5,-80(s0)
    800023a6:	ffa9                	bnez	a5,80002300 <copyout+0x1a>
  }
  return 0;
    800023a8:	4781                	li	a5,0
}
    800023aa:	853e                	mv	a0,a5
    800023ac:	60a6                	ld	ra,72(sp)
    800023ae:	6406                	ld	s0,64(sp)
    800023b0:	6161                	addi	sp,sp,80
    800023b2:	8082                	ret

00000000800023b4 <copyin>:
// Copy from user to kernel.
// Copy len bytes to dst from virtual address srcva in a given page table.
// Return 0 on success, -1 on error.
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
    800023b4:	715d                	addi	sp,sp,-80
    800023b6:	e486                	sd	ra,72(sp)
    800023b8:	e0a2                	sd	s0,64(sp)
    800023ba:	0880                	addi	s0,sp,80
    800023bc:	fca43423          	sd	a0,-56(s0)
    800023c0:	fcb43023          	sd	a1,-64(s0)
    800023c4:	fac43c23          	sd	a2,-72(s0)
    800023c8:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800023cc:	a055                	j	80002470 <copyin+0xbc>
    va0 = PGROUNDDOWN(srcva);
    800023ce:	fb843703          	ld	a4,-72(s0)
    800023d2:	77fd                	lui	a5,0xfffff
    800023d4:	8ff9                	and	a5,a5,a4
    800023d6:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    800023da:	fe043583          	ld	a1,-32(s0)
    800023de:	fc843503          	ld	a0,-56(s0)
    800023e2:	fffff097          	auipc	ra,0xfffff
    800023e6:	7b2080e7          	jalr	1970(ra) # 80001b94 <walkaddr>
    800023ea:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    800023ee:	fd843783          	ld	a5,-40(s0)
    800023f2:	e399                	bnez	a5,800023f8 <copyin+0x44>
      return -1;
    800023f4:	57fd                	li	a5,-1
    800023f6:	a049                	j	80002478 <copyin+0xc4>
    n = PGSIZE - (srcva - va0);
    800023f8:	fe043703          	ld	a4,-32(s0)
    800023fc:	fb843783          	ld	a5,-72(s0)
    80002400:	8f1d                	sub	a4,a4,a5
    80002402:	6785                	lui	a5,0x1
    80002404:	97ba                	add	a5,a5,a4
    80002406:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    8000240a:	fe843703          	ld	a4,-24(s0)
    8000240e:	fb043783          	ld	a5,-80(s0)
    80002412:	00e7f663          	bgeu	a5,a4,8000241e <copyin+0x6a>
      n = len;
    80002416:	fb043783          	ld	a5,-80(s0)
    8000241a:	fef43423          	sd	a5,-24(s0)
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    8000241e:	fb843703          	ld	a4,-72(s0)
    80002422:	fe043783          	ld	a5,-32(s0)
    80002426:	8f1d                	sub	a4,a4,a5
    80002428:	fd843783          	ld	a5,-40(s0)
    8000242c:	97ba                	add	a5,a5,a4
    8000242e:	873e                	mv	a4,a5
    80002430:	fe843783          	ld	a5,-24(s0)
    80002434:	2781                	sext.w	a5,a5
    80002436:	863e                	mv	a2,a5
    80002438:	85ba                	mv	a1,a4
    8000243a:	fc043503          	ld	a0,-64(s0)
    8000243e:	fffff097          	auipc	ra,0xfffff
    80002442:	0e8080e7          	jalr	232(ra) # 80001526 <memmove>

    len -= n;
    80002446:	fb043703          	ld	a4,-80(s0)
    8000244a:	fe843783          	ld	a5,-24(s0)
    8000244e:	40f707b3          	sub	a5,a4,a5
    80002452:	faf43823          	sd	a5,-80(s0)
    dst += n;
    80002456:	fc043703          	ld	a4,-64(s0)
    8000245a:	fe843783          	ld	a5,-24(s0)
    8000245e:	97ba                	add	a5,a5,a4
    80002460:	fcf43023          	sd	a5,-64(s0)
    srcva = va0 + PGSIZE;
    80002464:	fe043703          	ld	a4,-32(s0)
    80002468:	6785                	lui	a5,0x1
    8000246a:	97ba                	add	a5,a5,a4
    8000246c:	faf43c23          	sd	a5,-72(s0)
  while(len > 0){
    80002470:	fb043783          	ld	a5,-80(s0)
    80002474:	ffa9                	bnez	a5,800023ce <copyin+0x1a>
  }
  return 0;
    80002476:	4781                	li	a5,0
}
    80002478:	853e                	mv	a0,a5
    8000247a:	60a6                	ld	ra,72(sp)
    8000247c:	6406                	ld	s0,64(sp)
    8000247e:	6161                	addi	sp,sp,80
    80002480:	8082                	ret

0000000080002482 <copyinstr>:
// Copy bytes to dst from virtual address srcva in a given page table,
// until a '\0', or max.
// Return 0 on success, -1 on error.
int
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
    80002482:	711d                	addi	sp,sp,-96
    80002484:	ec86                	sd	ra,88(sp)
    80002486:	e8a2                	sd	s0,80(sp)
    80002488:	1080                	addi	s0,sp,96
    8000248a:	faa43c23          	sd	a0,-72(s0)
    8000248e:	fab43823          	sd	a1,-80(s0)
    80002492:	fac43423          	sd	a2,-88(s0)
    80002496:	fad43023          	sd	a3,-96(s0)
  uint64 n, va0, pa0;
  int got_null = 0;
    8000249a:	fe042223          	sw	zero,-28(s0)

  while(got_null == 0 && max > 0){
    8000249e:	a0f1                	j	8000256a <copyinstr+0xe8>
    va0 = PGROUNDDOWN(srcva);
    800024a0:	fa843703          	ld	a4,-88(s0)
    800024a4:	77fd                	lui	a5,0xfffff
    800024a6:	8ff9                	and	a5,a5,a4
    800024a8:	fcf43823          	sd	a5,-48(s0)
    pa0 = walkaddr(pagetable, va0);
    800024ac:	fd043583          	ld	a1,-48(s0)
    800024b0:	fb843503          	ld	a0,-72(s0)
    800024b4:	fffff097          	auipc	ra,0xfffff
    800024b8:	6e0080e7          	jalr	1760(ra) # 80001b94 <walkaddr>
    800024bc:	fca43423          	sd	a0,-56(s0)
    if(pa0 == 0)
    800024c0:	fc843783          	ld	a5,-56(s0)
    800024c4:	e399                	bnez	a5,800024ca <copyinstr+0x48>
      return -1;
    800024c6:	57fd                	li	a5,-1
    800024c8:	a87d                	j	80002586 <copyinstr+0x104>
    n = PGSIZE - (srcva - va0);
    800024ca:	fd043703          	ld	a4,-48(s0)
    800024ce:	fa843783          	ld	a5,-88(s0)
    800024d2:	8f1d                	sub	a4,a4,a5
    800024d4:	6785                	lui	a5,0x1
    800024d6:	97ba                	add	a5,a5,a4
    800024d8:	fef43423          	sd	a5,-24(s0)
    if(n > max)
    800024dc:	fe843703          	ld	a4,-24(s0)
    800024e0:	fa043783          	ld	a5,-96(s0)
    800024e4:	00e7f663          	bgeu	a5,a4,800024f0 <copyinstr+0x6e>
      n = max;
    800024e8:	fa043783          	ld	a5,-96(s0)
    800024ec:	fef43423          	sd	a5,-24(s0)

    char *p = (char *) (pa0 + (srcva - va0));
    800024f0:	fa843703          	ld	a4,-88(s0)
    800024f4:	fd043783          	ld	a5,-48(s0)
    800024f8:	8f1d                	sub	a4,a4,a5
    800024fa:	fc843783          	ld	a5,-56(s0)
    800024fe:	97ba                	add	a5,a5,a4
    80002500:	fcf43c23          	sd	a5,-40(s0)
    while(n > 0){
    80002504:	a891                	j	80002558 <copyinstr+0xd6>
      if(*p == '\0'){
    80002506:	fd843783          	ld	a5,-40(s0)
    8000250a:	0007c783          	lbu	a5,0(a5) # 1000 <_entry-0x7ffff000>
    8000250e:	eb89                	bnez	a5,80002520 <copyinstr+0x9e>
        *dst = '\0';
    80002510:	fb043783          	ld	a5,-80(s0)
    80002514:	00078023          	sb	zero,0(a5)
        got_null = 1;
    80002518:	4785                	li	a5,1
    8000251a:	fef42223          	sw	a5,-28(s0)
        break;
    8000251e:	a081                	j	8000255e <copyinstr+0xdc>
      } else {
        *dst = *p;
    80002520:	fd843783          	ld	a5,-40(s0)
    80002524:	0007c703          	lbu	a4,0(a5)
    80002528:	fb043783          	ld	a5,-80(s0)
    8000252c:	00e78023          	sb	a4,0(a5)
      }
      --n;
    80002530:	fe843783          	ld	a5,-24(s0)
    80002534:	17fd                	addi	a5,a5,-1
    80002536:	fef43423          	sd	a5,-24(s0)
      --max;
    8000253a:	fa043783          	ld	a5,-96(s0)
    8000253e:	17fd                	addi	a5,a5,-1
    80002540:	faf43023          	sd	a5,-96(s0)
      p++;
    80002544:	fd843783          	ld	a5,-40(s0)
    80002548:	0785                	addi	a5,a5,1
    8000254a:	fcf43c23          	sd	a5,-40(s0)
      dst++;
    8000254e:	fb043783          	ld	a5,-80(s0)
    80002552:	0785                	addi	a5,a5,1
    80002554:	faf43823          	sd	a5,-80(s0)
    while(n > 0){
    80002558:	fe843783          	ld	a5,-24(s0)
    8000255c:	f7cd                	bnez	a5,80002506 <copyinstr+0x84>
    }

    srcva = va0 + PGSIZE;
    8000255e:	fd043703          	ld	a4,-48(s0)
    80002562:	6785                	lui	a5,0x1
    80002564:	97ba                	add	a5,a5,a4
    80002566:	faf43423          	sd	a5,-88(s0)
  while(got_null == 0 && max > 0){
    8000256a:	fe442783          	lw	a5,-28(s0)
    8000256e:	2781                	sext.w	a5,a5
    80002570:	e781                	bnez	a5,80002578 <copyinstr+0xf6>
    80002572:	fa043783          	ld	a5,-96(s0)
    80002576:	f78d                	bnez	a5,800024a0 <copyinstr+0x1e>
  }
  if(got_null){
    80002578:	fe442783          	lw	a5,-28(s0)
    8000257c:	2781                	sext.w	a5,a5
    8000257e:	c399                	beqz	a5,80002584 <copyinstr+0x102>
    return 0;
    80002580:	4781                	li	a5,0
    80002582:	a011                	j	80002586 <copyinstr+0x104>
  } else {
    return -1;
    80002584:	57fd                	li	a5,-1
  }
}
    80002586:	853e                	mv	a0,a5
    80002588:	60e6                	ld	ra,88(sp)
    8000258a:	6446                	ld	s0,80(sp)
    8000258c:	6125                	addi	sp,sp,96
    8000258e:	8082                	ret

0000000080002590 <r_sstatus>:
{
    80002590:	1101                	addi	sp,sp,-32
    80002592:	ec22                	sd	s0,24(sp)
    80002594:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80002596:	100027f3          	csrr	a5,sstatus
    8000259a:	fef43423          	sd	a5,-24(s0)
  return x;
    8000259e:	fe843783          	ld	a5,-24(s0)
}
    800025a2:	853e                	mv	a0,a5
    800025a4:	6462                	ld	s0,24(sp)
    800025a6:	6105                	addi	sp,sp,32
    800025a8:	8082                	ret

00000000800025aa <w_sstatus>:
{
    800025aa:	1101                	addi	sp,sp,-32
    800025ac:	ec22                	sd	s0,24(sp)
    800025ae:	1000                	addi	s0,sp,32
    800025b0:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800025b4:	fe843783          	ld	a5,-24(s0)
    800025b8:	10079073          	csrw	sstatus,a5
}
    800025bc:	0001                	nop
    800025be:	6462                	ld	s0,24(sp)
    800025c0:	6105                	addi	sp,sp,32
    800025c2:	8082                	ret

00000000800025c4 <intr_on>:
{
    800025c4:	1141                	addi	sp,sp,-16
    800025c6:	e406                	sd	ra,8(sp)
    800025c8:	e022                	sd	s0,0(sp)
    800025ca:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800025cc:	00000097          	auipc	ra,0x0
    800025d0:	fc4080e7          	jalr	-60(ra) # 80002590 <r_sstatus>
    800025d4:	87aa                	mv	a5,a0
    800025d6:	0027e793          	ori	a5,a5,2
    800025da:	853e                	mv	a0,a5
    800025dc:	00000097          	auipc	ra,0x0
    800025e0:	fce080e7          	jalr	-50(ra) # 800025aa <w_sstatus>
}
    800025e4:	0001                	nop
    800025e6:	60a2                	ld	ra,8(sp)
    800025e8:	6402                	ld	s0,0(sp)
    800025ea:	0141                	addi	sp,sp,16
    800025ec:	8082                	ret

00000000800025ee <intr_get>:
{
    800025ee:	1101                	addi	sp,sp,-32
    800025f0:	ec06                	sd	ra,24(sp)
    800025f2:	e822                	sd	s0,16(sp)
    800025f4:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    800025f6:	00000097          	auipc	ra,0x0
    800025fa:	f9a080e7          	jalr	-102(ra) # 80002590 <r_sstatus>
    800025fe:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80002602:	fe843783          	ld	a5,-24(s0)
    80002606:	8b89                	andi	a5,a5,2
    80002608:	00f037b3          	snez	a5,a5
    8000260c:	0ff7f793          	andi	a5,a5,255
    80002610:	2781                	sext.w	a5,a5
}
    80002612:	853e                	mv	a0,a5
    80002614:	60e2                	ld	ra,24(sp)
    80002616:	6442                	ld	s0,16(sp)
    80002618:	6105                	addi	sp,sp,32
    8000261a:	8082                	ret

000000008000261c <r_tp>:
{
    8000261c:	1101                	addi	sp,sp,-32
    8000261e:	ec22                	sd	s0,24(sp)
    80002620:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80002622:	8792                	mv	a5,tp
    80002624:	fef43423          	sd	a5,-24(s0)
  return x;
    80002628:	fe843783          	ld	a5,-24(s0)
}
    8000262c:	853e                	mv	a0,a5
    8000262e:	6462                	ld	s0,24(sp)
    80002630:	6105                	addi	sp,sp,32
    80002632:	8082                	ret

0000000080002634 <proc_mapstacks>:

// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void
proc_mapstacks(pagetable_t kpgtbl) {
    80002634:	7139                	addi	sp,sp,-64
    80002636:	fc06                	sd	ra,56(sp)
    80002638:	f822                	sd	s0,48(sp)
    8000263a:	0080                	addi	s0,sp,64
    8000263c:	fca43423          	sd	a0,-56(s0)
  struct proc *p;
  
  for(p = proc; p < &proc[NPROC]; p++) {
    80002640:	00012797          	auipc	a5,0x12
    80002644:	09878793          	addi	a5,a5,152 # 800146d8 <proc>
    80002648:	fef43423          	sd	a5,-24(s0)
    8000264c:	a061                	j	800026d4 <proc_mapstacks+0xa0>
    char *pa = kalloc();
    8000264e:	fffff097          	auipc	ra,0xfffff
    80002652:	acc080e7          	jalr	-1332(ra) # 8000111a <kalloc>
    80002656:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    8000265a:	fe043783          	ld	a5,-32(s0)
    8000265e:	eb89                	bnez	a5,80002670 <proc_mapstacks+0x3c>
      panic("kalloc");
    80002660:	00009517          	auipc	a0,0x9
    80002664:	b6050513          	addi	a0,a0,-1184 # 8000b1c0 <etext+0x1c0>
    80002668:	ffffe097          	auipc	ra,0xffffe
    8000266c:	616080e7          	jalr	1558(ra) # 80000c7e <panic>
    uint64 va = KSTACK((int) (p - proc));
    80002670:	fe843703          	ld	a4,-24(s0)
    80002674:	00012797          	auipc	a5,0x12
    80002678:	06478793          	addi	a5,a5,100 # 800146d8 <proc>
    8000267c:	40f707b3          	sub	a5,a4,a5
    80002680:	4037d713          	srai	a4,a5,0x3
    80002684:	00009797          	auipc	a5,0x9
    80002688:	c5478793          	addi	a5,a5,-940 # 8000b2d8 <etext+0x2d8>
    8000268c:	639c                	ld	a5,0(a5)
    8000268e:	02f707b3          	mul	a5,a4,a5
    80002692:	2781                	sext.w	a5,a5
    80002694:	2785                	addiw	a5,a5,1
    80002696:	2781                	sext.w	a5,a5
    80002698:	00d7979b          	slliw	a5,a5,0xd
    8000269c:	2781                	sext.w	a5,a5
    8000269e:	873e                	mv	a4,a5
    800026a0:	040007b7          	lui	a5,0x4000
    800026a4:	17fd                	addi	a5,a5,-1
    800026a6:	07b2                	slli	a5,a5,0xc
    800026a8:	8f99                	sub	a5,a5,a4
    800026aa:	fcf43c23          	sd	a5,-40(s0)
    kvmmap(kpgtbl, va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
    800026ae:	fe043783          	ld	a5,-32(s0)
    800026b2:	4719                	li	a4,6
    800026b4:	6685                	lui	a3,0x1
    800026b6:	863e                	mv	a2,a5
    800026b8:	fd843583          	ld	a1,-40(s0)
    800026bc:	fc843503          	ld	a0,-56(s0)
    800026c0:	fffff097          	auipc	ra,0xfffff
    800026c4:	54c080e7          	jalr	1356(ra) # 80001c0c <kvmmap>
  for(p = proc; p < &proc[NPROC]; p++) {
    800026c8:	fe843783          	ld	a5,-24(s0)
    800026cc:	16878793          	addi	a5,a5,360 # 4000168 <_entry-0x7bfffe98>
    800026d0:	fef43423          	sd	a5,-24(s0)
    800026d4:	fe843703          	ld	a4,-24(s0)
    800026d8:	00018797          	auipc	a5,0x18
    800026dc:	a0078793          	addi	a5,a5,-1536 # 8001a0d8 <pid_lock>
    800026e0:	f6f767e3          	bltu	a4,a5,8000264e <proc_mapstacks+0x1a>
  }
}
    800026e4:	0001                	nop
    800026e6:	0001                	nop
    800026e8:	70e2                	ld	ra,56(sp)
    800026ea:	7442                	ld	s0,48(sp)
    800026ec:	6121                	addi	sp,sp,64
    800026ee:	8082                	ret

00000000800026f0 <procinit>:

// initialize the proc table at boot time.
void
procinit(void)
{
    800026f0:	1101                	addi	sp,sp,-32
    800026f2:	ec06                	sd	ra,24(sp)
    800026f4:	e822                	sd	s0,16(sp)
    800026f6:	1000                	addi	s0,sp,32
  struct proc *p;
  
  initlock(&pid_lock, "nextpid");
    800026f8:	00009597          	auipc	a1,0x9
    800026fc:	ad058593          	addi	a1,a1,-1328 # 8000b1c8 <etext+0x1c8>
    80002700:	00018517          	auipc	a0,0x18
    80002704:	9d850513          	addi	a0,a0,-1576 # 8001a0d8 <pid_lock>
    80002708:	fffff097          	auipc	ra,0xfffff
    8000270c:	b36080e7          	jalr	-1226(ra) # 8000123e <initlock>
  initlock(&wait_lock, "wait_lock");
    80002710:	00009597          	auipc	a1,0x9
    80002714:	ac058593          	addi	a1,a1,-1344 # 8000b1d0 <etext+0x1d0>
    80002718:	00018517          	auipc	a0,0x18
    8000271c:	9d850513          	addi	a0,a0,-1576 # 8001a0f0 <wait_lock>
    80002720:	fffff097          	auipc	ra,0xfffff
    80002724:	b1e080e7          	jalr	-1250(ra) # 8000123e <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002728:	00012797          	auipc	a5,0x12
    8000272c:	fb078793          	addi	a5,a5,-80 # 800146d8 <proc>
    80002730:	fef43423          	sd	a5,-24(s0)
    80002734:	a09d                	j	8000279a <procinit+0xaa>
      initlock(&p->lock, "proc");
    80002736:	fe843783          	ld	a5,-24(s0)
    8000273a:	00009597          	auipc	a1,0x9
    8000273e:	aa658593          	addi	a1,a1,-1370 # 8000b1e0 <etext+0x1e0>
    80002742:	853e                	mv	a0,a5
    80002744:	fffff097          	auipc	ra,0xfffff
    80002748:	afa080e7          	jalr	-1286(ra) # 8000123e <initlock>
      p->kstack = KSTACK((int) (p - proc));
    8000274c:	fe843703          	ld	a4,-24(s0)
    80002750:	00012797          	auipc	a5,0x12
    80002754:	f8878793          	addi	a5,a5,-120 # 800146d8 <proc>
    80002758:	40f707b3          	sub	a5,a4,a5
    8000275c:	4037d713          	srai	a4,a5,0x3
    80002760:	00009797          	auipc	a5,0x9
    80002764:	b7878793          	addi	a5,a5,-1160 # 8000b2d8 <etext+0x2d8>
    80002768:	639c                	ld	a5,0(a5)
    8000276a:	02f707b3          	mul	a5,a4,a5
    8000276e:	2781                	sext.w	a5,a5
    80002770:	2785                	addiw	a5,a5,1
    80002772:	2781                	sext.w	a5,a5
    80002774:	00d7979b          	slliw	a5,a5,0xd
    80002778:	2781                	sext.w	a5,a5
    8000277a:	873e                	mv	a4,a5
    8000277c:	040007b7          	lui	a5,0x4000
    80002780:	17fd                	addi	a5,a5,-1
    80002782:	07b2                	slli	a5,a5,0xc
    80002784:	8f99                	sub	a5,a5,a4
    80002786:	873e                	mv	a4,a5
    80002788:	fe843783          	ld	a5,-24(s0)
    8000278c:	e3b8                	sd	a4,64(a5)
  for(p = proc; p < &proc[NPROC]; p++) {
    8000278e:	fe843783          	ld	a5,-24(s0)
    80002792:	16878793          	addi	a5,a5,360 # 4000168 <_entry-0x7bfffe98>
    80002796:	fef43423          	sd	a5,-24(s0)
    8000279a:	fe843703          	ld	a4,-24(s0)
    8000279e:	00018797          	auipc	a5,0x18
    800027a2:	93a78793          	addi	a5,a5,-1734 # 8001a0d8 <pid_lock>
    800027a6:	f8f768e3          	bltu	a4,a5,80002736 <procinit+0x46>
  }
}
    800027aa:	0001                	nop
    800027ac:	0001                	nop
    800027ae:	60e2                	ld	ra,24(sp)
    800027b0:	6442                	ld	s0,16(sp)
    800027b2:	6105                	addi	sp,sp,32
    800027b4:	8082                	ret

00000000800027b6 <cpuid>:
// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
    800027b6:	1101                	addi	sp,sp,-32
    800027b8:	ec06                	sd	ra,24(sp)
    800027ba:	e822                	sd	s0,16(sp)
    800027bc:	1000                	addi	s0,sp,32
  int id = r_tp();
    800027be:	00000097          	auipc	ra,0x0
    800027c2:	e5e080e7          	jalr	-418(ra) # 8000261c <r_tp>
    800027c6:	87aa                	mv	a5,a0
    800027c8:	fef42623          	sw	a5,-20(s0)
  return id;
    800027cc:	fec42783          	lw	a5,-20(s0)
}
    800027d0:	853e                	mv	a0,a5
    800027d2:	60e2                	ld	ra,24(sp)
    800027d4:	6442                	ld	s0,16(sp)
    800027d6:	6105                	addi	sp,sp,32
    800027d8:	8082                	ret

00000000800027da <mycpu>:

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*
mycpu(void) {
    800027da:	1101                	addi	sp,sp,-32
    800027dc:	ec06                	sd	ra,24(sp)
    800027de:	e822                	sd	s0,16(sp)
    800027e0:	1000                	addi	s0,sp,32
  int id = cpuid();
    800027e2:	00000097          	auipc	ra,0x0
    800027e6:	fd4080e7          	jalr	-44(ra) # 800027b6 <cpuid>
    800027ea:	87aa                	mv	a5,a0
    800027ec:	fef42623          	sw	a5,-20(s0)
  struct cpu *c = &cpus[id];
    800027f0:	fec42703          	lw	a4,-20(s0)
    800027f4:	87ba                	mv	a5,a4
    800027f6:	0792                	slli	a5,a5,0x4
    800027f8:	97ba                	add	a5,a5,a4
    800027fa:	078e                	slli	a5,a5,0x3
    800027fc:	00012717          	auipc	a4,0x12
    80002800:	a9c70713          	addi	a4,a4,-1380 # 80014298 <cpus>
    80002804:	97ba                	add	a5,a5,a4
    80002806:	fef43023          	sd	a5,-32(s0)
  return c;
    8000280a:	fe043783          	ld	a5,-32(s0)
}
    8000280e:	853e                	mv	a0,a5
    80002810:	60e2                	ld	ra,24(sp)
    80002812:	6442                	ld	s0,16(sp)
    80002814:	6105                	addi	sp,sp,32
    80002816:	8082                	ret

0000000080002818 <myproc>:

// Return the current struct proc *, or zero if none.
struct proc*
myproc(void) {
    80002818:	1101                	addi	sp,sp,-32
    8000281a:	ec06                	sd	ra,24(sp)
    8000281c:	e822                	sd	s0,16(sp)
    8000281e:	1000                	addi	s0,sp,32
  push_off();
    80002820:	fffff097          	auipc	ra,0xfffff
    80002824:	b4c080e7          	jalr	-1204(ra) # 8000136c <push_off>
  struct cpu *c = mycpu();
    80002828:	00000097          	auipc	ra,0x0
    8000282c:	fb2080e7          	jalr	-78(ra) # 800027da <mycpu>
    80002830:	fea43423          	sd	a0,-24(s0)
  struct proc *p = c->proc;
    80002834:	fe843783          	ld	a5,-24(s0)
    80002838:	639c                	ld	a5,0(a5)
    8000283a:	fef43023          	sd	a5,-32(s0)
  pop_off();
    8000283e:	fffff097          	auipc	ra,0xfffff
    80002842:	b86080e7          	jalr	-1146(ra) # 800013c4 <pop_off>
  return p;
    80002846:	fe043783          	ld	a5,-32(s0)
}
    8000284a:	853e                	mv	a0,a5
    8000284c:	60e2                	ld	ra,24(sp)
    8000284e:	6442                	ld	s0,16(sp)
    80002850:	6105                	addi	sp,sp,32
    80002852:	8082                	ret

0000000080002854 <allocpid>:

int
allocpid() {
    80002854:	1101                	addi	sp,sp,-32
    80002856:	ec06                	sd	ra,24(sp)
    80002858:	e822                	sd	s0,16(sp)
    8000285a:	1000                	addi	s0,sp,32
  int pid;
  
  acquire(&pid_lock);
    8000285c:	00018517          	auipc	a0,0x18
    80002860:	87c50513          	addi	a0,a0,-1924 # 8001a0d8 <pid_lock>
    80002864:	fffff097          	auipc	ra,0xfffff
    80002868:	a0a080e7          	jalr	-1526(ra) # 8000126e <acquire>
  pid = nextpid;
    8000286c:	00009797          	auipc	a5,0x9
    80002870:	f0478793          	addi	a5,a5,-252 # 8000b770 <nextpid>
    80002874:	439c                	lw	a5,0(a5)
    80002876:	fef42623          	sw	a5,-20(s0)
  nextpid = nextpid + 1;
    8000287a:	00009797          	auipc	a5,0x9
    8000287e:	ef678793          	addi	a5,a5,-266 # 8000b770 <nextpid>
    80002882:	439c                	lw	a5,0(a5)
    80002884:	2785                	addiw	a5,a5,1
    80002886:	0007871b          	sext.w	a4,a5
    8000288a:	00009797          	auipc	a5,0x9
    8000288e:	ee678793          	addi	a5,a5,-282 # 8000b770 <nextpid>
    80002892:	c398                	sw	a4,0(a5)
  release(&pid_lock);
    80002894:	00018517          	auipc	a0,0x18
    80002898:	84450513          	addi	a0,a0,-1980 # 8001a0d8 <pid_lock>
    8000289c:	fffff097          	auipc	ra,0xfffff
    800028a0:	a36080e7          	jalr	-1482(ra) # 800012d2 <release>

  return pid;
    800028a4:	fec42783          	lw	a5,-20(s0)
}
    800028a8:	853e                	mv	a0,a5
    800028aa:	60e2                	ld	ra,24(sp)
    800028ac:	6442                	ld	s0,16(sp)
    800028ae:	6105                	addi	sp,sp,32
    800028b0:	8082                	ret

00000000800028b2 <allocproc>:
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
static struct proc*
allocproc(void)
{
    800028b2:	1101                	addi	sp,sp,-32
    800028b4:	ec06                	sd	ra,24(sp)
    800028b6:	e822                	sd	s0,16(sp)
    800028b8:	1000                	addi	s0,sp,32
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    800028ba:	00012797          	auipc	a5,0x12
    800028be:	e1e78793          	addi	a5,a5,-482 # 800146d8 <proc>
    800028c2:	fef43423          	sd	a5,-24(s0)
    800028c6:	a80d                	j	800028f8 <allocproc+0x46>
    acquire(&p->lock);
    800028c8:	fe843783          	ld	a5,-24(s0)
    800028cc:	853e                	mv	a0,a5
    800028ce:	fffff097          	auipc	ra,0xfffff
    800028d2:	9a0080e7          	jalr	-1632(ra) # 8000126e <acquire>
    if(p->state == UNUSED) {
    800028d6:	fe843783          	ld	a5,-24(s0)
    800028da:	4f9c                	lw	a5,24(a5)
    800028dc:	cb85                	beqz	a5,8000290c <allocproc+0x5a>
      goto found;
    } else {
      release(&p->lock);
    800028de:	fe843783          	ld	a5,-24(s0)
    800028e2:	853e                	mv	a0,a5
    800028e4:	fffff097          	auipc	ra,0xfffff
    800028e8:	9ee080e7          	jalr	-1554(ra) # 800012d2 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    800028ec:	fe843783          	ld	a5,-24(s0)
    800028f0:	16878793          	addi	a5,a5,360
    800028f4:	fef43423          	sd	a5,-24(s0)
    800028f8:	fe843703          	ld	a4,-24(s0)
    800028fc:	00017797          	auipc	a5,0x17
    80002900:	7dc78793          	addi	a5,a5,2012 # 8001a0d8 <pid_lock>
    80002904:	fcf762e3          	bltu	a4,a5,800028c8 <allocproc+0x16>
    }
  }
  return 0;
    80002908:	4781                	li	a5,0
    8000290a:	a0e1                	j	800029d2 <allocproc+0x120>
      goto found;
    8000290c:	0001                	nop

found:
  p->pid = allocpid();
    8000290e:	00000097          	auipc	ra,0x0
    80002912:	f46080e7          	jalr	-186(ra) # 80002854 <allocpid>
    80002916:	87aa                	mv	a5,a0
    80002918:	873e                	mv	a4,a5
    8000291a:	fe843783          	ld	a5,-24(s0)
    8000291e:	db98                	sw	a4,48(a5)
  p->state = USED;
    80002920:	fe843783          	ld	a5,-24(s0)
    80002924:	4705                	li	a4,1
    80002926:	cf98                	sw	a4,24(a5)

  // Allocate a trapframe page.
  if((p->trapframe = (struct trapframe *)kalloc()) == 0){
    80002928:	ffffe097          	auipc	ra,0xffffe
    8000292c:	7f2080e7          	jalr	2034(ra) # 8000111a <kalloc>
    80002930:	872a                	mv	a4,a0
    80002932:	fe843783          	ld	a5,-24(s0)
    80002936:	efb8                	sd	a4,88(a5)
    80002938:	fe843783          	ld	a5,-24(s0)
    8000293c:	6fbc                	ld	a5,88(a5)
    8000293e:	e385                	bnez	a5,8000295e <allocproc+0xac>
    freeproc(p);
    80002940:	fe843503          	ld	a0,-24(s0)
    80002944:	00000097          	auipc	ra,0x0
    80002948:	098080e7          	jalr	152(ra) # 800029dc <freeproc>
    release(&p->lock);
    8000294c:	fe843783          	ld	a5,-24(s0)
    80002950:	853e                	mv	a0,a5
    80002952:	fffff097          	auipc	ra,0xfffff
    80002956:	980080e7          	jalr	-1664(ra) # 800012d2 <release>
    return 0;
    8000295a:	4781                	li	a5,0
    8000295c:	a89d                	j	800029d2 <allocproc+0x120>
  }

  // An empty user page table.
  p->pagetable = proc_pagetable(p);
    8000295e:	fe843503          	ld	a0,-24(s0)
    80002962:	00000097          	auipc	ra,0x0
    80002966:	118080e7          	jalr	280(ra) # 80002a7a <proc_pagetable>
    8000296a:	872a                	mv	a4,a0
    8000296c:	fe843783          	ld	a5,-24(s0)
    80002970:	ebb8                	sd	a4,80(a5)
  if(p->pagetable == 0){
    80002972:	fe843783          	ld	a5,-24(s0)
    80002976:	6bbc                	ld	a5,80(a5)
    80002978:	e385                	bnez	a5,80002998 <allocproc+0xe6>
    freeproc(p);
    8000297a:	fe843503          	ld	a0,-24(s0)
    8000297e:	00000097          	auipc	ra,0x0
    80002982:	05e080e7          	jalr	94(ra) # 800029dc <freeproc>
    release(&p->lock);
    80002986:	fe843783          	ld	a5,-24(s0)
    8000298a:	853e                	mv	a0,a5
    8000298c:	fffff097          	auipc	ra,0xfffff
    80002990:	946080e7          	jalr	-1722(ra) # 800012d2 <release>
    return 0;
    80002994:	4781                	li	a5,0
    80002996:	a835                	j	800029d2 <allocproc+0x120>
  }

  // Set up new context to start executing at forkret,
  // which returns to user space.
  memset(&p->context, 0, sizeof(p->context));
    80002998:	fe843783          	ld	a5,-24(s0)
    8000299c:	06078793          	addi	a5,a5,96
    800029a0:	07000613          	li	a2,112
    800029a4:	4581                	li	a1,0
    800029a6:	853e                	mv	a0,a5
    800029a8:	fffff097          	auipc	ra,0xfffff
    800029ac:	a9a080e7          	jalr	-1382(ra) # 80001442 <memset>
  p->context.ra = (uint64)forkret;
    800029b0:	00001717          	auipc	a4,0x1
    800029b4:	aa470713          	addi	a4,a4,-1372 # 80003454 <forkret>
    800029b8:	fe843783          	ld	a5,-24(s0)
    800029bc:	f3b8                	sd	a4,96(a5)
  p->context.sp = p->kstack + PGSIZE;
    800029be:	fe843783          	ld	a5,-24(s0)
    800029c2:	63b8                	ld	a4,64(a5)
    800029c4:	6785                	lui	a5,0x1
    800029c6:	973e                	add	a4,a4,a5
    800029c8:	fe843783          	ld	a5,-24(s0)
    800029cc:	f7b8                	sd	a4,104(a5)

  return p;
    800029ce:	fe843783          	ld	a5,-24(s0)
}
    800029d2:	853e                	mv	a0,a5
    800029d4:	60e2                	ld	ra,24(sp)
    800029d6:	6442                	ld	s0,16(sp)
    800029d8:	6105                	addi	sp,sp,32
    800029da:	8082                	ret

00000000800029dc <freeproc>:
// free a proc structure and the data hanging from it,
// including user pages.
// p->lock must be held.
static void
freeproc(struct proc *p)
{
    800029dc:	1101                	addi	sp,sp,-32
    800029de:	ec06                	sd	ra,24(sp)
    800029e0:	e822                	sd	s0,16(sp)
    800029e2:	1000                	addi	s0,sp,32
    800029e4:	fea43423          	sd	a0,-24(s0)
  if(p->trapframe)
    800029e8:	fe843783          	ld	a5,-24(s0)
    800029ec:	6fbc                	ld	a5,88(a5)
    800029ee:	cb89                	beqz	a5,80002a00 <freeproc+0x24>
    kfree((void*)p->trapframe);
    800029f0:	fe843783          	ld	a5,-24(s0)
    800029f4:	6fbc                	ld	a5,88(a5)
    800029f6:	853e                	mv	a0,a5
    800029f8:	ffffe097          	auipc	ra,0xffffe
    800029fc:	67e080e7          	jalr	1662(ra) # 80001076 <kfree>
  p->trapframe = 0;
    80002a00:	fe843783          	ld	a5,-24(s0)
    80002a04:	0407bc23          	sd	zero,88(a5) # 1058 <_entry-0x7fffefa8>
  if(p->pagetable)
    80002a08:	fe843783          	ld	a5,-24(s0)
    80002a0c:	6bbc                	ld	a5,80(a5)
    80002a0e:	cf89                	beqz	a5,80002a28 <freeproc+0x4c>
    proc_freepagetable(p->pagetable, p->sz);
    80002a10:	fe843783          	ld	a5,-24(s0)
    80002a14:	6bb8                	ld	a4,80(a5)
    80002a16:	fe843783          	ld	a5,-24(s0)
    80002a1a:	67bc                	ld	a5,72(a5)
    80002a1c:	85be                	mv	a1,a5
    80002a1e:	853a                	mv	a0,a4
    80002a20:	00000097          	auipc	ra,0x0
    80002a24:	11a080e7          	jalr	282(ra) # 80002b3a <proc_freepagetable>
  p->pagetable = 0;
    80002a28:	fe843783          	ld	a5,-24(s0)
    80002a2c:	0407b823          	sd	zero,80(a5)
  p->sz = 0;
    80002a30:	fe843783          	ld	a5,-24(s0)
    80002a34:	0407b423          	sd	zero,72(a5)
  p->pid = 0;
    80002a38:	fe843783          	ld	a5,-24(s0)
    80002a3c:	0207a823          	sw	zero,48(a5)
  p->parent = 0;
    80002a40:	fe843783          	ld	a5,-24(s0)
    80002a44:	0207bc23          	sd	zero,56(a5)
  p->name[0] = 0;
    80002a48:	fe843783          	ld	a5,-24(s0)
    80002a4c:	14078c23          	sb	zero,344(a5)
  p->chan = 0;
    80002a50:	fe843783          	ld	a5,-24(s0)
    80002a54:	0207b023          	sd	zero,32(a5)
  p->killed = 0;
    80002a58:	fe843783          	ld	a5,-24(s0)
    80002a5c:	0207a423          	sw	zero,40(a5)
  p->xstate = 0;
    80002a60:	fe843783          	ld	a5,-24(s0)
    80002a64:	0207a623          	sw	zero,44(a5)
  p->state = UNUSED;
    80002a68:	fe843783          	ld	a5,-24(s0)
    80002a6c:	0007ac23          	sw	zero,24(a5)
}
    80002a70:	0001                	nop
    80002a72:	60e2                	ld	ra,24(sp)
    80002a74:	6442                	ld	s0,16(sp)
    80002a76:	6105                	addi	sp,sp,32
    80002a78:	8082                	ret

0000000080002a7a <proc_pagetable>:

// Create a user page table for a given process,
// with no user memory, but with trampoline pages.
pagetable_t
proc_pagetable(struct proc *p)
{
    80002a7a:	7179                	addi	sp,sp,-48
    80002a7c:	f406                	sd	ra,40(sp)
    80002a7e:	f022                	sd	s0,32(sp)
    80002a80:	1800                	addi	s0,sp,48
    80002a82:	fca43c23          	sd	a0,-40(s0)
  pagetable_t pagetable;

  // An empty page table.
  pagetable = uvmcreate();
    80002a86:	fffff097          	auipc	ra,0xfffff
    80002a8a:	3be080e7          	jalr	958(ra) # 80001e44 <uvmcreate>
    80002a8e:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80002a92:	fe843783          	ld	a5,-24(s0)
    80002a96:	e399                	bnez	a5,80002a9c <proc_pagetable+0x22>
    return 0;
    80002a98:	4781                	li	a5,0
    80002a9a:	a859                	j	80002b30 <proc_pagetable+0xb6>

  // map the trampoline code (for system call return)
  // at the highest user virtual address.
  // only the supervisor uses it, on the way
  // to/from user space, so not PTE_U.
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80002a9c:	00007797          	auipc	a5,0x7
    80002aa0:	56478793          	addi	a5,a5,1380 # 8000a000 <_trampoline>
    80002aa4:	4729                	li	a4,10
    80002aa6:	86be                	mv	a3,a5
    80002aa8:	6605                	lui	a2,0x1
    80002aaa:	040007b7          	lui	a5,0x4000
    80002aae:	17fd                	addi	a5,a5,-1
    80002ab0:	00c79593          	slli	a1,a5,0xc
    80002ab4:	fe843503          	ld	a0,-24(s0)
    80002ab8:	fffff097          	auipc	ra,0xfffff
    80002abc:	1ae080e7          	jalr	430(ra) # 80001c66 <mappages>
    80002ac0:	87aa                	mv	a5,a0
    80002ac2:	0007db63          	bgez	a5,80002ad8 <proc_pagetable+0x5e>
              (uint64)trampoline, PTE_R | PTE_X) < 0){
    uvmfree(pagetable, 0);
    80002ac6:	4581                	li	a1,0
    80002ac8:	fe843503          	ld	a0,-24(s0)
    80002acc:	fffff097          	auipc	ra,0xfffff
    80002ad0:	666080e7          	jalr	1638(ra) # 80002132 <uvmfree>
    return 0;
    80002ad4:	4781                	li	a5,0
    80002ad6:	a8a9                	j	80002b30 <proc_pagetable+0xb6>
  }

  // map the trapframe just below TRAMPOLINE, for trampoline.S.
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
              (uint64)(p->trapframe), PTE_R | PTE_W) < 0){
    80002ad8:	fd843783          	ld	a5,-40(s0)
    80002adc:	6fbc                	ld	a5,88(a5)
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80002ade:	4719                	li	a4,6
    80002ae0:	86be                	mv	a3,a5
    80002ae2:	6605                	lui	a2,0x1
    80002ae4:	020007b7          	lui	a5,0x2000
    80002ae8:	17fd                	addi	a5,a5,-1
    80002aea:	00d79593          	slli	a1,a5,0xd
    80002aee:	fe843503          	ld	a0,-24(s0)
    80002af2:	fffff097          	auipc	ra,0xfffff
    80002af6:	174080e7          	jalr	372(ra) # 80001c66 <mappages>
    80002afa:	87aa                	mv	a5,a0
    80002afc:	0207d863          	bgez	a5,80002b2c <proc_pagetable+0xb2>
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002b00:	4681                	li	a3,0
    80002b02:	4605                	li	a2,1
    80002b04:	040007b7          	lui	a5,0x4000
    80002b08:	17fd                	addi	a5,a5,-1
    80002b0a:	00c79593          	slli	a1,a5,0xc
    80002b0e:	fe843503          	ld	a0,-24(s0)
    80002b12:	fffff097          	auipc	ra,0xfffff
    80002b16:	232080e7          	jalr	562(ra) # 80001d44 <uvmunmap>
    uvmfree(pagetable, 0);
    80002b1a:	4581                	li	a1,0
    80002b1c:	fe843503          	ld	a0,-24(s0)
    80002b20:	fffff097          	auipc	ra,0xfffff
    80002b24:	612080e7          	jalr	1554(ra) # 80002132 <uvmfree>
    return 0;
    80002b28:	4781                	li	a5,0
    80002b2a:	a019                	j	80002b30 <proc_pagetable+0xb6>
  }

  return pagetable;
    80002b2c:	fe843783          	ld	a5,-24(s0)
}
    80002b30:	853e                	mv	a0,a5
    80002b32:	70a2                	ld	ra,40(sp)
    80002b34:	7402                	ld	s0,32(sp)
    80002b36:	6145                	addi	sp,sp,48
    80002b38:	8082                	ret

0000000080002b3a <proc_freepagetable>:

// Free a process's page table, and free the
// physical memory it refers to.
void
proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
    80002b3a:	1101                	addi	sp,sp,-32
    80002b3c:	ec06                	sd	ra,24(sp)
    80002b3e:	e822                	sd	s0,16(sp)
    80002b40:	1000                	addi	s0,sp,32
    80002b42:	fea43423          	sd	a0,-24(s0)
    80002b46:	feb43023          	sd	a1,-32(s0)
  uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002b4a:	4681                	li	a3,0
    80002b4c:	4605                	li	a2,1
    80002b4e:	040007b7          	lui	a5,0x4000
    80002b52:	17fd                	addi	a5,a5,-1
    80002b54:	00c79593          	slli	a1,a5,0xc
    80002b58:	fe843503          	ld	a0,-24(s0)
    80002b5c:	fffff097          	auipc	ra,0xfffff
    80002b60:	1e8080e7          	jalr	488(ra) # 80001d44 <uvmunmap>
  uvmunmap(pagetable, TRAPFRAME, 1, 0);
    80002b64:	4681                	li	a3,0
    80002b66:	4605                	li	a2,1
    80002b68:	020007b7          	lui	a5,0x2000
    80002b6c:	17fd                	addi	a5,a5,-1
    80002b6e:	00d79593          	slli	a1,a5,0xd
    80002b72:	fe843503          	ld	a0,-24(s0)
    80002b76:	fffff097          	auipc	ra,0xfffff
    80002b7a:	1ce080e7          	jalr	462(ra) # 80001d44 <uvmunmap>
  uvmfree(pagetable, sz);
    80002b7e:	fe043583          	ld	a1,-32(s0)
    80002b82:	fe843503          	ld	a0,-24(s0)
    80002b86:	fffff097          	auipc	ra,0xfffff
    80002b8a:	5ac080e7          	jalr	1452(ra) # 80002132 <uvmfree>
}
    80002b8e:	0001                	nop
    80002b90:	60e2                	ld	ra,24(sp)
    80002b92:	6442                	ld	s0,16(sp)
    80002b94:	6105                	addi	sp,sp,32
    80002b96:	8082                	ret

0000000080002b98 <userinit>:
};

// Set up first user process.
void
userinit(void)
{
    80002b98:	1101                	addi	sp,sp,-32
    80002b9a:	ec06                	sd	ra,24(sp)
    80002b9c:	e822                	sd	s0,16(sp)
    80002b9e:	1000                	addi	s0,sp,32
  struct proc *p;

  p = allocproc();
    80002ba0:	00000097          	auipc	ra,0x0
    80002ba4:	d12080e7          	jalr	-750(ra) # 800028b2 <allocproc>
    80002ba8:	fea43423          	sd	a0,-24(s0)
  initproc = p;
    80002bac:	00009797          	auipc	a5,0x9
    80002bb0:	47478793          	addi	a5,a5,1140 # 8000c020 <initproc>
    80002bb4:	fe843703          	ld	a4,-24(s0)
    80002bb8:	e398                	sd	a4,0(a5)
  
  // allocate one user page and copy init's instructions
  // and data into it.
  uvminit(p->pagetable, initcode, sizeof(initcode));
    80002bba:	fe843783          	ld	a5,-24(s0)
    80002bbe:	6bbc                	ld	a5,80(a5)
    80002bc0:	03400613          	li	a2,52
    80002bc4:	00009597          	auipc	a1,0x9
    80002bc8:	bd458593          	addi	a1,a1,-1068 # 8000b798 <initcode>
    80002bcc:	853e                	mv	a0,a5
    80002bce:	fffff097          	auipc	ra,0xfffff
    80002bd2:	2b2080e7          	jalr	690(ra) # 80001e80 <uvminit>
  p->sz = PGSIZE;
    80002bd6:	fe843783          	ld	a5,-24(s0)
    80002bda:	6705                	lui	a4,0x1
    80002bdc:	e7b8                	sd	a4,72(a5)

  // prepare for the very first "return" from kernel to user.
  p->trapframe->epc = 0;      // user program counter
    80002bde:	fe843783          	ld	a5,-24(s0)
    80002be2:	6fbc                	ld	a5,88(a5)
    80002be4:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80002be8:	fe843783          	ld	a5,-24(s0)
    80002bec:	6fbc                	ld	a5,88(a5)
    80002bee:	6705                	lui	a4,0x1
    80002bf0:	fb98                	sd	a4,48(a5)

  safestrcpy(p->name, "initcode", sizeof(p->name));
    80002bf2:	fe843783          	ld	a5,-24(s0)
    80002bf6:	15878793          	addi	a5,a5,344
    80002bfa:	4641                	li	a2,16
    80002bfc:	00008597          	auipc	a1,0x8
    80002c00:	5ec58593          	addi	a1,a1,1516 # 8000b1e8 <etext+0x1e8>
    80002c04:	853e                	mv	a0,a5
    80002c06:	fffff097          	auipc	ra,0xfffff
    80002c0a:	b40080e7          	jalr	-1216(ra) # 80001746 <safestrcpy>
  p->cwd = namei("/");
    80002c0e:	00008517          	auipc	a0,0x8
    80002c12:	5ea50513          	addi	a0,a0,1514 # 8000b1f8 <etext+0x1f8>
    80002c16:	00003097          	auipc	ra,0x3
    80002c1a:	1d0080e7          	jalr	464(ra) # 80005de6 <namei>
    80002c1e:	872a                	mv	a4,a0
    80002c20:	fe843783          	ld	a5,-24(s0)
    80002c24:	14e7b823          	sd	a4,336(a5)

  put(p);
    80002c28:	fe843503          	ld	a0,-24(s0)
    80002c2c:	00000097          	auipc	ra,0x0
    80002c30:	60a080e7          	jalr	1546(ra) # 80003236 <put>

  release(&p->lock);
    80002c34:	fe843783          	ld	a5,-24(s0)
    80002c38:	853e                	mv	a0,a5
    80002c3a:	ffffe097          	auipc	ra,0xffffe
    80002c3e:	698080e7          	jalr	1688(ra) # 800012d2 <release>
}
    80002c42:	0001                	nop
    80002c44:	60e2                	ld	ra,24(sp)
    80002c46:	6442                	ld	s0,16(sp)
    80002c48:	6105                	addi	sp,sp,32
    80002c4a:	8082                	ret

0000000080002c4c <growproc>:

// Grow or shrink user memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
    80002c4c:	7179                	addi	sp,sp,-48
    80002c4e:	f406                	sd	ra,40(sp)
    80002c50:	f022                	sd	s0,32(sp)
    80002c52:	1800                	addi	s0,sp,48
    80002c54:	87aa                	mv	a5,a0
    80002c56:	fcf42e23          	sw	a5,-36(s0)
  uint sz;
  struct proc *p = myproc();
    80002c5a:	00000097          	auipc	ra,0x0
    80002c5e:	bbe080e7          	jalr	-1090(ra) # 80002818 <myproc>
    80002c62:	fea43023          	sd	a0,-32(s0)

  sz = p->sz;
    80002c66:	fe043783          	ld	a5,-32(s0)
    80002c6a:	67bc                	ld	a5,72(a5)
    80002c6c:	fef42623          	sw	a5,-20(s0)
  if(n > 0){
    80002c70:	fdc42783          	lw	a5,-36(s0)
    80002c74:	2781                	sext.w	a5,a5
    80002c76:	02f05e63          	blez	a5,80002cb2 <growproc+0x66>
    if((sz = uvmalloc(p->pagetable, sz, sz + n)) == 0) {
    80002c7a:	fe043783          	ld	a5,-32(s0)
    80002c7e:	6bb4                	ld	a3,80(a5)
    80002c80:	fec46583          	lwu	a1,-20(s0)
    80002c84:	fdc42783          	lw	a5,-36(s0)
    80002c88:	fec42703          	lw	a4,-20(s0)
    80002c8c:	9fb9                	addw	a5,a5,a4
    80002c8e:	2781                	sext.w	a5,a5
    80002c90:	1782                	slli	a5,a5,0x20
    80002c92:	9381                	srli	a5,a5,0x20
    80002c94:	863e                	mv	a2,a5
    80002c96:	8536                	mv	a0,a3
    80002c98:	fffff097          	auipc	ra,0xfffff
    80002c9c:	270080e7          	jalr	624(ra) # 80001f08 <uvmalloc>
    80002ca0:	87aa                	mv	a5,a0
    80002ca2:	fef42623          	sw	a5,-20(s0)
    80002ca6:	fec42783          	lw	a5,-20(s0)
    80002caa:	2781                	sext.w	a5,a5
    80002cac:	ef95                	bnez	a5,80002ce8 <growproc+0x9c>
      return -1;
    80002cae:	57fd                	li	a5,-1
    80002cb0:	a091                	j	80002cf4 <growproc+0xa8>
    }
  } else if(n < 0){
    80002cb2:	fdc42783          	lw	a5,-36(s0)
    80002cb6:	2781                	sext.w	a5,a5
    80002cb8:	0207d863          	bgez	a5,80002ce8 <growproc+0x9c>
    sz = uvmdealloc(p->pagetable, sz, sz + n);
    80002cbc:	fe043783          	ld	a5,-32(s0)
    80002cc0:	6bb4                	ld	a3,80(a5)
    80002cc2:	fec46583          	lwu	a1,-20(s0)
    80002cc6:	fdc42783          	lw	a5,-36(s0)
    80002cca:	fec42703          	lw	a4,-20(s0)
    80002cce:	9fb9                	addw	a5,a5,a4
    80002cd0:	2781                	sext.w	a5,a5
    80002cd2:	1782                	slli	a5,a5,0x20
    80002cd4:	9381                	srli	a5,a5,0x20
    80002cd6:	863e                	mv	a2,a5
    80002cd8:	8536                	mv	a0,a3
    80002cda:	fffff097          	auipc	ra,0xfffff
    80002cde:	312080e7          	jalr	786(ra) # 80001fec <uvmdealloc>
    80002ce2:	87aa                	mv	a5,a0
    80002ce4:	fef42623          	sw	a5,-20(s0)
  }
  p->sz = sz;
    80002ce8:	fec46703          	lwu	a4,-20(s0)
    80002cec:	fe043783          	ld	a5,-32(s0)
    80002cf0:	e7b8                	sd	a4,72(a5)
  return 0;
    80002cf2:	4781                	li	a5,0
}
    80002cf4:	853e                	mv	a0,a5
    80002cf6:	70a2                	ld	ra,40(sp)
    80002cf8:	7402                	ld	s0,32(sp)
    80002cfa:	6145                	addi	sp,sp,48
    80002cfc:	8082                	ret

0000000080002cfe <fork>:

// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.
int
fork(void)
{
    80002cfe:	7179                	addi	sp,sp,-48
    80002d00:	f406                	sd	ra,40(sp)
    80002d02:	f022                	sd	s0,32(sp)
    80002d04:	1800                	addi	s0,sp,48
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();
    80002d06:	00000097          	auipc	ra,0x0
    80002d0a:	b12080e7          	jalr	-1262(ra) # 80002818 <myproc>
    80002d0e:	fea43023          	sd	a0,-32(s0)

  // Allocate process.
  if((np = allocproc()) == 0){
    80002d12:	00000097          	auipc	ra,0x0
    80002d16:	ba0080e7          	jalr	-1120(ra) # 800028b2 <allocproc>
    80002d1a:	fca43c23          	sd	a0,-40(s0)
    80002d1e:	fd843783          	ld	a5,-40(s0)
    80002d22:	e399                	bnez	a5,80002d28 <fork+0x2a>
    return -1;
    80002d24:	57fd                	li	a5,-1
    80002d26:	a241                	j	80002ea6 <fork+0x1a8>
  }

  // Copy user memory from parent to child.
  if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
    80002d28:	fe043783          	ld	a5,-32(s0)
    80002d2c:	6bb8                	ld	a4,80(a5)
    80002d2e:	fd843783          	ld	a5,-40(s0)
    80002d32:	6bb4                	ld	a3,80(a5)
    80002d34:	fe043783          	ld	a5,-32(s0)
    80002d38:	67bc                	ld	a5,72(a5)
    80002d3a:	863e                	mv	a2,a5
    80002d3c:	85b6                	mv	a1,a3
    80002d3e:	853a                	mv	a0,a4
    80002d40:	fffff097          	auipc	ra,0xfffff
    80002d44:	43c080e7          	jalr	1084(ra) # 8000217c <uvmcopy>
    80002d48:	87aa                	mv	a5,a0
    80002d4a:	0207d163          	bgez	a5,80002d6c <fork+0x6e>
    freeproc(np);
    80002d4e:	fd843503          	ld	a0,-40(s0)
    80002d52:	00000097          	auipc	ra,0x0
    80002d56:	c8a080e7          	jalr	-886(ra) # 800029dc <freeproc>
    release(&np->lock);
    80002d5a:	fd843783          	ld	a5,-40(s0)
    80002d5e:	853e                	mv	a0,a5
    80002d60:	ffffe097          	auipc	ra,0xffffe
    80002d64:	572080e7          	jalr	1394(ra) # 800012d2 <release>
    return -1;
    80002d68:	57fd                	li	a5,-1
    80002d6a:	aa35                	j	80002ea6 <fork+0x1a8>
  }
  np->sz = p->sz;
    80002d6c:	fe043783          	ld	a5,-32(s0)
    80002d70:	67b8                	ld	a4,72(a5)
    80002d72:	fd843783          	ld	a5,-40(s0)
    80002d76:	e7b8                	sd	a4,72(a5)

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);
    80002d78:	fe043783          	ld	a5,-32(s0)
    80002d7c:	6fb8                	ld	a4,88(a5)
    80002d7e:	fd843783          	ld	a5,-40(s0)
    80002d82:	6fbc                	ld	a5,88(a5)
    80002d84:	86be                	mv	a3,a5
    80002d86:	12000793          	li	a5,288
    80002d8a:	863e                	mv	a2,a5
    80002d8c:	85ba                	mv	a1,a4
    80002d8e:	8536                	mv	a0,a3
    80002d90:	fffff097          	auipc	ra,0xfffff
    80002d94:	872080e7          	jalr	-1934(ra) # 80001602 <memcpy>

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;
    80002d98:	fd843783          	ld	a5,-40(s0)
    80002d9c:	6fbc                	ld	a5,88(a5)
    80002d9e:	0607b823          	sd	zero,112(a5)

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    80002da2:	fe042623          	sw	zero,-20(s0)
    80002da6:	a0a9                	j	80002df0 <fork+0xf2>
    if(p->ofile[i])
    80002da8:	fe043703          	ld	a4,-32(s0)
    80002dac:	fec42783          	lw	a5,-20(s0)
    80002db0:	07e9                	addi	a5,a5,26
    80002db2:	078e                	slli	a5,a5,0x3
    80002db4:	97ba                	add	a5,a5,a4
    80002db6:	639c                	ld	a5,0(a5)
    80002db8:	c79d                	beqz	a5,80002de6 <fork+0xe8>
      np->ofile[i] = filedup(p->ofile[i]);
    80002dba:	fe043703          	ld	a4,-32(s0)
    80002dbe:	fec42783          	lw	a5,-20(s0)
    80002dc2:	07e9                	addi	a5,a5,26
    80002dc4:	078e                	slli	a5,a5,0x3
    80002dc6:	97ba                	add	a5,a5,a4
    80002dc8:	639c                	ld	a5,0(a5)
    80002dca:	853e                	mv	a0,a5
    80002dcc:	00004097          	auipc	ra,0x4
    80002dd0:	9b2080e7          	jalr	-1614(ra) # 8000677e <filedup>
    80002dd4:	86aa                	mv	a3,a0
    80002dd6:	fd843703          	ld	a4,-40(s0)
    80002dda:	fec42783          	lw	a5,-20(s0)
    80002dde:	07e9                	addi	a5,a5,26
    80002de0:	078e                	slli	a5,a5,0x3
    80002de2:	97ba                	add	a5,a5,a4
    80002de4:	e394                	sd	a3,0(a5)
  for(i = 0; i < NOFILE; i++)
    80002de6:	fec42783          	lw	a5,-20(s0)
    80002dea:	2785                	addiw	a5,a5,1
    80002dec:	fef42623          	sw	a5,-20(s0)
    80002df0:	fec42783          	lw	a5,-20(s0)
    80002df4:	0007871b          	sext.w	a4,a5
    80002df8:	47bd                	li	a5,15
    80002dfa:	fae7d7e3          	bge	a5,a4,80002da8 <fork+0xaa>
  np->cwd = idup(p->cwd);
    80002dfe:	fe043783          	ld	a5,-32(s0)
    80002e02:	1507b783          	ld	a5,336(a5)
    80002e06:	853e                	mv	a0,a5
    80002e08:	00002097          	auipc	ra,0x2
    80002e0c:	29c080e7          	jalr	668(ra) # 800050a4 <idup>
    80002e10:	872a                	mv	a4,a0
    80002e12:	fd843783          	ld	a5,-40(s0)
    80002e16:	14e7b823          	sd	a4,336(a5)

  safestrcpy(np->name, p->name, sizeof(p->name));
    80002e1a:	fd843783          	ld	a5,-40(s0)
    80002e1e:	15878713          	addi	a4,a5,344
    80002e22:	fe043783          	ld	a5,-32(s0)
    80002e26:	15878793          	addi	a5,a5,344
    80002e2a:	4641                	li	a2,16
    80002e2c:	85be                	mv	a1,a5
    80002e2e:	853a                	mv	a0,a4
    80002e30:	fffff097          	auipc	ra,0xfffff
    80002e34:	916080e7          	jalr	-1770(ra) # 80001746 <safestrcpy>

  pid = np->pid;
    80002e38:	fd843783          	ld	a5,-40(s0)
    80002e3c:	5b9c                	lw	a5,48(a5)
    80002e3e:	fcf42a23          	sw	a5,-44(s0)

  release(&np->lock);
    80002e42:	fd843783          	ld	a5,-40(s0)
    80002e46:	853e                	mv	a0,a5
    80002e48:	ffffe097          	auipc	ra,0xffffe
    80002e4c:	48a080e7          	jalr	1162(ra) # 800012d2 <release>

  acquire(&wait_lock);
    80002e50:	00017517          	auipc	a0,0x17
    80002e54:	2a050513          	addi	a0,a0,672 # 8001a0f0 <wait_lock>
    80002e58:	ffffe097          	auipc	ra,0xffffe
    80002e5c:	416080e7          	jalr	1046(ra) # 8000126e <acquire>
  np->parent = p;
    80002e60:	fd843783          	ld	a5,-40(s0)
    80002e64:	fe043703          	ld	a4,-32(s0)
    80002e68:	ff98                	sd	a4,56(a5)
  release(&wait_lock);
    80002e6a:	00017517          	auipc	a0,0x17
    80002e6e:	28650513          	addi	a0,a0,646 # 8001a0f0 <wait_lock>
    80002e72:	ffffe097          	auipc	ra,0xffffe
    80002e76:	460080e7          	jalr	1120(ra) # 800012d2 <release>

  acquire(&np->lock);
    80002e7a:	fd843783          	ld	a5,-40(s0)
    80002e7e:	853e                	mv	a0,a5
    80002e80:	ffffe097          	auipc	ra,0xffffe
    80002e84:	3ee080e7          	jalr	1006(ra) # 8000126e <acquire>
  put(np);
    80002e88:	fd843503          	ld	a0,-40(s0)
    80002e8c:	00000097          	auipc	ra,0x0
    80002e90:	3aa080e7          	jalr	938(ra) # 80003236 <put>
  release(&np->lock);
    80002e94:	fd843783          	ld	a5,-40(s0)
    80002e98:	853e                	mv	a0,a5
    80002e9a:	ffffe097          	auipc	ra,0xffffe
    80002e9e:	438080e7          	jalr	1080(ra) # 800012d2 <release>

  return pid;
    80002ea2:	fd442783          	lw	a5,-44(s0)
}
    80002ea6:	853e                	mv	a0,a5
    80002ea8:	70a2                	ld	ra,40(sp)
    80002eaa:	7402                	ld	s0,32(sp)
    80002eac:	6145                	addi	sp,sp,48
    80002eae:	8082                	ret

0000000080002eb0 <reparent>:

// Pass p's abandoned children to init.
// Caller must hold wait_lock.
void
reparent(struct proc *p)
{
    80002eb0:	7179                	addi	sp,sp,-48
    80002eb2:	f406                	sd	ra,40(sp)
    80002eb4:	f022                	sd	s0,32(sp)
    80002eb6:	1800                	addi	s0,sp,48
    80002eb8:	fca43c23          	sd	a0,-40(s0)
  struct proc *pp;

  for(pp = proc; pp < &proc[NPROC]; pp++){
    80002ebc:	00012797          	auipc	a5,0x12
    80002ec0:	81c78793          	addi	a5,a5,-2020 # 800146d8 <proc>
    80002ec4:	fef43423          	sd	a5,-24(s0)
    80002ec8:	a081                	j	80002f08 <reparent+0x58>
    if(pp->parent == p){
    80002eca:	fe843783          	ld	a5,-24(s0)
    80002ece:	7f9c                	ld	a5,56(a5)
    80002ed0:	fd843703          	ld	a4,-40(s0)
    80002ed4:	02f71463          	bne	a4,a5,80002efc <reparent+0x4c>
      pp->parent = initproc;
    80002ed8:	00009797          	auipc	a5,0x9
    80002edc:	14878793          	addi	a5,a5,328 # 8000c020 <initproc>
    80002ee0:	6398                	ld	a4,0(a5)
    80002ee2:	fe843783          	ld	a5,-24(s0)
    80002ee6:	ff98                	sd	a4,56(a5)
      wakeup(initproc);
    80002ee8:	00009797          	auipc	a5,0x9
    80002eec:	13878793          	addi	a5,a5,312 # 8000c020 <initproc>
    80002ef0:	639c                	ld	a5,0(a5)
    80002ef2:	853e                	mv	a0,a5
    80002ef4:	00000097          	auipc	ra,0x0
    80002ef8:	62c080e7          	jalr	1580(ra) # 80003520 <wakeup>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80002efc:	fe843783          	ld	a5,-24(s0)
    80002f00:	16878793          	addi	a5,a5,360
    80002f04:	fef43423          	sd	a5,-24(s0)
    80002f08:	fe843703          	ld	a4,-24(s0)
    80002f0c:	00017797          	auipc	a5,0x17
    80002f10:	1cc78793          	addi	a5,a5,460 # 8001a0d8 <pid_lock>
    80002f14:	faf76be3          	bltu	a4,a5,80002eca <reparent+0x1a>
    }
  }
}
    80002f18:	0001                	nop
    80002f1a:	0001                	nop
    80002f1c:	70a2                	ld	ra,40(sp)
    80002f1e:	7402                	ld	s0,32(sp)
    80002f20:	6145                	addi	sp,sp,48
    80002f22:	8082                	ret

0000000080002f24 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait().
void
exit(int status)
{
    80002f24:	7139                	addi	sp,sp,-64
    80002f26:	fc06                	sd	ra,56(sp)
    80002f28:	f822                	sd	s0,48(sp)
    80002f2a:	0080                	addi	s0,sp,64
    80002f2c:	87aa                	mv	a5,a0
    80002f2e:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80002f32:	00000097          	auipc	ra,0x0
    80002f36:	8e6080e7          	jalr	-1818(ra) # 80002818 <myproc>
    80002f3a:	fea43023          	sd	a0,-32(s0)

  if(p == initproc)
    80002f3e:	00009797          	auipc	a5,0x9
    80002f42:	0e278793          	addi	a5,a5,226 # 8000c020 <initproc>
    80002f46:	639c                	ld	a5,0(a5)
    80002f48:	fe043703          	ld	a4,-32(s0)
    80002f4c:	00f71a63          	bne	a4,a5,80002f60 <exit+0x3c>
    panic("init exiting");
    80002f50:	00008517          	auipc	a0,0x8
    80002f54:	2b050513          	addi	a0,a0,688 # 8000b200 <etext+0x200>
    80002f58:	ffffe097          	auipc	ra,0xffffe
    80002f5c:	d26080e7          	jalr	-730(ra) # 80000c7e <panic>

  // Close all open files.
  for(int fd = 0; fd < NOFILE; fd++){
    80002f60:	fe042623          	sw	zero,-20(s0)
    80002f64:	a881                	j	80002fb4 <exit+0x90>
    if(p->ofile[fd]){
    80002f66:	fe043703          	ld	a4,-32(s0)
    80002f6a:	fec42783          	lw	a5,-20(s0)
    80002f6e:	07e9                	addi	a5,a5,26
    80002f70:	078e                	slli	a5,a5,0x3
    80002f72:	97ba                	add	a5,a5,a4
    80002f74:	639c                	ld	a5,0(a5)
    80002f76:	cb95                	beqz	a5,80002faa <exit+0x86>
      struct file *f = p->ofile[fd];
    80002f78:	fe043703          	ld	a4,-32(s0)
    80002f7c:	fec42783          	lw	a5,-20(s0)
    80002f80:	07e9                	addi	a5,a5,26
    80002f82:	078e                	slli	a5,a5,0x3
    80002f84:	97ba                	add	a5,a5,a4
    80002f86:	639c                	ld	a5,0(a5)
    80002f88:	fcf43c23          	sd	a5,-40(s0)
      fileclose(f);
    80002f8c:	fd843503          	ld	a0,-40(s0)
    80002f90:	00004097          	auipc	ra,0x4
    80002f94:	854080e7          	jalr	-1964(ra) # 800067e4 <fileclose>
      p->ofile[fd] = 0;
    80002f98:	fe043703          	ld	a4,-32(s0)
    80002f9c:	fec42783          	lw	a5,-20(s0)
    80002fa0:	07e9                	addi	a5,a5,26
    80002fa2:	078e                	slli	a5,a5,0x3
    80002fa4:	97ba                	add	a5,a5,a4
    80002fa6:	0007b023          	sd	zero,0(a5)
  for(int fd = 0; fd < NOFILE; fd++){
    80002faa:	fec42783          	lw	a5,-20(s0)
    80002fae:	2785                	addiw	a5,a5,1
    80002fb0:	fef42623          	sw	a5,-20(s0)
    80002fb4:	fec42783          	lw	a5,-20(s0)
    80002fb8:	0007871b          	sext.w	a4,a5
    80002fbc:	47bd                	li	a5,15
    80002fbe:	fae7d4e3          	bge	a5,a4,80002f66 <exit+0x42>
    }
  }

  begin_op();
    80002fc2:	00003097          	auipc	ra,0x3
    80002fc6:	188080e7          	jalr	392(ra) # 8000614a <begin_op>
  iput(p->cwd);
    80002fca:	fe043783          	ld	a5,-32(s0)
    80002fce:	1507b783          	ld	a5,336(a5)
    80002fd2:	853e                	mv	a0,a5
    80002fd4:	00002097          	auipc	ra,0x2
    80002fd8:	2aa080e7          	jalr	682(ra) # 8000527e <iput>
  end_op();
    80002fdc:	00003097          	auipc	ra,0x3
    80002fe0:	230080e7          	jalr	560(ra) # 8000620c <end_op>
  p->cwd = 0;
    80002fe4:	fe043783          	ld	a5,-32(s0)
    80002fe8:	1407b823          	sd	zero,336(a5)

  acquire(&wait_lock);
    80002fec:	00017517          	auipc	a0,0x17
    80002ff0:	10450513          	addi	a0,a0,260 # 8001a0f0 <wait_lock>
    80002ff4:	ffffe097          	auipc	ra,0xffffe
    80002ff8:	27a080e7          	jalr	634(ra) # 8000126e <acquire>

  // Give any children to init.
  reparent(p);
    80002ffc:	fe043503          	ld	a0,-32(s0)
    80003000:	00000097          	auipc	ra,0x0
    80003004:	eb0080e7          	jalr	-336(ra) # 80002eb0 <reparent>

  // Parent might be sleeping in wait().
  wakeup(p->parent);
    80003008:	fe043783          	ld	a5,-32(s0)
    8000300c:	7f9c                	ld	a5,56(a5)
    8000300e:	853e                	mv	a0,a5
    80003010:	00000097          	auipc	ra,0x0
    80003014:	510080e7          	jalr	1296(ra) # 80003520 <wakeup>
  
  acquire(&p->lock);
    80003018:	fe043783          	ld	a5,-32(s0)
    8000301c:	853e                	mv	a0,a5
    8000301e:	ffffe097          	auipc	ra,0xffffe
    80003022:	250080e7          	jalr	592(ra) # 8000126e <acquire>

  p->xstate = status;
    80003026:	fe043783          	ld	a5,-32(s0)
    8000302a:	fcc42703          	lw	a4,-52(s0)
    8000302e:	d7d8                	sw	a4,44(a5)
  p->state = ZOMBIE;
    80003030:	fe043783          	ld	a5,-32(s0)
    80003034:	4715                	li	a4,5
    80003036:	cf98                	sw	a4,24(a5)

  release(&wait_lock);
    80003038:	00017517          	auipc	a0,0x17
    8000303c:	0b850513          	addi	a0,a0,184 # 8001a0f0 <wait_lock>
    80003040:	ffffe097          	auipc	ra,0xffffe
    80003044:	292080e7          	jalr	658(ra) # 800012d2 <release>

  // Jump into the scheduler, never to return.
  sched();
    80003048:	00000097          	auipc	ra,0x0
    8000304c:	2dc080e7          	jalr	732(ra) # 80003324 <sched>
  panic("zombie exit");
    80003050:	00008517          	auipc	a0,0x8
    80003054:	1c050513          	addi	a0,a0,448 # 8000b210 <etext+0x210>
    80003058:	ffffe097          	auipc	ra,0xffffe
    8000305c:	c26080e7          	jalr	-986(ra) # 80000c7e <panic>

0000000080003060 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(uint64 addr)
{
    80003060:	7139                	addi	sp,sp,-64
    80003062:	fc06                	sd	ra,56(sp)
    80003064:	f822                	sd	s0,48(sp)
    80003066:	0080                	addi	s0,sp,64
    80003068:	fca43423          	sd	a0,-56(s0)
  struct proc *np;
  int havekids, pid;
  struct proc *p = myproc();
    8000306c:	fffff097          	auipc	ra,0xfffff
    80003070:	7ac080e7          	jalr	1964(ra) # 80002818 <myproc>
    80003074:	fca43c23          	sd	a0,-40(s0)

  acquire(&wait_lock);
    80003078:	00017517          	auipc	a0,0x17
    8000307c:	07850513          	addi	a0,a0,120 # 8001a0f0 <wait_lock>
    80003080:	ffffe097          	auipc	ra,0xffffe
    80003084:	1ee080e7          	jalr	494(ra) # 8000126e <acquire>

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    80003088:	fe042223          	sw	zero,-28(s0)
    for(np = proc; np < &proc[NPROC]; np++){
    8000308c:	00011797          	auipc	a5,0x11
    80003090:	64c78793          	addi	a5,a5,1612 # 800146d8 <proc>
    80003094:	fef43423          	sd	a5,-24(s0)
    80003098:	a8d1                	j	8000316c <wait+0x10c>
      if(np->parent == p){
    8000309a:	fe843783          	ld	a5,-24(s0)
    8000309e:	7f9c                	ld	a5,56(a5)
    800030a0:	fd843703          	ld	a4,-40(s0)
    800030a4:	0af71e63          	bne	a4,a5,80003160 <wait+0x100>
        // make sure the child isn't still in exit() or swtch().
        acquire(&np->lock);
    800030a8:	fe843783          	ld	a5,-24(s0)
    800030ac:	853e                	mv	a0,a5
    800030ae:	ffffe097          	auipc	ra,0xffffe
    800030b2:	1c0080e7          	jalr	448(ra) # 8000126e <acquire>

        havekids = 1;
    800030b6:	4785                	li	a5,1
    800030b8:	fef42223          	sw	a5,-28(s0)
        if(np->state == ZOMBIE){
    800030bc:	fe843783          	ld	a5,-24(s0)
    800030c0:	4f9c                	lw	a5,24(a5)
    800030c2:	873e                	mv	a4,a5
    800030c4:	4795                	li	a5,5
    800030c6:	08f71663          	bne	a4,a5,80003152 <wait+0xf2>
          // Found one.
          pid = np->pid;
    800030ca:	fe843783          	ld	a5,-24(s0)
    800030ce:	5b9c                	lw	a5,48(a5)
    800030d0:	fcf42a23          	sw	a5,-44(s0)
          if(addr != 0 && copyout(p->pagetable, addr, (char *)&np->xstate,
    800030d4:	fc843783          	ld	a5,-56(s0)
    800030d8:	c7a9                	beqz	a5,80003122 <wait+0xc2>
    800030da:	fd843783          	ld	a5,-40(s0)
    800030de:	6bb8                	ld	a4,80(a5)
    800030e0:	fe843783          	ld	a5,-24(s0)
    800030e4:	02c78793          	addi	a5,a5,44
    800030e8:	4691                	li	a3,4
    800030ea:	863e                	mv	a2,a5
    800030ec:	fc843583          	ld	a1,-56(s0)
    800030f0:	853a                	mv	a0,a4
    800030f2:	fffff097          	auipc	ra,0xfffff
    800030f6:	1f4080e7          	jalr	500(ra) # 800022e6 <copyout>
    800030fa:	87aa                	mv	a5,a0
    800030fc:	0207d363          	bgez	a5,80003122 <wait+0xc2>
                                  sizeof(np->xstate)) < 0) {
            release(&np->lock);
    80003100:	fe843783          	ld	a5,-24(s0)
    80003104:	853e                	mv	a0,a5
    80003106:	ffffe097          	auipc	ra,0xffffe
    8000310a:	1cc080e7          	jalr	460(ra) # 800012d2 <release>
            release(&wait_lock);
    8000310e:	00017517          	auipc	a0,0x17
    80003112:	fe250513          	addi	a0,a0,-30 # 8001a0f0 <wait_lock>
    80003116:	ffffe097          	auipc	ra,0xffffe
    8000311a:	1bc080e7          	jalr	444(ra) # 800012d2 <release>
            return -1;
    8000311e:	57fd                	li	a5,-1
    80003120:	a859                	j	800031b6 <wait+0x156>
          }
          freeproc(np);
    80003122:	fe843503          	ld	a0,-24(s0)
    80003126:	00000097          	auipc	ra,0x0
    8000312a:	8b6080e7          	jalr	-1866(ra) # 800029dc <freeproc>
          release(&np->lock);
    8000312e:	fe843783          	ld	a5,-24(s0)
    80003132:	853e                	mv	a0,a5
    80003134:	ffffe097          	auipc	ra,0xffffe
    80003138:	19e080e7          	jalr	414(ra) # 800012d2 <release>
          release(&wait_lock);
    8000313c:	00017517          	auipc	a0,0x17
    80003140:	fb450513          	addi	a0,a0,-76 # 8001a0f0 <wait_lock>
    80003144:	ffffe097          	auipc	ra,0xffffe
    80003148:	18e080e7          	jalr	398(ra) # 800012d2 <release>
          return pid;
    8000314c:	fd442783          	lw	a5,-44(s0)
    80003150:	a09d                	j	800031b6 <wait+0x156>
        }
        release(&np->lock);
    80003152:	fe843783          	ld	a5,-24(s0)
    80003156:	853e                	mv	a0,a5
    80003158:	ffffe097          	auipc	ra,0xffffe
    8000315c:	17a080e7          	jalr	378(ra) # 800012d2 <release>
    for(np = proc; np < &proc[NPROC]; np++){
    80003160:	fe843783          	ld	a5,-24(s0)
    80003164:	16878793          	addi	a5,a5,360
    80003168:	fef43423          	sd	a5,-24(s0)
    8000316c:	fe843703          	ld	a4,-24(s0)
    80003170:	00017797          	auipc	a5,0x17
    80003174:	f6878793          	addi	a5,a5,-152 # 8001a0d8 <pid_lock>
    80003178:	f2f761e3          	bltu	a4,a5,8000309a <wait+0x3a>
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || p->killed){
    8000317c:	fe442783          	lw	a5,-28(s0)
    80003180:	2781                	sext.w	a5,a5
    80003182:	c789                	beqz	a5,8000318c <wait+0x12c>
    80003184:	fd843783          	ld	a5,-40(s0)
    80003188:	579c                	lw	a5,40(a5)
    8000318a:	cb99                	beqz	a5,800031a0 <wait+0x140>
      release(&wait_lock);
    8000318c:	00017517          	auipc	a0,0x17
    80003190:	f6450513          	addi	a0,a0,-156 # 8001a0f0 <wait_lock>
    80003194:	ffffe097          	auipc	ra,0xffffe
    80003198:	13e080e7          	jalr	318(ra) # 800012d2 <release>
      return -1;
    8000319c:	57fd                	li	a5,-1
    8000319e:	a821                	j	800031b6 <wait+0x156>
    }
    
    // Wait for a child to exit.
    sleep(p, &wait_lock);  //DOC: wait-sleep
    800031a0:	00017597          	auipc	a1,0x17
    800031a4:	f5058593          	addi	a1,a1,-176 # 8001a0f0 <wait_lock>
    800031a8:	fd843503          	ld	a0,-40(s0)
    800031ac:	00000097          	auipc	ra,0x0
    800031b0:	2f8080e7          	jalr	760(ra) # 800034a4 <sleep>
    havekids = 0;
    800031b4:	bdd1                	j	80003088 <wait+0x28>
  }
}
    800031b6:	853e                	mv	a0,a5
    800031b8:	70e2                	ld	ra,56(sp)
    800031ba:	7442                	ld	s0,48(sp)
    800031bc:	6121                	addi	sp,sp,64
    800031be:	8082                	ret

00000000800031c0 <get>:


//Geter of the next ready process by the set algorithm
struct proc*
get(void)
{
    800031c0:	1101                	addi	sp,sp,-32
    800031c2:	ec06                	sd	ra,24(sp)
    800031c4:	e822                	sd	s0,16(sp)
    800031c6:	1000                	addi	s0,sp,32
//        CFS:
//            printf("%s \n",c->scheduling_algorithm);
//            break;
//    }
    struct proc* p;
    for(p = proc; p < &proc[NPROC]; p++) {
    800031c8:	00011797          	auipc	a5,0x11
    800031cc:	51078793          	addi	a5,a5,1296 # 800146d8 <proc>
    800031d0:	fef43423          	sd	a5,-24(s0)
    800031d4:	a099                	j	8000321a <get+0x5a>
        acquire(&p->lock);
    800031d6:	fe843783          	ld	a5,-24(s0)
    800031da:	853e                	mv	a0,a5
    800031dc:	ffffe097          	auipc	ra,0xffffe
    800031e0:	092080e7          	jalr	146(ra) # 8000126e <acquire>
        if (p->state == RUNNABLE) {
    800031e4:	fe843783          	ld	a5,-24(s0)
    800031e8:	4f9c                	lw	a5,24(a5)
    800031ea:	873e                	mv	a4,a5
    800031ec:	478d                	li	a5,3
    800031ee:	00f71963          	bne	a4,a5,80003200 <get+0x40>
            p->state = RUNNING;
    800031f2:	fe843783          	ld	a5,-24(s0)
    800031f6:	4711                	li	a4,4
    800031f8:	cf98                	sw	a4,24(a5)
            return p;
    800031fa:	fe843783          	ld	a5,-24(s0)
    800031fe:	a03d                	j	8000322c <get+0x6c>
        }
        release(&p->lock);
    80003200:	fe843783          	ld	a5,-24(s0)
    80003204:	853e                	mv	a0,a5
    80003206:	ffffe097          	auipc	ra,0xffffe
    8000320a:	0cc080e7          	jalr	204(ra) # 800012d2 <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    8000320e:	fe843783          	ld	a5,-24(s0)
    80003212:	16878793          	addi	a5,a5,360
    80003216:	fef43423          	sd	a5,-24(s0)
    8000321a:	fe843703          	ld	a4,-24(s0)
    8000321e:	00017797          	auipc	a5,0x17
    80003222:	eba78793          	addi	a5,a5,-326 # 8001a0d8 <pid_lock>
    80003226:	faf768e3          	bltu	a4,a5,800031d6 <get+0x16>
    }
    return 0;
    8000322a:	4781                	li	a5,0
}
    8000322c:	853e                	mv	a0,a5
    8000322e:	60e2                	ld	ra,24(sp)
    80003230:	6442                	ld	s0,16(sp)
    80003232:	6105                	addi	sp,sp,32
    80003234:	8082                	ret

0000000080003236 <put>:

//Puts necessary parameters for scheduling the process
void
put(struct proc* p)
{
    80003236:	1101                	addi	sp,sp,-32
    80003238:	ec22                	sd	s0,24(sp)
    8000323a:	1000                	addi	s0,sp,32
    8000323c:	fea43423          	sd	a0,-24(s0)
    p->state = RUNNABLE;
    80003240:	fe843783          	ld	a5,-24(s0)
    80003244:	470d                	li	a4,3
    80003246:	cf98                	sw	a4,24(a5)
}
    80003248:	0001                	nop
    8000324a:	6462                	ld	s0,24(sp)
    8000324c:	6105                	addi	sp,sp,32
    8000324e:	8082                	ret

0000000080003250 <scheduler>:
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.
void
scheduler(void)
{
    80003250:	1101                	addi	sp,sp,-32
    80003252:	ec06                	sd	ra,24(sp)
    80003254:	e822                	sd	s0,16(sp)
    80003256:	1000                	addi	s0,sp,32
  struct proc *p;
  struct cpu *c = mycpu();
    80003258:	fffff097          	auipc	ra,0xfffff
    8000325c:	582080e7          	jalr	1410(ra) # 800027da <mycpu>
    80003260:	fea43423          	sd	a0,-24(s0)
//  c->scheduling_algorithm="SJF";
  //printf("%s \n",c->scheduling_algorithm);
  c->proc = 0;
    80003264:	fe843783          	ld	a5,-24(s0)
    80003268:	0007b023          	sd	zero,0(a5)
  for(;;){
    // Avoid deadlock by ensuring that devices can interrupt.
    intr_on();
    8000326c:	fffff097          	auipc	ra,0xfffff
    80003270:	358080e7          	jalr	856(ra) # 800025c4 <intr_on>
    p=get();
    80003274:	00000097          	auipc	ra,0x0
    80003278:	f4c080e7          	jalr	-180(ra) # 800031c0 <get>
    8000327c:	fea43023          	sd	a0,-32(s0)
    if(p)
    80003280:	fe043783          	ld	a5,-32(s0)
    80003284:	d7e5                	beqz	a5,8000326c <scheduler+0x1c>
    {
        // Switch to chosen process.  It is the process's job
        // to release its lock and then reacquire it
        // before jumping back to us.

        c->proc = p;
    80003286:	fe843783          	ld	a5,-24(s0)
    8000328a:	fe043703          	ld	a4,-32(s0)
    8000328e:	e398                	sd	a4,0(a5)
        swtch(&c->context, &p->context);
    80003290:	fe843783          	ld	a5,-24(s0)
    80003294:	00878713          	addi	a4,a5,8
    80003298:	fe043783          	ld	a5,-32(s0)
    8000329c:	06078793          	addi	a5,a5,96
    800032a0:	85be                	mv	a1,a5
    800032a2:	853a                	mv	a0,a4
    800032a4:	00000097          	auipc	ra,0x0
    800032a8:	582080e7          	jalr	1410(ra) # 80003826 <swtch>

        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;
    800032ac:	fe843783          	ld	a5,-24(s0)
    800032b0:	0007b023          	sd	zero,0(a5)
        if(&p->lock.locked) release(&p->lock);
    800032b4:	fe043783          	ld	a5,-32(s0)
    800032b8:	dbd5                	beqz	a5,8000326c <scheduler+0x1c>
    800032ba:	fe043783          	ld	a5,-32(s0)
    800032be:	853e                	mv	a0,a5
    800032c0:	ffffe097          	auipc	ra,0xffffe
    800032c4:	012080e7          	jalr	18(ra) # 800012d2 <release>
    intr_on();
    800032c8:	b755                	j	8000326c <scheduler+0x1c>

00000000800032ca <changeSchedulingAlgorithm>:

  }
}
//Fja za promenu algoritma rasporedjivanja na odredjenom procesoru
int changeSchedulingAlgorithm(char *type)
{
    800032ca:	7179                	addi	sp,sp,-48
    800032cc:	f406                	sd	ra,40(sp)
    800032ce:	f022                	sd	s0,32(sp)
    800032d0:	1800                	addi	s0,sp,48
    800032d2:	fca43c23          	sd	a0,-40(s0)
    printf("druga %s \n",type);
    800032d6:	fd843583          	ld	a1,-40(s0)
    800032da:	00008517          	auipc	a0,0x8
    800032de:	f4650513          	addi	a0,a0,-186 # 8000b220 <etext+0x220>
    800032e2:	ffffd097          	auipc	ra,0xffffd
    800032e6:	746080e7          	jalr	1862(ra) # 80000a28 <printf>
    struct cpu *c = mycpu();
    800032ea:	fffff097          	auipc	ra,0xfffff
    800032ee:	4f0080e7          	jalr	1264(ra) # 800027da <mycpu>
    800032f2:	fea43423          	sd	a0,-24(s0)
//    if(strcmp(type,"SJF") || strcmp(type,"SJF"))
//    {
        c->scheduling_algorithm= type;//(type==1)? "SJF" : "CFS";
    800032f6:	fe843783          	ld	a5,-24(s0)
    800032fa:	fd843703          	ld	a4,-40(s0)
    800032fe:	e3d8                	sd	a4,128(a5)
        printf("treca-USPESNO: %s \n",c->scheduling_algorithm);
    80003300:	fe843783          	ld	a5,-24(s0)
    80003304:	63dc                	ld	a5,128(a5)
    80003306:	85be                	mv	a1,a5
    80003308:	00008517          	auipc	a0,0x8
    8000330c:	f2850513          	addi	a0,a0,-216 # 8000b230 <etext+0x230>
    80003310:	ffffd097          	auipc	ra,0xffffd
    80003314:	718080e7          	jalr	1816(ra) # 80000a28 <printf>
        return 0;
    80003318:	4781                	li	a5,0
//    }
//    else return -1;

}
    8000331a:	853e                	mv	a0,a5
    8000331c:	70a2                	ld	ra,40(sp)
    8000331e:	7402                	ld	s0,32(sp)
    80003320:	6145                	addi	sp,sp,48
    80003322:	8082                	ret

0000000080003324 <sched>:
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    80003324:	7179                	addi	sp,sp,-48
    80003326:	f406                	sd	ra,40(sp)
    80003328:	f022                	sd	s0,32(sp)
    8000332a:	ec26                	sd	s1,24(sp)
    8000332c:	1800                	addi	s0,sp,48
  int intena;
  struct proc *p = myproc();
    8000332e:	fffff097          	auipc	ra,0xfffff
    80003332:	4ea080e7          	jalr	1258(ra) # 80002818 <myproc>
    80003336:	fca43c23          	sd	a0,-40(s0)

  if(!holding(&p->lock))
    8000333a:	fd843783          	ld	a5,-40(s0)
    8000333e:	853e                	mv	a0,a5
    80003340:	ffffe097          	auipc	ra,0xffffe
    80003344:	fe8080e7          	jalr	-24(ra) # 80001328 <holding>
    80003348:	87aa                	mv	a5,a0
    8000334a:	eb89                	bnez	a5,8000335c <sched+0x38>
    panic("sched p->lock");
    8000334c:	00008517          	auipc	a0,0x8
    80003350:	efc50513          	addi	a0,a0,-260 # 8000b248 <etext+0x248>
    80003354:	ffffe097          	auipc	ra,0xffffe
    80003358:	92a080e7          	jalr	-1750(ra) # 80000c7e <panic>
  if(mycpu()->noff != 1)
    8000335c:	fffff097          	auipc	ra,0xfffff
    80003360:	47e080e7          	jalr	1150(ra) # 800027da <mycpu>
    80003364:	87aa                	mv	a5,a0
    80003366:	5fbc                	lw	a5,120(a5)
    80003368:	873e                	mv	a4,a5
    8000336a:	4785                	li	a5,1
    8000336c:	00f70a63          	beq	a4,a5,80003380 <sched+0x5c>
    panic("sched locks");
    80003370:	00008517          	auipc	a0,0x8
    80003374:	ee850513          	addi	a0,a0,-280 # 8000b258 <etext+0x258>
    80003378:	ffffe097          	auipc	ra,0xffffe
    8000337c:	906080e7          	jalr	-1786(ra) # 80000c7e <panic>
  if(p->state == RUNNING)
    80003380:	fd843783          	ld	a5,-40(s0)
    80003384:	4f9c                	lw	a5,24(a5)
    80003386:	873e                	mv	a4,a5
    80003388:	4791                	li	a5,4
    8000338a:	00f71a63          	bne	a4,a5,8000339e <sched+0x7a>
    panic("sched running");
    8000338e:	00008517          	auipc	a0,0x8
    80003392:	eda50513          	addi	a0,a0,-294 # 8000b268 <etext+0x268>
    80003396:	ffffe097          	auipc	ra,0xffffe
    8000339a:	8e8080e7          	jalr	-1816(ra) # 80000c7e <panic>
  if(intr_get())
    8000339e:	fffff097          	auipc	ra,0xfffff
    800033a2:	250080e7          	jalr	592(ra) # 800025ee <intr_get>
    800033a6:	87aa                	mv	a5,a0
    800033a8:	cb89                	beqz	a5,800033ba <sched+0x96>
    panic("sched interruptible");
    800033aa:	00008517          	auipc	a0,0x8
    800033ae:	ece50513          	addi	a0,a0,-306 # 8000b278 <etext+0x278>
    800033b2:	ffffe097          	auipc	ra,0xffffe
    800033b6:	8cc080e7          	jalr	-1844(ra) # 80000c7e <panic>

  intena = mycpu()->intena;
    800033ba:	fffff097          	auipc	ra,0xfffff
    800033be:	420080e7          	jalr	1056(ra) # 800027da <mycpu>
    800033c2:	87aa                	mv	a5,a0
    800033c4:	5ffc                	lw	a5,124(a5)
    800033c6:	fcf42a23          	sw	a5,-44(s0)
  swtch(&p->context, &mycpu()->context);
    800033ca:	fd843783          	ld	a5,-40(s0)
    800033ce:	06078493          	addi	s1,a5,96
    800033d2:	fffff097          	auipc	ra,0xfffff
    800033d6:	408080e7          	jalr	1032(ra) # 800027da <mycpu>
    800033da:	87aa                	mv	a5,a0
    800033dc:	07a1                	addi	a5,a5,8
    800033de:	85be                	mv	a1,a5
    800033e0:	8526                	mv	a0,s1
    800033e2:	00000097          	auipc	ra,0x0
    800033e6:	444080e7          	jalr	1092(ra) # 80003826 <swtch>
  mycpu()->intena = intena;
    800033ea:	fffff097          	auipc	ra,0xfffff
    800033ee:	3f0080e7          	jalr	1008(ra) # 800027da <mycpu>
    800033f2:	872a                	mv	a4,a0
    800033f4:	fd442783          	lw	a5,-44(s0)
    800033f8:	df7c                	sw	a5,124(a4)
}
    800033fa:	0001                	nop
    800033fc:	70a2                	ld	ra,40(sp)
    800033fe:	7402                	ld	s0,32(sp)
    80003400:	64e2                	ld	s1,24(sp)
    80003402:	6145                	addi	sp,sp,48
    80003404:	8082                	ret

0000000080003406 <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
    80003406:	1101                	addi	sp,sp,-32
    80003408:	ec06                	sd	ra,24(sp)
    8000340a:	e822                	sd	s0,16(sp)
    8000340c:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    8000340e:	fffff097          	auipc	ra,0xfffff
    80003412:	40a080e7          	jalr	1034(ra) # 80002818 <myproc>
    80003416:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    8000341a:	fe843783          	ld	a5,-24(s0)
    8000341e:	853e                	mv	a0,a5
    80003420:	ffffe097          	auipc	ra,0xffffe
    80003424:	e4e080e7          	jalr	-434(ra) # 8000126e <acquire>
  put(p);
    80003428:	fe843503          	ld	a0,-24(s0)
    8000342c:	00000097          	auipc	ra,0x0
    80003430:	e0a080e7          	jalr	-502(ra) # 80003236 <put>
  sched();
    80003434:	00000097          	auipc	ra,0x0
    80003438:	ef0080e7          	jalr	-272(ra) # 80003324 <sched>
  release(&p->lock);
    8000343c:	fe843783          	ld	a5,-24(s0)
    80003440:	853e                	mv	a0,a5
    80003442:	ffffe097          	auipc	ra,0xffffe
    80003446:	e90080e7          	jalr	-368(ra) # 800012d2 <release>
}
    8000344a:	0001                	nop
    8000344c:	60e2                	ld	ra,24(sp)
    8000344e:	6442                	ld	s0,16(sp)
    80003450:	6105                	addi	sp,sp,32
    80003452:	8082                	ret

0000000080003454 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
    80003454:	1141                	addi	sp,sp,-16
    80003456:	e406                	sd	ra,8(sp)
    80003458:	e022                	sd	s0,0(sp)
    8000345a:	0800                	addi	s0,sp,16
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);
    8000345c:	fffff097          	auipc	ra,0xfffff
    80003460:	3bc080e7          	jalr	956(ra) # 80002818 <myproc>
    80003464:	87aa                	mv	a5,a0
    80003466:	853e                	mv	a0,a5
    80003468:	ffffe097          	auipc	ra,0xffffe
    8000346c:	e6a080e7          	jalr	-406(ra) # 800012d2 <release>

  if (first) {
    80003470:	00008797          	auipc	a5,0x8
    80003474:	30478793          	addi	a5,a5,772 # 8000b774 <first.1690>
    80003478:	439c                	lw	a5,0(a5)
    8000347a:	cf81                	beqz	a5,80003492 <forkret+0x3e>
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    first = 0;
    8000347c:	00008797          	auipc	a5,0x8
    80003480:	2f878793          	addi	a5,a5,760 # 8000b774 <first.1690>
    80003484:	0007a023          	sw	zero,0(a5)
    fsinit(ROOTDEV);
    80003488:	4505                	li	a0,1
    8000348a:	00001097          	auipc	ra,0x1
    8000348e:	4f4080e7          	jalr	1268(ra) # 8000497e <fsinit>
  }

  usertrapret();
    80003492:	00000097          	auipc	ra,0x0
    80003496:	732080e7          	jalr	1842(ra) # 80003bc4 <usertrapret>
}
    8000349a:	0001                	nop
    8000349c:	60a2                	ld	ra,8(sp)
    8000349e:	6402                	ld	s0,0(sp)
    800034a0:	0141                	addi	sp,sp,16
    800034a2:	8082                	ret

00000000800034a4 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
    800034a4:	7179                	addi	sp,sp,-48
    800034a6:	f406                	sd	ra,40(sp)
    800034a8:	f022                	sd	s0,32(sp)
    800034aa:	1800                	addi	s0,sp,48
    800034ac:	fca43c23          	sd	a0,-40(s0)
    800034b0:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    800034b4:	fffff097          	auipc	ra,0xfffff
    800034b8:	364080e7          	jalr	868(ra) # 80002818 <myproc>
    800034bc:	fea43423          	sd	a0,-24(s0)
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&p->lock);  //DOC: sleeplock1
    800034c0:	fe843783          	ld	a5,-24(s0)
    800034c4:	853e                	mv	a0,a5
    800034c6:	ffffe097          	auipc	ra,0xffffe
    800034ca:	da8080e7          	jalr	-600(ra) # 8000126e <acquire>
  release(lk);
    800034ce:	fd043503          	ld	a0,-48(s0)
    800034d2:	ffffe097          	auipc	ra,0xffffe
    800034d6:	e00080e7          	jalr	-512(ra) # 800012d2 <release>

  // Go to sleep.
  p->chan = chan;
    800034da:	fe843783          	ld	a5,-24(s0)
    800034de:	fd843703          	ld	a4,-40(s0)
    800034e2:	f398                	sd	a4,32(a5)
  p->state = SLEEPING;
    800034e4:	fe843783          	ld	a5,-24(s0)
    800034e8:	4709                	li	a4,2
    800034ea:	cf98                	sw	a4,24(a5)

  sched();
    800034ec:	00000097          	auipc	ra,0x0
    800034f0:	e38080e7          	jalr	-456(ra) # 80003324 <sched>

  // Tidy up.
  p->chan = 0;
    800034f4:	fe843783          	ld	a5,-24(s0)
    800034f8:	0207b023          	sd	zero,32(a5)

  // Reacquire original lock.
  release(&p->lock);
    800034fc:	fe843783          	ld	a5,-24(s0)
    80003500:	853e                	mv	a0,a5
    80003502:	ffffe097          	auipc	ra,0xffffe
    80003506:	dd0080e7          	jalr	-560(ra) # 800012d2 <release>
  acquire(lk);
    8000350a:	fd043503          	ld	a0,-48(s0)
    8000350e:	ffffe097          	auipc	ra,0xffffe
    80003512:	d60080e7          	jalr	-672(ra) # 8000126e <acquire>
}
    80003516:	0001                	nop
    80003518:	70a2                	ld	ra,40(sp)
    8000351a:	7402                	ld	s0,32(sp)
    8000351c:	6145                	addi	sp,sp,48
    8000351e:	8082                	ret

0000000080003520 <wakeup>:

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
    80003520:	7179                	addi	sp,sp,-48
    80003522:	f406                	sd	ra,40(sp)
    80003524:	f022                	sd	s0,32(sp)
    80003526:	1800                	addi	s0,sp,48
    80003528:	fca43c23          	sd	a0,-40(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    8000352c:	00011797          	auipc	a5,0x11
    80003530:	1ac78793          	addi	a5,a5,428 # 800146d8 <proc>
    80003534:	fef43423          	sd	a5,-24(s0)
    80003538:	a095                	j	8000359c <wakeup+0x7c>
    if(p != myproc()){
    8000353a:	fffff097          	auipc	ra,0xfffff
    8000353e:	2de080e7          	jalr	734(ra) # 80002818 <myproc>
    80003542:	872a                	mv	a4,a0
    80003544:	fe843783          	ld	a5,-24(s0)
    80003548:	04e78463          	beq	a5,a4,80003590 <wakeup+0x70>
      acquire(&p->lock);
    8000354c:	fe843783          	ld	a5,-24(s0)
    80003550:	853e                	mv	a0,a5
    80003552:	ffffe097          	auipc	ra,0xffffe
    80003556:	d1c080e7          	jalr	-740(ra) # 8000126e <acquire>
      if(p->state == SLEEPING && p->chan == chan) {
    8000355a:	fe843783          	ld	a5,-24(s0)
    8000355e:	4f9c                	lw	a5,24(a5)
    80003560:	873e                	mv	a4,a5
    80003562:	4789                	li	a5,2
    80003564:	00f71f63          	bne	a4,a5,80003582 <wakeup+0x62>
    80003568:	fe843783          	ld	a5,-24(s0)
    8000356c:	739c                	ld	a5,32(a5)
    8000356e:	fd843703          	ld	a4,-40(s0)
    80003572:	00f71863          	bne	a4,a5,80003582 <wakeup+0x62>
          put(p);
    80003576:	fe843503          	ld	a0,-24(s0)
    8000357a:	00000097          	auipc	ra,0x0
    8000357e:	cbc080e7          	jalr	-836(ra) # 80003236 <put>
      }
      release(&p->lock);
    80003582:	fe843783          	ld	a5,-24(s0)
    80003586:	853e                	mv	a0,a5
    80003588:	ffffe097          	auipc	ra,0xffffe
    8000358c:	d4a080e7          	jalr	-694(ra) # 800012d2 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80003590:	fe843783          	ld	a5,-24(s0)
    80003594:	16878793          	addi	a5,a5,360
    80003598:	fef43423          	sd	a5,-24(s0)
    8000359c:	fe843703          	ld	a4,-24(s0)
    800035a0:	00017797          	auipc	a5,0x17
    800035a4:	b3878793          	addi	a5,a5,-1224 # 8001a0d8 <pid_lock>
    800035a8:	f8f769e3          	bltu	a4,a5,8000353a <wakeup+0x1a>
    }
  }
}
    800035ac:	0001                	nop
    800035ae:	0001                	nop
    800035b0:	70a2                	ld	ra,40(sp)
    800035b2:	7402                	ld	s0,32(sp)
    800035b4:	6145                	addi	sp,sp,48
    800035b6:	8082                	ret

00000000800035b8 <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    800035b8:	7179                	addi	sp,sp,-48
    800035ba:	f406                	sd	ra,40(sp)
    800035bc:	f022                	sd	s0,32(sp)
    800035be:	1800                	addi	s0,sp,48
    800035c0:	87aa                	mv	a5,a0
    800035c2:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    800035c6:	00011797          	auipc	a5,0x11
    800035ca:	11278793          	addi	a5,a5,274 # 800146d8 <proc>
    800035ce:	fef43423          	sd	a5,-24(s0)
    800035d2:	a0bd                	j	80003640 <kill+0x88>
    acquire(&p->lock);
    800035d4:	fe843783          	ld	a5,-24(s0)
    800035d8:	853e                	mv	a0,a5
    800035da:	ffffe097          	auipc	ra,0xffffe
    800035de:	c94080e7          	jalr	-876(ra) # 8000126e <acquire>
    if(p->pid == pid){
    800035e2:	fe843783          	ld	a5,-24(s0)
    800035e6:	5b98                	lw	a4,48(a5)
    800035e8:	fdc42783          	lw	a5,-36(s0)
    800035ec:	2781                	sext.w	a5,a5
    800035ee:	02e79c63          	bne	a5,a4,80003626 <kill+0x6e>
      p->killed = 1;
    800035f2:	fe843783          	ld	a5,-24(s0)
    800035f6:	4705                	li	a4,1
    800035f8:	d798                	sw	a4,40(a5)
      if(p->state == SLEEPING){
    800035fa:	fe843783          	ld	a5,-24(s0)
    800035fe:	4f9c                	lw	a5,24(a5)
    80003600:	873e                	mv	a4,a5
    80003602:	4789                	li	a5,2
    80003604:	00f71863          	bne	a4,a5,80003614 <kill+0x5c>
        // Wake process from sleep().
        put(p);
    80003608:	fe843503          	ld	a0,-24(s0)
    8000360c:	00000097          	auipc	ra,0x0
    80003610:	c2a080e7          	jalr	-982(ra) # 80003236 <put>
      }
      release(&p->lock);
    80003614:	fe843783          	ld	a5,-24(s0)
    80003618:	853e                	mv	a0,a5
    8000361a:	ffffe097          	auipc	ra,0xffffe
    8000361e:	cb8080e7          	jalr	-840(ra) # 800012d2 <release>
      return 0;
    80003622:	4781                	li	a5,0
    80003624:	a03d                	j	80003652 <kill+0x9a>
    }
    release(&p->lock);
    80003626:	fe843783          	ld	a5,-24(s0)
    8000362a:	853e                	mv	a0,a5
    8000362c:	ffffe097          	auipc	ra,0xffffe
    80003630:	ca6080e7          	jalr	-858(ra) # 800012d2 <release>
  for(p = proc; p < &proc[NPROC]; p++){
    80003634:	fe843783          	ld	a5,-24(s0)
    80003638:	16878793          	addi	a5,a5,360
    8000363c:	fef43423          	sd	a5,-24(s0)
    80003640:	fe843703          	ld	a4,-24(s0)
    80003644:	00017797          	auipc	a5,0x17
    80003648:	a9478793          	addi	a5,a5,-1388 # 8001a0d8 <pid_lock>
    8000364c:	f8f764e3          	bltu	a4,a5,800035d4 <kill+0x1c>
  }
  return -1;
    80003650:	57fd                	li	a5,-1
}
    80003652:	853e                	mv	a0,a5
    80003654:	70a2                	ld	ra,40(sp)
    80003656:	7402                	ld	s0,32(sp)
    80003658:	6145                	addi	sp,sp,48
    8000365a:	8082                	ret

000000008000365c <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    8000365c:	7139                	addi	sp,sp,-64
    8000365e:	fc06                	sd	ra,56(sp)
    80003660:	f822                	sd	s0,48(sp)
    80003662:	0080                	addi	s0,sp,64
    80003664:	87aa                	mv	a5,a0
    80003666:	fcb43823          	sd	a1,-48(s0)
    8000366a:	fcc43423          	sd	a2,-56(s0)
    8000366e:	fcd43023          	sd	a3,-64(s0)
    80003672:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    80003676:	fffff097          	auipc	ra,0xfffff
    8000367a:	1a2080e7          	jalr	418(ra) # 80002818 <myproc>
    8000367e:	fea43423          	sd	a0,-24(s0)
  if(user_dst){
    80003682:	fdc42783          	lw	a5,-36(s0)
    80003686:	2781                	sext.w	a5,a5
    80003688:	c38d                	beqz	a5,800036aa <either_copyout+0x4e>
    return copyout(p->pagetable, dst, src, len);
    8000368a:	fe843783          	ld	a5,-24(s0)
    8000368e:	6bbc                	ld	a5,80(a5)
    80003690:	fc043683          	ld	a3,-64(s0)
    80003694:	fc843603          	ld	a2,-56(s0)
    80003698:	fd043583          	ld	a1,-48(s0)
    8000369c:	853e                	mv	a0,a5
    8000369e:	fffff097          	auipc	ra,0xfffff
    800036a2:	c48080e7          	jalr	-952(ra) # 800022e6 <copyout>
    800036a6:	87aa                	mv	a5,a0
    800036a8:	a839                	j	800036c6 <either_copyout+0x6a>
  } else {
    memmove((char *)dst, src, len);
    800036aa:	fd043783          	ld	a5,-48(s0)
    800036ae:	fc043703          	ld	a4,-64(s0)
    800036b2:	2701                	sext.w	a4,a4
    800036b4:	863a                	mv	a2,a4
    800036b6:	fc843583          	ld	a1,-56(s0)
    800036ba:	853e                	mv	a0,a5
    800036bc:	ffffe097          	auipc	ra,0xffffe
    800036c0:	e6a080e7          	jalr	-406(ra) # 80001526 <memmove>
    return 0;
    800036c4:	4781                	li	a5,0
  }
}
    800036c6:	853e                	mv	a0,a5
    800036c8:	70e2                	ld	ra,56(sp)
    800036ca:	7442                	ld	s0,48(sp)
    800036cc:	6121                	addi	sp,sp,64
    800036ce:	8082                	ret

00000000800036d0 <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    800036d0:	7139                	addi	sp,sp,-64
    800036d2:	fc06                	sd	ra,56(sp)
    800036d4:	f822                	sd	s0,48(sp)
    800036d6:	0080                	addi	s0,sp,64
    800036d8:	fca43c23          	sd	a0,-40(s0)
    800036dc:	87ae                	mv	a5,a1
    800036de:	fcc43423          	sd	a2,-56(s0)
    800036e2:	fcd43023          	sd	a3,-64(s0)
    800036e6:	fcf42a23          	sw	a5,-44(s0)
  struct proc *p = myproc();
    800036ea:	fffff097          	auipc	ra,0xfffff
    800036ee:	12e080e7          	jalr	302(ra) # 80002818 <myproc>
    800036f2:	fea43423          	sd	a0,-24(s0)
  if(user_src){
    800036f6:	fd442783          	lw	a5,-44(s0)
    800036fa:	2781                	sext.w	a5,a5
    800036fc:	c38d                	beqz	a5,8000371e <either_copyin+0x4e>
    return copyin(p->pagetable, dst, src, len);
    800036fe:	fe843783          	ld	a5,-24(s0)
    80003702:	6bbc                	ld	a5,80(a5)
    80003704:	fc043683          	ld	a3,-64(s0)
    80003708:	fc843603          	ld	a2,-56(s0)
    8000370c:	fd843583          	ld	a1,-40(s0)
    80003710:	853e                	mv	a0,a5
    80003712:	fffff097          	auipc	ra,0xfffff
    80003716:	ca2080e7          	jalr	-862(ra) # 800023b4 <copyin>
    8000371a:	87aa                	mv	a5,a0
    8000371c:	a839                	j	8000373a <either_copyin+0x6a>
  } else {
    memmove(dst, (char*)src, len);
    8000371e:	fc843783          	ld	a5,-56(s0)
    80003722:	fc043703          	ld	a4,-64(s0)
    80003726:	2701                	sext.w	a4,a4
    80003728:	863a                	mv	a2,a4
    8000372a:	85be                	mv	a1,a5
    8000372c:	fd843503          	ld	a0,-40(s0)
    80003730:	ffffe097          	auipc	ra,0xffffe
    80003734:	df6080e7          	jalr	-522(ra) # 80001526 <memmove>
    return 0;
    80003738:	4781                	li	a5,0
  }
}
    8000373a:	853e                	mv	a0,a5
    8000373c:	70e2                	ld	ra,56(sp)
    8000373e:	7442                	ld	s0,48(sp)
    80003740:	6121                	addi	sp,sp,64
    80003742:	8082                	ret

0000000080003744 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    80003744:	1101                	addi	sp,sp,-32
    80003746:	ec06                	sd	ra,24(sp)
    80003748:	e822                	sd	s0,16(sp)
    8000374a:	1000                	addi	s0,sp,32
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
    8000374c:	00008517          	auipc	a0,0x8
    80003750:	b4450513          	addi	a0,a0,-1212 # 8000b290 <etext+0x290>
    80003754:	ffffd097          	auipc	ra,0xffffd
    80003758:	2d4080e7          	jalr	724(ra) # 80000a28 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    8000375c:	00011797          	auipc	a5,0x11
    80003760:	f7c78793          	addi	a5,a5,-132 # 800146d8 <proc>
    80003764:	fef43423          	sd	a5,-24(s0)
    80003768:	a04d                	j	8000380a <procdump+0xc6>
    if(p->state == UNUSED)
    8000376a:	fe843783          	ld	a5,-24(s0)
    8000376e:	4f9c                	lw	a5,24(a5)
    80003770:	c7d1                	beqz	a5,800037fc <procdump+0xb8>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80003772:	fe843783          	ld	a5,-24(s0)
    80003776:	4f9c                	lw	a5,24(a5)
    80003778:	873e                	mv	a4,a5
    8000377a:	4795                	li	a5,5
    8000377c:	02e7ee63          	bltu	a5,a4,800037b8 <procdump+0x74>
    80003780:	fe843783          	ld	a5,-24(s0)
    80003784:	4f9c                	lw	a5,24(a5)
    80003786:	00008717          	auipc	a4,0x8
    8000378a:	04a70713          	addi	a4,a4,74 # 8000b7d0 <states.1727>
    8000378e:	1782                	slli	a5,a5,0x20
    80003790:	9381                	srli	a5,a5,0x20
    80003792:	078e                	slli	a5,a5,0x3
    80003794:	97ba                	add	a5,a5,a4
    80003796:	639c                	ld	a5,0(a5)
    80003798:	c385                	beqz	a5,800037b8 <procdump+0x74>
      state = states[p->state];
    8000379a:	fe843783          	ld	a5,-24(s0)
    8000379e:	4f9c                	lw	a5,24(a5)
    800037a0:	00008717          	auipc	a4,0x8
    800037a4:	03070713          	addi	a4,a4,48 # 8000b7d0 <states.1727>
    800037a8:	1782                	slli	a5,a5,0x20
    800037aa:	9381                	srli	a5,a5,0x20
    800037ac:	078e                	slli	a5,a5,0x3
    800037ae:	97ba                	add	a5,a5,a4
    800037b0:	639c                	ld	a5,0(a5)
    800037b2:	fef43023          	sd	a5,-32(s0)
    800037b6:	a039                	j	800037c4 <procdump+0x80>
    else
      state = "???";
    800037b8:	00008797          	auipc	a5,0x8
    800037bc:	ae078793          	addi	a5,a5,-1312 # 8000b298 <etext+0x298>
    800037c0:	fef43023          	sd	a5,-32(s0)
    printf("%d %s %s", p->pid, state, p->name);
    800037c4:	fe843783          	ld	a5,-24(s0)
    800037c8:	5b98                	lw	a4,48(a5)
    800037ca:	fe843783          	ld	a5,-24(s0)
    800037ce:	15878793          	addi	a5,a5,344
    800037d2:	86be                	mv	a3,a5
    800037d4:	fe043603          	ld	a2,-32(s0)
    800037d8:	85ba                	mv	a1,a4
    800037da:	00008517          	auipc	a0,0x8
    800037de:	ac650513          	addi	a0,a0,-1338 # 8000b2a0 <etext+0x2a0>
    800037e2:	ffffd097          	auipc	ra,0xffffd
    800037e6:	246080e7          	jalr	582(ra) # 80000a28 <printf>
    printf("\n");
    800037ea:	00008517          	auipc	a0,0x8
    800037ee:	aa650513          	addi	a0,a0,-1370 # 8000b290 <etext+0x290>
    800037f2:	ffffd097          	auipc	ra,0xffffd
    800037f6:	236080e7          	jalr	566(ra) # 80000a28 <printf>
    800037fa:	a011                	j	800037fe <procdump+0xba>
      continue;
    800037fc:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++){
    800037fe:	fe843783          	ld	a5,-24(s0)
    80003802:	16878793          	addi	a5,a5,360
    80003806:	fef43423          	sd	a5,-24(s0)
    8000380a:	fe843703          	ld	a4,-24(s0)
    8000380e:	00017797          	auipc	a5,0x17
    80003812:	8ca78793          	addi	a5,a5,-1846 # 8001a0d8 <pid_lock>
    80003816:	f4f76ae3          	bltu	a4,a5,8000376a <procdump+0x26>
  }
}
    8000381a:	0001                	nop
    8000381c:	0001                	nop
    8000381e:	60e2                	ld	ra,24(sp)
    80003820:	6442                	ld	s0,16(sp)
    80003822:	6105                	addi	sp,sp,32
    80003824:	8082                	ret

0000000080003826 <swtch>:
    80003826:	00153023          	sd	ra,0(a0)
    8000382a:	00253423          	sd	sp,8(a0)
    8000382e:	e900                	sd	s0,16(a0)
    80003830:	ed04                	sd	s1,24(a0)
    80003832:	03253023          	sd	s2,32(a0)
    80003836:	03353423          	sd	s3,40(a0)
    8000383a:	03453823          	sd	s4,48(a0)
    8000383e:	03553c23          	sd	s5,56(a0)
    80003842:	05653023          	sd	s6,64(a0)
    80003846:	05753423          	sd	s7,72(a0)
    8000384a:	05853823          	sd	s8,80(a0)
    8000384e:	05953c23          	sd	s9,88(a0)
    80003852:	07a53023          	sd	s10,96(a0)
    80003856:	07b53423          	sd	s11,104(a0)
    8000385a:	0005b083          	ld	ra,0(a1)
    8000385e:	0085b103          	ld	sp,8(a1)
    80003862:	6980                	ld	s0,16(a1)
    80003864:	6d84                	ld	s1,24(a1)
    80003866:	0205b903          	ld	s2,32(a1)
    8000386a:	0285b983          	ld	s3,40(a1)
    8000386e:	0305ba03          	ld	s4,48(a1)
    80003872:	0385ba83          	ld	s5,56(a1)
    80003876:	0405bb03          	ld	s6,64(a1)
    8000387a:	0485bb83          	ld	s7,72(a1)
    8000387e:	0505bc03          	ld	s8,80(a1)
    80003882:	0585bc83          	ld	s9,88(a1)
    80003886:	0605bd03          	ld	s10,96(a1)
    8000388a:	0685bd83          	ld	s11,104(a1)
    8000388e:	8082                	ret

0000000080003890 <r_sstatus>:
{
    80003890:	1101                	addi	sp,sp,-32
    80003892:	ec22                	sd	s0,24(sp)
    80003894:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80003896:	100027f3          	csrr	a5,sstatus
    8000389a:	fef43423          	sd	a5,-24(s0)
  return x;
    8000389e:	fe843783          	ld	a5,-24(s0)
}
    800038a2:	853e                	mv	a0,a5
    800038a4:	6462                	ld	s0,24(sp)
    800038a6:	6105                	addi	sp,sp,32
    800038a8:	8082                	ret

00000000800038aa <w_sstatus>:
{
    800038aa:	1101                	addi	sp,sp,-32
    800038ac:	ec22                	sd	s0,24(sp)
    800038ae:	1000                	addi	s0,sp,32
    800038b0:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800038b4:	fe843783          	ld	a5,-24(s0)
    800038b8:	10079073          	csrw	sstatus,a5
}
    800038bc:	0001                	nop
    800038be:	6462                	ld	s0,24(sp)
    800038c0:	6105                	addi	sp,sp,32
    800038c2:	8082                	ret

00000000800038c4 <r_sip>:
{
    800038c4:	1101                	addi	sp,sp,-32
    800038c6:	ec22                	sd	s0,24(sp)
    800038c8:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sip" : "=r" (x) );
    800038ca:	144027f3          	csrr	a5,sip
    800038ce:	fef43423          	sd	a5,-24(s0)
  return x;
    800038d2:	fe843783          	ld	a5,-24(s0)
}
    800038d6:	853e                	mv	a0,a5
    800038d8:	6462                	ld	s0,24(sp)
    800038da:	6105                	addi	sp,sp,32
    800038dc:	8082                	ret

00000000800038de <w_sip>:
{
    800038de:	1101                	addi	sp,sp,-32
    800038e0:	ec22                	sd	s0,24(sp)
    800038e2:	1000                	addi	s0,sp,32
    800038e4:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sip, %0" : : "r" (x));
    800038e8:	fe843783          	ld	a5,-24(s0)
    800038ec:	14479073          	csrw	sip,a5
}
    800038f0:	0001                	nop
    800038f2:	6462                	ld	s0,24(sp)
    800038f4:	6105                	addi	sp,sp,32
    800038f6:	8082                	ret

00000000800038f8 <w_sepc>:
{
    800038f8:	1101                	addi	sp,sp,-32
    800038fa:	ec22                	sd	s0,24(sp)
    800038fc:	1000                	addi	s0,sp,32
    800038fe:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80003902:	fe843783          	ld	a5,-24(s0)
    80003906:	14179073          	csrw	sepc,a5
}
    8000390a:	0001                	nop
    8000390c:	6462                	ld	s0,24(sp)
    8000390e:	6105                	addi	sp,sp,32
    80003910:	8082                	ret

0000000080003912 <r_sepc>:
{
    80003912:	1101                	addi	sp,sp,-32
    80003914:	ec22                	sd	s0,24(sp)
    80003916:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80003918:	141027f3          	csrr	a5,sepc
    8000391c:	fef43423          	sd	a5,-24(s0)
  return x;
    80003920:	fe843783          	ld	a5,-24(s0)
}
    80003924:	853e                	mv	a0,a5
    80003926:	6462                	ld	s0,24(sp)
    80003928:	6105                	addi	sp,sp,32
    8000392a:	8082                	ret

000000008000392c <w_stvec>:
{
    8000392c:	1101                	addi	sp,sp,-32
    8000392e:	ec22                	sd	s0,24(sp)
    80003930:	1000                	addi	s0,sp,32
    80003932:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw stvec, %0" : : "r" (x));
    80003936:	fe843783          	ld	a5,-24(s0)
    8000393a:	10579073          	csrw	stvec,a5
}
    8000393e:	0001                	nop
    80003940:	6462                	ld	s0,24(sp)
    80003942:	6105                	addi	sp,sp,32
    80003944:	8082                	ret

0000000080003946 <r_satp>:
{
    80003946:	1101                	addi	sp,sp,-32
    80003948:	ec22                	sd	s0,24(sp)
    8000394a:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, satp" : "=r" (x) );
    8000394c:	180027f3          	csrr	a5,satp
    80003950:	fef43423          	sd	a5,-24(s0)
  return x;
    80003954:	fe843783          	ld	a5,-24(s0)
}
    80003958:	853e                	mv	a0,a5
    8000395a:	6462                	ld	s0,24(sp)
    8000395c:	6105                	addi	sp,sp,32
    8000395e:	8082                	ret

0000000080003960 <r_scause>:
{
    80003960:	1101                	addi	sp,sp,-32
    80003962:	ec22                	sd	s0,24(sp)
    80003964:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80003966:	142027f3          	csrr	a5,scause
    8000396a:	fef43423          	sd	a5,-24(s0)
  return x;
    8000396e:	fe843783          	ld	a5,-24(s0)
}
    80003972:	853e                	mv	a0,a5
    80003974:	6462                	ld	s0,24(sp)
    80003976:	6105                	addi	sp,sp,32
    80003978:	8082                	ret

000000008000397a <r_stval>:
{
    8000397a:	1101                	addi	sp,sp,-32
    8000397c:	ec22                	sd	s0,24(sp)
    8000397e:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, stval" : "=r" (x) );
    80003980:	143027f3          	csrr	a5,stval
    80003984:	fef43423          	sd	a5,-24(s0)
  return x;
    80003988:	fe843783          	ld	a5,-24(s0)
}
    8000398c:	853e                	mv	a0,a5
    8000398e:	6462                	ld	s0,24(sp)
    80003990:	6105                	addi	sp,sp,32
    80003992:	8082                	ret

0000000080003994 <intr_on>:
{
    80003994:	1141                	addi	sp,sp,-16
    80003996:	e406                	sd	ra,8(sp)
    80003998:	e022                	sd	s0,0(sp)
    8000399a:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    8000399c:	00000097          	auipc	ra,0x0
    800039a0:	ef4080e7          	jalr	-268(ra) # 80003890 <r_sstatus>
    800039a4:	87aa                	mv	a5,a0
    800039a6:	0027e793          	ori	a5,a5,2
    800039aa:	853e                	mv	a0,a5
    800039ac:	00000097          	auipc	ra,0x0
    800039b0:	efe080e7          	jalr	-258(ra) # 800038aa <w_sstatus>
}
    800039b4:	0001                	nop
    800039b6:	60a2                	ld	ra,8(sp)
    800039b8:	6402                	ld	s0,0(sp)
    800039ba:	0141                	addi	sp,sp,16
    800039bc:	8082                	ret

00000000800039be <intr_off>:
{
    800039be:	1141                	addi	sp,sp,-16
    800039c0:	e406                	sd	ra,8(sp)
    800039c2:	e022                	sd	s0,0(sp)
    800039c4:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    800039c6:	00000097          	auipc	ra,0x0
    800039ca:	eca080e7          	jalr	-310(ra) # 80003890 <r_sstatus>
    800039ce:	87aa                	mv	a5,a0
    800039d0:	9bf5                	andi	a5,a5,-3
    800039d2:	853e                	mv	a0,a5
    800039d4:	00000097          	auipc	ra,0x0
    800039d8:	ed6080e7          	jalr	-298(ra) # 800038aa <w_sstatus>
}
    800039dc:	0001                	nop
    800039de:	60a2                	ld	ra,8(sp)
    800039e0:	6402                	ld	s0,0(sp)
    800039e2:	0141                	addi	sp,sp,16
    800039e4:	8082                	ret

00000000800039e6 <intr_get>:
{
    800039e6:	1101                	addi	sp,sp,-32
    800039e8:	ec06                	sd	ra,24(sp)
    800039ea:	e822                	sd	s0,16(sp)
    800039ec:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    800039ee:	00000097          	auipc	ra,0x0
    800039f2:	ea2080e7          	jalr	-350(ra) # 80003890 <r_sstatus>
    800039f6:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    800039fa:	fe843783          	ld	a5,-24(s0)
    800039fe:	8b89                	andi	a5,a5,2
    80003a00:	00f037b3          	snez	a5,a5
    80003a04:	0ff7f793          	andi	a5,a5,255
    80003a08:	2781                	sext.w	a5,a5
}
    80003a0a:	853e                	mv	a0,a5
    80003a0c:	60e2                	ld	ra,24(sp)
    80003a0e:	6442                	ld	s0,16(sp)
    80003a10:	6105                	addi	sp,sp,32
    80003a12:	8082                	ret

0000000080003a14 <r_tp>:
{
    80003a14:	1101                	addi	sp,sp,-32
    80003a16:	ec22                	sd	s0,24(sp)
    80003a18:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80003a1a:	8792                	mv	a5,tp
    80003a1c:	fef43423          	sd	a5,-24(s0)
  return x;
    80003a20:	fe843783          	ld	a5,-24(s0)
}
    80003a24:	853e                	mv	a0,a5
    80003a26:	6462                	ld	s0,24(sp)
    80003a28:	6105                	addi	sp,sp,32
    80003a2a:	8082                	ret

0000000080003a2c <trapinit>:

extern int devintr();

void
trapinit(void)
{
    80003a2c:	1141                	addi	sp,sp,-16
    80003a2e:	e406                	sd	ra,8(sp)
    80003a30:	e022                	sd	s0,0(sp)
    80003a32:	0800                	addi	s0,sp,16
  initlock(&tickslock, "time");
    80003a34:	00008597          	auipc	a1,0x8
    80003a38:	8ac58593          	addi	a1,a1,-1876 # 8000b2e0 <etext+0x2e0>
    80003a3c:	00016517          	auipc	a0,0x16
    80003a40:	6cc50513          	addi	a0,a0,1740 # 8001a108 <tickslock>
    80003a44:	ffffd097          	auipc	ra,0xffffd
    80003a48:	7fa080e7          	jalr	2042(ra) # 8000123e <initlock>
}
    80003a4c:	0001                	nop
    80003a4e:	60a2                	ld	ra,8(sp)
    80003a50:	6402                	ld	s0,0(sp)
    80003a52:	0141                	addi	sp,sp,16
    80003a54:	8082                	ret

0000000080003a56 <trapinithart>:

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80003a56:	1141                	addi	sp,sp,-16
    80003a58:	e406                	sd	ra,8(sp)
    80003a5a:	e022                	sd	s0,0(sp)
    80003a5c:	0800                	addi	s0,sp,16
  w_stvec((uint64)kernelvec);
    80003a5e:	00005797          	auipc	a5,0x5
    80003a62:	d9278793          	addi	a5,a5,-622 # 800087f0 <kernelvec>
    80003a66:	853e                	mv	a0,a5
    80003a68:	00000097          	auipc	ra,0x0
    80003a6c:	ec4080e7          	jalr	-316(ra) # 8000392c <w_stvec>
}
    80003a70:	0001                	nop
    80003a72:	60a2                	ld	ra,8(sp)
    80003a74:	6402                	ld	s0,0(sp)
    80003a76:	0141                	addi	sp,sp,16
    80003a78:	8082                	ret

0000000080003a7a <usertrap>:
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void
usertrap(void)
{
    80003a7a:	7179                	addi	sp,sp,-48
    80003a7c:	f406                	sd	ra,40(sp)
    80003a7e:	f022                	sd	s0,32(sp)
    80003a80:	ec26                	sd	s1,24(sp)
    80003a82:	1800                	addi	s0,sp,48
  int which_dev = 0;
    80003a84:	fc042e23          	sw	zero,-36(s0)

  if((r_sstatus() & SSTATUS_SPP) != 0)
    80003a88:	00000097          	auipc	ra,0x0
    80003a8c:	e08080e7          	jalr	-504(ra) # 80003890 <r_sstatus>
    80003a90:	87aa                	mv	a5,a0
    80003a92:	1007f793          	andi	a5,a5,256
    80003a96:	cb89                	beqz	a5,80003aa8 <usertrap+0x2e>
    panic("usertrap: not from user mode");
    80003a98:	00008517          	auipc	a0,0x8
    80003a9c:	85050513          	addi	a0,a0,-1968 # 8000b2e8 <etext+0x2e8>
    80003aa0:	ffffd097          	auipc	ra,0xffffd
    80003aa4:	1de080e7          	jalr	478(ra) # 80000c7e <panic>

  // send interrupts and exceptions to kerneltrap(),
  // since we're now in the kernel.
  w_stvec((uint64)kernelvec);
    80003aa8:	00005797          	auipc	a5,0x5
    80003aac:	d4878793          	addi	a5,a5,-696 # 800087f0 <kernelvec>
    80003ab0:	853e                	mv	a0,a5
    80003ab2:	00000097          	auipc	ra,0x0
    80003ab6:	e7a080e7          	jalr	-390(ra) # 8000392c <w_stvec>

  struct proc *p = myproc();
    80003aba:	fffff097          	auipc	ra,0xfffff
    80003abe:	d5e080e7          	jalr	-674(ra) # 80002818 <myproc>
    80003ac2:	fca43823          	sd	a0,-48(s0)
  
  // save user program counter.
  p->trapframe->epc = r_sepc();
    80003ac6:	fd043783          	ld	a5,-48(s0)
    80003aca:	6fa4                	ld	s1,88(a5)
    80003acc:	00000097          	auipc	ra,0x0
    80003ad0:	e46080e7          	jalr	-442(ra) # 80003912 <r_sepc>
    80003ad4:	87aa                	mv	a5,a0
    80003ad6:	ec9c                	sd	a5,24(s1)
  
  if(r_scause() == 8){
    80003ad8:	00000097          	auipc	ra,0x0
    80003adc:	e88080e7          	jalr	-376(ra) # 80003960 <r_scause>
    80003ae0:	872a                	mv	a4,a0
    80003ae2:	47a1                	li	a5,8
    80003ae4:	02f71d63          	bne	a4,a5,80003b1e <usertrap+0xa4>
    // system call

    if(p->killed)
    80003ae8:	fd043783          	ld	a5,-48(s0)
    80003aec:	579c                	lw	a5,40(a5)
    80003aee:	c791                	beqz	a5,80003afa <usertrap+0x80>
      exit(-1);
    80003af0:	557d                	li	a0,-1
    80003af2:	fffff097          	auipc	ra,0xfffff
    80003af6:	432080e7          	jalr	1074(ra) # 80002f24 <exit>

    // sepc points to the ecall instruction,
    // but we want to return to the next instruction.
    p->trapframe->epc += 4;
    80003afa:	fd043783          	ld	a5,-48(s0)
    80003afe:	6fbc                	ld	a5,88(a5)
    80003b00:	6f98                	ld	a4,24(a5)
    80003b02:	fd043783          	ld	a5,-48(s0)
    80003b06:	6fbc                	ld	a5,88(a5)
    80003b08:	0711                	addi	a4,a4,4
    80003b0a:	ef98                	sd	a4,24(a5)

    // an interrupt will change sstatus &c registers,
    // so don't enable until done with those registers.
    intr_on();
    80003b0c:	00000097          	auipc	ra,0x0
    80003b10:	e88080e7          	jalr	-376(ra) # 80003994 <intr_on>

    syscall();
    80003b14:	00000097          	auipc	ra,0x0
    80003b18:	67e080e7          	jalr	1662(ra) # 80004192 <syscall>
    80003b1c:	a0b5                	j	80003b88 <usertrap+0x10e>
  } else if((which_dev = devintr()) != 0){
    80003b1e:	00000097          	auipc	ra,0x0
    80003b22:	346080e7          	jalr	838(ra) # 80003e64 <devintr>
    80003b26:	87aa                	mv	a5,a0
    80003b28:	fcf42e23          	sw	a5,-36(s0)
    80003b2c:	fdc42783          	lw	a5,-36(s0)
    80003b30:	2781                	sext.w	a5,a5
    80003b32:	ebb9                	bnez	a5,80003b88 <usertrap+0x10e>
    // ok
  } else {
    printf("usertrap(): unexpected scause %p pid=%d\n", r_scause(), p->pid);
    80003b34:	00000097          	auipc	ra,0x0
    80003b38:	e2c080e7          	jalr	-468(ra) # 80003960 <r_scause>
    80003b3c:	872a                	mv	a4,a0
    80003b3e:	fd043783          	ld	a5,-48(s0)
    80003b42:	5b9c                	lw	a5,48(a5)
    80003b44:	863e                	mv	a2,a5
    80003b46:	85ba                	mv	a1,a4
    80003b48:	00007517          	auipc	a0,0x7
    80003b4c:	7c050513          	addi	a0,a0,1984 # 8000b308 <etext+0x308>
    80003b50:	ffffd097          	auipc	ra,0xffffd
    80003b54:	ed8080e7          	jalr	-296(ra) # 80000a28 <printf>
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003b58:	00000097          	auipc	ra,0x0
    80003b5c:	dba080e7          	jalr	-582(ra) # 80003912 <r_sepc>
    80003b60:	84aa                	mv	s1,a0
    80003b62:	00000097          	auipc	ra,0x0
    80003b66:	e18080e7          	jalr	-488(ra) # 8000397a <r_stval>
    80003b6a:	87aa                	mv	a5,a0
    80003b6c:	863e                	mv	a2,a5
    80003b6e:	85a6                	mv	a1,s1
    80003b70:	00007517          	auipc	a0,0x7
    80003b74:	7c850513          	addi	a0,a0,1992 # 8000b338 <etext+0x338>
    80003b78:	ffffd097          	auipc	ra,0xffffd
    80003b7c:	eb0080e7          	jalr	-336(ra) # 80000a28 <printf>
    p->killed = 1;
    80003b80:	fd043783          	ld	a5,-48(s0)
    80003b84:	4705                	li	a4,1
    80003b86:	d798                	sw	a4,40(a5)
  }

  if(p->killed)
    80003b88:	fd043783          	ld	a5,-48(s0)
    80003b8c:	579c                	lw	a5,40(a5)
    80003b8e:	c791                	beqz	a5,80003b9a <usertrap+0x120>
    exit(-1);
    80003b90:	557d                	li	a0,-1
    80003b92:	fffff097          	auipc	ra,0xfffff
    80003b96:	392080e7          	jalr	914(ra) # 80002f24 <exit>

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2)
    80003b9a:	fdc42783          	lw	a5,-36(s0)
    80003b9e:	0007871b          	sext.w	a4,a5
    80003ba2:	4789                	li	a5,2
    80003ba4:	00f71663          	bne	a4,a5,80003bb0 <usertrap+0x136>
    yield();
    80003ba8:	00000097          	auipc	ra,0x0
    80003bac:	85e080e7          	jalr	-1954(ra) # 80003406 <yield>

  usertrapret();
    80003bb0:	00000097          	auipc	ra,0x0
    80003bb4:	014080e7          	jalr	20(ra) # 80003bc4 <usertrapret>
}
    80003bb8:	0001                	nop
    80003bba:	70a2                	ld	ra,40(sp)
    80003bbc:	7402                	ld	s0,32(sp)
    80003bbe:	64e2                	ld	s1,24(sp)
    80003bc0:	6145                	addi	sp,sp,48
    80003bc2:	8082                	ret

0000000080003bc4 <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80003bc4:	7139                	addi	sp,sp,-64
    80003bc6:	fc06                	sd	ra,56(sp)
    80003bc8:	f822                	sd	s0,48(sp)
    80003bca:	f426                	sd	s1,40(sp)
    80003bcc:	0080                	addi	s0,sp,64
  struct proc *p = myproc();
    80003bce:	fffff097          	auipc	ra,0xfffff
    80003bd2:	c4a080e7          	jalr	-950(ra) # 80002818 <myproc>
    80003bd6:	fca43c23          	sd	a0,-40(s0)

  // we're about to switch the destination of traps from
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();
    80003bda:	00000097          	auipc	ra,0x0
    80003bde:	de4080e7          	jalr	-540(ra) # 800039be <intr_off>

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    80003be2:	00006717          	auipc	a4,0x6
    80003be6:	41e70713          	addi	a4,a4,1054 # 8000a000 <_trampoline>
    80003bea:	00006797          	auipc	a5,0x6
    80003bee:	41678793          	addi	a5,a5,1046 # 8000a000 <_trampoline>
    80003bf2:	8f1d                	sub	a4,a4,a5
    80003bf4:	040007b7          	lui	a5,0x4000
    80003bf8:	17fd                	addi	a5,a5,-1
    80003bfa:	07b2                	slli	a5,a5,0xc
    80003bfc:	97ba                	add	a5,a5,a4
    80003bfe:	853e                	mv	a0,a5
    80003c00:	00000097          	auipc	ra,0x0
    80003c04:	d2c080e7          	jalr	-724(ra) # 8000392c <w_stvec>

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80003c08:	fd843783          	ld	a5,-40(s0)
    80003c0c:	6fa4                	ld	s1,88(a5)
    80003c0e:	00000097          	auipc	ra,0x0
    80003c12:	d38080e7          	jalr	-712(ra) # 80003946 <r_satp>
    80003c16:	87aa                	mv	a5,a0
    80003c18:	e09c                	sd	a5,0(s1)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80003c1a:	fd843783          	ld	a5,-40(s0)
    80003c1e:	63b4                	ld	a3,64(a5)
    80003c20:	fd843783          	ld	a5,-40(s0)
    80003c24:	6fbc                	ld	a5,88(a5)
    80003c26:	6705                	lui	a4,0x1
    80003c28:	9736                	add	a4,a4,a3
    80003c2a:	e798                	sd	a4,8(a5)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80003c2c:	fd843783          	ld	a5,-40(s0)
    80003c30:	6fbc                	ld	a5,88(a5)
    80003c32:	00000717          	auipc	a4,0x0
    80003c36:	e4870713          	addi	a4,a4,-440 # 80003a7a <usertrap>
    80003c3a:	eb98                	sd	a4,16(a5)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80003c3c:	fd843783          	ld	a5,-40(s0)
    80003c40:	6fa4                	ld	s1,88(a5)
    80003c42:	00000097          	auipc	ra,0x0
    80003c46:	dd2080e7          	jalr	-558(ra) # 80003a14 <r_tp>
    80003c4a:	87aa                	mv	a5,a0
    80003c4c:	f09c                	sd	a5,32(s1)

  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
    80003c4e:	00000097          	auipc	ra,0x0
    80003c52:	c42080e7          	jalr	-958(ra) # 80003890 <r_sstatus>
    80003c56:	fca43823          	sd	a0,-48(s0)
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80003c5a:	fd043783          	ld	a5,-48(s0)
    80003c5e:	eff7f793          	andi	a5,a5,-257
    80003c62:	fcf43823          	sd	a5,-48(s0)
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80003c66:	fd043783          	ld	a5,-48(s0)
    80003c6a:	0207e793          	ori	a5,a5,32
    80003c6e:	fcf43823          	sd	a5,-48(s0)
  w_sstatus(x);
    80003c72:	fd043503          	ld	a0,-48(s0)
    80003c76:	00000097          	auipc	ra,0x0
    80003c7a:	c34080e7          	jalr	-972(ra) # 800038aa <w_sstatus>

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80003c7e:	fd843783          	ld	a5,-40(s0)
    80003c82:	6fbc                	ld	a5,88(a5)
    80003c84:	6f9c                	ld	a5,24(a5)
    80003c86:	853e                	mv	a0,a5
    80003c88:	00000097          	auipc	ra,0x0
    80003c8c:	c70080e7          	jalr	-912(ra) # 800038f8 <w_sepc>

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);
    80003c90:	fd843783          	ld	a5,-40(s0)
    80003c94:	6bbc                	ld	a5,80(a5)
    80003c96:	00c7d713          	srli	a4,a5,0xc
    80003c9a:	57fd                	li	a5,-1
    80003c9c:	17fe                	slli	a5,a5,0x3f
    80003c9e:	8fd9                	or	a5,a5,a4
    80003ca0:	fcf43423          	sd	a5,-56(s0)

  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    80003ca4:	00006717          	auipc	a4,0x6
    80003ca8:	3ec70713          	addi	a4,a4,1004 # 8000a090 <userret>
    80003cac:	00006797          	auipc	a5,0x6
    80003cb0:	35478793          	addi	a5,a5,852 # 8000a000 <_trampoline>
    80003cb4:	8f1d                	sub	a4,a4,a5
    80003cb6:	040007b7          	lui	a5,0x4000
    80003cba:	17fd                	addi	a5,a5,-1
    80003cbc:	07b2                	slli	a5,a5,0xc
    80003cbe:	97ba                	add	a5,a5,a4
    80003cc0:	fcf43023          	sd	a5,-64(s0)
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    80003cc4:	fc043703          	ld	a4,-64(s0)
    80003cc8:	fc843583          	ld	a1,-56(s0)
    80003ccc:	020007b7          	lui	a5,0x2000
    80003cd0:	17fd                	addi	a5,a5,-1
    80003cd2:	00d79513          	slli	a0,a5,0xd
    80003cd6:	9702                	jalr	a4
}
    80003cd8:	0001                	nop
    80003cda:	70e2                	ld	ra,56(sp)
    80003cdc:	7442                	ld	s0,48(sp)
    80003cde:	74a2                	ld	s1,40(sp)
    80003ce0:	6121                	addi	sp,sp,64
    80003ce2:	8082                	ret

0000000080003ce4 <kerneltrap>:

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void 
kerneltrap()
{
    80003ce4:	7139                	addi	sp,sp,-64
    80003ce6:	fc06                	sd	ra,56(sp)
    80003ce8:	f822                	sd	s0,48(sp)
    80003cea:	f426                	sd	s1,40(sp)
    80003cec:	0080                	addi	s0,sp,64
  int which_dev = 0;
    80003cee:	fc042e23          	sw	zero,-36(s0)
  uint64 sepc = r_sepc();
    80003cf2:	00000097          	auipc	ra,0x0
    80003cf6:	c20080e7          	jalr	-992(ra) # 80003912 <r_sepc>
    80003cfa:	fca43823          	sd	a0,-48(s0)
  uint64 sstatus = r_sstatus();
    80003cfe:	00000097          	auipc	ra,0x0
    80003d02:	b92080e7          	jalr	-1134(ra) # 80003890 <r_sstatus>
    80003d06:	fca43423          	sd	a0,-56(s0)
  uint64 scause = r_scause();
    80003d0a:	00000097          	auipc	ra,0x0
    80003d0e:	c56080e7          	jalr	-938(ra) # 80003960 <r_scause>
    80003d12:	fca43023          	sd	a0,-64(s0)
  
  if((sstatus & SSTATUS_SPP) == 0)
    80003d16:	fc843783          	ld	a5,-56(s0)
    80003d1a:	1007f793          	andi	a5,a5,256
    80003d1e:	eb89                	bnez	a5,80003d30 <kerneltrap+0x4c>
    panic("kerneltrap: not from supervisor mode");
    80003d20:	00007517          	auipc	a0,0x7
    80003d24:	63850513          	addi	a0,a0,1592 # 8000b358 <etext+0x358>
    80003d28:	ffffd097          	auipc	ra,0xffffd
    80003d2c:	f56080e7          	jalr	-170(ra) # 80000c7e <panic>
  if(intr_get() != 0)
    80003d30:	00000097          	auipc	ra,0x0
    80003d34:	cb6080e7          	jalr	-842(ra) # 800039e6 <intr_get>
    80003d38:	87aa                	mv	a5,a0
    80003d3a:	cb89                	beqz	a5,80003d4c <kerneltrap+0x68>
    panic("kerneltrap: interrupts enabled");
    80003d3c:	00007517          	auipc	a0,0x7
    80003d40:	64450513          	addi	a0,a0,1604 # 8000b380 <etext+0x380>
    80003d44:	ffffd097          	auipc	ra,0xffffd
    80003d48:	f3a080e7          	jalr	-198(ra) # 80000c7e <panic>

  if((which_dev = devintr()) == 0){
    80003d4c:	00000097          	auipc	ra,0x0
    80003d50:	118080e7          	jalr	280(ra) # 80003e64 <devintr>
    80003d54:	87aa                	mv	a5,a0
    80003d56:	fcf42e23          	sw	a5,-36(s0)
    80003d5a:	fdc42783          	lw	a5,-36(s0)
    80003d5e:	2781                	sext.w	a5,a5
    80003d60:	e7b9                	bnez	a5,80003dae <kerneltrap+0xca>
    printf("scause %p\n", scause);
    80003d62:	fc043583          	ld	a1,-64(s0)
    80003d66:	00007517          	auipc	a0,0x7
    80003d6a:	63a50513          	addi	a0,a0,1594 # 8000b3a0 <etext+0x3a0>
    80003d6e:	ffffd097          	auipc	ra,0xffffd
    80003d72:	cba080e7          	jalr	-838(ra) # 80000a28 <printf>
    printf("sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003d76:	00000097          	auipc	ra,0x0
    80003d7a:	b9c080e7          	jalr	-1124(ra) # 80003912 <r_sepc>
    80003d7e:	84aa                	mv	s1,a0
    80003d80:	00000097          	auipc	ra,0x0
    80003d84:	bfa080e7          	jalr	-1030(ra) # 8000397a <r_stval>
    80003d88:	87aa                	mv	a5,a0
    80003d8a:	863e                	mv	a2,a5
    80003d8c:	85a6                	mv	a1,s1
    80003d8e:	00007517          	auipc	a0,0x7
    80003d92:	62250513          	addi	a0,a0,1570 # 8000b3b0 <etext+0x3b0>
    80003d96:	ffffd097          	auipc	ra,0xffffd
    80003d9a:	c92080e7          	jalr	-878(ra) # 80000a28 <printf>
    panic("kerneltrap");
    80003d9e:	00007517          	auipc	a0,0x7
    80003da2:	62a50513          	addi	a0,a0,1578 # 8000b3c8 <etext+0x3c8>
    80003da6:	ffffd097          	auipc	ra,0xffffd
    80003daa:	ed8080e7          	jalr	-296(ra) # 80000c7e <panic>
  }

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING)
    80003dae:	fdc42783          	lw	a5,-36(s0)
    80003db2:	0007871b          	sext.w	a4,a5
    80003db6:	4789                	li	a5,2
    80003db8:	02f71663          	bne	a4,a5,80003de4 <kerneltrap+0x100>
    80003dbc:	fffff097          	auipc	ra,0xfffff
    80003dc0:	a5c080e7          	jalr	-1444(ra) # 80002818 <myproc>
    80003dc4:	87aa                	mv	a5,a0
    80003dc6:	cf99                	beqz	a5,80003de4 <kerneltrap+0x100>
    80003dc8:	fffff097          	auipc	ra,0xfffff
    80003dcc:	a50080e7          	jalr	-1456(ra) # 80002818 <myproc>
    80003dd0:	87aa                	mv	a5,a0
    80003dd2:	4f9c                	lw	a5,24(a5)
    80003dd4:	873e                	mv	a4,a5
    80003dd6:	4791                	li	a5,4
    80003dd8:	00f71663          	bne	a4,a5,80003de4 <kerneltrap+0x100>
    yield();
    80003ddc:	fffff097          	auipc	ra,0xfffff
    80003de0:	62a080e7          	jalr	1578(ra) # 80003406 <yield>

  // the yield() may have caused some traps to occur,
  // so restore trap registers for use by kernelvec.S's sepc instruction.
  w_sepc(sepc);
    80003de4:	fd043503          	ld	a0,-48(s0)
    80003de8:	00000097          	auipc	ra,0x0
    80003dec:	b10080e7          	jalr	-1264(ra) # 800038f8 <w_sepc>
  w_sstatus(sstatus);
    80003df0:	fc843503          	ld	a0,-56(s0)
    80003df4:	00000097          	auipc	ra,0x0
    80003df8:	ab6080e7          	jalr	-1354(ra) # 800038aa <w_sstatus>
}
    80003dfc:	0001                	nop
    80003dfe:	70e2                	ld	ra,56(sp)
    80003e00:	7442                	ld	s0,48(sp)
    80003e02:	74a2                	ld	s1,40(sp)
    80003e04:	6121                	addi	sp,sp,64
    80003e06:	8082                	ret

0000000080003e08 <clockintr>:

void
clockintr()
{
    80003e08:	1141                	addi	sp,sp,-16
    80003e0a:	e406                	sd	ra,8(sp)
    80003e0c:	e022                	sd	s0,0(sp)
    80003e0e:	0800                	addi	s0,sp,16
  acquire(&tickslock);
    80003e10:	00016517          	auipc	a0,0x16
    80003e14:	2f850513          	addi	a0,a0,760 # 8001a108 <tickslock>
    80003e18:	ffffd097          	auipc	ra,0xffffd
    80003e1c:	456080e7          	jalr	1110(ra) # 8000126e <acquire>
  ticks++;
    80003e20:	00008797          	auipc	a5,0x8
    80003e24:	20878793          	addi	a5,a5,520 # 8000c028 <ticks>
    80003e28:	439c                	lw	a5,0(a5)
    80003e2a:	2785                	addiw	a5,a5,1
    80003e2c:	0007871b          	sext.w	a4,a5
    80003e30:	00008797          	auipc	a5,0x8
    80003e34:	1f878793          	addi	a5,a5,504 # 8000c028 <ticks>
    80003e38:	c398                	sw	a4,0(a5)
  wakeup(&ticks);
    80003e3a:	00008517          	auipc	a0,0x8
    80003e3e:	1ee50513          	addi	a0,a0,494 # 8000c028 <ticks>
    80003e42:	fffff097          	auipc	ra,0xfffff
    80003e46:	6de080e7          	jalr	1758(ra) # 80003520 <wakeup>
  release(&tickslock);
    80003e4a:	00016517          	auipc	a0,0x16
    80003e4e:	2be50513          	addi	a0,a0,702 # 8001a108 <tickslock>
    80003e52:	ffffd097          	auipc	ra,0xffffd
    80003e56:	480080e7          	jalr	1152(ra) # 800012d2 <release>
}
    80003e5a:	0001                	nop
    80003e5c:	60a2                	ld	ra,8(sp)
    80003e5e:	6402                	ld	s0,0(sp)
    80003e60:	0141                	addi	sp,sp,16
    80003e62:	8082                	ret

0000000080003e64 <devintr>:
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()
{
    80003e64:	1101                	addi	sp,sp,-32
    80003e66:	ec06                	sd	ra,24(sp)
    80003e68:	e822                	sd	s0,16(sp)
    80003e6a:	1000                	addi	s0,sp,32
  uint64 scause = r_scause();
    80003e6c:	00000097          	auipc	ra,0x0
    80003e70:	af4080e7          	jalr	-1292(ra) # 80003960 <r_scause>
    80003e74:	fea43423          	sd	a0,-24(s0)

  if((scause & 0x8000000000000000L) &&
    80003e78:	fe843783          	ld	a5,-24(s0)
    80003e7c:	0807d463          	bgez	a5,80003f04 <devintr+0xa0>
     (scause & 0xff) == 9){
    80003e80:	fe843783          	ld	a5,-24(s0)
    80003e84:	0ff7f713          	andi	a4,a5,255
  if((scause & 0x8000000000000000L) &&
    80003e88:	47a5                	li	a5,9
    80003e8a:	06f71d63          	bne	a4,a5,80003f04 <devintr+0xa0>
    // this is a supervisor external interrupt, via PLIC.

    // irq indicates which device interrupted.
    int irq = plic_claim();
    80003e8e:	00005097          	auipc	ra,0x5
    80003e92:	a94080e7          	jalr	-1388(ra) # 80008922 <plic_claim>
    80003e96:	87aa                	mv	a5,a0
    80003e98:	fef42223          	sw	a5,-28(s0)

    if(irq == UART0_IRQ){
    80003e9c:	fe442783          	lw	a5,-28(s0)
    80003ea0:	0007871b          	sext.w	a4,a5
    80003ea4:	47a9                	li	a5,10
    80003ea6:	00f71763          	bne	a4,a5,80003eb4 <devintr+0x50>
      uartintr();
    80003eaa:	ffffd097          	auipc	ra,0xffffd
    80003eae:	0cc080e7          	jalr	204(ra) # 80000f76 <uartintr>
    80003eb2:	a825                	j	80003eea <devintr+0x86>
    } else if(irq == VIRTIO0_IRQ){
    80003eb4:	fe442783          	lw	a5,-28(s0)
    80003eb8:	0007871b          	sext.w	a4,a5
    80003ebc:	4785                	li	a5,1
    80003ebe:	00f71763          	bne	a4,a5,80003ecc <devintr+0x68>
      virtio_disk_intr();
    80003ec2:	00005097          	auipc	ra,0x5
    80003ec6:	374080e7          	jalr	884(ra) # 80009236 <virtio_disk_intr>
    80003eca:	a005                	j	80003eea <devintr+0x86>
    } else if(irq){
    80003ecc:	fe442783          	lw	a5,-28(s0)
    80003ed0:	2781                	sext.w	a5,a5
    80003ed2:	cf81                	beqz	a5,80003eea <devintr+0x86>
      printf("unexpected interrupt irq=%d\n", irq);
    80003ed4:	fe442783          	lw	a5,-28(s0)
    80003ed8:	85be                	mv	a1,a5
    80003eda:	00007517          	auipc	a0,0x7
    80003ede:	4fe50513          	addi	a0,a0,1278 # 8000b3d8 <etext+0x3d8>
    80003ee2:	ffffd097          	auipc	ra,0xffffd
    80003ee6:	b46080e7          	jalr	-1210(ra) # 80000a28 <printf>
    }

    // the PLIC allows each device to raise at most one
    // interrupt at a time; tell the PLIC the device is
    // now allowed to interrupt again.
    if(irq)
    80003eea:	fe442783          	lw	a5,-28(s0)
    80003eee:	2781                	sext.w	a5,a5
    80003ef0:	cb81                	beqz	a5,80003f00 <devintr+0x9c>
      plic_complete(irq);
    80003ef2:	fe442783          	lw	a5,-28(s0)
    80003ef6:	853e                	mv	a0,a5
    80003ef8:	00005097          	auipc	ra,0x5
    80003efc:	a68080e7          	jalr	-1432(ra) # 80008960 <plic_complete>

    return 1;
    80003f00:	4785                	li	a5,1
    80003f02:	a081                	j	80003f42 <devintr+0xde>
  } else if(scause == 0x8000000000000001L){
    80003f04:	fe843703          	ld	a4,-24(s0)
    80003f08:	57fd                	li	a5,-1
    80003f0a:	17fe                	slli	a5,a5,0x3f
    80003f0c:	0785                	addi	a5,a5,1
    80003f0e:	02f71963          	bne	a4,a5,80003f40 <devintr+0xdc>
    // software interrupt from a machine-mode timer interrupt,
    // forwarded by timervec in kernelvec.S.

    if(cpuid() == 0){
    80003f12:	fffff097          	auipc	ra,0xfffff
    80003f16:	8a4080e7          	jalr	-1884(ra) # 800027b6 <cpuid>
    80003f1a:	87aa                	mv	a5,a0
    80003f1c:	e789                	bnez	a5,80003f26 <devintr+0xc2>
      clockintr();
    80003f1e:	00000097          	auipc	ra,0x0
    80003f22:	eea080e7          	jalr	-278(ra) # 80003e08 <clockintr>
    }
    
    // acknowledge the software interrupt by clearing
    // the SSIP bit in sip.
    w_sip(r_sip() & ~2);
    80003f26:	00000097          	auipc	ra,0x0
    80003f2a:	99e080e7          	jalr	-1634(ra) # 800038c4 <r_sip>
    80003f2e:	87aa                	mv	a5,a0
    80003f30:	9bf5                	andi	a5,a5,-3
    80003f32:	853e                	mv	a0,a5
    80003f34:	00000097          	auipc	ra,0x0
    80003f38:	9aa080e7          	jalr	-1622(ra) # 800038de <w_sip>

    return 2;
    80003f3c:	4789                	li	a5,2
    80003f3e:	a011                	j	80003f42 <devintr+0xde>
  } else {
    return 0;
    80003f40:	4781                	li	a5,0
  }
}
    80003f42:	853e                	mv	a0,a5
    80003f44:	60e2                	ld	ra,24(sp)
    80003f46:	6442                	ld	s0,16(sp)
    80003f48:	6105                	addi	sp,sp,32
    80003f4a:	8082                	ret

0000000080003f4c <fetchaddr>:
#include "defs.h"

// Fetch the uint64 at addr from the current process.
int
fetchaddr(uint64 addr, uint64 *ip)
{
    80003f4c:	7179                	addi	sp,sp,-48
    80003f4e:	f406                	sd	ra,40(sp)
    80003f50:	f022                	sd	s0,32(sp)
    80003f52:	1800                	addi	s0,sp,48
    80003f54:	fca43c23          	sd	a0,-40(s0)
    80003f58:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    80003f5c:	fffff097          	auipc	ra,0xfffff
    80003f60:	8bc080e7          	jalr	-1860(ra) # 80002818 <myproc>
    80003f64:	fea43423          	sd	a0,-24(s0)
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    80003f68:	fe843783          	ld	a5,-24(s0)
    80003f6c:	67bc                	ld	a5,72(a5)
    80003f6e:	fd843703          	ld	a4,-40(s0)
    80003f72:	00f77b63          	bgeu	a4,a5,80003f88 <fetchaddr+0x3c>
    80003f76:	fd843783          	ld	a5,-40(s0)
    80003f7a:	00878713          	addi	a4,a5,8
    80003f7e:	fe843783          	ld	a5,-24(s0)
    80003f82:	67bc                	ld	a5,72(a5)
    80003f84:	00e7f463          	bgeu	a5,a4,80003f8c <fetchaddr+0x40>
    return -1;
    80003f88:	57fd                	li	a5,-1
    80003f8a:	a01d                	j	80003fb0 <fetchaddr+0x64>
  if(copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    80003f8c:	fe843783          	ld	a5,-24(s0)
    80003f90:	6bbc                	ld	a5,80(a5)
    80003f92:	46a1                	li	a3,8
    80003f94:	fd843603          	ld	a2,-40(s0)
    80003f98:	fd043583          	ld	a1,-48(s0)
    80003f9c:	853e                	mv	a0,a5
    80003f9e:	ffffe097          	auipc	ra,0xffffe
    80003fa2:	416080e7          	jalr	1046(ra) # 800023b4 <copyin>
    80003fa6:	87aa                	mv	a5,a0
    80003fa8:	c399                	beqz	a5,80003fae <fetchaddr+0x62>
    return -1;
    80003faa:	57fd                	li	a5,-1
    80003fac:	a011                	j	80003fb0 <fetchaddr+0x64>
  return 0;
    80003fae:	4781                	li	a5,0
}
    80003fb0:	853e                	mv	a0,a5
    80003fb2:	70a2                	ld	ra,40(sp)
    80003fb4:	7402                	ld	s0,32(sp)
    80003fb6:	6145                	addi	sp,sp,48
    80003fb8:	8082                	ret

0000000080003fba <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Returns length of string, not including nul, or -1 for error.
int
fetchstr(uint64 addr, char *buf, int max)
{
    80003fba:	7139                	addi	sp,sp,-64
    80003fbc:	fc06                	sd	ra,56(sp)
    80003fbe:	f822                	sd	s0,48(sp)
    80003fc0:	0080                	addi	s0,sp,64
    80003fc2:	fca43c23          	sd	a0,-40(s0)
    80003fc6:	fcb43823          	sd	a1,-48(s0)
    80003fca:	87b2                	mv	a5,a2
    80003fcc:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80003fd0:	fffff097          	auipc	ra,0xfffff
    80003fd4:	848080e7          	jalr	-1976(ra) # 80002818 <myproc>
    80003fd8:	fea43423          	sd	a0,-24(s0)
  int err = copyinstr(p->pagetable, buf, addr, max);
    80003fdc:	fe843783          	ld	a5,-24(s0)
    80003fe0:	6bbc                	ld	a5,80(a5)
    80003fe2:	fcc42703          	lw	a4,-52(s0)
    80003fe6:	86ba                	mv	a3,a4
    80003fe8:	fd843603          	ld	a2,-40(s0)
    80003fec:	fd043583          	ld	a1,-48(s0)
    80003ff0:	853e                	mv	a0,a5
    80003ff2:	ffffe097          	auipc	ra,0xffffe
    80003ff6:	490080e7          	jalr	1168(ra) # 80002482 <copyinstr>
    80003ffa:	87aa                	mv	a5,a0
    80003ffc:	fef42223          	sw	a5,-28(s0)
  if(err < 0)
    80004000:	fe442783          	lw	a5,-28(s0)
    80004004:	2781                	sext.w	a5,a5
    80004006:	0007d563          	bgez	a5,80004010 <fetchstr+0x56>
    return err;
    8000400a:	fe442783          	lw	a5,-28(s0)
    8000400e:	a801                	j	8000401e <fetchstr+0x64>
  return strlen(buf);
    80004010:	fd043503          	ld	a0,-48(s0)
    80004014:	ffffd097          	auipc	ra,0xffffd
    80004018:	7ac080e7          	jalr	1964(ra) # 800017c0 <strlen>
    8000401c:	87aa                	mv	a5,a0
}
    8000401e:	853e                	mv	a0,a5
    80004020:	70e2                	ld	ra,56(sp)
    80004022:	7442                	ld	s0,48(sp)
    80004024:	6121                	addi	sp,sp,64
    80004026:	8082                	ret

0000000080004028 <argraw>:

static uint64
argraw(int n)
{
    80004028:	7179                	addi	sp,sp,-48
    8000402a:	f406                	sd	ra,40(sp)
    8000402c:	f022                	sd	s0,32(sp)
    8000402e:	1800                	addi	s0,sp,48
    80004030:	87aa                	mv	a5,a0
    80004032:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    80004036:	ffffe097          	auipc	ra,0xffffe
    8000403a:	7e2080e7          	jalr	2018(ra) # 80002818 <myproc>
    8000403e:	fea43423          	sd	a0,-24(s0)
    80004042:	fdc42783          	lw	a5,-36(s0)
    80004046:	0007871b          	sext.w	a4,a5
    8000404a:	4795                	li	a5,5
    8000404c:	06e7e263          	bltu	a5,a4,800040b0 <argraw+0x88>
    80004050:	fdc46783          	lwu	a5,-36(s0)
    80004054:	00279713          	slli	a4,a5,0x2
    80004058:	00007797          	auipc	a5,0x7
    8000405c:	3a878793          	addi	a5,a5,936 # 8000b400 <etext+0x400>
    80004060:	97ba                	add	a5,a5,a4
    80004062:	439c                	lw	a5,0(a5)
    80004064:	0007871b          	sext.w	a4,a5
    80004068:	00007797          	auipc	a5,0x7
    8000406c:	39878793          	addi	a5,a5,920 # 8000b400 <etext+0x400>
    80004070:	97ba                	add	a5,a5,a4
    80004072:	8782                	jr	a5
  switch (n) {
  case 0:
    return p->trapframe->a0;
    80004074:	fe843783          	ld	a5,-24(s0)
    80004078:	6fbc                	ld	a5,88(a5)
    8000407a:	7bbc                	ld	a5,112(a5)
    8000407c:	a091                	j	800040c0 <argraw+0x98>
  case 1:
    return p->trapframe->a1;
    8000407e:	fe843783          	ld	a5,-24(s0)
    80004082:	6fbc                	ld	a5,88(a5)
    80004084:	7fbc                	ld	a5,120(a5)
    80004086:	a82d                	j	800040c0 <argraw+0x98>
  case 2:
    return p->trapframe->a2;
    80004088:	fe843783          	ld	a5,-24(s0)
    8000408c:	6fbc                	ld	a5,88(a5)
    8000408e:	63dc                	ld	a5,128(a5)
    80004090:	a805                	j	800040c0 <argraw+0x98>
  case 3:
    return p->trapframe->a3;
    80004092:	fe843783          	ld	a5,-24(s0)
    80004096:	6fbc                	ld	a5,88(a5)
    80004098:	67dc                	ld	a5,136(a5)
    8000409a:	a01d                	j	800040c0 <argraw+0x98>
  case 4:
    return p->trapframe->a4;
    8000409c:	fe843783          	ld	a5,-24(s0)
    800040a0:	6fbc                	ld	a5,88(a5)
    800040a2:	6bdc                	ld	a5,144(a5)
    800040a4:	a831                	j	800040c0 <argraw+0x98>
  case 5:
    return p->trapframe->a5;
    800040a6:	fe843783          	ld	a5,-24(s0)
    800040aa:	6fbc                	ld	a5,88(a5)
    800040ac:	6fdc                	ld	a5,152(a5)
    800040ae:	a809                	j	800040c0 <argraw+0x98>
  }
  panic("argraw");
    800040b0:	00007517          	auipc	a0,0x7
    800040b4:	34850513          	addi	a0,a0,840 # 8000b3f8 <etext+0x3f8>
    800040b8:	ffffd097          	auipc	ra,0xffffd
    800040bc:	bc6080e7          	jalr	-1082(ra) # 80000c7e <panic>
  return -1;
}
    800040c0:	853e                	mv	a0,a5
    800040c2:	70a2                	ld	ra,40(sp)
    800040c4:	7402                	ld	s0,32(sp)
    800040c6:	6145                	addi	sp,sp,48
    800040c8:	8082                	ret

00000000800040ca <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
    800040ca:	1101                	addi	sp,sp,-32
    800040cc:	ec06                	sd	ra,24(sp)
    800040ce:	e822                	sd	s0,16(sp)
    800040d0:	1000                	addi	s0,sp,32
    800040d2:	87aa                	mv	a5,a0
    800040d4:	feb43023          	sd	a1,-32(s0)
    800040d8:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    800040dc:	fec42783          	lw	a5,-20(s0)
    800040e0:	853e                	mv	a0,a5
    800040e2:	00000097          	auipc	ra,0x0
    800040e6:	f46080e7          	jalr	-186(ra) # 80004028 <argraw>
    800040ea:	87aa                	mv	a5,a0
    800040ec:	0007871b          	sext.w	a4,a5
    800040f0:	fe043783          	ld	a5,-32(s0)
    800040f4:	c398                	sw	a4,0(a5)
  return 0;
    800040f6:	4781                	li	a5,0
}
    800040f8:	853e                	mv	a0,a5
    800040fa:	60e2                	ld	ra,24(sp)
    800040fc:	6442                	ld	s0,16(sp)
    800040fe:	6105                	addi	sp,sp,32
    80004100:	8082                	ret

0000000080004102 <argaddr>:
// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
int
argaddr(int n, uint64 *ip)
{
    80004102:	1101                	addi	sp,sp,-32
    80004104:	ec06                	sd	ra,24(sp)
    80004106:	e822                	sd	s0,16(sp)
    80004108:	1000                	addi	s0,sp,32
    8000410a:	87aa                	mv	a5,a0
    8000410c:	feb43023          	sd	a1,-32(s0)
    80004110:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    80004114:	fec42783          	lw	a5,-20(s0)
    80004118:	853e                	mv	a0,a5
    8000411a:	00000097          	auipc	ra,0x0
    8000411e:	f0e080e7          	jalr	-242(ra) # 80004028 <argraw>
    80004122:	872a                	mv	a4,a0
    80004124:	fe043783          	ld	a5,-32(s0)
    80004128:	e398                	sd	a4,0(a5)
  return 0;
    8000412a:	4781                	li	a5,0
}
    8000412c:	853e                	mv	a0,a5
    8000412e:	60e2                	ld	ra,24(sp)
    80004130:	6442                	ld	s0,16(sp)
    80004132:	6105                	addi	sp,sp,32
    80004134:	8082                	ret

0000000080004136 <argstr>:
// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (including nul), -1 if error.
int
argstr(int n, char *buf, int max)
{
    80004136:	7179                	addi	sp,sp,-48
    80004138:	f406                	sd	ra,40(sp)
    8000413a:	f022                	sd	s0,32(sp)
    8000413c:	1800                	addi	s0,sp,48
    8000413e:	87aa                	mv	a5,a0
    80004140:	fcb43823          	sd	a1,-48(s0)
    80004144:	8732                	mv	a4,a2
    80004146:	fcf42e23          	sw	a5,-36(s0)
    8000414a:	87ba                	mv	a5,a4
    8000414c:	fcf42c23          	sw	a5,-40(s0)
  uint64 addr;
  if(argaddr(n, &addr) < 0)
    80004150:	fe840713          	addi	a4,s0,-24
    80004154:	fdc42783          	lw	a5,-36(s0)
    80004158:	85ba                	mv	a1,a4
    8000415a:	853e                	mv	a0,a5
    8000415c:	00000097          	auipc	ra,0x0
    80004160:	fa6080e7          	jalr	-90(ra) # 80004102 <argaddr>
    80004164:	87aa                	mv	a5,a0
    80004166:	0007d463          	bgez	a5,8000416e <argstr+0x38>
    return -1;
    8000416a:	57fd                	li	a5,-1
    8000416c:	a831                	j	80004188 <argstr+0x52>
  return fetchstr(addr, buf, max);
    8000416e:	fe843783          	ld	a5,-24(s0)
    80004172:	fd842703          	lw	a4,-40(s0)
    80004176:	863a                	mv	a2,a4
    80004178:	fd043583          	ld	a1,-48(s0)
    8000417c:	853e                	mv	a0,a5
    8000417e:	00000097          	auipc	ra,0x0
    80004182:	e3c080e7          	jalr	-452(ra) # 80003fba <fetchstr>
    80004186:	87aa                	mv	a5,a0
}
    80004188:	853e                	mv	a0,a5
    8000418a:	70a2                	ld	ra,40(sp)
    8000418c:	7402                	ld	s0,32(sp)
    8000418e:	6145                	addi	sp,sp,48
    80004190:	8082                	ret

0000000080004192 <syscall>:
[SYS_changeSchedulingAlgorithm] sys_changeSchedulingAlgorithm,
};

void
syscall(void)
{
    80004192:	7179                	addi	sp,sp,-48
    80004194:	f406                	sd	ra,40(sp)
    80004196:	f022                	sd	s0,32(sp)
    80004198:	ec26                	sd	s1,24(sp)
    8000419a:	1800                	addi	s0,sp,48
  int num;
  struct proc *p = myproc();
    8000419c:	ffffe097          	auipc	ra,0xffffe
    800041a0:	67c080e7          	jalr	1660(ra) # 80002818 <myproc>
    800041a4:	fca43c23          	sd	a0,-40(s0)

  num = p->trapframe->a7;
    800041a8:	fd843783          	ld	a5,-40(s0)
    800041ac:	6fbc                	ld	a5,88(a5)
    800041ae:	77dc                	ld	a5,168(a5)
    800041b0:	fcf42a23          	sw	a5,-44(s0)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    800041b4:	fd442783          	lw	a5,-44(s0)
    800041b8:	2781                	sext.w	a5,a5
    800041ba:	04f05263          	blez	a5,800041fe <syscall+0x6c>
    800041be:	fd442783          	lw	a5,-44(s0)
    800041c2:	873e                	mv	a4,a5
    800041c4:	47d9                	li	a5,22
    800041c6:	02e7ec63          	bltu	a5,a4,800041fe <syscall+0x6c>
    800041ca:	00007717          	auipc	a4,0x7
    800041ce:	63670713          	addi	a4,a4,1590 # 8000b800 <syscalls>
    800041d2:	fd442783          	lw	a5,-44(s0)
    800041d6:	078e                	slli	a5,a5,0x3
    800041d8:	97ba                	add	a5,a5,a4
    800041da:	639c                	ld	a5,0(a5)
    800041dc:	c38d                	beqz	a5,800041fe <syscall+0x6c>
    p->trapframe->a0 = syscalls[num]();
    800041de:	00007717          	auipc	a4,0x7
    800041e2:	62270713          	addi	a4,a4,1570 # 8000b800 <syscalls>
    800041e6:	fd442783          	lw	a5,-44(s0)
    800041ea:	078e                	slli	a5,a5,0x3
    800041ec:	97ba                	add	a5,a5,a4
    800041ee:	6398                	ld	a4,0(a5)
    800041f0:	fd843783          	ld	a5,-40(s0)
    800041f4:	6fa4                	ld	s1,88(a5)
    800041f6:	9702                	jalr	a4
    800041f8:	87aa                	mv	a5,a0
    800041fa:	f8bc                	sd	a5,112(s1)
    800041fc:	a815                	j	80004230 <syscall+0x9e>
  } else {
    printf("%d %s: unknown sys call %d\n",
    800041fe:	fd843783          	ld	a5,-40(s0)
    80004202:	5b98                	lw	a4,48(a5)
            p->pid, p->name, num);
    80004204:	fd843783          	ld	a5,-40(s0)
    80004208:	15878793          	addi	a5,a5,344
    printf("%d %s: unknown sys call %d\n",
    8000420c:	fd442683          	lw	a3,-44(s0)
    80004210:	863e                	mv	a2,a5
    80004212:	85ba                	mv	a1,a4
    80004214:	00007517          	auipc	a0,0x7
    80004218:	20450513          	addi	a0,a0,516 # 8000b418 <etext+0x418>
    8000421c:	ffffd097          	auipc	ra,0xffffd
    80004220:	80c080e7          	jalr	-2036(ra) # 80000a28 <printf>
    p->trapframe->a0 = -1;
    80004224:	fd843783          	ld	a5,-40(s0)
    80004228:	6fbc                	ld	a5,88(a5)
    8000422a:	577d                	li	a4,-1
    8000422c:	fbb8                	sd	a4,112(a5)
  }
}
    8000422e:	0001                	nop
    80004230:	0001                	nop
    80004232:	70a2                	ld	ra,40(sp)
    80004234:	7402                	ld	s0,32(sp)
    80004236:	64e2                	ld	s1,24(sp)
    80004238:	6145                	addi	sp,sp,48
    8000423a:	8082                	ret

000000008000423c <sys_exit>:
#include "proc.h"


uint64
sys_exit(void)
{
    8000423c:	1101                	addi	sp,sp,-32
    8000423e:	ec06                	sd	ra,24(sp)
    80004240:	e822                	sd	s0,16(sp)
    80004242:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    80004244:	fec40793          	addi	a5,s0,-20
    80004248:	85be                	mv	a1,a5
    8000424a:	4501                	li	a0,0
    8000424c:	00000097          	auipc	ra,0x0
    80004250:	e7e080e7          	jalr	-386(ra) # 800040ca <argint>
    80004254:	87aa                	mv	a5,a0
    80004256:	0007d463          	bgez	a5,8000425e <sys_exit+0x22>
    return -1;
    8000425a:	57fd                	li	a5,-1
    8000425c:	a809                	j	8000426e <sys_exit+0x32>
  exit(n);
    8000425e:	fec42783          	lw	a5,-20(s0)
    80004262:	853e                	mv	a0,a5
    80004264:	fffff097          	auipc	ra,0xfffff
    80004268:	cc0080e7          	jalr	-832(ra) # 80002f24 <exit>
  return 0;  // not reached
    8000426c:	4781                	li	a5,0
}
    8000426e:	853e                	mv	a0,a5
    80004270:	60e2                	ld	ra,24(sp)
    80004272:	6442                	ld	s0,16(sp)
    80004274:	6105                	addi	sp,sp,32
    80004276:	8082                	ret

0000000080004278 <sys_getpid>:

uint64
sys_getpid(void)
{
    80004278:	1141                	addi	sp,sp,-16
    8000427a:	e406                	sd	ra,8(sp)
    8000427c:	e022                	sd	s0,0(sp)
    8000427e:	0800                	addi	s0,sp,16
  return myproc()->pid;
    80004280:	ffffe097          	auipc	ra,0xffffe
    80004284:	598080e7          	jalr	1432(ra) # 80002818 <myproc>
    80004288:	87aa                	mv	a5,a0
    8000428a:	5b9c                	lw	a5,48(a5)
}
    8000428c:	853e                	mv	a0,a5
    8000428e:	60a2                	ld	ra,8(sp)
    80004290:	6402                	ld	s0,0(sp)
    80004292:	0141                	addi	sp,sp,16
    80004294:	8082                	ret

0000000080004296 <sys_fork>:

uint64
sys_fork(void)
{
    80004296:	1141                	addi	sp,sp,-16
    80004298:	e406                	sd	ra,8(sp)
    8000429a:	e022                	sd	s0,0(sp)
    8000429c:	0800                	addi	s0,sp,16
  return fork();
    8000429e:	fffff097          	auipc	ra,0xfffff
    800042a2:	a60080e7          	jalr	-1440(ra) # 80002cfe <fork>
    800042a6:	87aa                	mv	a5,a0
}
    800042a8:	853e                	mv	a0,a5
    800042aa:	60a2                	ld	ra,8(sp)
    800042ac:	6402                	ld	s0,0(sp)
    800042ae:	0141                	addi	sp,sp,16
    800042b0:	8082                	ret

00000000800042b2 <sys_wait>:

uint64
sys_wait(void)
{
    800042b2:	1101                	addi	sp,sp,-32
    800042b4:	ec06                	sd	ra,24(sp)
    800042b6:	e822                	sd	s0,16(sp)
    800042b8:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    800042ba:	fe840793          	addi	a5,s0,-24
    800042be:	85be                	mv	a1,a5
    800042c0:	4501                	li	a0,0
    800042c2:	00000097          	auipc	ra,0x0
    800042c6:	e40080e7          	jalr	-448(ra) # 80004102 <argaddr>
    800042ca:	87aa                	mv	a5,a0
    800042cc:	0007d463          	bgez	a5,800042d4 <sys_wait+0x22>
    return -1;
    800042d0:	57fd                	li	a5,-1
    800042d2:	a809                	j	800042e4 <sys_wait+0x32>
  return wait(p);
    800042d4:	fe843783          	ld	a5,-24(s0)
    800042d8:	853e                	mv	a0,a5
    800042da:	fffff097          	auipc	ra,0xfffff
    800042de:	d86080e7          	jalr	-634(ra) # 80003060 <wait>
    800042e2:	87aa                	mv	a5,a0
}
    800042e4:	853e                	mv	a0,a5
    800042e6:	60e2                	ld	ra,24(sp)
    800042e8:	6442                	ld	s0,16(sp)
    800042ea:	6105                	addi	sp,sp,32
    800042ec:	8082                	ret

00000000800042ee <sys_sbrk>:

uint64
sys_sbrk(void)
{
    800042ee:	1101                	addi	sp,sp,-32
    800042f0:	ec06                	sd	ra,24(sp)
    800042f2:	e822                	sd	s0,16(sp)
    800042f4:	1000                	addi	s0,sp,32
  int addr;
  int n;

  if(argint(0, &n) < 0)
    800042f6:	fe840793          	addi	a5,s0,-24
    800042fa:	85be                	mv	a1,a5
    800042fc:	4501                	li	a0,0
    800042fe:	00000097          	auipc	ra,0x0
    80004302:	dcc080e7          	jalr	-564(ra) # 800040ca <argint>
    80004306:	87aa                	mv	a5,a0
    80004308:	0007d463          	bgez	a5,80004310 <sys_sbrk+0x22>
    return -1;
    8000430c:	57fd                	li	a5,-1
    8000430e:	a03d                	j	8000433c <sys_sbrk+0x4e>
  addr = myproc()->sz;
    80004310:	ffffe097          	auipc	ra,0xffffe
    80004314:	508080e7          	jalr	1288(ra) # 80002818 <myproc>
    80004318:	87aa                	mv	a5,a0
    8000431a:	67bc                	ld	a5,72(a5)
    8000431c:	fef42623          	sw	a5,-20(s0)
  if(growproc(n) < 0)
    80004320:	fe842783          	lw	a5,-24(s0)
    80004324:	853e                	mv	a0,a5
    80004326:	fffff097          	auipc	ra,0xfffff
    8000432a:	926080e7          	jalr	-1754(ra) # 80002c4c <growproc>
    8000432e:	87aa                	mv	a5,a0
    80004330:	0007d463          	bgez	a5,80004338 <sys_sbrk+0x4a>
    return -1;
    80004334:	57fd                	li	a5,-1
    80004336:	a019                	j	8000433c <sys_sbrk+0x4e>
  return addr;
    80004338:	fec42783          	lw	a5,-20(s0)
}
    8000433c:	853e                	mv	a0,a5
    8000433e:	60e2                	ld	ra,24(sp)
    80004340:	6442                	ld	s0,16(sp)
    80004342:	6105                	addi	sp,sp,32
    80004344:	8082                	ret

0000000080004346 <sys_sleep>:

uint64
sys_sleep(void)
{
    80004346:	1101                	addi	sp,sp,-32
    80004348:	ec06                	sd	ra,24(sp)
    8000434a:	e822                	sd	s0,16(sp)
    8000434c:	1000                	addi	s0,sp,32
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    8000434e:	fe840793          	addi	a5,s0,-24
    80004352:	85be                	mv	a1,a5
    80004354:	4501                	li	a0,0
    80004356:	00000097          	auipc	ra,0x0
    8000435a:	d74080e7          	jalr	-652(ra) # 800040ca <argint>
    8000435e:	87aa                	mv	a5,a0
    80004360:	0007d463          	bgez	a5,80004368 <sys_sleep+0x22>
    return -1;
    80004364:	57fd                	li	a5,-1
    80004366:	a079                	j	800043f4 <sys_sleep+0xae>
  acquire(&tickslock);
    80004368:	00016517          	auipc	a0,0x16
    8000436c:	da050513          	addi	a0,a0,-608 # 8001a108 <tickslock>
    80004370:	ffffd097          	auipc	ra,0xffffd
    80004374:	efe080e7          	jalr	-258(ra) # 8000126e <acquire>
  ticks0 = ticks;
    80004378:	00008797          	auipc	a5,0x8
    8000437c:	cb078793          	addi	a5,a5,-848 # 8000c028 <ticks>
    80004380:	439c                	lw	a5,0(a5)
    80004382:	fef42623          	sw	a5,-20(s0)
  while(ticks - ticks0 < n){
    80004386:	a835                	j	800043c2 <sys_sleep+0x7c>
    if(myproc()->killed){
    80004388:	ffffe097          	auipc	ra,0xffffe
    8000438c:	490080e7          	jalr	1168(ra) # 80002818 <myproc>
    80004390:	87aa                	mv	a5,a0
    80004392:	579c                	lw	a5,40(a5)
    80004394:	cb99                	beqz	a5,800043aa <sys_sleep+0x64>
      release(&tickslock);
    80004396:	00016517          	auipc	a0,0x16
    8000439a:	d7250513          	addi	a0,a0,-654 # 8001a108 <tickslock>
    8000439e:	ffffd097          	auipc	ra,0xffffd
    800043a2:	f34080e7          	jalr	-204(ra) # 800012d2 <release>
      return -1;
    800043a6:	57fd                	li	a5,-1
    800043a8:	a0b1                	j	800043f4 <sys_sleep+0xae>
    }
    sleep(&ticks, &tickslock);
    800043aa:	00016597          	auipc	a1,0x16
    800043ae:	d5e58593          	addi	a1,a1,-674 # 8001a108 <tickslock>
    800043b2:	00008517          	auipc	a0,0x8
    800043b6:	c7650513          	addi	a0,a0,-906 # 8000c028 <ticks>
    800043ba:	fffff097          	auipc	ra,0xfffff
    800043be:	0ea080e7          	jalr	234(ra) # 800034a4 <sleep>
  while(ticks - ticks0 < n){
    800043c2:	00008797          	auipc	a5,0x8
    800043c6:	c6678793          	addi	a5,a5,-922 # 8000c028 <ticks>
    800043ca:	4398                	lw	a4,0(a5)
    800043cc:	fec42783          	lw	a5,-20(s0)
    800043d0:	40f707bb          	subw	a5,a4,a5
    800043d4:	0007871b          	sext.w	a4,a5
    800043d8:	fe842783          	lw	a5,-24(s0)
    800043dc:	2781                	sext.w	a5,a5
    800043de:	faf765e3          	bltu	a4,a5,80004388 <sys_sleep+0x42>
  }
  release(&tickslock);
    800043e2:	00016517          	auipc	a0,0x16
    800043e6:	d2650513          	addi	a0,a0,-730 # 8001a108 <tickslock>
    800043ea:	ffffd097          	auipc	ra,0xffffd
    800043ee:	ee8080e7          	jalr	-280(ra) # 800012d2 <release>
  return 0;
    800043f2:	4781                	li	a5,0
}
    800043f4:	853e                	mv	a0,a5
    800043f6:	60e2                	ld	ra,24(sp)
    800043f8:	6442                	ld	s0,16(sp)
    800043fa:	6105                	addi	sp,sp,32
    800043fc:	8082                	ret

00000000800043fe <sys_kill>:

uint64
sys_kill(void)
{
    800043fe:	1101                	addi	sp,sp,-32
    80004400:	ec06                	sd	ra,24(sp)
    80004402:	e822                	sd	s0,16(sp)
    80004404:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    80004406:	fec40793          	addi	a5,s0,-20
    8000440a:	85be                	mv	a1,a5
    8000440c:	4501                	li	a0,0
    8000440e:	00000097          	auipc	ra,0x0
    80004412:	cbc080e7          	jalr	-836(ra) # 800040ca <argint>
    80004416:	87aa                	mv	a5,a0
    80004418:	0007d463          	bgez	a5,80004420 <sys_kill+0x22>
    return -1;
    8000441c:	57fd                	li	a5,-1
    8000441e:	a809                	j	80004430 <sys_kill+0x32>
  return kill(pid);
    80004420:	fec42783          	lw	a5,-20(s0)
    80004424:	853e                	mv	a0,a5
    80004426:	fffff097          	auipc	ra,0xfffff
    8000442a:	192080e7          	jalr	402(ra) # 800035b8 <kill>
    8000442e:	87aa                	mv	a5,a0
}
    80004430:	853e                	mv	a0,a5
    80004432:	60e2                	ld	ra,24(sp)
    80004434:	6442                	ld	s0,16(sp)
    80004436:	6105                	addi	sp,sp,32
    80004438:	8082                	ret

000000008000443a <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    8000443a:	1101                	addi	sp,sp,-32
    8000443c:	ec06                	sd	ra,24(sp)
    8000443e:	e822                	sd	s0,16(sp)
    80004440:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    80004442:	00016517          	auipc	a0,0x16
    80004446:	cc650513          	addi	a0,a0,-826 # 8001a108 <tickslock>
    8000444a:	ffffd097          	auipc	ra,0xffffd
    8000444e:	e24080e7          	jalr	-476(ra) # 8000126e <acquire>
  xticks = ticks;
    80004452:	00008797          	auipc	a5,0x8
    80004456:	bd678793          	addi	a5,a5,-1066 # 8000c028 <ticks>
    8000445a:	439c                	lw	a5,0(a5)
    8000445c:	fef42623          	sw	a5,-20(s0)
  release(&tickslock);
    80004460:	00016517          	auipc	a0,0x16
    80004464:	ca850513          	addi	a0,a0,-856 # 8001a108 <tickslock>
    80004468:	ffffd097          	auipc	ra,0xffffd
    8000446c:	e6a080e7          	jalr	-406(ra) # 800012d2 <release>
  return xticks;
    80004470:	fec46783          	lwu	a5,-20(s0)
}
    80004474:	853e                	mv	a0,a5
    80004476:	60e2                	ld	ra,24(sp)
    80004478:	6442                	ld	s0,16(sp)
    8000447a:	6105                	addi	sp,sp,32
    8000447c:	8082                	ret

000000008000447e <sys_changeSchedulingAlgorithm>:

uint64
sys_changeSchedulingAlgorithm(void)
{
    8000447e:	1101                	addi	sp,sp,-32
    80004480:	ec06                	sd	ra,24(sp)
    80004482:	e822                	sd	s0,16(sp)
    80004484:	1000                	addi	s0,sp,32
    char sp[3];
    if(argstr(0, sp,4) < 0) //uzimamo prvi parametar koji nam govori koji algoritam da koristimo
    80004486:	fe840793          	addi	a5,s0,-24
    8000448a:	4611                	li	a2,4
    8000448c:	85be                	mv	a1,a5
    8000448e:	4501                	li	a0,0
    80004490:	00000097          	auipc	ra,0x0
    80004494:	ca6080e7          	jalr	-858(ra) # 80004136 <argstr>
    80004498:	87aa                	mv	a5,a0
    8000449a:	0007d463          	bgez	a5,800044a2 <sys_changeSchedulingAlgorithm+0x24>
        return -1;
    8000449e:	57fd                	li	a5,-1
    800044a0:	a025                	j	800044c8 <sys_changeSchedulingAlgorithm+0x4a>
    printf(" prva %s \n",sp);
    800044a2:	fe840793          	addi	a5,s0,-24
    800044a6:	85be                	mv	a1,a5
    800044a8:	00007517          	auipc	a0,0x7
    800044ac:	f9050513          	addi	a0,a0,-112 # 8000b438 <etext+0x438>
    800044b0:	ffffc097          	auipc	ra,0xffffc
    800044b4:	578080e7          	jalr	1400(ra) # 80000a28 <printf>
    return changeSchedulingAlgorithm(sp);
    800044b8:	fe840793          	addi	a5,s0,-24
    800044bc:	853e                	mv	a0,a5
    800044be:	fffff097          	auipc	ra,0xfffff
    800044c2:	e0c080e7          	jalr	-500(ra) # 800032ca <changeSchedulingAlgorithm>
    800044c6:	87aa                	mv	a5,a0
    800044c8:	853e                	mv	a0,a5
    800044ca:	60e2                	ld	ra,24(sp)
    800044cc:	6442                	ld	s0,16(sp)
    800044ce:	6105                	addi	sp,sp,32
    800044d0:	8082                	ret

00000000800044d2 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    800044d2:	1101                	addi	sp,sp,-32
    800044d4:	ec06                	sd	ra,24(sp)
    800044d6:	e822                	sd	s0,16(sp)
    800044d8:	1000                	addi	s0,sp,32
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    800044da:	00007597          	auipc	a1,0x7
    800044de:	f6e58593          	addi	a1,a1,-146 # 8000b448 <etext+0x448>
    800044e2:	00016517          	auipc	a0,0x16
    800044e6:	c3e50513          	addi	a0,a0,-962 # 8001a120 <bcache>
    800044ea:	ffffd097          	auipc	ra,0xffffd
    800044ee:	d54080e7          	jalr	-684(ra) # 8000123e <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    800044f2:	00016717          	auipc	a4,0x16
    800044f6:	c2e70713          	addi	a4,a4,-978 # 8001a120 <bcache>
    800044fa:	67a1                	lui	a5,0x8
    800044fc:	97ba                	add	a5,a5,a4
    800044fe:	0001e717          	auipc	a4,0x1e
    80004502:	e8a70713          	addi	a4,a4,-374 # 80022388 <bcache+0x8268>
    80004506:	2ae7b823          	sd	a4,688(a5) # 82b0 <_entry-0x7fff7d50>
  bcache.head.next = &bcache.head;
    8000450a:	00016717          	auipc	a4,0x16
    8000450e:	c1670713          	addi	a4,a4,-1002 # 8001a120 <bcache>
    80004512:	67a1                	lui	a5,0x8
    80004514:	97ba                	add	a5,a5,a4
    80004516:	0001e717          	auipc	a4,0x1e
    8000451a:	e7270713          	addi	a4,a4,-398 # 80022388 <bcache+0x8268>
    8000451e:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80004522:	00016797          	auipc	a5,0x16
    80004526:	c1678793          	addi	a5,a5,-1002 # 8001a138 <bcache+0x18>
    8000452a:	fef43423          	sd	a5,-24(s0)
    8000452e:	a895                	j	800045a2 <binit+0xd0>
    b->next = bcache.head.next;
    80004530:	00016717          	auipc	a4,0x16
    80004534:	bf070713          	addi	a4,a4,-1040 # 8001a120 <bcache>
    80004538:	67a1                	lui	a5,0x8
    8000453a:	97ba                	add	a5,a5,a4
    8000453c:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004540:	fe843783          	ld	a5,-24(s0)
    80004544:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004546:	fe843783          	ld	a5,-24(s0)
    8000454a:	0001e717          	auipc	a4,0x1e
    8000454e:	e3e70713          	addi	a4,a4,-450 # 80022388 <bcache+0x8268>
    80004552:	e7b8                	sd	a4,72(a5)
    initsleeplock(&b->lock, "buffer");
    80004554:	fe843783          	ld	a5,-24(s0)
    80004558:	07c1                	addi	a5,a5,16
    8000455a:	00007597          	auipc	a1,0x7
    8000455e:	ef658593          	addi	a1,a1,-266 # 8000b450 <etext+0x450>
    80004562:	853e                	mv	a0,a5
    80004564:	00002097          	auipc	ra,0x2
    80004568:	ff8080e7          	jalr	-8(ra) # 8000655c <initsleeplock>
    bcache.head.next->prev = b;
    8000456c:	00016717          	auipc	a4,0x16
    80004570:	bb470713          	addi	a4,a4,-1100 # 8001a120 <bcache>
    80004574:	67a1                	lui	a5,0x8
    80004576:	97ba                	add	a5,a5,a4
    80004578:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    8000457c:	fe843703          	ld	a4,-24(s0)
    80004580:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004582:	00016717          	auipc	a4,0x16
    80004586:	b9e70713          	addi	a4,a4,-1122 # 8001a120 <bcache>
    8000458a:	67a1                	lui	a5,0x8
    8000458c:	97ba                	add	a5,a5,a4
    8000458e:	fe843703          	ld	a4,-24(s0)
    80004592:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80004596:	fe843783          	ld	a5,-24(s0)
    8000459a:	45878793          	addi	a5,a5,1112
    8000459e:	fef43423          	sd	a5,-24(s0)
    800045a2:	0001e797          	auipc	a5,0x1e
    800045a6:	de678793          	addi	a5,a5,-538 # 80022388 <bcache+0x8268>
    800045aa:	fe843703          	ld	a4,-24(s0)
    800045ae:	f8f761e3          	bltu	a4,a5,80004530 <binit+0x5e>
  }
}
    800045b2:	0001                	nop
    800045b4:	0001                	nop
    800045b6:	60e2                	ld	ra,24(sp)
    800045b8:	6442                	ld	s0,16(sp)
    800045ba:	6105                	addi	sp,sp,32
    800045bc:	8082                	ret

00000000800045be <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
    800045be:	7179                	addi	sp,sp,-48
    800045c0:	f406                	sd	ra,40(sp)
    800045c2:	f022                	sd	s0,32(sp)
    800045c4:	1800                	addi	s0,sp,48
    800045c6:	87aa                	mv	a5,a0
    800045c8:	872e                	mv	a4,a1
    800045ca:	fcf42e23          	sw	a5,-36(s0)
    800045ce:	87ba                	mv	a5,a4
    800045d0:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  acquire(&bcache.lock);
    800045d4:	00016517          	auipc	a0,0x16
    800045d8:	b4c50513          	addi	a0,a0,-1204 # 8001a120 <bcache>
    800045dc:	ffffd097          	auipc	ra,0xffffd
    800045e0:	c92080e7          	jalr	-878(ra) # 8000126e <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    800045e4:	00016717          	auipc	a4,0x16
    800045e8:	b3c70713          	addi	a4,a4,-1220 # 8001a120 <bcache>
    800045ec:	67a1                	lui	a5,0x8
    800045ee:	97ba                	add	a5,a5,a4
    800045f0:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    800045f4:	fef43423          	sd	a5,-24(s0)
    800045f8:	a095                	j	8000465c <bget+0x9e>
    if(b->dev == dev && b->blockno == blockno){
    800045fa:	fe843783          	ld	a5,-24(s0)
    800045fe:	4798                	lw	a4,8(a5)
    80004600:	fdc42783          	lw	a5,-36(s0)
    80004604:	2781                	sext.w	a5,a5
    80004606:	04e79663          	bne	a5,a4,80004652 <bget+0x94>
    8000460a:	fe843783          	ld	a5,-24(s0)
    8000460e:	47d8                	lw	a4,12(a5)
    80004610:	fd842783          	lw	a5,-40(s0)
    80004614:	2781                	sext.w	a5,a5
    80004616:	02e79e63          	bne	a5,a4,80004652 <bget+0x94>
      b->refcnt++;
    8000461a:	fe843783          	ld	a5,-24(s0)
    8000461e:	43bc                	lw	a5,64(a5)
    80004620:	2785                	addiw	a5,a5,1
    80004622:	0007871b          	sext.w	a4,a5
    80004626:	fe843783          	ld	a5,-24(s0)
    8000462a:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    8000462c:	00016517          	auipc	a0,0x16
    80004630:	af450513          	addi	a0,a0,-1292 # 8001a120 <bcache>
    80004634:	ffffd097          	auipc	ra,0xffffd
    80004638:	c9e080e7          	jalr	-866(ra) # 800012d2 <release>
      acquiresleep(&b->lock);
    8000463c:	fe843783          	ld	a5,-24(s0)
    80004640:	07c1                	addi	a5,a5,16
    80004642:	853e                	mv	a0,a5
    80004644:	00002097          	auipc	ra,0x2
    80004648:	f64080e7          	jalr	-156(ra) # 800065a8 <acquiresleep>
      return b;
    8000464c:	fe843783          	ld	a5,-24(s0)
    80004650:	a07d                	j	800046fe <bget+0x140>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80004652:	fe843783          	ld	a5,-24(s0)
    80004656:	6bbc                	ld	a5,80(a5)
    80004658:	fef43423          	sd	a5,-24(s0)
    8000465c:	fe843703          	ld	a4,-24(s0)
    80004660:	0001e797          	auipc	a5,0x1e
    80004664:	d2878793          	addi	a5,a5,-728 # 80022388 <bcache+0x8268>
    80004668:	f8f719e3          	bne	a4,a5,800045fa <bget+0x3c>
    }
  }

  // Not cached.
  // Recycle the least recently used (LRU) unused buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    8000466c:	00016717          	auipc	a4,0x16
    80004670:	ab470713          	addi	a4,a4,-1356 # 8001a120 <bcache>
    80004674:	67a1                	lui	a5,0x8
    80004676:	97ba                	add	a5,a5,a4
    80004678:	2b07b783          	ld	a5,688(a5) # 82b0 <_entry-0x7fff7d50>
    8000467c:	fef43423          	sd	a5,-24(s0)
    80004680:	a8b9                	j	800046de <bget+0x120>
    if(b->refcnt == 0) {
    80004682:	fe843783          	ld	a5,-24(s0)
    80004686:	43bc                	lw	a5,64(a5)
    80004688:	e7b1                	bnez	a5,800046d4 <bget+0x116>
      b->dev = dev;
    8000468a:	fe843783          	ld	a5,-24(s0)
    8000468e:	fdc42703          	lw	a4,-36(s0)
    80004692:	c798                	sw	a4,8(a5)
      b->blockno = blockno;
    80004694:	fe843783          	ld	a5,-24(s0)
    80004698:	fd842703          	lw	a4,-40(s0)
    8000469c:	c7d8                	sw	a4,12(a5)
      b->valid = 0;
    8000469e:	fe843783          	ld	a5,-24(s0)
    800046a2:	0007a023          	sw	zero,0(a5)
      b->refcnt = 1;
    800046a6:	fe843783          	ld	a5,-24(s0)
    800046aa:	4705                	li	a4,1
    800046ac:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    800046ae:	00016517          	auipc	a0,0x16
    800046b2:	a7250513          	addi	a0,a0,-1422 # 8001a120 <bcache>
    800046b6:	ffffd097          	auipc	ra,0xffffd
    800046ba:	c1c080e7          	jalr	-996(ra) # 800012d2 <release>
      acquiresleep(&b->lock);
    800046be:	fe843783          	ld	a5,-24(s0)
    800046c2:	07c1                	addi	a5,a5,16
    800046c4:	853e                	mv	a0,a5
    800046c6:	00002097          	auipc	ra,0x2
    800046ca:	ee2080e7          	jalr	-286(ra) # 800065a8 <acquiresleep>
      return b;
    800046ce:	fe843783          	ld	a5,-24(s0)
    800046d2:	a035                	j	800046fe <bget+0x140>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    800046d4:	fe843783          	ld	a5,-24(s0)
    800046d8:	67bc                	ld	a5,72(a5)
    800046da:	fef43423          	sd	a5,-24(s0)
    800046de:	fe843703          	ld	a4,-24(s0)
    800046e2:	0001e797          	auipc	a5,0x1e
    800046e6:	ca678793          	addi	a5,a5,-858 # 80022388 <bcache+0x8268>
    800046ea:	f8f71ce3          	bne	a4,a5,80004682 <bget+0xc4>
    }
  }
  panic("bget: no buffers");
    800046ee:	00007517          	auipc	a0,0x7
    800046f2:	d6a50513          	addi	a0,a0,-662 # 8000b458 <etext+0x458>
    800046f6:	ffffc097          	auipc	ra,0xffffc
    800046fa:	588080e7          	jalr	1416(ra) # 80000c7e <panic>
}
    800046fe:	853e                	mv	a0,a5
    80004700:	70a2                	ld	ra,40(sp)
    80004702:	7402                	ld	s0,32(sp)
    80004704:	6145                	addi	sp,sp,48
    80004706:	8082                	ret

0000000080004708 <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
    80004708:	7179                	addi	sp,sp,-48
    8000470a:	f406                	sd	ra,40(sp)
    8000470c:	f022                	sd	s0,32(sp)
    8000470e:	1800                	addi	s0,sp,48
    80004710:	87aa                	mv	a5,a0
    80004712:	872e                	mv	a4,a1
    80004714:	fcf42e23          	sw	a5,-36(s0)
    80004718:	87ba                	mv	a5,a4
    8000471a:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  b = bget(dev, blockno);
    8000471e:	fd842703          	lw	a4,-40(s0)
    80004722:	fdc42783          	lw	a5,-36(s0)
    80004726:	85ba                	mv	a1,a4
    80004728:	853e                	mv	a0,a5
    8000472a:	00000097          	auipc	ra,0x0
    8000472e:	e94080e7          	jalr	-364(ra) # 800045be <bget>
    80004732:	fea43423          	sd	a0,-24(s0)
  if(!b->valid) {
    80004736:	fe843783          	ld	a5,-24(s0)
    8000473a:	439c                	lw	a5,0(a5)
    8000473c:	ef81                	bnez	a5,80004754 <bread+0x4c>
    virtio_disk_rw(b, 0);
    8000473e:	4581                	li	a1,0
    80004740:	fe843503          	ld	a0,-24(s0)
    80004744:	00004097          	auipc	ra,0x4
    80004748:	756080e7          	jalr	1878(ra) # 80008e9a <virtio_disk_rw>
    b->valid = 1;
    8000474c:	fe843783          	ld	a5,-24(s0)
    80004750:	4705                	li	a4,1
    80004752:	c398                	sw	a4,0(a5)
  }
  return b;
    80004754:	fe843783          	ld	a5,-24(s0)
}
    80004758:	853e                	mv	a0,a5
    8000475a:	70a2                	ld	ra,40(sp)
    8000475c:	7402                	ld	s0,32(sp)
    8000475e:	6145                	addi	sp,sp,48
    80004760:	8082                	ret

0000000080004762 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
    80004762:	1101                	addi	sp,sp,-32
    80004764:	ec06                	sd	ra,24(sp)
    80004766:	e822                	sd	s0,16(sp)
    80004768:	1000                	addi	s0,sp,32
    8000476a:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    8000476e:	fe843783          	ld	a5,-24(s0)
    80004772:	07c1                	addi	a5,a5,16
    80004774:	853e                	mv	a0,a5
    80004776:	00002097          	auipc	ra,0x2
    8000477a:	ef2080e7          	jalr	-270(ra) # 80006668 <holdingsleep>
    8000477e:	87aa                	mv	a5,a0
    80004780:	eb89                	bnez	a5,80004792 <bwrite+0x30>
    panic("bwrite");
    80004782:	00007517          	auipc	a0,0x7
    80004786:	cee50513          	addi	a0,a0,-786 # 8000b470 <etext+0x470>
    8000478a:	ffffc097          	auipc	ra,0xffffc
    8000478e:	4f4080e7          	jalr	1268(ra) # 80000c7e <panic>
  virtio_disk_rw(b, 1);
    80004792:	4585                	li	a1,1
    80004794:	fe843503          	ld	a0,-24(s0)
    80004798:	00004097          	auipc	ra,0x4
    8000479c:	702080e7          	jalr	1794(ra) # 80008e9a <virtio_disk_rw>
}
    800047a0:	0001                	nop
    800047a2:	60e2                	ld	ra,24(sp)
    800047a4:	6442                	ld	s0,16(sp)
    800047a6:	6105                	addi	sp,sp,32
    800047a8:	8082                	ret

00000000800047aa <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    800047aa:	1101                	addi	sp,sp,-32
    800047ac:	ec06                	sd	ra,24(sp)
    800047ae:	e822                	sd	s0,16(sp)
    800047b0:	1000                	addi	s0,sp,32
    800047b2:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    800047b6:	fe843783          	ld	a5,-24(s0)
    800047ba:	07c1                	addi	a5,a5,16
    800047bc:	853e                	mv	a0,a5
    800047be:	00002097          	auipc	ra,0x2
    800047c2:	eaa080e7          	jalr	-342(ra) # 80006668 <holdingsleep>
    800047c6:	87aa                	mv	a5,a0
    800047c8:	eb89                	bnez	a5,800047da <brelse+0x30>
    panic("brelse");
    800047ca:	00007517          	auipc	a0,0x7
    800047ce:	cae50513          	addi	a0,a0,-850 # 8000b478 <etext+0x478>
    800047d2:	ffffc097          	auipc	ra,0xffffc
    800047d6:	4ac080e7          	jalr	1196(ra) # 80000c7e <panic>

  releasesleep(&b->lock);
    800047da:	fe843783          	ld	a5,-24(s0)
    800047de:	07c1                	addi	a5,a5,16
    800047e0:	853e                	mv	a0,a5
    800047e2:	00002097          	auipc	ra,0x2
    800047e6:	e34080e7          	jalr	-460(ra) # 80006616 <releasesleep>

  acquire(&bcache.lock);
    800047ea:	00016517          	auipc	a0,0x16
    800047ee:	93650513          	addi	a0,a0,-1738 # 8001a120 <bcache>
    800047f2:	ffffd097          	auipc	ra,0xffffd
    800047f6:	a7c080e7          	jalr	-1412(ra) # 8000126e <acquire>
  b->refcnt--;
    800047fa:	fe843783          	ld	a5,-24(s0)
    800047fe:	43bc                	lw	a5,64(a5)
    80004800:	37fd                	addiw	a5,a5,-1
    80004802:	0007871b          	sext.w	a4,a5
    80004806:	fe843783          	ld	a5,-24(s0)
    8000480a:	c3b8                	sw	a4,64(a5)
  if (b->refcnt == 0) {
    8000480c:	fe843783          	ld	a5,-24(s0)
    80004810:	43bc                	lw	a5,64(a5)
    80004812:	e7b5                	bnez	a5,8000487e <brelse+0xd4>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80004814:	fe843783          	ld	a5,-24(s0)
    80004818:	6bbc                	ld	a5,80(a5)
    8000481a:	fe843703          	ld	a4,-24(s0)
    8000481e:	6738                	ld	a4,72(a4)
    80004820:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80004822:	fe843783          	ld	a5,-24(s0)
    80004826:	67bc                	ld	a5,72(a5)
    80004828:	fe843703          	ld	a4,-24(s0)
    8000482c:	6b38                	ld	a4,80(a4)
    8000482e:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80004830:	00016717          	auipc	a4,0x16
    80004834:	8f070713          	addi	a4,a4,-1808 # 8001a120 <bcache>
    80004838:	67a1                	lui	a5,0x8
    8000483a:	97ba                	add	a5,a5,a4
    8000483c:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004840:	fe843783          	ld	a5,-24(s0)
    80004844:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004846:	fe843783          	ld	a5,-24(s0)
    8000484a:	0001e717          	auipc	a4,0x1e
    8000484e:	b3e70713          	addi	a4,a4,-1218 # 80022388 <bcache+0x8268>
    80004852:	e7b8                	sd	a4,72(a5)
    bcache.head.next->prev = b;
    80004854:	00016717          	auipc	a4,0x16
    80004858:	8cc70713          	addi	a4,a4,-1844 # 8001a120 <bcache>
    8000485c:	67a1                	lui	a5,0x8
    8000485e:	97ba                	add	a5,a5,a4
    80004860:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004864:	fe843703          	ld	a4,-24(s0)
    80004868:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    8000486a:	00016717          	auipc	a4,0x16
    8000486e:	8b670713          	addi	a4,a4,-1866 # 8001a120 <bcache>
    80004872:	67a1                	lui	a5,0x8
    80004874:	97ba                	add	a5,a5,a4
    80004876:	fe843703          	ld	a4,-24(s0)
    8000487a:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  }
  
  release(&bcache.lock);
    8000487e:	00016517          	auipc	a0,0x16
    80004882:	8a250513          	addi	a0,a0,-1886 # 8001a120 <bcache>
    80004886:	ffffd097          	auipc	ra,0xffffd
    8000488a:	a4c080e7          	jalr	-1460(ra) # 800012d2 <release>
}
    8000488e:	0001                	nop
    80004890:	60e2                	ld	ra,24(sp)
    80004892:	6442                	ld	s0,16(sp)
    80004894:	6105                	addi	sp,sp,32
    80004896:	8082                	ret

0000000080004898 <bpin>:

void
bpin(struct buf *b) {
    80004898:	1101                	addi	sp,sp,-32
    8000489a:	ec06                	sd	ra,24(sp)
    8000489c:	e822                	sd	s0,16(sp)
    8000489e:	1000                	addi	s0,sp,32
    800048a0:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    800048a4:	00016517          	auipc	a0,0x16
    800048a8:	87c50513          	addi	a0,a0,-1924 # 8001a120 <bcache>
    800048ac:	ffffd097          	auipc	ra,0xffffd
    800048b0:	9c2080e7          	jalr	-1598(ra) # 8000126e <acquire>
  b->refcnt++;
    800048b4:	fe843783          	ld	a5,-24(s0)
    800048b8:	43bc                	lw	a5,64(a5)
    800048ba:	2785                	addiw	a5,a5,1
    800048bc:	0007871b          	sext.w	a4,a5
    800048c0:	fe843783          	ld	a5,-24(s0)
    800048c4:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    800048c6:	00016517          	auipc	a0,0x16
    800048ca:	85a50513          	addi	a0,a0,-1958 # 8001a120 <bcache>
    800048ce:	ffffd097          	auipc	ra,0xffffd
    800048d2:	a04080e7          	jalr	-1532(ra) # 800012d2 <release>
}
    800048d6:	0001                	nop
    800048d8:	60e2                	ld	ra,24(sp)
    800048da:	6442                	ld	s0,16(sp)
    800048dc:	6105                	addi	sp,sp,32
    800048de:	8082                	ret

00000000800048e0 <bunpin>:

void
bunpin(struct buf *b) {
    800048e0:	1101                	addi	sp,sp,-32
    800048e2:	ec06                	sd	ra,24(sp)
    800048e4:	e822                	sd	s0,16(sp)
    800048e6:	1000                	addi	s0,sp,32
    800048e8:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    800048ec:	00016517          	auipc	a0,0x16
    800048f0:	83450513          	addi	a0,a0,-1996 # 8001a120 <bcache>
    800048f4:	ffffd097          	auipc	ra,0xffffd
    800048f8:	97a080e7          	jalr	-1670(ra) # 8000126e <acquire>
  b->refcnt--;
    800048fc:	fe843783          	ld	a5,-24(s0)
    80004900:	43bc                	lw	a5,64(a5)
    80004902:	37fd                	addiw	a5,a5,-1
    80004904:	0007871b          	sext.w	a4,a5
    80004908:	fe843783          	ld	a5,-24(s0)
    8000490c:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    8000490e:	00016517          	auipc	a0,0x16
    80004912:	81250513          	addi	a0,a0,-2030 # 8001a120 <bcache>
    80004916:	ffffd097          	auipc	ra,0xffffd
    8000491a:	9bc080e7          	jalr	-1604(ra) # 800012d2 <release>
}
    8000491e:	0001                	nop
    80004920:	60e2                	ld	ra,24(sp)
    80004922:	6442                	ld	s0,16(sp)
    80004924:	6105                	addi	sp,sp,32
    80004926:	8082                	ret

0000000080004928 <readsb>:
struct superblock sb; 

// Read the super block.
static void
readsb(int dev, struct superblock *sb)
{
    80004928:	7179                	addi	sp,sp,-48
    8000492a:	f406                	sd	ra,40(sp)
    8000492c:	f022                	sd	s0,32(sp)
    8000492e:	1800                	addi	s0,sp,48
    80004930:	87aa                	mv	a5,a0
    80004932:	fcb43823          	sd	a1,-48(s0)
    80004936:	fcf42e23          	sw	a5,-36(s0)
  struct buf *bp;

  bp = bread(dev, 1);
    8000493a:	fdc42783          	lw	a5,-36(s0)
    8000493e:	4585                	li	a1,1
    80004940:	853e                	mv	a0,a5
    80004942:	00000097          	auipc	ra,0x0
    80004946:	dc6080e7          	jalr	-570(ra) # 80004708 <bread>
    8000494a:	fea43423          	sd	a0,-24(s0)
  memmove(sb, bp->data, sizeof(*sb));
    8000494e:	fe843783          	ld	a5,-24(s0)
    80004952:	05878793          	addi	a5,a5,88
    80004956:	02000613          	li	a2,32
    8000495a:	85be                	mv	a1,a5
    8000495c:	fd043503          	ld	a0,-48(s0)
    80004960:	ffffd097          	auipc	ra,0xffffd
    80004964:	bc6080e7          	jalr	-1082(ra) # 80001526 <memmove>
  brelse(bp);
    80004968:	fe843503          	ld	a0,-24(s0)
    8000496c:	00000097          	auipc	ra,0x0
    80004970:	e3e080e7          	jalr	-450(ra) # 800047aa <brelse>
}
    80004974:	0001                	nop
    80004976:	70a2                	ld	ra,40(sp)
    80004978:	7402                	ld	s0,32(sp)
    8000497a:	6145                	addi	sp,sp,48
    8000497c:	8082                	ret

000000008000497e <fsinit>:

// Init fs
void
fsinit(int dev) {
    8000497e:	1101                	addi	sp,sp,-32
    80004980:	ec06                	sd	ra,24(sp)
    80004982:	e822                	sd	s0,16(sp)
    80004984:	1000                	addi	s0,sp,32
    80004986:	87aa                	mv	a5,a0
    80004988:	fef42623          	sw	a5,-20(s0)
  readsb(dev, &sb);
    8000498c:	fec42783          	lw	a5,-20(s0)
    80004990:	0001e597          	auipc	a1,0x1e
    80004994:	e5058593          	addi	a1,a1,-432 # 800227e0 <sb>
    80004998:	853e                	mv	a0,a5
    8000499a:	00000097          	auipc	ra,0x0
    8000499e:	f8e080e7          	jalr	-114(ra) # 80004928 <readsb>
  if(sb.magic != FSMAGIC)
    800049a2:	0001e797          	auipc	a5,0x1e
    800049a6:	e3e78793          	addi	a5,a5,-450 # 800227e0 <sb>
    800049aa:	439c                	lw	a5,0(a5)
    800049ac:	873e                	mv	a4,a5
    800049ae:	102037b7          	lui	a5,0x10203
    800049b2:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
    800049b6:	00f70a63          	beq	a4,a5,800049ca <fsinit+0x4c>
    panic("invalid file system");
    800049ba:	00007517          	auipc	a0,0x7
    800049be:	ac650513          	addi	a0,a0,-1338 # 8000b480 <etext+0x480>
    800049c2:	ffffc097          	auipc	ra,0xffffc
    800049c6:	2bc080e7          	jalr	700(ra) # 80000c7e <panic>
  initlog(dev, &sb);
    800049ca:	fec42783          	lw	a5,-20(s0)
    800049ce:	0001e597          	auipc	a1,0x1e
    800049d2:	e1258593          	addi	a1,a1,-494 # 800227e0 <sb>
    800049d6:	853e                	mv	a0,a5
    800049d8:	00001097          	auipc	ra,0x1
    800049dc:	468080e7          	jalr	1128(ra) # 80005e40 <initlog>
}
    800049e0:	0001                	nop
    800049e2:	60e2                	ld	ra,24(sp)
    800049e4:	6442                	ld	s0,16(sp)
    800049e6:	6105                	addi	sp,sp,32
    800049e8:	8082                	ret

00000000800049ea <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
    800049ea:	7179                	addi	sp,sp,-48
    800049ec:	f406                	sd	ra,40(sp)
    800049ee:	f022                	sd	s0,32(sp)
    800049f0:	1800                	addi	s0,sp,48
    800049f2:	87aa                	mv	a5,a0
    800049f4:	872e                	mv	a4,a1
    800049f6:	fcf42e23          	sw	a5,-36(s0)
    800049fa:	87ba                	mv	a5,a4
    800049fc:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;

  bp = bread(dev, bno);
    80004a00:	fdc42783          	lw	a5,-36(s0)
    80004a04:	fd842703          	lw	a4,-40(s0)
    80004a08:	85ba                	mv	a1,a4
    80004a0a:	853e                	mv	a0,a5
    80004a0c:	00000097          	auipc	ra,0x0
    80004a10:	cfc080e7          	jalr	-772(ra) # 80004708 <bread>
    80004a14:	fea43423          	sd	a0,-24(s0)
  memset(bp->data, 0, BSIZE);
    80004a18:	fe843783          	ld	a5,-24(s0)
    80004a1c:	05878793          	addi	a5,a5,88
    80004a20:	40000613          	li	a2,1024
    80004a24:	4581                	li	a1,0
    80004a26:	853e                	mv	a0,a5
    80004a28:	ffffd097          	auipc	ra,0xffffd
    80004a2c:	a1a080e7          	jalr	-1510(ra) # 80001442 <memset>
  log_write(bp);
    80004a30:	fe843503          	ld	a0,-24(s0)
    80004a34:	00002097          	auipc	ra,0x2
    80004a38:	9f4080e7          	jalr	-1548(ra) # 80006428 <log_write>
  brelse(bp);
    80004a3c:	fe843503          	ld	a0,-24(s0)
    80004a40:	00000097          	auipc	ra,0x0
    80004a44:	d6a080e7          	jalr	-662(ra) # 800047aa <brelse>
}
    80004a48:	0001                	nop
    80004a4a:	70a2                	ld	ra,40(sp)
    80004a4c:	7402                	ld	s0,32(sp)
    80004a4e:	6145                	addi	sp,sp,48
    80004a50:	8082                	ret

0000000080004a52 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
    80004a52:	7139                	addi	sp,sp,-64
    80004a54:	fc06                	sd	ra,56(sp)
    80004a56:	f822                	sd	s0,48(sp)
    80004a58:	0080                	addi	s0,sp,64
    80004a5a:	87aa                	mv	a5,a0
    80004a5c:	fcf42623          	sw	a5,-52(s0)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
    80004a60:	fe043023          	sd	zero,-32(s0)
  for(b = 0; b < sb.size; b += BPB){
    80004a64:	fe042623          	sw	zero,-20(s0)
    80004a68:	a2b5                	j	80004bd4 <balloc+0x182>
    bp = bread(dev, BBLOCK(b, sb));
    80004a6a:	fec42783          	lw	a5,-20(s0)
    80004a6e:	41f7d71b          	sraiw	a4,a5,0x1f
    80004a72:	0137571b          	srliw	a4,a4,0x13
    80004a76:	9fb9                	addw	a5,a5,a4
    80004a78:	40d7d79b          	sraiw	a5,a5,0xd
    80004a7c:	2781                	sext.w	a5,a5
    80004a7e:	0007871b          	sext.w	a4,a5
    80004a82:	0001e797          	auipc	a5,0x1e
    80004a86:	d5e78793          	addi	a5,a5,-674 # 800227e0 <sb>
    80004a8a:	4fdc                	lw	a5,28(a5)
    80004a8c:	9fb9                	addw	a5,a5,a4
    80004a8e:	0007871b          	sext.w	a4,a5
    80004a92:	fcc42783          	lw	a5,-52(s0)
    80004a96:	85ba                	mv	a1,a4
    80004a98:	853e                	mv	a0,a5
    80004a9a:	00000097          	auipc	ra,0x0
    80004a9e:	c6e080e7          	jalr	-914(ra) # 80004708 <bread>
    80004aa2:	fea43023          	sd	a0,-32(s0)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004aa6:	fe042423          	sw	zero,-24(s0)
    80004aaa:	a0dd                	j	80004b90 <balloc+0x13e>
      m = 1 << (bi % 8);
    80004aac:	fe842703          	lw	a4,-24(s0)
    80004ab0:	41f7579b          	sraiw	a5,a4,0x1f
    80004ab4:	01d7d79b          	srliw	a5,a5,0x1d
    80004ab8:	9f3d                	addw	a4,a4,a5
    80004aba:	8b1d                	andi	a4,a4,7
    80004abc:	40f707bb          	subw	a5,a4,a5
    80004ac0:	2781                	sext.w	a5,a5
    80004ac2:	4705                	li	a4,1
    80004ac4:	00f717bb          	sllw	a5,a4,a5
    80004ac8:	fcf42e23          	sw	a5,-36(s0)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
    80004acc:	fe842783          	lw	a5,-24(s0)
    80004ad0:	41f7d71b          	sraiw	a4,a5,0x1f
    80004ad4:	01d7571b          	srliw	a4,a4,0x1d
    80004ad8:	9fb9                	addw	a5,a5,a4
    80004ada:	4037d79b          	sraiw	a5,a5,0x3
    80004ade:	2781                	sext.w	a5,a5
    80004ae0:	fe043703          	ld	a4,-32(s0)
    80004ae4:	97ba                	add	a5,a5,a4
    80004ae6:	0587c783          	lbu	a5,88(a5)
    80004aea:	0007871b          	sext.w	a4,a5
    80004aee:	fdc42783          	lw	a5,-36(s0)
    80004af2:	8ff9                	and	a5,a5,a4
    80004af4:	2781                	sext.w	a5,a5
    80004af6:	ebc1                	bnez	a5,80004b86 <balloc+0x134>
        bp->data[bi/8] |= m;  // Mark block in use.
    80004af8:	fe842783          	lw	a5,-24(s0)
    80004afc:	41f7d71b          	sraiw	a4,a5,0x1f
    80004b00:	01d7571b          	srliw	a4,a4,0x1d
    80004b04:	9fb9                	addw	a5,a5,a4
    80004b06:	4037d79b          	sraiw	a5,a5,0x3
    80004b0a:	2781                	sext.w	a5,a5
    80004b0c:	fe043703          	ld	a4,-32(s0)
    80004b10:	973e                	add	a4,a4,a5
    80004b12:	05874703          	lbu	a4,88(a4)
    80004b16:	0187169b          	slliw	a3,a4,0x18
    80004b1a:	4186d69b          	sraiw	a3,a3,0x18
    80004b1e:	fdc42703          	lw	a4,-36(s0)
    80004b22:	0187171b          	slliw	a4,a4,0x18
    80004b26:	4187571b          	sraiw	a4,a4,0x18
    80004b2a:	8f55                	or	a4,a4,a3
    80004b2c:	0187171b          	slliw	a4,a4,0x18
    80004b30:	4187571b          	sraiw	a4,a4,0x18
    80004b34:	0ff77713          	andi	a4,a4,255
    80004b38:	fe043683          	ld	a3,-32(s0)
    80004b3c:	97b6                	add	a5,a5,a3
    80004b3e:	04e78c23          	sb	a4,88(a5)
        log_write(bp);
    80004b42:	fe043503          	ld	a0,-32(s0)
    80004b46:	00002097          	auipc	ra,0x2
    80004b4a:	8e2080e7          	jalr	-1822(ra) # 80006428 <log_write>
        brelse(bp);
    80004b4e:	fe043503          	ld	a0,-32(s0)
    80004b52:	00000097          	auipc	ra,0x0
    80004b56:	c58080e7          	jalr	-936(ra) # 800047aa <brelse>
        bzero(dev, b + bi);
    80004b5a:	fcc42683          	lw	a3,-52(s0)
    80004b5e:	fec42703          	lw	a4,-20(s0)
    80004b62:	fe842783          	lw	a5,-24(s0)
    80004b66:	9fb9                	addw	a5,a5,a4
    80004b68:	2781                	sext.w	a5,a5
    80004b6a:	85be                	mv	a1,a5
    80004b6c:	8536                	mv	a0,a3
    80004b6e:	00000097          	auipc	ra,0x0
    80004b72:	e7c080e7          	jalr	-388(ra) # 800049ea <bzero>
        return b + bi;
    80004b76:	fec42703          	lw	a4,-20(s0)
    80004b7a:	fe842783          	lw	a5,-24(s0)
    80004b7e:	9fb9                	addw	a5,a5,a4
    80004b80:	2781                	sext.w	a5,a5
    80004b82:	2781                	sext.w	a5,a5
    80004b84:	a88d                	j	80004bf6 <balloc+0x1a4>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004b86:	fe842783          	lw	a5,-24(s0)
    80004b8a:	2785                	addiw	a5,a5,1
    80004b8c:	fef42423          	sw	a5,-24(s0)
    80004b90:	fe842783          	lw	a5,-24(s0)
    80004b94:	0007871b          	sext.w	a4,a5
    80004b98:	6789                	lui	a5,0x2
    80004b9a:	02f75163          	bge	a4,a5,80004bbc <balloc+0x16a>
    80004b9e:	fec42703          	lw	a4,-20(s0)
    80004ba2:	fe842783          	lw	a5,-24(s0)
    80004ba6:	9fb9                	addw	a5,a5,a4
    80004ba8:	2781                	sext.w	a5,a5
    80004baa:	0007871b          	sext.w	a4,a5
    80004bae:	0001e797          	auipc	a5,0x1e
    80004bb2:	c3278793          	addi	a5,a5,-974 # 800227e0 <sb>
    80004bb6:	43dc                	lw	a5,4(a5)
    80004bb8:	eef76ae3          	bltu	a4,a5,80004aac <balloc+0x5a>
      }
    }
    brelse(bp);
    80004bbc:	fe043503          	ld	a0,-32(s0)
    80004bc0:	00000097          	auipc	ra,0x0
    80004bc4:	bea080e7          	jalr	-1046(ra) # 800047aa <brelse>
  for(b = 0; b < sb.size; b += BPB){
    80004bc8:	fec42703          	lw	a4,-20(s0)
    80004bcc:	6789                	lui	a5,0x2
    80004bce:	9fb9                	addw	a5,a5,a4
    80004bd0:	fef42623          	sw	a5,-20(s0)
    80004bd4:	0001e797          	auipc	a5,0x1e
    80004bd8:	c0c78793          	addi	a5,a5,-1012 # 800227e0 <sb>
    80004bdc:	43d8                	lw	a4,4(a5)
    80004bde:	fec42783          	lw	a5,-20(s0)
    80004be2:	e8e7e4e3          	bltu	a5,a4,80004a6a <balloc+0x18>
  }
  panic("balloc: out of blocks");
    80004be6:	00007517          	auipc	a0,0x7
    80004bea:	8b250513          	addi	a0,a0,-1870 # 8000b498 <etext+0x498>
    80004bee:	ffffc097          	auipc	ra,0xffffc
    80004bf2:	090080e7          	jalr	144(ra) # 80000c7e <panic>
}
    80004bf6:	853e                	mv	a0,a5
    80004bf8:	70e2                	ld	ra,56(sp)
    80004bfa:	7442                	ld	s0,48(sp)
    80004bfc:	6121                	addi	sp,sp,64
    80004bfe:	8082                	ret

0000000080004c00 <bfree>:

// Free a disk block.
static void
bfree(int dev, uint b)
{
    80004c00:	7179                	addi	sp,sp,-48
    80004c02:	f406                	sd	ra,40(sp)
    80004c04:	f022                	sd	s0,32(sp)
    80004c06:	1800                	addi	s0,sp,48
    80004c08:	87aa                	mv	a5,a0
    80004c0a:	872e                	mv	a4,a1
    80004c0c:	fcf42e23          	sw	a5,-36(s0)
    80004c10:	87ba                	mv	a5,a4
    80004c12:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
    80004c16:	fdc42683          	lw	a3,-36(s0)
    80004c1a:	fd842783          	lw	a5,-40(s0)
    80004c1e:	00d7d79b          	srliw	a5,a5,0xd
    80004c22:	0007871b          	sext.w	a4,a5
    80004c26:	0001e797          	auipc	a5,0x1e
    80004c2a:	bba78793          	addi	a5,a5,-1094 # 800227e0 <sb>
    80004c2e:	4fdc                	lw	a5,28(a5)
    80004c30:	9fb9                	addw	a5,a5,a4
    80004c32:	2781                	sext.w	a5,a5
    80004c34:	85be                	mv	a1,a5
    80004c36:	8536                	mv	a0,a3
    80004c38:	00000097          	auipc	ra,0x0
    80004c3c:	ad0080e7          	jalr	-1328(ra) # 80004708 <bread>
    80004c40:	fea43423          	sd	a0,-24(s0)
  bi = b % BPB;
    80004c44:	fd842703          	lw	a4,-40(s0)
    80004c48:	6789                	lui	a5,0x2
    80004c4a:	17fd                	addi	a5,a5,-1
    80004c4c:	8ff9                	and	a5,a5,a4
    80004c4e:	fef42223          	sw	a5,-28(s0)
  m = 1 << (bi % 8);
    80004c52:	fe442703          	lw	a4,-28(s0)
    80004c56:	41f7579b          	sraiw	a5,a4,0x1f
    80004c5a:	01d7d79b          	srliw	a5,a5,0x1d
    80004c5e:	9f3d                	addw	a4,a4,a5
    80004c60:	8b1d                	andi	a4,a4,7
    80004c62:	40f707bb          	subw	a5,a4,a5
    80004c66:	2781                	sext.w	a5,a5
    80004c68:	4705                	li	a4,1
    80004c6a:	00f717bb          	sllw	a5,a4,a5
    80004c6e:	fef42023          	sw	a5,-32(s0)
  if((bp->data[bi/8] & m) == 0)
    80004c72:	fe442783          	lw	a5,-28(s0)
    80004c76:	41f7d71b          	sraiw	a4,a5,0x1f
    80004c7a:	01d7571b          	srliw	a4,a4,0x1d
    80004c7e:	9fb9                	addw	a5,a5,a4
    80004c80:	4037d79b          	sraiw	a5,a5,0x3
    80004c84:	2781                	sext.w	a5,a5
    80004c86:	fe843703          	ld	a4,-24(s0)
    80004c8a:	97ba                	add	a5,a5,a4
    80004c8c:	0587c783          	lbu	a5,88(a5) # 2058 <_entry-0x7fffdfa8>
    80004c90:	0007871b          	sext.w	a4,a5
    80004c94:	fe042783          	lw	a5,-32(s0)
    80004c98:	8ff9                	and	a5,a5,a4
    80004c9a:	2781                	sext.w	a5,a5
    80004c9c:	eb89                	bnez	a5,80004cae <bfree+0xae>
    panic("freeing free block");
    80004c9e:	00007517          	auipc	a0,0x7
    80004ca2:	81250513          	addi	a0,a0,-2030 # 8000b4b0 <etext+0x4b0>
    80004ca6:	ffffc097          	auipc	ra,0xffffc
    80004caa:	fd8080e7          	jalr	-40(ra) # 80000c7e <panic>
  bp->data[bi/8] &= ~m;
    80004cae:	fe442783          	lw	a5,-28(s0)
    80004cb2:	41f7d71b          	sraiw	a4,a5,0x1f
    80004cb6:	01d7571b          	srliw	a4,a4,0x1d
    80004cba:	9fb9                	addw	a5,a5,a4
    80004cbc:	4037d79b          	sraiw	a5,a5,0x3
    80004cc0:	2781                	sext.w	a5,a5
    80004cc2:	fe843703          	ld	a4,-24(s0)
    80004cc6:	973e                	add	a4,a4,a5
    80004cc8:	05874703          	lbu	a4,88(a4)
    80004ccc:	0187169b          	slliw	a3,a4,0x18
    80004cd0:	4186d69b          	sraiw	a3,a3,0x18
    80004cd4:	fe042703          	lw	a4,-32(s0)
    80004cd8:	0187171b          	slliw	a4,a4,0x18
    80004cdc:	4187571b          	sraiw	a4,a4,0x18
    80004ce0:	fff74713          	not	a4,a4
    80004ce4:	0187171b          	slliw	a4,a4,0x18
    80004ce8:	4187571b          	sraiw	a4,a4,0x18
    80004cec:	8f75                	and	a4,a4,a3
    80004cee:	0187171b          	slliw	a4,a4,0x18
    80004cf2:	4187571b          	sraiw	a4,a4,0x18
    80004cf6:	0ff77713          	andi	a4,a4,255
    80004cfa:	fe843683          	ld	a3,-24(s0)
    80004cfe:	97b6                	add	a5,a5,a3
    80004d00:	04e78c23          	sb	a4,88(a5)
  log_write(bp);
    80004d04:	fe843503          	ld	a0,-24(s0)
    80004d08:	00001097          	auipc	ra,0x1
    80004d0c:	720080e7          	jalr	1824(ra) # 80006428 <log_write>
  brelse(bp);
    80004d10:	fe843503          	ld	a0,-24(s0)
    80004d14:	00000097          	auipc	ra,0x0
    80004d18:	a96080e7          	jalr	-1386(ra) # 800047aa <brelse>
}
    80004d1c:	0001                	nop
    80004d1e:	70a2                	ld	ra,40(sp)
    80004d20:	7402                	ld	s0,32(sp)
    80004d22:	6145                	addi	sp,sp,48
    80004d24:	8082                	ret

0000000080004d26 <iinit>:
  struct inode inode[NINODE];
} itable;

void
iinit()
{
    80004d26:	1101                	addi	sp,sp,-32
    80004d28:	ec06                	sd	ra,24(sp)
    80004d2a:	e822                	sd	s0,16(sp)
    80004d2c:	1000                	addi	s0,sp,32
  int i = 0;
    80004d2e:	fe042623          	sw	zero,-20(s0)
  
  initlock(&itable.lock, "itable");
    80004d32:	00006597          	auipc	a1,0x6
    80004d36:	79658593          	addi	a1,a1,1942 # 8000b4c8 <etext+0x4c8>
    80004d3a:	0001e517          	auipc	a0,0x1e
    80004d3e:	ac650513          	addi	a0,a0,-1338 # 80022800 <itable>
    80004d42:	ffffc097          	auipc	ra,0xffffc
    80004d46:	4fc080e7          	jalr	1276(ra) # 8000123e <initlock>
  for(i = 0; i < NINODE; i++) {
    80004d4a:	fe042623          	sw	zero,-20(s0)
    80004d4e:	a82d                	j	80004d88 <iinit+0x62>
    initsleeplock(&itable.inode[i].lock, "inode");
    80004d50:	fec42703          	lw	a4,-20(s0)
    80004d54:	87ba                	mv	a5,a4
    80004d56:	0792                	slli	a5,a5,0x4
    80004d58:	97ba                	add	a5,a5,a4
    80004d5a:	078e                	slli	a5,a5,0x3
    80004d5c:	02078713          	addi	a4,a5,32
    80004d60:	0001e797          	auipc	a5,0x1e
    80004d64:	aa078793          	addi	a5,a5,-1376 # 80022800 <itable>
    80004d68:	97ba                	add	a5,a5,a4
    80004d6a:	07a1                	addi	a5,a5,8
    80004d6c:	00006597          	auipc	a1,0x6
    80004d70:	76458593          	addi	a1,a1,1892 # 8000b4d0 <etext+0x4d0>
    80004d74:	853e                	mv	a0,a5
    80004d76:	00001097          	auipc	ra,0x1
    80004d7a:	7e6080e7          	jalr	2022(ra) # 8000655c <initsleeplock>
  for(i = 0; i < NINODE; i++) {
    80004d7e:	fec42783          	lw	a5,-20(s0)
    80004d82:	2785                	addiw	a5,a5,1
    80004d84:	fef42623          	sw	a5,-20(s0)
    80004d88:	fec42783          	lw	a5,-20(s0)
    80004d8c:	0007871b          	sext.w	a4,a5
    80004d90:	03100793          	li	a5,49
    80004d94:	fae7dee3          	bge	a5,a4,80004d50 <iinit+0x2a>
  }
}
    80004d98:	0001                	nop
    80004d9a:	0001                	nop
    80004d9c:	60e2                	ld	ra,24(sp)
    80004d9e:	6442                	ld	s0,16(sp)
    80004da0:	6105                	addi	sp,sp,32
    80004da2:	8082                	ret

0000000080004da4 <ialloc>:
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
    80004da4:	7139                	addi	sp,sp,-64
    80004da6:	fc06                	sd	ra,56(sp)
    80004da8:	f822                	sd	s0,48(sp)
    80004daa:	0080                	addi	s0,sp,64
    80004dac:	87aa                	mv	a5,a0
    80004dae:	872e                	mv	a4,a1
    80004db0:	fcf42623          	sw	a5,-52(s0)
    80004db4:	87ba                	mv	a5,a4
    80004db6:	fcf41523          	sh	a5,-54(s0)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    80004dba:	4785                	li	a5,1
    80004dbc:	fef42623          	sw	a5,-20(s0)
    80004dc0:	a855                	j	80004e74 <ialloc+0xd0>
    bp = bread(dev, IBLOCK(inum, sb));
    80004dc2:	fec42783          	lw	a5,-20(s0)
    80004dc6:	8391                	srli	a5,a5,0x4
    80004dc8:	0007871b          	sext.w	a4,a5
    80004dcc:	0001e797          	auipc	a5,0x1e
    80004dd0:	a1478793          	addi	a5,a5,-1516 # 800227e0 <sb>
    80004dd4:	4f9c                	lw	a5,24(a5)
    80004dd6:	9fb9                	addw	a5,a5,a4
    80004dd8:	0007871b          	sext.w	a4,a5
    80004ddc:	fcc42783          	lw	a5,-52(s0)
    80004de0:	85ba                	mv	a1,a4
    80004de2:	853e                	mv	a0,a5
    80004de4:	00000097          	auipc	ra,0x0
    80004de8:	924080e7          	jalr	-1756(ra) # 80004708 <bread>
    80004dec:	fea43023          	sd	a0,-32(s0)
    dip = (struct dinode*)bp->data + inum%IPB;
    80004df0:	fe043783          	ld	a5,-32(s0)
    80004df4:	05878713          	addi	a4,a5,88
    80004df8:	fec42783          	lw	a5,-20(s0)
    80004dfc:	8bbd                	andi	a5,a5,15
    80004dfe:	079a                	slli	a5,a5,0x6
    80004e00:	97ba                	add	a5,a5,a4
    80004e02:	fcf43c23          	sd	a5,-40(s0)
    if(dip->type == 0){  // a free inode
    80004e06:	fd843783          	ld	a5,-40(s0)
    80004e0a:	00079783          	lh	a5,0(a5)
    80004e0e:	eba1                	bnez	a5,80004e5e <ialloc+0xba>
      memset(dip, 0, sizeof(*dip));
    80004e10:	04000613          	li	a2,64
    80004e14:	4581                	li	a1,0
    80004e16:	fd843503          	ld	a0,-40(s0)
    80004e1a:	ffffc097          	auipc	ra,0xffffc
    80004e1e:	628080e7          	jalr	1576(ra) # 80001442 <memset>
      dip->type = type;
    80004e22:	fd843783          	ld	a5,-40(s0)
    80004e26:	fca45703          	lhu	a4,-54(s0)
    80004e2a:	00e79023          	sh	a4,0(a5)
      log_write(bp);   // mark it allocated on the disk
    80004e2e:	fe043503          	ld	a0,-32(s0)
    80004e32:	00001097          	auipc	ra,0x1
    80004e36:	5f6080e7          	jalr	1526(ra) # 80006428 <log_write>
      brelse(bp);
    80004e3a:	fe043503          	ld	a0,-32(s0)
    80004e3e:	00000097          	auipc	ra,0x0
    80004e42:	96c080e7          	jalr	-1684(ra) # 800047aa <brelse>
      return iget(dev, inum);
    80004e46:	fec42703          	lw	a4,-20(s0)
    80004e4a:	fcc42783          	lw	a5,-52(s0)
    80004e4e:	85ba                	mv	a1,a4
    80004e50:	853e                	mv	a0,a5
    80004e52:	00000097          	auipc	ra,0x0
    80004e56:	136080e7          	jalr	310(ra) # 80004f88 <iget>
    80004e5a:	87aa                	mv	a5,a0
    80004e5c:	a82d                	j	80004e96 <ialloc+0xf2>
    }
    brelse(bp);
    80004e5e:	fe043503          	ld	a0,-32(s0)
    80004e62:	00000097          	auipc	ra,0x0
    80004e66:	948080e7          	jalr	-1720(ra) # 800047aa <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
    80004e6a:	fec42783          	lw	a5,-20(s0)
    80004e6e:	2785                	addiw	a5,a5,1
    80004e70:	fef42623          	sw	a5,-20(s0)
    80004e74:	0001e797          	auipc	a5,0x1e
    80004e78:	96c78793          	addi	a5,a5,-1684 # 800227e0 <sb>
    80004e7c:	47d8                	lw	a4,12(a5)
    80004e7e:	fec42783          	lw	a5,-20(s0)
    80004e82:	f4e7e0e3          	bltu	a5,a4,80004dc2 <ialloc+0x1e>
  }
  panic("ialloc: no inodes");
    80004e86:	00006517          	auipc	a0,0x6
    80004e8a:	65250513          	addi	a0,a0,1618 # 8000b4d8 <etext+0x4d8>
    80004e8e:	ffffc097          	auipc	ra,0xffffc
    80004e92:	df0080e7          	jalr	-528(ra) # 80000c7e <panic>
}
    80004e96:	853e                	mv	a0,a5
    80004e98:	70e2                	ld	ra,56(sp)
    80004e9a:	7442                	ld	s0,48(sp)
    80004e9c:	6121                	addi	sp,sp,64
    80004e9e:	8082                	ret

0000000080004ea0 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
    80004ea0:	7179                	addi	sp,sp,-48
    80004ea2:	f406                	sd	ra,40(sp)
    80004ea4:	f022                	sd	s0,32(sp)
    80004ea6:	1800                	addi	s0,sp,48
    80004ea8:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    80004eac:	fd843783          	ld	a5,-40(s0)
    80004eb0:	4394                	lw	a3,0(a5)
    80004eb2:	fd843783          	ld	a5,-40(s0)
    80004eb6:	43dc                	lw	a5,4(a5)
    80004eb8:	0047d79b          	srliw	a5,a5,0x4
    80004ebc:	0007871b          	sext.w	a4,a5
    80004ec0:	0001e797          	auipc	a5,0x1e
    80004ec4:	92078793          	addi	a5,a5,-1760 # 800227e0 <sb>
    80004ec8:	4f9c                	lw	a5,24(a5)
    80004eca:	9fb9                	addw	a5,a5,a4
    80004ecc:	2781                	sext.w	a5,a5
    80004ece:	85be                	mv	a1,a5
    80004ed0:	8536                	mv	a0,a3
    80004ed2:	00000097          	auipc	ra,0x0
    80004ed6:	836080e7          	jalr	-1994(ra) # 80004708 <bread>
    80004eda:	fea43423          	sd	a0,-24(s0)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
    80004ede:	fe843783          	ld	a5,-24(s0)
    80004ee2:	05878713          	addi	a4,a5,88
    80004ee6:	fd843783          	ld	a5,-40(s0)
    80004eea:	43dc                	lw	a5,4(a5)
    80004eec:	1782                	slli	a5,a5,0x20
    80004eee:	9381                	srli	a5,a5,0x20
    80004ef0:	8bbd                	andi	a5,a5,15
    80004ef2:	079a                	slli	a5,a5,0x6
    80004ef4:	97ba                	add	a5,a5,a4
    80004ef6:	fef43023          	sd	a5,-32(s0)
  dip->type = ip->type;
    80004efa:	fd843783          	ld	a5,-40(s0)
    80004efe:	04479703          	lh	a4,68(a5)
    80004f02:	fe043783          	ld	a5,-32(s0)
    80004f06:	00e79023          	sh	a4,0(a5)
  dip->major = ip->major;
    80004f0a:	fd843783          	ld	a5,-40(s0)
    80004f0e:	04679703          	lh	a4,70(a5)
    80004f12:	fe043783          	ld	a5,-32(s0)
    80004f16:	00e79123          	sh	a4,2(a5)
  dip->minor = ip->minor;
    80004f1a:	fd843783          	ld	a5,-40(s0)
    80004f1e:	04879703          	lh	a4,72(a5)
    80004f22:	fe043783          	ld	a5,-32(s0)
    80004f26:	00e79223          	sh	a4,4(a5)
  dip->nlink = ip->nlink;
    80004f2a:	fd843783          	ld	a5,-40(s0)
    80004f2e:	04a79703          	lh	a4,74(a5)
    80004f32:	fe043783          	ld	a5,-32(s0)
    80004f36:	00e79323          	sh	a4,6(a5)
  dip->size = ip->size;
    80004f3a:	fd843783          	ld	a5,-40(s0)
    80004f3e:	47f8                	lw	a4,76(a5)
    80004f40:	fe043783          	ld	a5,-32(s0)
    80004f44:	c798                	sw	a4,8(a5)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
    80004f46:	fe043783          	ld	a5,-32(s0)
    80004f4a:	00c78713          	addi	a4,a5,12
    80004f4e:	fd843783          	ld	a5,-40(s0)
    80004f52:	05078793          	addi	a5,a5,80
    80004f56:	03400613          	li	a2,52
    80004f5a:	85be                	mv	a1,a5
    80004f5c:	853a                	mv	a0,a4
    80004f5e:	ffffc097          	auipc	ra,0xffffc
    80004f62:	5c8080e7          	jalr	1480(ra) # 80001526 <memmove>
  log_write(bp);
    80004f66:	fe843503          	ld	a0,-24(s0)
    80004f6a:	00001097          	auipc	ra,0x1
    80004f6e:	4be080e7          	jalr	1214(ra) # 80006428 <log_write>
  brelse(bp);
    80004f72:	fe843503          	ld	a0,-24(s0)
    80004f76:	00000097          	auipc	ra,0x0
    80004f7a:	834080e7          	jalr	-1996(ra) # 800047aa <brelse>
}
    80004f7e:	0001                	nop
    80004f80:	70a2                	ld	ra,40(sp)
    80004f82:	7402                	ld	s0,32(sp)
    80004f84:	6145                	addi	sp,sp,48
    80004f86:	8082                	ret

0000000080004f88 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
    80004f88:	7179                	addi	sp,sp,-48
    80004f8a:	f406                	sd	ra,40(sp)
    80004f8c:	f022                	sd	s0,32(sp)
    80004f8e:	1800                	addi	s0,sp,48
    80004f90:	87aa                	mv	a5,a0
    80004f92:	872e                	mv	a4,a1
    80004f94:	fcf42e23          	sw	a5,-36(s0)
    80004f98:	87ba                	mv	a5,a4
    80004f9a:	fcf42c23          	sw	a5,-40(s0)
  struct inode *ip, *empty;

  acquire(&itable.lock);
    80004f9e:	0001e517          	auipc	a0,0x1e
    80004fa2:	86250513          	addi	a0,a0,-1950 # 80022800 <itable>
    80004fa6:	ffffc097          	auipc	ra,0xffffc
    80004faa:	2c8080e7          	jalr	712(ra) # 8000126e <acquire>

  // Is the inode already in the table?
  empty = 0;
    80004fae:	fe043023          	sd	zero,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    80004fb2:	0001e797          	auipc	a5,0x1e
    80004fb6:	86678793          	addi	a5,a5,-1946 # 80022818 <itable+0x18>
    80004fba:	fef43423          	sd	a5,-24(s0)
    80004fbe:	a89d                	j	80005034 <iget+0xac>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
    80004fc0:	fe843783          	ld	a5,-24(s0)
    80004fc4:	479c                	lw	a5,8(a5)
    80004fc6:	04f05663          	blez	a5,80005012 <iget+0x8a>
    80004fca:	fe843783          	ld	a5,-24(s0)
    80004fce:	4398                	lw	a4,0(a5)
    80004fd0:	fdc42783          	lw	a5,-36(s0)
    80004fd4:	2781                	sext.w	a5,a5
    80004fd6:	02e79e63          	bne	a5,a4,80005012 <iget+0x8a>
    80004fda:	fe843783          	ld	a5,-24(s0)
    80004fde:	43d8                	lw	a4,4(a5)
    80004fe0:	fd842783          	lw	a5,-40(s0)
    80004fe4:	2781                	sext.w	a5,a5
    80004fe6:	02e79663          	bne	a5,a4,80005012 <iget+0x8a>
      ip->ref++;
    80004fea:	fe843783          	ld	a5,-24(s0)
    80004fee:	479c                	lw	a5,8(a5)
    80004ff0:	2785                	addiw	a5,a5,1
    80004ff2:	0007871b          	sext.w	a4,a5
    80004ff6:	fe843783          	ld	a5,-24(s0)
    80004ffa:	c798                	sw	a4,8(a5)
      release(&itable.lock);
    80004ffc:	0001e517          	auipc	a0,0x1e
    80005000:	80450513          	addi	a0,a0,-2044 # 80022800 <itable>
    80005004:	ffffc097          	auipc	ra,0xffffc
    80005008:	2ce080e7          	jalr	718(ra) # 800012d2 <release>
      return ip;
    8000500c:	fe843783          	ld	a5,-24(s0)
    80005010:	a069                	j	8000509a <iget+0x112>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
    80005012:	fe043783          	ld	a5,-32(s0)
    80005016:	eb89                	bnez	a5,80005028 <iget+0xa0>
    80005018:	fe843783          	ld	a5,-24(s0)
    8000501c:	479c                	lw	a5,8(a5)
    8000501e:	e789                	bnez	a5,80005028 <iget+0xa0>
      empty = ip;
    80005020:	fe843783          	ld	a5,-24(s0)
    80005024:	fef43023          	sd	a5,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    80005028:	fe843783          	ld	a5,-24(s0)
    8000502c:	08878793          	addi	a5,a5,136
    80005030:	fef43423          	sd	a5,-24(s0)
    80005034:	fe843703          	ld	a4,-24(s0)
    80005038:	0001f797          	auipc	a5,0x1f
    8000503c:	27078793          	addi	a5,a5,624 # 800242a8 <log>
    80005040:	f8f760e3          	bltu	a4,a5,80004fc0 <iget+0x38>
  }

  // Recycle an inode entry.
  if(empty == 0)
    80005044:	fe043783          	ld	a5,-32(s0)
    80005048:	eb89                	bnez	a5,8000505a <iget+0xd2>
    panic("iget: no inodes");
    8000504a:	00006517          	auipc	a0,0x6
    8000504e:	4a650513          	addi	a0,a0,1190 # 8000b4f0 <etext+0x4f0>
    80005052:	ffffc097          	auipc	ra,0xffffc
    80005056:	c2c080e7          	jalr	-980(ra) # 80000c7e <panic>

  ip = empty;
    8000505a:	fe043783          	ld	a5,-32(s0)
    8000505e:	fef43423          	sd	a5,-24(s0)
  ip->dev = dev;
    80005062:	fe843783          	ld	a5,-24(s0)
    80005066:	fdc42703          	lw	a4,-36(s0)
    8000506a:	c398                	sw	a4,0(a5)
  ip->inum = inum;
    8000506c:	fe843783          	ld	a5,-24(s0)
    80005070:	fd842703          	lw	a4,-40(s0)
    80005074:	c3d8                	sw	a4,4(a5)
  ip->ref = 1;
    80005076:	fe843783          	ld	a5,-24(s0)
    8000507a:	4705                	li	a4,1
    8000507c:	c798                	sw	a4,8(a5)
  ip->valid = 0;
    8000507e:	fe843783          	ld	a5,-24(s0)
    80005082:	0407a023          	sw	zero,64(a5)
  release(&itable.lock);
    80005086:	0001d517          	auipc	a0,0x1d
    8000508a:	77a50513          	addi	a0,a0,1914 # 80022800 <itable>
    8000508e:	ffffc097          	auipc	ra,0xffffc
    80005092:	244080e7          	jalr	580(ra) # 800012d2 <release>

  return ip;
    80005096:	fe843783          	ld	a5,-24(s0)
}
    8000509a:	853e                	mv	a0,a5
    8000509c:	70a2                	ld	ra,40(sp)
    8000509e:	7402                	ld	s0,32(sp)
    800050a0:	6145                	addi	sp,sp,48
    800050a2:	8082                	ret

00000000800050a4 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
    800050a4:	1101                	addi	sp,sp,-32
    800050a6:	ec06                	sd	ra,24(sp)
    800050a8:	e822                	sd	s0,16(sp)
    800050aa:	1000                	addi	s0,sp,32
    800050ac:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    800050b0:	0001d517          	auipc	a0,0x1d
    800050b4:	75050513          	addi	a0,a0,1872 # 80022800 <itable>
    800050b8:	ffffc097          	auipc	ra,0xffffc
    800050bc:	1b6080e7          	jalr	438(ra) # 8000126e <acquire>
  ip->ref++;
    800050c0:	fe843783          	ld	a5,-24(s0)
    800050c4:	479c                	lw	a5,8(a5)
    800050c6:	2785                	addiw	a5,a5,1
    800050c8:	0007871b          	sext.w	a4,a5
    800050cc:	fe843783          	ld	a5,-24(s0)
    800050d0:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    800050d2:	0001d517          	auipc	a0,0x1d
    800050d6:	72e50513          	addi	a0,a0,1838 # 80022800 <itable>
    800050da:	ffffc097          	auipc	ra,0xffffc
    800050de:	1f8080e7          	jalr	504(ra) # 800012d2 <release>
  return ip;
    800050e2:	fe843783          	ld	a5,-24(s0)
}
    800050e6:	853e                	mv	a0,a5
    800050e8:	60e2                	ld	ra,24(sp)
    800050ea:	6442                	ld	s0,16(sp)
    800050ec:	6105                	addi	sp,sp,32
    800050ee:	8082                	ret

00000000800050f0 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
    800050f0:	7179                	addi	sp,sp,-48
    800050f2:	f406                	sd	ra,40(sp)
    800050f4:	f022                	sd	s0,32(sp)
    800050f6:	1800                	addi	s0,sp,48
    800050f8:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    800050fc:	fd843783          	ld	a5,-40(s0)
    80005100:	c791                	beqz	a5,8000510c <ilock+0x1c>
    80005102:	fd843783          	ld	a5,-40(s0)
    80005106:	479c                	lw	a5,8(a5)
    80005108:	00f04a63          	bgtz	a5,8000511c <ilock+0x2c>
    panic("ilock");
    8000510c:	00006517          	auipc	a0,0x6
    80005110:	3f450513          	addi	a0,a0,1012 # 8000b500 <etext+0x500>
    80005114:	ffffc097          	auipc	ra,0xffffc
    80005118:	b6a080e7          	jalr	-1174(ra) # 80000c7e <panic>

  acquiresleep(&ip->lock);
    8000511c:	fd843783          	ld	a5,-40(s0)
    80005120:	07c1                	addi	a5,a5,16
    80005122:	853e                	mv	a0,a5
    80005124:	00001097          	auipc	ra,0x1
    80005128:	484080e7          	jalr	1156(ra) # 800065a8 <acquiresleep>

  if(ip->valid == 0){
    8000512c:	fd843783          	ld	a5,-40(s0)
    80005130:	43bc                	lw	a5,64(a5)
    80005132:	e7e5                	bnez	a5,8000521a <ilock+0x12a>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    80005134:	fd843783          	ld	a5,-40(s0)
    80005138:	4394                	lw	a3,0(a5)
    8000513a:	fd843783          	ld	a5,-40(s0)
    8000513e:	43dc                	lw	a5,4(a5)
    80005140:	0047d79b          	srliw	a5,a5,0x4
    80005144:	0007871b          	sext.w	a4,a5
    80005148:	0001d797          	auipc	a5,0x1d
    8000514c:	69878793          	addi	a5,a5,1688 # 800227e0 <sb>
    80005150:	4f9c                	lw	a5,24(a5)
    80005152:	9fb9                	addw	a5,a5,a4
    80005154:	2781                	sext.w	a5,a5
    80005156:	85be                	mv	a1,a5
    80005158:	8536                	mv	a0,a3
    8000515a:	fffff097          	auipc	ra,0xfffff
    8000515e:	5ae080e7          	jalr	1454(ra) # 80004708 <bread>
    80005162:	fea43423          	sd	a0,-24(s0)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    80005166:	fe843783          	ld	a5,-24(s0)
    8000516a:	05878713          	addi	a4,a5,88
    8000516e:	fd843783          	ld	a5,-40(s0)
    80005172:	43dc                	lw	a5,4(a5)
    80005174:	1782                	slli	a5,a5,0x20
    80005176:	9381                	srli	a5,a5,0x20
    80005178:	8bbd                	andi	a5,a5,15
    8000517a:	079a                	slli	a5,a5,0x6
    8000517c:	97ba                	add	a5,a5,a4
    8000517e:	fef43023          	sd	a5,-32(s0)
    ip->type = dip->type;
    80005182:	fe043783          	ld	a5,-32(s0)
    80005186:	00079703          	lh	a4,0(a5)
    8000518a:	fd843783          	ld	a5,-40(s0)
    8000518e:	04e79223          	sh	a4,68(a5)
    ip->major = dip->major;
    80005192:	fe043783          	ld	a5,-32(s0)
    80005196:	00279703          	lh	a4,2(a5)
    8000519a:	fd843783          	ld	a5,-40(s0)
    8000519e:	04e79323          	sh	a4,70(a5)
    ip->minor = dip->minor;
    800051a2:	fe043783          	ld	a5,-32(s0)
    800051a6:	00479703          	lh	a4,4(a5)
    800051aa:	fd843783          	ld	a5,-40(s0)
    800051ae:	04e79423          	sh	a4,72(a5)
    ip->nlink = dip->nlink;
    800051b2:	fe043783          	ld	a5,-32(s0)
    800051b6:	00679703          	lh	a4,6(a5)
    800051ba:	fd843783          	ld	a5,-40(s0)
    800051be:	04e79523          	sh	a4,74(a5)
    ip->size = dip->size;
    800051c2:	fe043783          	ld	a5,-32(s0)
    800051c6:	4798                	lw	a4,8(a5)
    800051c8:	fd843783          	ld	a5,-40(s0)
    800051cc:	c7f8                	sw	a4,76(a5)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    800051ce:	fd843783          	ld	a5,-40(s0)
    800051d2:	05078713          	addi	a4,a5,80
    800051d6:	fe043783          	ld	a5,-32(s0)
    800051da:	07b1                	addi	a5,a5,12
    800051dc:	03400613          	li	a2,52
    800051e0:	85be                	mv	a1,a5
    800051e2:	853a                	mv	a0,a4
    800051e4:	ffffc097          	auipc	ra,0xffffc
    800051e8:	342080e7          	jalr	834(ra) # 80001526 <memmove>
    brelse(bp);
    800051ec:	fe843503          	ld	a0,-24(s0)
    800051f0:	fffff097          	auipc	ra,0xfffff
    800051f4:	5ba080e7          	jalr	1466(ra) # 800047aa <brelse>
    ip->valid = 1;
    800051f8:	fd843783          	ld	a5,-40(s0)
    800051fc:	4705                	li	a4,1
    800051fe:	c3b8                	sw	a4,64(a5)
    if(ip->type == 0)
    80005200:	fd843783          	ld	a5,-40(s0)
    80005204:	04479783          	lh	a5,68(a5)
    80005208:	eb89                	bnez	a5,8000521a <ilock+0x12a>
      panic("ilock: no type");
    8000520a:	00006517          	auipc	a0,0x6
    8000520e:	2fe50513          	addi	a0,a0,766 # 8000b508 <etext+0x508>
    80005212:	ffffc097          	auipc	ra,0xffffc
    80005216:	a6c080e7          	jalr	-1428(ra) # 80000c7e <panic>
  }
}
    8000521a:	0001                	nop
    8000521c:	70a2                	ld	ra,40(sp)
    8000521e:	7402                	ld	s0,32(sp)
    80005220:	6145                	addi	sp,sp,48
    80005222:	8082                	ret

0000000080005224 <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
    80005224:	1101                	addi	sp,sp,-32
    80005226:	ec06                	sd	ra,24(sp)
    80005228:	e822                	sd	s0,16(sp)
    8000522a:	1000                	addi	s0,sp,32
    8000522c:	fea43423          	sd	a0,-24(s0)
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    80005230:	fe843783          	ld	a5,-24(s0)
    80005234:	c385                	beqz	a5,80005254 <iunlock+0x30>
    80005236:	fe843783          	ld	a5,-24(s0)
    8000523a:	07c1                	addi	a5,a5,16
    8000523c:	853e                	mv	a0,a5
    8000523e:	00001097          	auipc	ra,0x1
    80005242:	42a080e7          	jalr	1066(ra) # 80006668 <holdingsleep>
    80005246:	87aa                	mv	a5,a0
    80005248:	c791                	beqz	a5,80005254 <iunlock+0x30>
    8000524a:	fe843783          	ld	a5,-24(s0)
    8000524e:	479c                	lw	a5,8(a5)
    80005250:	00f04a63          	bgtz	a5,80005264 <iunlock+0x40>
    panic("iunlock");
    80005254:	00006517          	auipc	a0,0x6
    80005258:	2c450513          	addi	a0,a0,708 # 8000b518 <etext+0x518>
    8000525c:	ffffc097          	auipc	ra,0xffffc
    80005260:	a22080e7          	jalr	-1502(ra) # 80000c7e <panic>

  releasesleep(&ip->lock);
    80005264:	fe843783          	ld	a5,-24(s0)
    80005268:	07c1                	addi	a5,a5,16
    8000526a:	853e                	mv	a0,a5
    8000526c:	00001097          	auipc	ra,0x1
    80005270:	3aa080e7          	jalr	938(ra) # 80006616 <releasesleep>
}
    80005274:	0001                	nop
    80005276:	60e2                	ld	ra,24(sp)
    80005278:	6442                	ld	s0,16(sp)
    8000527a:	6105                	addi	sp,sp,32
    8000527c:	8082                	ret

000000008000527e <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
    8000527e:	1101                	addi	sp,sp,-32
    80005280:	ec06                	sd	ra,24(sp)
    80005282:	e822                	sd	s0,16(sp)
    80005284:	1000                	addi	s0,sp,32
    80005286:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    8000528a:	0001d517          	auipc	a0,0x1d
    8000528e:	57650513          	addi	a0,a0,1398 # 80022800 <itable>
    80005292:	ffffc097          	auipc	ra,0xffffc
    80005296:	fdc080e7          	jalr	-36(ra) # 8000126e <acquire>

  if(ip->ref == 1 && ip->valid && ip->nlink == 0){
    8000529a:	fe843783          	ld	a5,-24(s0)
    8000529e:	479c                	lw	a5,8(a5)
    800052a0:	873e                	mv	a4,a5
    800052a2:	4785                	li	a5,1
    800052a4:	06f71f63          	bne	a4,a5,80005322 <iput+0xa4>
    800052a8:	fe843783          	ld	a5,-24(s0)
    800052ac:	43bc                	lw	a5,64(a5)
    800052ae:	cbb5                	beqz	a5,80005322 <iput+0xa4>
    800052b0:	fe843783          	ld	a5,-24(s0)
    800052b4:	04a79783          	lh	a5,74(a5)
    800052b8:	e7ad                	bnez	a5,80005322 <iput+0xa4>
    // inode has no links and no other references: truncate and free.

    // ip->ref == 1 means no other process can have ip locked,
    // so this acquiresleep() won't block (or deadlock).
    acquiresleep(&ip->lock);
    800052ba:	fe843783          	ld	a5,-24(s0)
    800052be:	07c1                	addi	a5,a5,16
    800052c0:	853e                	mv	a0,a5
    800052c2:	00001097          	auipc	ra,0x1
    800052c6:	2e6080e7          	jalr	742(ra) # 800065a8 <acquiresleep>

    release(&itable.lock);
    800052ca:	0001d517          	auipc	a0,0x1d
    800052ce:	53650513          	addi	a0,a0,1334 # 80022800 <itable>
    800052d2:	ffffc097          	auipc	ra,0xffffc
    800052d6:	000080e7          	jalr	ra # 800012d2 <release>

    itrunc(ip);
    800052da:	fe843503          	ld	a0,-24(s0)
    800052de:	00000097          	auipc	ra,0x0
    800052e2:	1fa080e7          	jalr	506(ra) # 800054d8 <itrunc>
    ip->type = 0;
    800052e6:	fe843783          	ld	a5,-24(s0)
    800052ea:	04079223          	sh	zero,68(a5)
    iupdate(ip);
    800052ee:	fe843503          	ld	a0,-24(s0)
    800052f2:	00000097          	auipc	ra,0x0
    800052f6:	bae080e7          	jalr	-1106(ra) # 80004ea0 <iupdate>
    ip->valid = 0;
    800052fa:	fe843783          	ld	a5,-24(s0)
    800052fe:	0407a023          	sw	zero,64(a5)

    releasesleep(&ip->lock);
    80005302:	fe843783          	ld	a5,-24(s0)
    80005306:	07c1                	addi	a5,a5,16
    80005308:	853e                	mv	a0,a5
    8000530a:	00001097          	auipc	ra,0x1
    8000530e:	30c080e7          	jalr	780(ra) # 80006616 <releasesleep>

    acquire(&itable.lock);
    80005312:	0001d517          	auipc	a0,0x1d
    80005316:	4ee50513          	addi	a0,a0,1262 # 80022800 <itable>
    8000531a:	ffffc097          	auipc	ra,0xffffc
    8000531e:	f54080e7          	jalr	-172(ra) # 8000126e <acquire>
  }

  ip->ref--;
    80005322:	fe843783          	ld	a5,-24(s0)
    80005326:	479c                	lw	a5,8(a5)
    80005328:	37fd                	addiw	a5,a5,-1
    8000532a:	0007871b          	sext.w	a4,a5
    8000532e:	fe843783          	ld	a5,-24(s0)
    80005332:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    80005334:	0001d517          	auipc	a0,0x1d
    80005338:	4cc50513          	addi	a0,a0,1228 # 80022800 <itable>
    8000533c:	ffffc097          	auipc	ra,0xffffc
    80005340:	f96080e7          	jalr	-106(ra) # 800012d2 <release>
}
    80005344:	0001                	nop
    80005346:	60e2                	ld	ra,24(sp)
    80005348:	6442                	ld	s0,16(sp)
    8000534a:	6105                	addi	sp,sp,32
    8000534c:	8082                	ret

000000008000534e <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
    8000534e:	1101                	addi	sp,sp,-32
    80005350:	ec06                	sd	ra,24(sp)
    80005352:	e822                	sd	s0,16(sp)
    80005354:	1000                	addi	s0,sp,32
    80005356:	fea43423          	sd	a0,-24(s0)
  iunlock(ip);
    8000535a:	fe843503          	ld	a0,-24(s0)
    8000535e:	00000097          	auipc	ra,0x0
    80005362:	ec6080e7          	jalr	-314(ra) # 80005224 <iunlock>
  iput(ip);
    80005366:	fe843503          	ld	a0,-24(s0)
    8000536a:	00000097          	auipc	ra,0x0
    8000536e:	f14080e7          	jalr	-236(ra) # 8000527e <iput>
}
    80005372:	0001                	nop
    80005374:	60e2                	ld	ra,24(sp)
    80005376:	6442                	ld	s0,16(sp)
    80005378:	6105                	addi	sp,sp,32
    8000537a:	8082                	ret

000000008000537c <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
    8000537c:	7139                	addi	sp,sp,-64
    8000537e:	fc06                	sd	ra,56(sp)
    80005380:	f822                	sd	s0,48(sp)
    80005382:	0080                	addi	s0,sp,64
    80005384:	fca43423          	sd	a0,-56(s0)
    80005388:	87ae                	mv	a5,a1
    8000538a:	fcf42223          	sw	a5,-60(s0)
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    8000538e:	fc442783          	lw	a5,-60(s0)
    80005392:	0007871b          	sext.w	a4,a5
    80005396:	47ad                	li	a5,11
    80005398:	04e7e863          	bltu	a5,a4,800053e8 <bmap+0x6c>
    if((addr = ip->addrs[bn]) == 0)
    8000539c:	fc843703          	ld	a4,-56(s0)
    800053a0:	fc446783          	lwu	a5,-60(s0)
    800053a4:	07d1                	addi	a5,a5,20
    800053a6:	078a                	slli	a5,a5,0x2
    800053a8:	97ba                	add	a5,a5,a4
    800053aa:	439c                	lw	a5,0(a5)
    800053ac:	fef42623          	sw	a5,-20(s0)
    800053b0:	fec42783          	lw	a5,-20(s0)
    800053b4:	2781                	sext.w	a5,a5
    800053b6:	e795                	bnez	a5,800053e2 <bmap+0x66>
      ip->addrs[bn] = addr = balloc(ip->dev);
    800053b8:	fc843783          	ld	a5,-56(s0)
    800053bc:	439c                	lw	a5,0(a5)
    800053be:	853e                	mv	a0,a5
    800053c0:	fffff097          	auipc	ra,0xfffff
    800053c4:	692080e7          	jalr	1682(ra) # 80004a52 <balloc>
    800053c8:	87aa                	mv	a5,a0
    800053ca:	fef42623          	sw	a5,-20(s0)
    800053ce:	fc843703          	ld	a4,-56(s0)
    800053d2:	fc446783          	lwu	a5,-60(s0)
    800053d6:	07d1                	addi	a5,a5,20
    800053d8:	078a                	slli	a5,a5,0x2
    800053da:	97ba                	add	a5,a5,a4
    800053dc:	fec42703          	lw	a4,-20(s0)
    800053e0:	c398                	sw	a4,0(a5)
    return addr;
    800053e2:	fec42783          	lw	a5,-20(s0)
    800053e6:	a0e5                	j	800054ce <bmap+0x152>
  }
  bn -= NDIRECT;
    800053e8:	fc442783          	lw	a5,-60(s0)
    800053ec:	37d1                	addiw	a5,a5,-12
    800053ee:	fcf42223          	sw	a5,-60(s0)

  if(bn < NINDIRECT){
    800053f2:	fc442783          	lw	a5,-60(s0)
    800053f6:	0007871b          	sext.w	a4,a5
    800053fa:	0ff00793          	li	a5,255
    800053fe:	0ce7e063          	bltu	a5,a4,800054be <bmap+0x142>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
    80005402:	fc843783          	ld	a5,-56(s0)
    80005406:	0807a783          	lw	a5,128(a5)
    8000540a:	fef42623          	sw	a5,-20(s0)
    8000540e:	fec42783          	lw	a5,-20(s0)
    80005412:	2781                	sext.w	a5,a5
    80005414:	e395                	bnez	a5,80005438 <bmap+0xbc>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    80005416:	fc843783          	ld	a5,-56(s0)
    8000541a:	439c                	lw	a5,0(a5)
    8000541c:	853e                	mv	a0,a5
    8000541e:	fffff097          	auipc	ra,0xfffff
    80005422:	634080e7          	jalr	1588(ra) # 80004a52 <balloc>
    80005426:	87aa                	mv	a5,a0
    80005428:	fef42623          	sw	a5,-20(s0)
    8000542c:	fc843783          	ld	a5,-56(s0)
    80005430:	fec42703          	lw	a4,-20(s0)
    80005434:	08e7a023          	sw	a4,128(a5)
    bp = bread(ip->dev, addr);
    80005438:	fc843783          	ld	a5,-56(s0)
    8000543c:	439c                	lw	a5,0(a5)
    8000543e:	fec42703          	lw	a4,-20(s0)
    80005442:	85ba                	mv	a1,a4
    80005444:	853e                	mv	a0,a5
    80005446:	fffff097          	auipc	ra,0xfffff
    8000544a:	2c2080e7          	jalr	706(ra) # 80004708 <bread>
    8000544e:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    80005452:	fe043783          	ld	a5,-32(s0)
    80005456:	05878793          	addi	a5,a5,88
    8000545a:	fcf43c23          	sd	a5,-40(s0)
    if((addr = a[bn]) == 0){
    8000545e:	fc446783          	lwu	a5,-60(s0)
    80005462:	078a                	slli	a5,a5,0x2
    80005464:	fd843703          	ld	a4,-40(s0)
    80005468:	97ba                	add	a5,a5,a4
    8000546a:	439c                	lw	a5,0(a5)
    8000546c:	fef42623          	sw	a5,-20(s0)
    80005470:	fec42783          	lw	a5,-20(s0)
    80005474:	2781                	sext.w	a5,a5
    80005476:	eb9d                	bnez	a5,800054ac <bmap+0x130>
      a[bn] = addr = balloc(ip->dev);
    80005478:	fc843783          	ld	a5,-56(s0)
    8000547c:	439c                	lw	a5,0(a5)
    8000547e:	853e                	mv	a0,a5
    80005480:	fffff097          	auipc	ra,0xfffff
    80005484:	5d2080e7          	jalr	1490(ra) # 80004a52 <balloc>
    80005488:	87aa                	mv	a5,a0
    8000548a:	fef42623          	sw	a5,-20(s0)
    8000548e:	fc446783          	lwu	a5,-60(s0)
    80005492:	078a                	slli	a5,a5,0x2
    80005494:	fd843703          	ld	a4,-40(s0)
    80005498:	97ba                	add	a5,a5,a4
    8000549a:	fec42703          	lw	a4,-20(s0)
    8000549e:	c398                	sw	a4,0(a5)
      log_write(bp);
    800054a0:	fe043503          	ld	a0,-32(s0)
    800054a4:	00001097          	auipc	ra,0x1
    800054a8:	f84080e7          	jalr	-124(ra) # 80006428 <log_write>
    }
    brelse(bp);
    800054ac:	fe043503          	ld	a0,-32(s0)
    800054b0:	fffff097          	auipc	ra,0xfffff
    800054b4:	2fa080e7          	jalr	762(ra) # 800047aa <brelse>
    return addr;
    800054b8:	fec42783          	lw	a5,-20(s0)
    800054bc:	a809                	j	800054ce <bmap+0x152>
  }

  panic("bmap: out of range");
    800054be:	00006517          	auipc	a0,0x6
    800054c2:	06250513          	addi	a0,a0,98 # 8000b520 <etext+0x520>
    800054c6:	ffffb097          	auipc	ra,0xffffb
    800054ca:	7b8080e7          	jalr	1976(ra) # 80000c7e <panic>
}
    800054ce:	853e                	mv	a0,a5
    800054d0:	70e2                	ld	ra,56(sp)
    800054d2:	7442                	ld	s0,48(sp)
    800054d4:	6121                	addi	sp,sp,64
    800054d6:	8082                	ret

00000000800054d8 <itrunc>:

// Truncate inode (discard contents).
// Caller must hold ip->lock.
void
itrunc(struct inode *ip)
{
    800054d8:	7139                	addi	sp,sp,-64
    800054da:	fc06                	sd	ra,56(sp)
    800054dc:	f822                	sd	s0,48(sp)
    800054de:	0080                	addi	s0,sp,64
    800054e0:	fca43423          	sd	a0,-56(s0)
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    800054e4:	fe042623          	sw	zero,-20(s0)
    800054e8:	a899                	j	8000553e <itrunc+0x66>
    if(ip->addrs[i]){
    800054ea:	fc843703          	ld	a4,-56(s0)
    800054ee:	fec42783          	lw	a5,-20(s0)
    800054f2:	07d1                	addi	a5,a5,20
    800054f4:	078a                	slli	a5,a5,0x2
    800054f6:	97ba                	add	a5,a5,a4
    800054f8:	439c                	lw	a5,0(a5)
    800054fa:	cf8d                	beqz	a5,80005534 <itrunc+0x5c>
      bfree(ip->dev, ip->addrs[i]);
    800054fc:	fc843783          	ld	a5,-56(s0)
    80005500:	439c                	lw	a5,0(a5)
    80005502:	0007869b          	sext.w	a3,a5
    80005506:	fc843703          	ld	a4,-56(s0)
    8000550a:	fec42783          	lw	a5,-20(s0)
    8000550e:	07d1                	addi	a5,a5,20
    80005510:	078a                	slli	a5,a5,0x2
    80005512:	97ba                	add	a5,a5,a4
    80005514:	439c                	lw	a5,0(a5)
    80005516:	85be                	mv	a1,a5
    80005518:	8536                	mv	a0,a3
    8000551a:	fffff097          	auipc	ra,0xfffff
    8000551e:	6e6080e7          	jalr	1766(ra) # 80004c00 <bfree>
      ip->addrs[i] = 0;
    80005522:	fc843703          	ld	a4,-56(s0)
    80005526:	fec42783          	lw	a5,-20(s0)
    8000552a:	07d1                	addi	a5,a5,20
    8000552c:	078a                	slli	a5,a5,0x2
    8000552e:	97ba                	add	a5,a5,a4
    80005530:	0007a023          	sw	zero,0(a5)
  for(i = 0; i < NDIRECT; i++){
    80005534:	fec42783          	lw	a5,-20(s0)
    80005538:	2785                	addiw	a5,a5,1
    8000553a:	fef42623          	sw	a5,-20(s0)
    8000553e:	fec42783          	lw	a5,-20(s0)
    80005542:	0007871b          	sext.w	a4,a5
    80005546:	47ad                	li	a5,11
    80005548:	fae7d1e3          	bge	a5,a4,800054ea <itrunc+0x12>
    }
  }

  if(ip->addrs[NDIRECT]){
    8000554c:	fc843783          	ld	a5,-56(s0)
    80005550:	0807a783          	lw	a5,128(a5)
    80005554:	cbc5                	beqz	a5,80005604 <itrunc+0x12c>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    80005556:	fc843783          	ld	a5,-56(s0)
    8000555a:	4398                	lw	a4,0(a5)
    8000555c:	fc843783          	ld	a5,-56(s0)
    80005560:	0807a783          	lw	a5,128(a5)
    80005564:	85be                	mv	a1,a5
    80005566:	853a                	mv	a0,a4
    80005568:	fffff097          	auipc	ra,0xfffff
    8000556c:	1a0080e7          	jalr	416(ra) # 80004708 <bread>
    80005570:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    80005574:	fe043783          	ld	a5,-32(s0)
    80005578:	05878793          	addi	a5,a5,88
    8000557c:	fcf43c23          	sd	a5,-40(s0)
    for(j = 0; j < NINDIRECT; j++){
    80005580:	fe042423          	sw	zero,-24(s0)
    80005584:	a081                	j	800055c4 <itrunc+0xec>
      if(a[j])
    80005586:	fe842783          	lw	a5,-24(s0)
    8000558a:	078a                	slli	a5,a5,0x2
    8000558c:	fd843703          	ld	a4,-40(s0)
    80005590:	97ba                	add	a5,a5,a4
    80005592:	439c                	lw	a5,0(a5)
    80005594:	c39d                	beqz	a5,800055ba <itrunc+0xe2>
        bfree(ip->dev, a[j]);
    80005596:	fc843783          	ld	a5,-56(s0)
    8000559a:	439c                	lw	a5,0(a5)
    8000559c:	0007869b          	sext.w	a3,a5
    800055a0:	fe842783          	lw	a5,-24(s0)
    800055a4:	078a                	slli	a5,a5,0x2
    800055a6:	fd843703          	ld	a4,-40(s0)
    800055aa:	97ba                	add	a5,a5,a4
    800055ac:	439c                	lw	a5,0(a5)
    800055ae:	85be                	mv	a1,a5
    800055b0:	8536                	mv	a0,a3
    800055b2:	fffff097          	auipc	ra,0xfffff
    800055b6:	64e080e7          	jalr	1614(ra) # 80004c00 <bfree>
    for(j = 0; j < NINDIRECT; j++){
    800055ba:	fe842783          	lw	a5,-24(s0)
    800055be:	2785                	addiw	a5,a5,1
    800055c0:	fef42423          	sw	a5,-24(s0)
    800055c4:	fe842783          	lw	a5,-24(s0)
    800055c8:	873e                	mv	a4,a5
    800055ca:	0ff00793          	li	a5,255
    800055ce:	fae7fce3          	bgeu	a5,a4,80005586 <itrunc+0xae>
    }
    brelse(bp);
    800055d2:	fe043503          	ld	a0,-32(s0)
    800055d6:	fffff097          	auipc	ra,0xfffff
    800055da:	1d4080e7          	jalr	468(ra) # 800047aa <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    800055de:	fc843783          	ld	a5,-56(s0)
    800055e2:	439c                	lw	a5,0(a5)
    800055e4:	0007871b          	sext.w	a4,a5
    800055e8:	fc843783          	ld	a5,-56(s0)
    800055ec:	0807a783          	lw	a5,128(a5)
    800055f0:	85be                	mv	a1,a5
    800055f2:	853a                	mv	a0,a4
    800055f4:	fffff097          	auipc	ra,0xfffff
    800055f8:	60c080e7          	jalr	1548(ra) # 80004c00 <bfree>
    ip->addrs[NDIRECT] = 0;
    800055fc:	fc843783          	ld	a5,-56(s0)
    80005600:	0807a023          	sw	zero,128(a5)
  }

  ip->size = 0;
    80005604:	fc843783          	ld	a5,-56(s0)
    80005608:	0407a623          	sw	zero,76(a5)
  iupdate(ip);
    8000560c:	fc843503          	ld	a0,-56(s0)
    80005610:	00000097          	auipc	ra,0x0
    80005614:	890080e7          	jalr	-1904(ra) # 80004ea0 <iupdate>
}
    80005618:	0001                	nop
    8000561a:	70e2                	ld	ra,56(sp)
    8000561c:	7442                	ld	s0,48(sp)
    8000561e:	6121                	addi	sp,sp,64
    80005620:	8082                	ret

0000000080005622 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
    80005622:	1101                	addi	sp,sp,-32
    80005624:	ec22                	sd	s0,24(sp)
    80005626:	1000                	addi	s0,sp,32
    80005628:	fea43423          	sd	a0,-24(s0)
    8000562c:	feb43023          	sd	a1,-32(s0)
  st->dev = ip->dev;
    80005630:	fe843783          	ld	a5,-24(s0)
    80005634:	439c                	lw	a5,0(a5)
    80005636:	0007871b          	sext.w	a4,a5
    8000563a:	fe043783          	ld	a5,-32(s0)
    8000563e:	c398                	sw	a4,0(a5)
  st->ino = ip->inum;
    80005640:	fe843783          	ld	a5,-24(s0)
    80005644:	43d8                	lw	a4,4(a5)
    80005646:	fe043783          	ld	a5,-32(s0)
    8000564a:	c3d8                	sw	a4,4(a5)
  st->type = ip->type;
    8000564c:	fe843783          	ld	a5,-24(s0)
    80005650:	04479703          	lh	a4,68(a5)
    80005654:	fe043783          	ld	a5,-32(s0)
    80005658:	00e79423          	sh	a4,8(a5)
  st->nlink = ip->nlink;
    8000565c:	fe843783          	ld	a5,-24(s0)
    80005660:	04a79703          	lh	a4,74(a5)
    80005664:	fe043783          	ld	a5,-32(s0)
    80005668:	00e79523          	sh	a4,10(a5)
  st->size = ip->size;
    8000566c:	fe843783          	ld	a5,-24(s0)
    80005670:	47fc                	lw	a5,76(a5)
    80005672:	02079713          	slli	a4,a5,0x20
    80005676:	9301                	srli	a4,a4,0x20
    80005678:	fe043783          	ld	a5,-32(s0)
    8000567c:	eb98                	sd	a4,16(a5)
}
    8000567e:	0001                	nop
    80005680:	6462                	ld	s0,24(sp)
    80005682:	6105                	addi	sp,sp,32
    80005684:	8082                	ret

0000000080005686 <readi>:
// Caller must hold ip->lock.
// If user_dst==1, then dst is a user virtual address;
// otherwise, dst is a kernel address.
int
readi(struct inode *ip, int user_dst, uint64 dst, uint off, uint n)
{
    80005686:	711d                	addi	sp,sp,-96
    80005688:	ec86                	sd	ra,88(sp)
    8000568a:	e8a2                	sd	s0,80(sp)
    8000568c:	e4a6                	sd	s1,72(sp)
    8000568e:	1080                	addi	s0,sp,96
    80005690:	faa43c23          	sd	a0,-72(s0)
    80005694:	87ae                	mv	a5,a1
    80005696:	fac43423          	sd	a2,-88(s0)
    8000569a:	faf42a23          	sw	a5,-76(s0)
    8000569e:	87b6                	mv	a5,a3
    800056a0:	faf42823          	sw	a5,-80(s0)
    800056a4:	87ba                	mv	a5,a4
    800056a6:	faf42223          	sw	a5,-92(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    800056aa:	fb843783          	ld	a5,-72(s0)
    800056ae:	47f8                	lw	a4,76(a5)
    800056b0:	fb042783          	lw	a5,-80(s0)
    800056b4:	2781                	sext.w	a5,a5
    800056b6:	00f76e63          	bltu	a4,a5,800056d2 <readi+0x4c>
    800056ba:	fb042703          	lw	a4,-80(s0)
    800056be:	fa442783          	lw	a5,-92(s0)
    800056c2:	9fb9                	addw	a5,a5,a4
    800056c4:	0007871b          	sext.w	a4,a5
    800056c8:	fb042783          	lw	a5,-80(s0)
    800056cc:	2781                	sext.w	a5,a5
    800056ce:	00f77463          	bgeu	a4,a5,800056d6 <readi+0x50>
    return 0;
    800056d2:	4781                	li	a5,0
    800056d4:	aa05                	j	80005804 <readi+0x17e>
  if(off + n > ip->size)
    800056d6:	fb042703          	lw	a4,-80(s0)
    800056da:	fa442783          	lw	a5,-92(s0)
    800056de:	9fb9                	addw	a5,a5,a4
    800056e0:	0007871b          	sext.w	a4,a5
    800056e4:	fb843783          	ld	a5,-72(s0)
    800056e8:	47fc                	lw	a5,76(a5)
    800056ea:	00e7fb63          	bgeu	a5,a4,80005700 <readi+0x7a>
    n = ip->size - off;
    800056ee:	fb843783          	ld	a5,-72(s0)
    800056f2:	47f8                	lw	a4,76(a5)
    800056f4:	fb042783          	lw	a5,-80(s0)
    800056f8:	40f707bb          	subw	a5,a4,a5
    800056fc:	faf42223          	sw	a5,-92(s0)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005700:	fc042e23          	sw	zero,-36(s0)
    80005704:	a0f5                	j	800057f0 <readi+0x16a>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    80005706:	fb843783          	ld	a5,-72(s0)
    8000570a:	4384                	lw	s1,0(a5)
    8000570c:	fb042783          	lw	a5,-80(s0)
    80005710:	00a7d79b          	srliw	a5,a5,0xa
    80005714:	2781                	sext.w	a5,a5
    80005716:	85be                	mv	a1,a5
    80005718:	fb843503          	ld	a0,-72(s0)
    8000571c:	00000097          	auipc	ra,0x0
    80005720:	c60080e7          	jalr	-928(ra) # 8000537c <bmap>
    80005724:	87aa                	mv	a5,a0
    80005726:	2781                	sext.w	a5,a5
    80005728:	85be                	mv	a1,a5
    8000572a:	8526                	mv	a0,s1
    8000572c:	fffff097          	auipc	ra,0xfffff
    80005730:	fdc080e7          	jalr	-36(ra) # 80004708 <bread>
    80005734:	fca43823          	sd	a0,-48(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005738:	fb042783          	lw	a5,-80(s0)
    8000573c:	3ff7f793          	andi	a5,a5,1023
    80005740:	2781                	sext.w	a5,a5
    80005742:	40000713          	li	a4,1024
    80005746:	40f707bb          	subw	a5,a4,a5
    8000574a:	0007869b          	sext.w	a3,a5
    8000574e:	fa442703          	lw	a4,-92(s0)
    80005752:	fdc42783          	lw	a5,-36(s0)
    80005756:	40f707bb          	subw	a5,a4,a5
    8000575a:	2781                	sext.w	a5,a5
    8000575c:	863e                	mv	a2,a5
    8000575e:	87b6                	mv	a5,a3
    80005760:	0007869b          	sext.w	a3,a5
    80005764:	0006071b          	sext.w	a4,a2
    80005768:	00d77363          	bgeu	a4,a3,8000576e <readi+0xe8>
    8000576c:	87b2                	mv	a5,a2
    8000576e:	fcf42623          	sw	a5,-52(s0)
    if(either_copyout(user_dst, dst, bp->data + (off % BSIZE), m) == -1) {
    80005772:	fd043783          	ld	a5,-48(s0)
    80005776:	05878713          	addi	a4,a5,88
    8000577a:	fb046783          	lwu	a5,-80(s0)
    8000577e:	3ff7f793          	andi	a5,a5,1023
    80005782:	973e                	add	a4,a4,a5
    80005784:	fcc46683          	lwu	a3,-52(s0)
    80005788:	fb442783          	lw	a5,-76(s0)
    8000578c:	863a                	mv	a2,a4
    8000578e:	fa843583          	ld	a1,-88(s0)
    80005792:	853e                	mv	a0,a5
    80005794:	ffffe097          	auipc	ra,0xffffe
    80005798:	ec8080e7          	jalr	-312(ra) # 8000365c <either_copyout>
    8000579c:	87aa                	mv	a5,a0
    8000579e:	873e                	mv	a4,a5
    800057a0:	57fd                	li	a5,-1
    800057a2:	00f71c63          	bne	a4,a5,800057ba <readi+0x134>
      brelse(bp);
    800057a6:	fd043503          	ld	a0,-48(s0)
    800057aa:	fffff097          	auipc	ra,0xfffff
    800057ae:	000080e7          	jalr	ra # 800047aa <brelse>
      tot = -1;
    800057b2:	57fd                	li	a5,-1
    800057b4:	fcf42e23          	sw	a5,-36(s0)
      break;
    800057b8:	a0a1                	j	80005800 <readi+0x17a>
    }
    brelse(bp);
    800057ba:	fd043503          	ld	a0,-48(s0)
    800057be:	fffff097          	auipc	ra,0xfffff
    800057c2:	fec080e7          	jalr	-20(ra) # 800047aa <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    800057c6:	fdc42703          	lw	a4,-36(s0)
    800057ca:	fcc42783          	lw	a5,-52(s0)
    800057ce:	9fb9                	addw	a5,a5,a4
    800057d0:	fcf42e23          	sw	a5,-36(s0)
    800057d4:	fb042703          	lw	a4,-80(s0)
    800057d8:	fcc42783          	lw	a5,-52(s0)
    800057dc:	9fb9                	addw	a5,a5,a4
    800057de:	faf42823          	sw	a5,-80(s0)
    800057e2:	fcc46783          	lwu	a5,-52(s0)
    800057e6:	fa843703          	ld	a4,-88(s0)
    800057ea:	97ba                	add	a5,a5,a4
    800057ec:	faf43423          	sd	a5,-88(s0)
    800057f0:	fdc42703          	lw	a4,-36(s0)
    800057f4:	fa442783          	lw	a5,-92(s0)
    800057f8:	2701                	sext.w	a4,a4
    800057fa:	2781                	sext.w	a5,a5
    800057fc:	f0f765e3          	bltu	a4,a5,80005706 <readi+0x80>
  }
  return tot;
    80005800:	fdc42783          	lw	a5,-36(s0)
}
    80005804:	853e                	mv	a0,a5
    80005806:	60e6                	ld	ra,88(sp)
    80005808:	6446                	ld	s0,80(sp)
    8000580a:	64a6                	ld	s1,72(sp)
    8000580c:	6125                	addi	sp,sp,96
    8000580e:	8082                	ret

0000000080005810 <writei>:
// Returns the number of bytes successfully written.
// If the return value is less than the requested n,
// there was an error of some kind.
int
writei(struct inode *ip, int user_src, uint64 src, uint off, uint n)
{
    80005810:	711d                	addi	sp,sp,-96
    80005812:	ec86                	sd	ra,88(sp)
    80005814:	e8a2                	sd	s0,80(sp)
    80005816:	e4a6                	sd	s1,72(sp)
    80005818:	1080                	addi	s0,sp,96
    8000581a:	faa43c23          	sd	a0,-72(s0)
    8000581e:	87ae                	mv	a5,a1
    80005820:	fac43423          	sd	a2,-88(s0)
    80005824:	faf42a23          	sw	a5,-76(s0)
    80005828:	87b6                	mv	a5,a3
    8000582a:	faf42823          	sw	a5,-80(s0)
    8000582e:	87ba                	mv	a5,a4
    80005830:	faf42223          	sw	a5,-92(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005834:	fb843783          	ld	a5,-72(s0)
    80005838:	47f8                	lw	a4,76(a5)
    8000583a:	fb042783          	lw	a5,-80(s0)
    8000583e:	2781                	sext.w	a5,a5
    80005840:	00f76e63          	bltu	a4,a5,8000585c <writei+0x4c>
    80005844:	fb042703          	lw	a4,-80(s0)
    80005848:	fa442783          	lw	a5,-92(s0)
    8000584c:	9fb9                	addw	a5,a5,a4
    8000584e:	0007871b          	sext.w	a4,a5
    80005852:	fb042783          	lw	a5,-80(s0)
    80005856:	2781                	sext.w	a5,a5
    80005858:	00f77463          	bgeu	a4,a5,80005860 <writei+0x50>
    return -1;
    8000585c:	57fd                	li	a5,-1
    8000585e:	a2b1                	j	800059aa <writei+0x19a>
  if(off + n > MAXFILE*BSIZE)
    80005860:	fb042703          	lw	a4,-80(s0)
    80005864:	fa442783          	lw	a5,-92(s0)
    80005868:	9fb9                	addw	a5,a5,a4
    8000586a:	2781                	sext.w	a5,a5
    8000586c:	873e                	mv	a4,a5
    8000586e:	000437b7          	lui	a5,0x43
    80005872:	00e7f463          	bgeu	a5,a4,8000587a <writei+0x6a>
    return -1;
    80005876:	57fd                	li	a5,-1
    80005878:	aa0d                	j	800059aa <writei+0x19a>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    8000587a:	fc042e23          	sw	zero,-36(s0)
    8000587e:	a8cd                	j	80005970 <writei+0x160>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    80005880:	fb843783          	ld	a5,-72(s0)
    80005884:	4384                	lw	s1,0(a5)
    80005886:	fb042783          	lw	a5,-80(s0)
    8000588a:	00a7d79b          	srliw	a5,a5,0xa
    8000588e:	2781                	sext.w	a5,a5
    80005890:	85be                	mv	a1,a5
    80005892:	fb843503          	ld	a0,-72(s0)
    80005896:	00000097          	auipc	ra,0x0
    8000589a:	ae6080e7          	jalr	-1306(ra) # 8000537c <bmap>
    8000589e:	87aa                	mv	a5,a0
    800058a0:	2781                	sext.w	a5,a5
    800058a2:	85be                	mv	a1,a5
    800058a4:	8526                	mv	a0,s1
    800058a6:	fffff097          	auipc	ra,0xfffff
    800058aa:	e62080e7          	jalr	-414(ra) # 80004708 <bread>
    800058ae:	fca43823          	sd	a0,-48(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    800058b2:	fb042783          	lw	a5,-80(s0)
    800058b6:	3ff7f793          	andi	a5,a5,1023
    800058ba:	2781                	sext.w	a5,a5
    800058bc:	40000713          	li	a4,1024
    800058c0:	40f707bb          	subw	a5,a4,a5
    800058c4:	0007869b          	sext.w	a3,a5
    800058c8:	fa442703          	lw	a4,-92(s0)
    800058cc:	fdc42783          	lw	a5,-36(s0)
    800058d0:	40f707bb          	subw	a5,a4,a5
    800058d4:	2781                	sext.w	a5,a5
    800058d6:	863e                	mv	a2,a5
    800058d8:	87b6                	mv	a5,a3
    800058da:	0007869b          	sext.w	a3,a5
    800058de:	0006071b          	sext.w	a4,a2
    800058e2:	00d77363          	bgeu	a4,a3,800058e8 <writei+0xd8>
    800058e6:	87b2                	mv	a5,a2
    800058e8:	fcf42623          	sw	a5,-52(s0)
    if(either_copyin(bp->data + (off % BSIZE), user_src, src, m) == -1) {
    800058ec:	fd043783          	ld	a5,-48(s0)
    800058f0:	05878713          	addi	a4,a5,88 # 43058 <_entry-0x7ffbcfa8>
    800058f4:	fb046783          	lwu	a5,-80(s0)
    800058f8:	3ff7f793          	andi	a5,a5,1023
    800058fc:	97ba                	add	a5,a5,a4
    800058fe:	fcc46683          	lwu	a3,-52(s0)
    80005902:	fb442703          	lw	a4,-76(s0)
    80005906:	fa843603          	ld	a2,-88(s0)
    8000590a:	85ba                	mv	a1,a4
    8000590c:	853e                	mv	a0,a5
    8000590e:	ffffe097          	auipc	ra,0xffffe
    80005912:	dc2080e7          	jalr	-574(ra) # 800036d0 <either_copyin>
    80005916:	87aa                	mv	a5,a0
    80005918:	873e                	mv	a4,a5
    8000591a:	57fd                	li	a5,-1
    8000591c:	00f71963          	bne	a4,a5,8000592e <writei+0x11e>
      brelse(bp);
    80005920:	fd043503          	ld	a0,-48(s0)
    80005924:	fffff097          	auipc	ra,0xfffff
    80005928:	e86080e7          	jalr	-378(ra) # 800047aa <brelse>
      break;
    8000592c:	a891                	j	80005980 <writei+0x170>
    }
    log_write(bp);
    8000592e:	fd043503          	ld	a0,-48(s0)
    80005932:	00001097          	auipc	ra,0x1
    80005936:	af6080e7          	jalr	-1290(ra) # 80006428 <log_write>
    brelse(bp);
    8000593a:	fd043503          	ld	a0,-48(s0)
    8000593e:	fffff097          	auipc	ra,0xfffff
    80005942:	e6c080e7          	jalr	-404(ra) # 800047aa <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005946:	fdc42703          	lw	a4,-36(s0)
    8000594a:	fcc42783          	lw	a5,-52(s0)
    8000594e:	9fb9                	addw	a5,a5,a4
    80005950:	fcf42e23          	sw	a5,-36(s0)
    80005954:	fb042703          	lw	a4,-80(s0)
    80005958:	fcc42783          	lw	a5,-52(s0)
    8000595c:	9fb9                	addw	a5,a5,a4
    8000595e:	faf42823          	sw	a5,-80(s0)
    80005962:	fcc46783          	lwu	a5,-52(s0)
    80005966:	fa843703          	ld	a4,-88(s0)
    8000596a:	97ba                	add	a5,a5,a4
    8000596c:	faf43423          	sd	a5,-88(s0)
    80005970:	fdc42703          	lw	a4,-36(s0)
    80005974:	fa442783          	lw	a5,-92(s0)
    80005978:	2701                	sext.w	a4,a4
    8000597a:	2781                	sext.w	a5,a5
    8000597c:	f0f762e3          	bltu	a4,a5,80005880 <writei+0x70>
  }

  if(off > ip->size)
    80005980:	fb843783          	ld	a5,-72(s0)
    80005984:	47f8                	lw	a4,76(a5)
    80005986:	fb042783          	lw	a5,-80(s0)
    8000598a:	2781                	sext.w	a5,a5
    8000598c:	00f77763          	bgeu	a4,a5,8000599a <writei+0x18a>
    ip->size = off;
    80005990:	fb843783          	ld	a5,-72(s0)
    80005994:	fb042703          	lw	a4,-80(s0)
    80005998:	c7f8                	sw	a4,76(a5)

  // write the i-node back to disk even if the size didn't change
  // because the loop above might have called bmap() and added a new
  // block to ip->addrs[].
  iupdate(ip);
    8000599a:	fb843503          	ld	a0,-72(s0)
    8000599e:	fffff097          	auipc	ra,0xfffff
    800059a2:	502080e7          	jalr	1282(ra) # 80004ea0 <iupdate>

  return tot;
    800059a6:	fdc42783          	lw	a5,-36(s0)
}
    800059aa:	853e                	mv	a0,a5
    800059ac:	60e6                	ld	ra,88(sp)
    800059ae:	6446                	ld	s0,80(sp)
    800059b0:	64a6                	ld	s1,72(sp)
    800059b2:	6125                	addi	sp,sp,96
    800059b4:	8082                	ret

00000000800059b6 <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
    800059b6:	1101                	addi	sp,sp,-32
    800059b8:	ec06                	sd	ra,24(sp)
    800059ba:	e822                	sd	s0,16(sp)
    800059bc:	1000                	addi	s0,sp,32
    800059be:	fea43423          	sd	a0,-24(s0)
    800059c2:	feb43023          	sd	a1,-32(s0)
  return strncmp(s, t, DIRSIZ);
    800059c6:	4639                	li	a2,14
    800059c8:	fe043583          	ld	a1,-32(s0)
    800059cc:	fe843503          	ld	a0,-24(s0)
    800059d0:	ffffc097          	auipc	ra,0xffffc
    800059d4:	c6a080e7          	jalr	-918(ra) # 8000163a <strncmp>
    800059d8:	87aa                	mv	a5,a0
}
    800059da:	853e                	mv	a0,a5
    800059dc:	60e2                	ld	ra,24(sp)
    800059de:	6442                	ld	s0,16(sp)
    800059e0:	6105                	addi	sp,sp,32
    800059e2:	8082                	ret

00000000800059e4 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
    800059e4:	715d                	addi	sp,sp,-80
    800059e6:	e486                	sd	ra,72(sp)
    800059e8:	e0a2                	sd	s0,64(sp)
    800059ea:	0880                	addi	s0,sp,80
    800059ec:	fca43423          	sd	a0,-56(s0)
    800059f0:	fcb43023          	sd	a1,-64(s0)
    800059f4:	fac43c23          	sd	a2,-72(s0)
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    800059f8:	fc843783          	ld	a5,-56(s0)
    800059fc:	04479783          	lh	a5,68(a5)
    80005a00:	0007871b          	sext.w	a4,a5
    80005a04:	4785                	li	a5,1
    80005a06:	00f70a63          	beq	a4,a5,80005a1a <dirlookup+0x36>
    panic("dirlookup not DIR");
    80005a0a:	00006517          	auipc	a0,0x6
    80005a0e:	b2e50513          	addi	a0,a0,-1234 # 8000b538 <etext+0x538>
    80005a12:	ffffb097          	auipc	ra,0xffffb
    80005a16:	26c080e7          	jalr	620(ra) # 80000c7e <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
    80005a1a:	fe042623          	sw	zero,-20(s0)
    80005a1e:	a849                	j	80005ab0 <dirlookup+0xcc>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005a20:	fd840793          	addi	a5,s0,-40
    80005a24:	fec42683          	lw	a3,-20(s0)
    80005a28:	4741                	li	a4,16
    80005a2a:	863e                	mv	a2,a5
    80005a2c:	4581                	li	a1,0
    80005a2e:	fc843503          	ld	a0,-56(s0)
    80005a32:	00000097          	auipc	ra,0x0
    80005a36:	c54080e7          	jalr	-940(ra) # 80005686 <readi>
    80005a3a:	87aa                	mv	a5,a0
    80005a3c:	873e                	mv	a4,a5
    80005a3e:	47c1                	li	a5,16
    80005a40:	00f70a63          	beq	a4,a5,80005a54 <dirlookup+0x70>
      panic("dirlookup read");
    80005a44:	00006517          	auipc	a0,0x6
    80005a48:	b0c50513          	addi	a0,a0,-1268 # 8000b550 <etext+0x550>
    80005a4c:	ffffb097          	auipc	ra,0xffffb
    80005a50:	232080e7          	jalr	562(ra) # 80000c7e <panic>
    if(de.inum == 0)
    80005a54:	fd845783          	lhu	a5,-40(s0)
    80005a58:	c7b1                	beqz	a5,80005aa4 <dirlookup+0xc0>
      continue;
    if(namecmp(name, de.name) == 0){
    80005a5a:	fd840793          	addi	a5,s0,-40
    80005a5e:	0789                	addi	a5,a5,2
    80005a60:	85be                	mv	a1,a5
    80005a62:	fc043503          	ld	a0,-64(s0)
    80005a66:	00000097          	auipc	ra,0x0
    80005a6a:	f50080e7          	jalr	-176(ra) # 800059b6 <namecmp>
    80005a6e:	87aa                	mv	a5,a0
    80005a70:	eb9d                	bnez	a5,80005aa6 <dirlookup+0xc2>
      // entry matches path element
      if(poff)
    80005a72:	fb843783          	ld	a5,-72(s0)
    80005a76:	c791                	beqz	a5,80005a82 <dirlookup+0x9e>
        *poff = off;
    80005a78:	fb843783          	ld	a5,-72(s0)
    80005a7c:	fec42703          	lw	a4,-20(s0)
    80005a80:	c398                	sw	a4,0(a5)
      inum = de.inum;
    80005a82:	fd845783          	lhu	a5,-40(s0)
    80005a86:	fef42423          	sw	a5,-24(s0)
      return iget(dp->dev, inum);
    80005a8a:	fc843783          	ld	a5,-56(s0)
    80005a8e:	439c                	lw	a5,0(a5)
    80005a90:	fe842703          	lw	a4,-24(s0)
    80005a94:	85ba                	mv	a1,a4
    80005a96:	853e                	mv	a0,a5
    80005a98:	fffff097          	auipc	ra,0xfffff
    80005a9c:	4f0080e7          	jalr	1264(ra) # 80004f88 <iget>
    80005aa0:	87aa                	mv	a5,a0
    80005aa2:	a005                	j	80005ac2 <dirlookup+0xde>
      continue;
    80005aa4:	0001                	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005aa6:	fec42783          	lw	a5,-20(s0)
    80005aaa:	27c1                	addiw	a5,a5,16
    80005aac:	fef42623          	sw	a5,-20(s0)
    80005ab0:	fc843783          	ld	a5,-56(s0)
    80005ab4:	47f8                	lw	a4,76(a5)
    80005ab6:	fec42783          	lw	a5,-20(s0)
    80005aba:	2781                	sext.w	a5,a5
    80005abc:	f6e7e2e3          	bltu	a5,a4,80005a20 <dirlookup+0x3c>
    }
  }

  return 0;
    80005ac0:	4781                	li	a5,0
}
    80005ac2:	853e                	mv	a0,a5
    80005ac4:	60a6                	ld	ra,72(sp)
    80005ac6:	6406                	ld	s0,64(sp)
    80005ac8:	6161                	addi	sp,sp,80
    80005aca:	8082                	ret

0000000080005acc <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
    80005acc:	715d                	addi	sp,sp,-80
    80005ace:	e486                	sd	ra,72(sp)
    80005ad0:	e0a2                	sd	s0,64(sp)
    80005ad2:	0880                	addi	s0,sp,80
    80005ad4:	fca43423          	sd	a0,-56(s0)
    80005ad8:	fcb43023          	sd	a1,-64(s0)
    80005adc:	87b2                	mv	a5,a2
    80005ade:	faf42e23          	sw	a5,-68(s0)
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    80005ae2:	4601                	li	a2,0
    80005ae4:	fc043583          	ld	a1,-64(s0)
    80005ae8:	fc843503          	ld	a0,-56(s0)
    80005aec:	00000097          	auipc	ra,0x0
    80005af0:	ef8080e7          	jalr	-264(ra) # 800059e4 <dirlookup>
    80005af4:	fea43023          	sd	a0,-32(s0)
    80005af8:	fe043783          	ld	a5,-32(s0)
    80005afc:	cb89                	beqz	a5,80005b0e <dirlink+0x42>
    iput(ip);
    80005afe:	fe043503          	ld	a0,-32(s0)
    80005b02:	fffff097          	auipc	ra,0xfffff
    80005b06:	77c080e7          	jalr	1916(ra) # 8000527e <iput>
    return -1;
    80005b0a:	57fd                	li	a5,-1
    80005b0c:	a865                	j	80005bc4 <dirlink+0xf8>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005b0e:	fe042623          	sw	zero,-20(s0)
    80005b12:	a0a1                	j	80005b5a <dirlink+0x8e>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005b14:	fd040793          	addi	a5,s0,-48
    80005b18:	fec42683          	lw	a3,-20(s0)
    80005b1c:	4741                	li	a4,16
    80005b1e:	863e                	mv	a2,a5
    80005b20:	4581                	li	a1,0
    80005b22:	fc843503          	ld	a0,-56(s0)
    80005b26:	00000097          	auipc	ra,0x0
    80005b2a:	b60080e7          	jalr	-1184(ra) # 80005686 <readi>
    80005b2e:	87aa                	mv	a5,a0
    80005b30:	873e                	mv	a4,a5
    80005b32:	47c1                	li	a5,16
    80005b34:	00f70a63          	beq	a4,a5,80005b48 <dirlink+0x7c>
      panic("dirlink read");
    80005b38:	00006517          	auipc	a0,0x6
    80005b3c:	a2850513          	addi	a0,a0,-1496 # 8000b560 <etext+0x560>
    80005b40:	ffffb097          	auipc	ra,0xffffb
    80005b44:	13e080e7          	jalr	318(ra) # 80000c7e <panic>
    if(de.inum == 0)
    80005b48:	fd045783          	lhu	a5,-48(s0)
    80005b4c:	cf99                	beqz	a5,80005b6a <dirlink+0x9e>
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005b4e:	fec42783          	lw	a5,-20(s0)
    80005b52:	27c1                	addiw	a5,a5,16
    80005b54:	2781                	sext.w	a5,a5
    80005b56:	fef42623          	sw	a5,-20(s0)
    80005b5a:	fc843783          	ld	a5,-56(s0)
    80005b5e:	47f8                	lw	a4,76(a5)
    80005b60:	fec42783          	lw	a5,-20(s0)
    80005b64:	fae7e8e3          	bltu	a5,a4,80005b14 <dirlink+0x48>
    80005b68:	a011                	j	80005b6c <dirlink+0xa0>
      break;
    80005b6a:	0001                	nop
  }

  strncpy(de.name, name, DIRSIZ);
    80005b6c:	fd040793          	addi	a5,s0,-48
    80005b70:	0789                	addi	a5,a5,2
    80005b72:	4639                	li	a2,14
    80005b74:	fc043583          	ld	a1,-64(s0)
    80005b78:	853e                	mv	a0,a5
    80005b7a:	ffffc097          	auipc	ra,0xffffc
    80005b7e:	b4a080e7          	jalr	-1206(ra) # 800016c4 <strncpy>
  de.inum = inum;
    80005b82:	fbc42783          	lw	a5,-68(s0)
    80005b86:	17c2                	slli	a5,a5,0x30
    80005b88:	93c1                	srli	a5,a5,0x30
    80005b8a:	fcf41823          	sh	a5,-48(s0)
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005b8e:	fd040793          	addi	a5,s0,-48
    80005b92:	fec42683          	lw	a3,-20(s0)
    80005b96:	4741                	li	a4,16
    80005b98:	863e                	mv	a2,a5
    80005b9a:	4581                	li	a1,0
    80005b9c:	fc843503          	ld	a0,-56(s0)
    80005ba0:	00000097          	auipc	ra,0x0
    80005ba4:	c70080e7          	jalr	-912(ra) # 80005810 <writei>
    80005ba8:	87aa                	mv	a5,a0
    80005baa:	873e                	mv	a4,a5
    80005bac:	47c1                	li	a5,16
    80005bae:	00f70a63          	beq	a4,a5,80005bc2 <dirlink+0xf6>
    panic("dirlink");
    80005bb2:	00006517          	auipc	a0,0x6
    80005bb6:	9be50513          	addi	a0,a0,-1602 # 8000b570 <etext+0x570>
    80005bba:	ffffb097          	auipc	ra,0xffffb
    80005bbe:	0c4080e7          	jalr	196(ra) # 80000c7e <panic>

  return 0;
    80005bc2:	4781                	li	a5,0
}
    80005bc4:	853e                	mv	a0,a5
    80005bc6:	60a6                	ld	ra,72(sp)
    80005bc8:	6406                	ld	s0,64(sp)
    80005bca:	6161                	addi	sp,sp,80
    80005bcc:	8082                	ret

0000000080005bce <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
    80005bce:	7179                	addi	sp,sp,-48
    80005bd0:	f406                	sd	ra,40(sp)
    80005bd2:	f022                	sd	s0,32(sp)
    80005bd4:	1800                	addi	s0,sp,48
    80005bd6:	fca43c23          	sd	a0,-40(s0)
    80005bda:	fcb43823          	sd	a1,-48(s0)
  char *s;
  int len;

  while(*path == '/')
    80005bde:	a031                	j	80005bea <skipelem+0x1c>
    path++;
    80005be0:	fd843783          	ld	a5,-40(s0)
    80005be4:	0785                	addi	a5,a5,1
    80005be6:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005bea:	fd843783          	ld	a5,-40(s0)
    80005bee:	0007c783          	lbu	a5,0(a5)
    80005bf2:	873e                	mv	a4,a5
    80005bf4:	02f00793          	li	a5,47
    80005bf8:	fef704e3          	beq	a4,a5,80005be0 <skipelem+0x12>
  if(*path == 0)
    80005bfc:	fd843783          	ld	a5,-40(s0)
    80005c00:	0007c783          	lbu	a5,0(a5)
    80005c04:	e399                	bnez	a5,80005c0a <skipelem+0x3c>
    return 0;
    80005c06:	4781                	li	a5,0
    80005c08:	a06d                	j	80005cb2 <skipelem+0xe4>
  s = path;
    80005c0a:	fd843783          	ld	a5,-40(s0)
    80005c0e:	fef43423          	sd	a5,-24(s0)
  while(*path != '/' && *path != 0)
    80005c12:	a031                	j	80005c1e <skipelem+0x50>
    path++;
    80005c14:	fd843783          	ld	a5,-40(s0)
    80005c18:	0785                	addi	a5,a5,1
    80005c1a:	fcf43c23          	sd	a5,-40(s0)
  while(*path != '/' && *path != 0)
    80005c1e:	fd843783          	ld	a5,-40(s0)
    80005c22:	0007c783          	lbu	a5,0(a5)
    80005c26:	873e                	mv	a4,a5
    80005c28:	02f00793          	li	a5,47
    80005c2c:	00f70763          	beq	a4,a5,80005c3a <skipelem+0x6c>
    80005c30:	fd843783          	ld	a5,-40(s0)
    80005c34:	0007c783          	lbu	a5,0(a5)
    80005c38:	fff1                	bnez	a5,80005c14 <skipelem+0x46>
  len = path - s;
    80005c3a:	fd843703          	ld	a4,-40(s0)
    80005c3e:	fe843783          	ld	a5,-24(s0)
    80005c42:	40f707b3          	sub	a5,a4,a5
    80005c46:	fef42223          	sw	a5,-28(s0)
  if(len >= DIRSIZ)
    80005c4a:	fe442783          	lw	a5,-28(s0)
    80005c4e:	0007871b          	sext.w	a4,a5
    80005c52:	47b5                	li	a5,13
    80005c54:	00e7dc63          	bge	a5,a4,80005c6c <skipelem+0x9e>
    memmove(name, s, DIRSIZ);
    80005c58:	4639                	li	a2,14
    80005c5a:	fe843583          	ld	a1,-24(s0)
    80005c5e:	fd043503          	ld	a0,-48(s0)
    80005c62:	ffffc097          	auipc	ra,0xffffc
    80005c66:	8c4080e7          	jalr	-1852(ra) # 80001526 <memmove>
    80005c6a:	a80d                	j	80005c9c <skipelem+0xce>
  else {
    memmove(name, s, len);
    80005c6c:	fe442783          	lw	a5,-28(s0)
    80005c70:	863e                	mv	a2,a5
    80005c72:	fe843583          	ld	a1,-24(s0)
    80005c76:	fd043503          	ld	a0,-48(s0)
    80005c7a:	ffffc097          	auipc	ra,0xffffc
    80005c7e:	8ac080e7          	jalr	-1876(ra) # 80001526 <memmove>
    name[len] = 0;
    80005c82:	fe442783          	lw	a5,-28(s0)
    80005c86:	fd043703          	ld	a4,-48(s0)
    80005c8a:	97ba                	add	a5,a5,a4
    80005c8c:	00078023          	sb	zero,0(a5)
  }
  while(*path == '/')
    80005c90:	a031                	j	80005c9c <skipelem+0xce>
    path++;
    80005c92:	fd843783          	ld	a5,-40(s0)
    80005c96:	0785                	addi	a5,a5,1
    80005c98:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005c9c:	fd843783          	ld	a5,-40(s0)
    80005ca0:	0007c783          	lbu	a5,0(a5)
    80005ca4:	873e                	mv	a4,a5
    80005ca6:	02f00793          	li	a5,47
    80005caa:	fef704e3          	beq	a4,a5,80005c92 <skipelem+0xc4>
  return path;
    80005cae:	fd843783          	ld	a5,-40(s0)
}
    80005cb2:	853e                	mv	a0,a5
    80005cb4:	70a2                	ld	ra,40(sp)
    80005cb6:	7402                	ld	s0,32(sp)
    80005cb8:	6145                	addi	sp,sp,48
    80005cba:	8082                	ret

0000000080005cbc <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
    80005cbc:	7139                	addi	sp,sp,-64
    80005cbe:	fc06                	sd	ra,56(sp)
    80005cc0:	f822                	sd	s0,48(sp)
    80005cc2:	0080                	addi	s0,sp,64
    80005cc4:	fca43c23          	sd	a0,-40(s0)
    80005cc8:	87ae                	mv	a5,a1
    80005cca:	fcc43423          	sd	a2,-56(s0)
    80005cce:	fcf42a23          	sw	a5,-44(s0)
  struct inode *ip, *next;

  if(*path == '/')
    80005cd2:	fd843783          	ld	a5,-40(s0)
    80005cd6:	0007c783          	lbu	a5,0(a5)
    80005cda:	873e                	mv	a4,a5
    80005cdc:	02f00793          	li	a5,47
    80005ce0:	00f71b63          	bne	a4,a5,80005cf6 <namex+0x3a>
    ip = iget(ROOTDEV, ROOTINO);
    80005ce4:	4585                	li	a1,1
    80005ce6:	4505                	li	a0,1
    80005ce8:	fffff097          	auipc	ra,0xfffff
    80005cec:	2a0080e7          	jalr	672(ra) # 80004f88 <iget>
    80005cf0:	fea43423          	sd	a0,-24(s0)
    80005cf4:	a84d                	j	80005da6 <namex+0xea>
  else
    ip = idup(myproc()->cwd);
    80005cf6:	ffffd097          	auipc	ra,0xffffd
    80005cfa:	b22080e7          	jalr	-1246(ra) # 80002818 <myproc>
    80005cfe:	87aa                	mv	a5,a0
    80005d00:	1507b783          	ld	a5,336(a5)
    80005d04:	853e                	mv	a0,a5
    80005d06:	fffff097          	auipc	ra,0xfffff
    80005d0a:	39e080e7          	jalr	926(ra) # 800050a4 <idup>
    80005d0e:	fea43423          	sd	a0,-24(s0)

  while((path = skipelem(path, name)) != 0){
    80005d12:	a851                	j	80005da6 <namex+0xea>
    ilock(ip);
    80005d14:	fe843503          	ld	a0,-24(s0)
    80005d18:	fffff097          	auipc	ra,0xfffff
    80005d1c:	3d8080e7          	jalr	984(ra) # 800050f0 <ilock>
    if(ip->type != T_DIR){
    80005d20:	fe843783          	ld	a5,-24(s0)
    80005d24:	04479783          	lh	a5,68(a5)
    80005d28:	0007871b          	sext.w	a4,a5
    80005d2c:	4785                	li	a5,1
    80005d2e:	00f70a63          	beq	a4,a5,80005d42 <namex+0x86>
      iunlockput(ip);
    80005d32:	fe843503          	ld	a0,-24(s0)
    80005d36:	fffff097          	auipc	ra,0xfffff
    80005d3a:	618080e7          	jalr	1560(ra) # 8000534e <iunlockput>
      return 0;
    80005d3e:	4781                	li	a5,0
    80005d40:	a871                	j	80005ddc <namex+0x120>
    }
    if(nameiparent && *path == '\0'){
    80005d42:	fd442783          	lw	a5,-44(s0)
    80005d46:	2781                	sext.w	a5,a5
    80005d48:	cf99                	beqz	a5,80005d66 <namex+0xaa>
    80005d4a:	fd843783          	ld	a5,-40(s0)
    80005d4e:	0007c783          	lbu	a5,0(a5)
    80005d52:	eb91                	bnez	a5,80005d66 <namex+0xaa>
      // Stop one level early.
      iunlock(ip);
    80005d54:	fe843503          	ld	a0,-24(s0)
    80005d58:	fffff097          	auipc	ra,0xfffff
    80005d5c:	4cc080e7          	jalr	1228(ra) # 80005224 <iunlock>
      return ip;
    80005d60:	fe843783          	ld	a5,-24(s0)
    80005d64:	a8a5                	j	80005ddc <namex+0x120>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
    80005d66:	4601                	li	a2,0
    80005d68:	fc843583          	ld	a1,-56(s0)
    80005d6c:	fe843503          	ld	a0,-24(s0)
    80005d70:	00000097          	auipc	ra,0x0
    80005d74:	c74080e7          	jalr	-908(ra) # 800059e4 <dirlookup>
    80005d78:	fea43023          	sd	a0,-32(s0)
    80005d7c:	fe043783          	ld	a5,-32(s0)
    80005d80:	eb89                	bnez	a5,80005d92 <namex+0xd6>
      iunlockput(ip);
    80005d82:	fe843503          	ld	a0,-24(s0)
    80005d86:	fffff097          	auipc	ra,0xfffff
    80005d8a:	5c8080e7          	jalr	1480(ra) # 8000534e <iunlockput>
      return 0;
    80005d8e:	4781                	li	a5,0
    80005d90:	a0b1                	j	80005ddc <namex+0x120>
    }
    iunlockput(ip);
    80005d92:	fe843503          	ld	a0,-24(s0)
    80005d96:	fffff097          	auipc	ra,0xfffff
    80005d9a:	5b8080e7          	jalr	1464(ra) # 8000534e <iunlockput>
    ip = next;
    80005d9e:	fe043783          	ld	a5,-32(s0)
    80005da2:	fef43423          	sd	a5,-24(s0)
  while((path = skipelem(path, name)) != 0){
    80005da6:	fc843583          	ld	a1,-56(s0)
    80005daa:	fd843503          	ld	a0,-40(s0)
    80005dae:	00000097          	auipc	ra,0x0
    80005db2:	e20080e7          	jalr	-480(ra) # 80005bce <skipelem>
    80005db6:	fca43c23          	sd	a0,-40(s0)
    80005dba:	fd843783          	ld	a5,-40(s0)
    80005dbe:	fbb9                	bnez	a5,80005d14 <namex+0x58>
  }
  if(nameiparent){
    80005dc0:	fd442783          	lw	a5,-44(s0)
    80005dc4:	2781                	sext.w	a5,a5
    80005dc6:	cb89                	beqz	a5,80005dd8 <namex+0x11c>
    iput(ip);
    80005dc8:	fe843503          	ld	a0,-24(s0)
    80005dcc:	fffff097          	auipc	ra,0xfffff
    80005dd0:	4b2080e7          	jalr	1202(ra) # 8000527e <iput>
    return 0;
    80005dd4:	4781                	li	a5,0
    80005dd6:	a019                	j	80005ddc <namex+0x120>
  }
  return ip;
    80005dd8:	fe843783          	ld	a5,-24(s0)
}
    80005ddc:	853e                	mv	a0,a5
    80005dde:	70e2                	ld	ra,56(sp)
    80005de0:	7442                	ld	s0,48(sp)
    80005de2:	6121                	addi	sp,sp,64
    80005de4:	8082                	ret

0000000080005de6 <namei>:

struct inode*
namei(char *path)
{
    80005de6:	7179                	addi	sp,sp,-48
    80005de8:	f406                	sd	ra,40(sp)
    80005dea:	f022                	sd	s0,32(sp)
    80005dec:	1800                	addi	s0,sp,48
    80005dee:	fca43c23          	sd	a0,-40(s0)
  char name[DIRSIZ];
  return namex(path, 0, name);
    80005df2:	fe040793          	addi	a5,s0,-32
    80005df6:	863e                	mv	a2,a5
    80005df8:	4581                	li	a1,0
    80005dfa:	fd843503          	ld	a0,-40(s0)
    80005dfe:	00000097          	auipc	ra,0x0
    80005e02:	ebe080e7          	jalr	-322(ra) # 80005cbc <namex>
    80005e06:	87aa                	mv	a5,a0
}
    80005e08:	853e                	mv	a0,a5
    80005e0a:	70a2                	ld	ra,40(sp)
    80005e0c:	7402                	ld	s0,32(sp)
    80005e0e:	6145                	addi	sp,sp,48
    80005e10:	8082                	ret

0000000080005e12 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
    80005e12:	1101                	addi	sp,sp,-32
    80005e14:	ec06                	sd	ra,24(sp)
    80005e16:	e822                	sd	s0,16(sp)
    80005e18:	1000                	addi	s0,sp,32
    80005e1a:	fea43423          	sd	a0,-24(s0)
    80005e1e:	feb43023          	sd	a1,-32(s0)
  return namex(path, 1, name);
    80005e22:	fe043603          	ld	a2,-32(s0)
    80005e26:	4585                	li	a1,1
    80005e28:	fe843503          	ld	a0,-24(s0)
    80005e2c:	00000097          	auipc	ra,0x0
    80005e30:	e90080e7          	jalr	-368(ra) # 80005cbc <namex>
    80005e34:	87aa                	mv	a5,a0
}
    80005e36:	853e                	mv	a0,a5
    80005e38:	60e2                	ld	ra,24(sp)
    80005e3a:	6442                	ld	s0,16(sp)
    80005e3c:	6105                	addi	sp,sp,32
    80005e3e:	8082                	ret

0000000080005e40 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev, struct superblock *sb)
{
    80005e40:	1101                	addi	sp,sp,-32
    80005e42:	ec06                	sd	ra,24(sp)
    80005e44:	e822                	sd	s0,16(sp)
    80005e46:	1000                	addi	s0,sp,32
    80005e48:	87aa                	mv	a5,a0
    80005e4a:	feb43023          	sd	a1,-32(s0)
    80005e4e:	fef42623          	sw	a5,-20(s0)
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  initlock(&log.lock, "log");
    80005e52:	00005597          	auipc	a1,0x5
    80005e56:	72658593          	addi	a1,a1,1830 # 8000b578 <etext+0x578>
    80005e5a:	0001e517          	auipc	a0,0x1e
    80005e5e:	44e50513          	addi	a0,a0,1102 # 800242a8 <log>
    80005e62:	ffffb097          	auipc	ra,0xffffb
    80005e66:	3dc080e7          	jalr	988(ra) # 8000123e <initlock>
  log.start = sb->logstart;
    80005e6a:	fe043783          	ld	a5,-32(s0)
    80005e6e:	4bdc                	lw	a5,20(a5)
    80005e70:	0007871b          	sext.w	a4,a5
    80005e74:	0001e797          	auipc	a5,0x1e
    80005e78:	43478793          	addi	a5,a5,1076 # 800242a8 <log>
    80005e7c:	cf98                	sw	a4,24(a5)
  log.size = sb->nlog;
    80005e7e:	fe043783          	ld	a5,-32(s0)
    80005e82:	4b9c                	lw	a5,16(a5)
    80005e84:	0007871b          	sext.w	a4,a5
    80005e88:	0001e797          	auipc	a5,0x1e
    80005e8c:	42078793          	addi	a5,a5,1056 # 800242a8 <log>
    80005e90:	cfd8                	sw	a4,28(a5)
  log.dev = dev;
    80005e92:	0001e797          	auipc	a5,0x1e
    80005e96:	41678793          	addi	a5,a5,1046 # 800242a8 <log>
    80005e9a:	fec42703          	lw	a4,-20(s0)
    80005e9e:	d798                	sw	a4,40(a5)
  recover_from_log();
    80005ea0:	00000097          	auipc	ra,0x0
    80005ea4:	272080e7          	jalr	626(ra) # 80006112 <recover_from_log>
}
    80005ea8:	0001                	nop
    80005eaa:	60e2                	ld	ra,24(sp)
    80005eac:	6442                	ld	s0,16(sp)
    80005eae:	6105                	addi	sp,sp,32
    80005eb0:	8082                	ret

0000000080005eb2 <install_trans>:

// Copy committed blocks from log to their home location
static void
install_trans(int recovering)
{
    80005eb2:	7139                	addi	sp,sp,-64
    80005eb4:	fc06                	sd	ra,56(sp)
    80005eb6:	f822                	sd	s0,48(sp)
    80005eb8:	0080                	addi	s0,sp,64
    80005eba:	87aa                	mv	a5,a0
    80005ebc:	fcf42623          	sw	a5,-52(s0)
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    80005ec0:	fe042623          	sw	zero,-20(s0)
    80005ec4:	a0f9                	j	80005f92 <install_trans+0xe0>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    80005ec6:	0001e797          	auipc	a5,0x1e
    80005eca:	3e278793          	addi	a5,a5,994 # 800242a8 <log>
    80005ece:	579c                	lw	a5,40(a5)
    80005ed0:	0007869b          	sext.w	a3,a5
    80005ed4:	0001e797          	auipc	a5,0x1e
    80005ed8:	3d478793          	addi	a5,a5,980 # 800242a8 <log>
    80005edc:	4f9c                	lw	a5,24(a5)
    80005ede:	fec42703          	lw	a4,-20(s0)
    80005ee2:	9fb9                	addw	a5,a5,a4
    80005ee4:	2781                	sext.w	a5,a5
    80005ee6:	2785                	addiw	a5,a5,1
    80005ee8:	2781                	sext.w	a5,a5
    80005eea:	2781                	sext.w	a5,a5
    80005eec:	85be                	mv	a1,a5
    80005eee:	8536                	mv	a0,a3
    80005ef0:	fffff097          	auipc	ra,0xfffff
    80005ef4:	818080e7          	jalr	-2024(ra) # 80004708 <bread>
    80005ef8:	fea43023          	sd	a0,-32(s0)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
    80005efc:	0001e797          	auipc	a5,0x1e
    80005f00:	3ac78793          	addi	a5,a5,940 # 800242a8 <log>
    80005f04:	579c                	lw	a5,40(a5)
    80005f06:	0007869b          	sext.w	a3,a5
    80005f0a:	0001e717          	auipc	a4,0x1e
    80005f0e:	39e70713          	addi	a4,a4,926 # 800242a8 <log>
    80005f12:	fec42783          	lw	a5,-20(s0)
    80005f16:	07a1                	addi	a5,a5,8
    80005f18:	078a                	slli	a5,a5,0x2
    80005f1a:	97ba                	add	a5,a5,a4
    80005f1c:	4b9c                	lw	a5,16(a5)
    80005f1e:	2781                	sext.w	a5,a5
    80005f20:	85be                	mv	a1,a5
    80005f22:	8536                	mv	a0,a3
    80005f24:	ffffe097          	auipc	ra,0xffffe
    80005f28:	7e4080e7          	jalr	2020(ra) # 80004708 <bread>
    80005f2c:	fca43c23          	sd	a0,-40(s0)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    80005f30:	fd843783          	ld	a5,-40(s0)
    80005f34:	05878713          	addi	a4,a5,88
    80005f38:	fe043783          	ld	a5,-32(s0)
    80005f3c:	05878793          	addi	a5,a5,88
    80005f40:	40000613          	li	a2,1024
    80005f44:	85be                	mv	a1,a5
    80005f46:	853a                	mv	a0,a4
    80005f48:	ffffb097          	auipc	ra,0xffffb
    80005f4c:	5de080e7          	jalr	1502(ra) # 80001526 <memmove>
    bwrite(dbuf);  // write dst to disk
    80005f50:	fd843503          	ld	a0,-40(s0)
    80005f54:	fffff097          	auipc	ra,0xfffff
    80005f58:	80e080e7          	jalr	-2034(ra) # 80004762 <bwrite>
    if(recovering == 0)
    80005f5c:	fcc42783          	lw	a5,-52(s0)
    80005f60:	2781                	sext.w	a5,a5
    80005f62:	e799                	bnez	a5,80005f70 <install_trans+0xbe>
      bunpin(dbuf);
    80005f64:	fd843503          	ld	a0,-40(s0)
    80005f68:	fffff097          	auipc	ra,0xfffff
    80005f6c:	978080e7          	jalr	-1672(ra) # 800048e0 <bunpin>
    brelse(lbuf);
    80005f70:	fe043503          	ld	a0,-32(s0)
    80005f74:	fffff097          	auipc	ra,0xfffff
    80005f78:	836080e7          	jalr	-1994(ra) # 800047aa <brelse>
    brelse(dbuf);
    80005f7c:	fd843503          	ld	a0,-40(s0)
    80005f80:	fffff097          	auipc	ra,0xfffff
    80005f84:	82a080e7          	jalr	-2006(ra) # 800047aa <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    80005f88:	fec42783          	lw	a5,-20(s0)
    80005f8c:	2785                	addiw	a5,a5,1
    80005f8e:	fef42623          	sw	a5,-20(s0)
    80005f92:	0001e797          	auipc	a5,0x1e
    80005f96:	31678793          	addi	a5,a5,790 # 800242a8 <log>
    80005f9a:	57d8                	lw	a4,44(a5)
    80005f9c:	fec42783          	lw	a5,-20(s0)
    80005fa0:	2781                	sext.w	a5,a5
    80005fa2:	f2e7c2e3          	blt	a5,a4,80005ec6 <install_trans+0x14>
  }
}
    80005fa6:	0001                	nop
    80005fa8:	0001                	nop
    80005faa:	70e2                	ld	ra,56(sp)
    80005fac:	7442                	ld	s0,48(sp)
    80005fae:	6121                	addi	sp,sp,64
    80005fb0:	8082                	ret

0000000080005fb2 <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
    80005fb2:	7179                	addi	sp,sp,-48
    80005fb4:	f406                	sd	ra,40(sp)
    80005fb6:	f022                	sd	s0,32(sp)
    80005fb8:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    80005fba:	0001e797          	auipc	a5,0x1e
    80005fbe:	2ee78793          	addi	a5,a5,750 # 800242a8 <log>
    80005fc2:	579c                	lw	a5,40(a5)
    80005fc4:	0007871b          	sext.w	a4,a5
    80005fc8:	0001e797          	auipc	a5,0x1e
    80005fcc:	2e078793          	addi	a5,a5,736 # 800242a8 <log>
    80005fd0:	4f9c                	lw	a5,24(a5)
    80005fd2:	2781                	sext.w	a5,a5
    80005fd4:	85be                	mv	a1,a5
    80005fd6:	853a                	mv	a0,a4
    80005fd8:	ffffe097          	auipc	ra,0xffffe
    80005fdc:	730080e7          	jalr	1840(ra) # 80004708 <bread>
    80005fe0:	fea43023          	sd	a0,-32(s0)
  struct logheader *lh = (struct logheader *) (buf->data);
    80005fe4:	fe043783          	ld	a5,-32(s0)
    80005fe8:	05878793          	addi	a5,a5,88
    80005fec:	fcf43c23          	sd	a5,-40(s0)
  int i;
  log.lh.n = lh->n;
    80005ff0:	fd843783          	ld	a5,-40(s0)
    80005ff4:	4398                	lw	a4,0(a5)
    80005ff6:	0001e797          	auipc	a5,0x1e
    80005ffa:	2b278793          	addi	a5,a5,690 # 800242a8 <log>
    80005ffe:	d7d8                	sw	a4,44(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006000:	fe042623          	sw	zero,-20(s0)
    80006004:	a03d                	j	80006032 <read_head+0x80>
    log.lh.block[i] = lh->block[i];
    80006006:	fd843703          	ld	a4,-40(s0)
    8000600a:	fec42783          	lw	a5,-20(s0)
    8000600e:	078a                	slli	a5,a5,0x2
    80006010:	97ba                	add	a5,a5,a4
    80006012:	43d8                	lw	a4,4(a5)
    80006014:	0001e697          	auipc	a3,0x1e
    80006018:	29468693          	addi	a3,a3,660 # 800242a8 <log>
    8000601c:	fec42783          	lw	a5,-20(s0)
    80006020:	07a1                	addi	a5,a5,8
    80006022:	078a                	slli	a5,a5,0x2
    80006024:	97b6                	add	a5,a5,a3
    80006026:	cb98                	sw	a4,16(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006028:	fec42783          	lw	a5,-20(s0)
    8000602c:	2785                	addiw	a5,a5,1
    8000602e:	fef42623          	sw	a5,-20(s0)
    80006032:	0001e797          	auipc	a5,0x1e
    80006036:	27678793          	addi	a5,a5,630 # 800242a8 <log>
    8000603a:	57d8                	lw	a4,44(a5)
    8000603c:	fec42783          	lw	a5,-20(s0)
    80006040:	2781                	sext.w	a5,a5
    80006042:	fce7c2e3          	blt	a5,a4,80006006 <read_head+0x54>
  }
  brelse(buf);
    80006046:	fe043503          	ld	a0,-32(s0)
    8000604a:	ffffe097          	auipc	ra,0xffffe
    8000604e:	760080e7          	jalr	1888(ra) # 800047aa <brelse>
}
    80006052:	0001                	nop
    80006054:	70a2                	ld	ra,40(sp)
    80006056:	7402                	ld	s0,32(sp)
    80006058:	6145                	addi	sp,sp,48
    8000605a:	8082                	ret

000000008000605c <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
    8000605c:	7179                	addi	sp,sp,-48
    8000605e:	f406                	sd	ra,40(sp)
    80006060:	f022                	sd	s0,32(sp)
    80006062:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    80006064:	0001e797          	auipc	a5,0x1e
    80006068:	24478793          	addi	a5,a5,580 # 800242a8 <log>
    8000606c:	579c                	lw	a5,40(a5)
    8000606e:	0007871b          	sext.w	a4,a5
    80006072:	0001e797          	auipc	a5,0x1e
    80006076:	23678793          	addi	a5,a5,566 # 800242a8 <log>
    8000607a:	4f9c                	lw	a5,24(a5)
    8000607c:	2781                	sext.w	a5,a5
    8000607e:	85be                	mv	a1,a5
    80006080:	853a                	mv	a0,a4
    80006082:	ffffe097          	auipc	ra,0xffffe
    80006086:	686080e7          	jalr	1670(ra) # 80004708 <bread>
    8000608a:	fea43023          	sd	a0,-32(s0)
  struct logheader *hb = (struct logheader *) (buf->data);
    8000608e:	fe043783          	ld	a5,-32(s0)
    80006092:	05878793          	addi	a5,a5,88
    80006096:	fcf43c23          	sd	a5,-40(s0)
  int i;
  hb->n = log.lh.n;
    8000609a:	0001e797          	auipc	a5,0x1e
    8000609e:	20e78793          	addi	a5,a5,526 # 800242a8 <log>
    800060a2:	57d8                	lw	a4,44(a5)
    800060a4:	fd843783          	ld	a5,-40(s0)
    800060a8:	c398                	sw	a4,0(a5)
  for (i = 0; i < log.lh.n; i++) {
    800060aa:	fe042623          	sw	zero,-20(s0)
    800060ae:	a03d                	j	800060dc <write_head+0x80>
    hb->block[i] = log.lh.block[i];
    800060b0:	0001e717          	auipc	a4,0x1e
    800060b4:	1f870713          	addi	a4,a4,504 # 800242a8 <log>
    800060b8:	fec42783          	lw	a5,-20(s0)
    800060bc:	07a1                	addi	a5,a5,8
    800060be:	078a                	slli	a5,a5,0x2
    800060c0:	97ba                	add	a5,a5,a4
    800060c2:	4b98                	lw	a4,16(a5)
    800060c4:	fd843683          	ld	a3,-40(s0)
    800060c8:	fec42783          	lw	a5,-20(s0)
    800060cc:	078a                	slli	a5,a5,0x2
    800060ce:	97b6                	add	a5,a5,a3
    800060d0:	c3d8                	sw	a4,4(a5)
  for (i = 0; i < log.lh.n; i++) {
    800060d2:	fec42783          	lw	a5,-20(s0)
    800060d6:	2785                	addiw	a5,a5,1
    800060d8:	fef42623          	sw	a5,-20(s0)
    800060dc:	0001e797          	auipc	a5,0x1e
    800060e0:	1cc78793          	addi	a5,a5,460 # 800242a8 <log>
    800060e4:	57d8                	lw	a4,44(a5)
    800060e6:	fec42783          	lw	a5,-20(s0)
    800060ea:	2781                	sext.w	a5,a5
    800060ec:	fce7c2e3          	blt	a5,a4,800060b0 <write_head+0x54>
  }
  bwrite(buf);
    800060f0:	fe043503          	ld	a0,-32(s0)
    800060f4:	ffffe097          	auipc	ra,0xffffe
    800060f8:	66e080e7          	jalr	1646(ra) # 80004762 <bwrite>
  brelse(buf);
    800060fc:	fe043503          	ld	a0,-32(s0)
    80006100:	ffffe097          	auipc	ra,0xffffe
    80006104:	6aa080e7          	jalr	1706(ra) # 800047aa <brelse>
}
    80006108:	0001                	nop
    8000610a:	70a2                	ld	ra,40(sp)
    8000610c:	7402                	ld	s0,32(sp)
    8000610e:	6145                	addi	sp,sp,48
    80006110:	8082                	ret

0000000080006112 <recover_from_log>:

static void
recover_from_log(void)
{
    80006112:	1141                	addi	sp,sp,-16
    80006114:	e406                	sd	ra,8(sp)
    80006116:	e022                	sd	s0,0(sp)
    80006118:	0800                	addi	s0,sp,16
  read_head();
    8000611a:	00000097          	auipc	ra,0x0
    8000611e:	e98080e7          	jalr	-360(ra) # 80005fb2 <read_head>
  install_trans(1); // if committed, copy from log to disk
    80006122:	4505                	li	a0,1
    80006124:	00000097          	auipc	ra,0x0
    80006128:	d8e080e7          	jalr	-626(ra) # 80005eb2 <install_trans>
  log.lh.n = 0;
    8000612c:	0001e797          	auipc	a5,0x1e
    80006130:	17c78793          	addi	a5,a5,380 # 800242a8 <log>
    80006134:	0207a623          	sw	zero,44(a5)
  write_head(); // clear the log
    80006138:	00000097          	auipc	ra,0x0
    8000613c:	f24080e7          	jalr	-220(ra) # 8000605c <write_head>
}
    80006140:	0001                	nop
    80006142:	60a2                	ld	ra,8(sp)
    80006144:	6402                	ld	s0,0(sp)
    80006146:	0141                	addi	sp,sp,16
    80006148:	8082                	ret

000000008000614a <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
    8000614a:	1141                	addi	sp,sp,-16
    8000614c:	e406                	sd	ra,8(sp)
    8000614e:	e022                	sd	s0,0(sp)
    80006150:	0800                	addi	s0,sp,16
  acquire(&log.lock);
    80006152:	0001e517          	auipc	a0,0x1e
    80006156:	15650513          	addi	a0,a0,342 # 800242a8 <log>
    8000615a:	ffffb097          	auipc	ra,0xffffb
    8000615e:	114080e7          	jalr	276(ra) # 8000126e <acquire>
  while(1){
    if(log.committing){
    80006162:	0001e797          	auipc	a5,0x1e
    80006166:	14678793          	addi	a5,a5,326 # 800242a8 <log>
    8000616a:	53dc                	lw	a5,36(a5)
    8000616c:	cf91                	beqz	a5,80006188 <begin_op+0x3e>
      sleep(&log, &log.lock);
    8000616e:	0001e597          	auipc	a1,0x1e
    80006172:	13a58593          	addi	a1,a1,314 # 800242a8 <log>
    80006176:	0001e517          	auipc	a0,0x1e
    8000617a:	13250513          	addi	a0,a0,306 # 800242a8 <log>
    8000617e:	ffffd097          	auipc	ra,0xffffd
    80006182:	326080e7          	jalr	806(ra) # 800034a4 <sleep>
    80006186:	bff1                	j	80006162 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
    80006188:	0001e797          	auipc	a5,0x1e
    8000618c:	12078793          	addi	a5,a5,288 # 800242a8 <log>
    80006190:	57d8                	lw	a4,44(a5)
    80006192:	0001e797          	auipc	a5,0x1e
    80006196:	11678793          	addi	a5,a5,278 # 800242a8 <log>
    8000619a:	539c                	lw	a5,32(a5)
    8000619c:	2785                	addiw	a5,a5,1
    8000619e:	2781                	sext.w	a5,a5
    800061a0:	86be                	mv	a3,a5
    800061a2:	87b6                	mv	a5,a3
    800061a4:	0027979b          	slliw	a5,a5,0x2
    800061a8:	9fb5                	addw	a5,a5,a3
    800061aa:	0017979b          	slliw	a5,a5,0x1
    800061ae:	2781                	sext.w	a5,a5
    800061b0:	9fb9                	addw	a5,a5,a4
    800061b2:	2781                	sext.w	a5,a5
    800061b4:	873e                	mv	a4,a5
    800061b6:	47f9                	li	a5,30
    800061b8:	00e7df63          	bge	a5,a4,800061d6 <begin_op+0x8c>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    800061bc:	0001e597          	auipc	a1,0x1e
    800061c0:	0ec58593          	addi	a1,a1,236 # 800242a8 <log>
    800061c4:	0001e517          	auipc	a0,0x1e
    800061c8:	0e450513          	addi	a0,a0,228 # 800242a8 <log>
    800061cc:	ffffd097          	auipc	ra,0xffffd
    800061d0:	2d8080e7          	jalr	728(ra) # 800034a4 <sleep>
    800061d4:	b779                	j	80006162 <begin_op+0x18>
    } else {
      log.outstanding += 1;
    800061d6:	0001e797          	auipc	a5,0x1e
    800061da:	0d278793          	addi	a5,a5,210 # 800242a8 <log>
    800061de:	539c                	lw	a5,32(a5)
    800061e0:	2785                	addiw	a5,a5,1
    800061e2:	0007871b          	sext.w	a4,a5
    800061e6:	0001e797          	auipc	a5,0x1e
    800061ea:	0c278793          	addi	a5,a5,194 # 800242a8 <log>
    800061ee:	d398                	sw	a4,32(a5)
      release(&log.lock);
    800061f0:	0001e517          	auipc	a0,0x1e
    800061f4:	0b850513          	addi	a0,a0,184 # 800242a8 <log>
    800061f8:	ffffb097          	auipc	ra,0xffffb
    800061fc:	0da080e7          	jalr	218(ra) # 800012d2 <release>
      break;
    80006200:	0001                	nop
    }
  }
}
    80006202:	0001                	nop
    80006204:	60a2                	ld	ra,8(sp)
    80006206:	6402                	ld	s0,0(sp)
    80006208:	0141                	addi	sp,sp,16
    8000620a:	8082                	ret

000000008000620c <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
    8000620c:	1101                	addi	sp,sp,-32
    8000620e:	ec06                	sd	ra,24(sp)
    80006210:	e822                	sd	s0,16(sp)
    80006212:	1000                	addi	s0,sp,32
  int do_commit = 0;
    80006214:	fe042623          	sw	zero,-20(s0)

  acquire(&log.lock);
    80006218:	0001e517          	auipc	a0,0x1e
    8000621c:	09050513          	addi	a0,a0,144 # 800242a8 <log>
    80006220:	ffffb097          	auipc	ra,0xffffb
    80006224:	04e080e7          	jalr	78(ra) # 8000126e <acquire>
  log.outstanding -= 1;
    80006228:	0001e797          	auipc	a5,0x1e
    8000622c:	08078793          	addi	a5,a5,128 # 800242a8 <log>
    80006230:	539c                	lw	a5,32(a5)
    80006232:	37fd                	addiw	a5,a5,-1
    80006234:	0007871b          	sext.w	a4,a5
    80006238:	0001e797          	auipc	a5,0x1e
    8000623c:	07078793          	addi	a5,a5,112 # 800242a8 <log>
    80006240:	d398                	sw	a4,32(a5)
  if(log.committing)
    80006242:	0001e797          	auipc	a5,0x1e
    80006246:	06678793          	addi	a5,a5,102 # 800242a8 <log>
    8000624a:	53dc                	lw	a5,36(a5)
    8000624c:	cb89                	beqz	a5,8000625e <end_op+0x52>
    panic("log.committing");
    8000624e:	00005517          	auipc	a0,0x5
    80006252:	33250513          	addi	a0,a0,818 # 8000b580 <etext+0x580>
    80006256:	ffffb097          	auipc	ra,0xffffb
    8000625a:	a28080e7          	jalr	-1496(ra) # 80000c7e <panic>
  if(log.outstanding == 0){
    8000625e:	0001e797          	auipc	a5,0x1e
    80006262:	04a78793          	addi	a5,a5,74 # 800242a8 <log>
    80006266:	539c                	lw	a5,32(a5)
    80006268:	eb99                	bnez	a5,8000627e <end_op+0x72>
    do_commit = 1;
    8000626a:	4785                	li	a5,1
    8000626c:	fef42623          	sw	a5,-20(s0)
    log.committing = 1;
    80006270:	0001e797          	auipc	a5,0x1e
    80006274:	03878793          	addi	a5,a5,56 # 800242a8 <log>
    80006278:	4705                	li	a4,1
    8000627a:	d3d8                	sw	a4,36(a5)
    8000627c:	a809                	j	8000628e <end_op+0x82>
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
    8000627e:	0001e517          	auipc	a0,0x1e
    80006282:	02a50513          	addi	a0,a0,42 # 800242a8 <log>
    80006286:	ffffd097          	auipc	ra,0xffffd
    8000628a:	29a080e7          	jalr	666(ra) # 80003520 <wakeup>
  }
  release(&log.lock);
    8000628e:	0001e517          	auipc	a0,0x1e
    80006292:	01a50513          	addi	a0,a0,26 # 800242a8 <log>
    80006296:	ffffb097          	auipc	ra,0xffffb
    8000629a:	03c080e7          	jalr	60(ra) # 800012d2 <release>

  if(do_commit){
    8000629e:	fec42783          	lw	a5,-20(s0)
    800062a2:	2781                	sext.w	a5,a5
    800062a4:	c3b9                	beqz	a5,800062ea <end_op+0xde>
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    800062a6:	00000097          	auipc	ra,0x0
    800062aa:	134080e7          	jalr	308(ra) # 800063da <commit>
    acquire(&log.lock);
    800062ae:	0001e517          	auipc	a0,0x1e
    800062b2:	ffa50513          	addi	a0,a0,-6 # 800242a8 <log>
    800062b6:	ffffb097          	auipc	ra,0xffffb
    800062ba:	fb8080e7          	jalr	-72(ra) # 8000126e <acquire>
    log.committing = 0;
    800062be:	0001e797          	auipc	a5,0x1e
    800062c2:	fea78793          	addi	a5,a5,-22 # 800242a8 <log>
    800062c6:	0207a223          	sw	zero,36(a5)
    wakeup(&log);
    800062ca:	0001e517          	auipc	a0,0x1e
    800062ce:	fde50513          	addi	a0,a0,-34 # 800242a8 <log>
    800062d2:	ffffd097          	auipc	ra,0xffffd
    800062d6:	24e080e7          	jalr	590(ra) # 80003520 <wakeup>
    release(&log.lock);
    800062da:	0001e517          	auipc	a0,0x1e
    800062de:	fce50513          	addi	a0,a0,-50 # 800242a8 <log>
    800062e2:	ffffb097          	auipc	ra,0xffffb
    800062e6:	ff0080e7          	jalr	-16(ra) # 800012d2 <release>
  }
}
    800062ea:	0001                	nop
    800062ec:	60e2                	ld	ra,24(sp)
    800062ee:	6442                	ld	s0,16(sp)
    800062f0:	6105                	addi	sp,sp,32
    800062f2:	8082                	ret

00000000800062f4 <write_log>:

// Copy modified blocks from cache to log.
static void
write_log(void)
{
    800062f4:	7179                	addi	sp,sp,-48
    800062f6:	f406                	sd	ra,40(sp)
    800062f8:	f022                	sd	s0,32(sp)
    800062fa:	1800                	addi	s0,sp,48
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    800062fc:	fe042623          	sw	zero,-20(s0)
    80006300:	a86d                	j	800063ba <write_log+0xc6>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    80006302:	0001e797          	auipc	a5,0x1e
    80006306:	fa678793          	addi	a5,a5,-90 # 800242a8 <log>
    8000630a:	579c                	lw	a5,40(a5)
    8000630c:	0007869b          	sext.w	a3,a5
    80006310:	0001e797          	auipc	a5,0x1e
    80006314:	f9878793          	addi	a5,a5,-104 # 800242a8 <log>
    80006318:	4f9c                	lw	a5,24(a5)
    8000631a:	fec42703          	lw	a4,-20(s0)
    8000631e:	9fb9                	addw	a5,a5,a4
    80006320:	2781                	sext.w	a5,a5
    80006322:	2785                	addiw	a5,a5,1
    80006324:	2781                	sext.w	a5,a5
    80006326:	2781                	sext.w	a5,a5
    80006328:	85be                	mv	a1,a5
    8000632a:	8536                	mv	a0,a3
    8000632c:	ffffe097          	auipc	ra,0xffffe
    80006330:	3dc080e7          	jalr	988(ra) # 80004708 <bread>
    80006334:	fea43023          	sd	a0,-32(s0)
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
    80006338:	0001e797          	auipc	a5,0x1e
    8000633c:	f7078793          	addi	a5,a5,-144 # 800242a8 <log>
    80006340:	579c                	lw	a5,40(a5)
    80006342:	0007869b          	sext.w	a3,a5
    80006346:	0001e717          	auipc	a4,0x1e
    8000634a:	f6270713          	addi	a4,a4,-158 # 800242a8 <log>
    8000634e:	fec42783          	lw	a5,-20(s0)
    80006352:	07a1                	addi	a5,a5,8
    80006354:	078a                	slli	a5,a5,0x2
    80006356:	97ba                	add	a5,a5,a4
    80006358:	4b9c                	lw	a5,16(a5)
    8000635a:	2781                	sext.w	a5,a5
    8000635c:	85be                	mv	a1,a5
    8000635e:	8536                	mv	a0,a3
    80006360:	ffffe097          	auipc	ra,0xffffe
    80006364:	3a8080e7          	jalr	936(ra) # 80004708 <bread>
    80006368:	fca43c23          	sd	a0,-40(s0)
    memmove(to->data, from->data, BSIZE);
    8000636c:	fe043783          	ld	a5,-32(s0)
    80006370:	05878713          	addi	a4,a5,88
    80006374:	fd843783          	ld	a5,-40(s0)
    80006378:	05878793          	addi	a5,a5,88
    8000637c:	40000613          	li	a2,1024
    80006380:	85be                	mv	a1,a5
    80006382:	853a                	mv	a0,a4
    80006384:	ffffb097          	auipc	ra,0xffffb
    80006388:	1a2080e7          	jalr	418(ra) # 80001526 <memmove>
    bwrite(to);  // write the log
    8000638c:	fe043503          	ld	a0,-32(s0)
    80006390:	ffffe097          	auipc	ra,0xffffe
    80006394:	3d2080e7          	jalr	978(ra) # 80004762 <bwrite>
    brelse(from);
    80006398:	fd843503          	ld	a0,-40(s0)
    8000639c:	ffffe097          	auipc	ra,0xffffe
    800063a0:	40e080e7          	jalr	1038(ra) # 800047aa <brelse>
    brelse(to);
    800063a4:	fe043503          	ld	a0,-32(s0)
    800063a8:	ffffe097          	auipc	ra,0xffffe
    800063ac:	402080e7          	jalr	1026(ra) # 800047aa <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    800063b0:	fec42783          	lw	a5,-20(s0)
    800063b4:	2785                	addiw	a5,a5,1
    800063b6:	fef42623          	sw	a5,-20(s0)
    800063ba:	0001e797          	auipc	a5,0x1e
    800063be:	eee78793          	addi	a5,a5,-274 # 800242a8 <log>
    800063c2:	57d8                	lw	a4,44(a5)
    800063c4:	fec42783          	lw	a5,-20(s0)
    800063c8:	2781                	sext.w	a5,a5
    800063ca:	f2e7cce3          	blt	a5,a4,80006302 <write_log+0xe>
  }
}
    800063ce:	0001                	nop
    800063d0:	0001                	nop
    800063d2:	70a2                	ld	ra,40(sp)
    800063d4:	7402                	ld	s0,32(sp)
    800063d6:	6145                	addi	sp,sp,48
    800063d8:	8082                	ret

00000000800063da <commit>:

static void
commit()
{
    800063da:	1141                	addi	sp,sp,-16
    800063dc:	e406                	sd	ra,8(sp)
    800063de:	e022                	sd	s0,0(sp)
    800063e0:	0800                	addi	s0,sp,16
  if (log.lh.n > 0) {
    800063e2:	0001e797          	auipc	a5,0x1e
    800063e6:	ec678793          	addi	a5,a5,-314 # 800242a8 <log>
    800063ea:	57dc                	lw	a5,44(a5)
    800063ec:	02f05963          	blez	a5,8000641e <commit+0x44>
    write_log();     // Write modified blocks from cache to log
    800063f0:	00000097          	auipc	ra,0x0
    800063f4:	f04080e7          	jalr	-252(ra) # 800062f4 <write_log>
    write_head();    // Write header to disk -- the real commit
    800063f8:	00000097          	auipc	ra,0x0
    800063fc:	c64080e7          	jalr	-924(ra) # 8000605c <write_head>
    install_trans(0); // Now install writes to home locations
    80006400:	4501                	li	a0,0
    80006402:	00000097          	auipc	ra,0x0
    80006406:	ab0080e7          	jalr	-1360(ra) # 80005eb2 <install_trans>
    log.lh.n = 0;
    8000640a:	0001e797          	auipc	a5,0x1e
    8000640e:	e9e78793          	addi	a5,a5,-354 # 800242a8 <log>
    80006412:	0207a623          	sw	zero,44(a5)
    write_head();    // Erase the transaction from the log
    80006416:	00000097          	auipc	ra,0x0
    8000641a:	c46080e7          	jalr	-954(ra) # 8000605c <write_head>
  }
}
    8000641e:	0001                	nop
    80006420:	60a2                	ld	ra,8(sp)
    80006422:	6402                	ld	s0,0(sp)
    80006424:	0141                	addi	sp,sp,16
    80006426:	8082                	ret

0000000080006428 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
    80006428:	7179                	addi	sp,sp,-48
    8000642a:	f406                	sd	ra,40(sp)
    8000642c:	f022                	sd	s0,32(sp)
    8000642e:	1800                	addi	s0,sp,48
    80006430:	fca43c23          	sd	a0,-40(s0)
  int i;

  acquire(&log.lock);
    80006434:	0001e517          	auipc	a0,0x1e
    80006438:	e7450513          	addi	a0,a0,-396 # 800242a8 <log>
    8000643c:	ffffb097          	auipc	ra,0xffffb
    80006440:	e32080e7          	jalr	-462(ra) # 8000126e <acquire>
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    80006444:	0001e797          	auipc	a5,0x1e
    80006448:	e6478793          	addi	a5,a5,-412 # 800242a8 <log>
    8000644c:	57dc                	lw	a5,44(a5)
    8000644e:	873e                	mv	a4,a5
    80006450:	47f5                	li	a5,29
    80006452:	02e7c063          	blt	a5,a4,80006472 <log_write+0x4a>
    80006456:	0001e797          	auipc	a5,0x1e
    8000645a:	e5278793          	addi	a5,a5,-430 # 800242a8 <log>
    8000645e:	57d8                	lw	a4,44(a5)
    80006460:	0001e797          	auipc	a5,0x1e
    80006464:	e4878793          	addi	a5,a5,-440 # 800242a8 <log>
    80006468:	4fdc                	lw	a5,28(a5)
    8000646a:	37fd                	addiw	a5,a5,-1
    8000646c:	2781                	sext.w	a5,a5
    8000646e:	00f74a63          	blt	a4,a5,80006482 <log_write+0x5a>
    panic("too big a transaction");
    80006472:	00005517          	auipc	a0,0x5
    80006476:	11e50513          	addi	a0,a0,286 # 8000b590 <etext+0x590>
    8000647a:	ffffb097          	auipc	ra,0xffffb
    8000647e:	804080e7          	jalr	-2044(ra) # 80000c7e <panic>
  if (log.outstanding < 1)
    80006482:	0001e797          	auipc	a5,0x1e
    80006486:	e2678793          	addi	a5,a5,-474 # 800242a8 <log>
    8000648a:	539c                	lw	a5,32(a5)
    8000648c:	00f04a63          	bgtz	a5,800064a0 <log_write+0x78>
    panic("log_write outside of trans");
    80006490:	00005517          	auipc	a0,0x5
    80006494:	11850513          	addi	a0,a0,280 # 8000b5a8 <etext+0x5a8>
    80006498:	ffffa097          	auipc	ra,0xffffa
    8000649c:	7e6080e7          	jalr	2022(ra) # 80000c7e <panic>

  for (i = 0; i < log.lh.n; i++) {
    800064a0:	fe042623          	sw	zero,-20(s0)
    800064a4:	a03d                	j	800064d2 <log_write+0xaa>
    if (log.lh.block[i] == b->blockno)   // log absorption
    800064a6:	0001e717          	auipc	a4,0x1e
    800064aa:	e0270713          	addi	a4,a4,-510 # 800242a8 <log>
    800064ae:	fec42783          	lw	a5,-20(s0)
    800064b2:	07a1                	addi	a5,a5,8
    800064b4:	078a                	slli	a5,a5,0x2
    800064b6:	97ba                	add	a5,a5,a4
    800064b8:	4b9c                	lw	a5,16(a5)
    800064ba:	0007871b          	sext.w	a4,a5
    800064be:	fd843783          	ld	a5,-40(s0)
    800064c2:	47dc                	lw	a5,12(a5)
    800064c4:	02f70263          	beq	a4,a5,800064e8 <log_write+0xc0>
  for (i = 0; i < log.lh.n; i++) {
    800064c8:	fec42783          	lw	a5,-20(s0)
    800064cc:	2785                	addiw	a5,a5,1
    800064ce:	fef42623          	sw	a5,-20(s0)
    800064d2:	0001e797          	auipc	a5,0x1e
    800064d6:	dd678793          	addi	a5,a5,-554 # 800242a8 <log>
    800064da:	57d8                	lw	a4,44(a5)
    800064dc:	fec42783          	lw	a5,-20(s0)
    800064e0:	2781                	sext.w	a5,a5
    800064e2:	fce7c2e3          	blt	a5,a4,800064a6 <log_write+0x7e>
    800064e6:	a011                	j	800064ea <log_write+0xc2>
      break;
    800064e8:	0001                	nop
  }
  log.lh.block[i] = b->blockno;
    800064ea:	fd843783          	ld	a5,-40(s0)
    800064ee:	47dc                	lw	a5,12(a5)
    800064f0:	0007871b          	sext.w	a4,a5
    800064f4:	0001e697          	auipc	a3,0x1e
    800064f8:	db468693          	addi	a3,a3,-588 # 800242a8 <log>
    800064fc:	fec42783          	lw	a5,-20(s0)
    80006500:	07a1                	addi	a5,a5,8
    80006502:	078a                	slli	a5,a5,0x2
    80006504:	97b6                	add	a5,a5,a3
    80006506:	cb98                	sw	a4,16(a5)
  if (i == log.lh.n) {  // Add new block to log?
    80006508:	0001e797          	auipc	a5,0x1e
    8000650c:	da078793          	addi	a5,a5,-608 # 800242a8 <log>
    80006510:	57d8                	lw	a4,44(a5)
    80006512:	fec42783          	lw	a5,-20(s0)
    80006516:	2781                	sext.w	a5,a5
    80006518:	02e79563          	bne	a5,a4,80006542 <log_write+0x11a>
    bpin(b);
    8000651c:	fd843503          	ld	a0,-40(s0)
    80006520:	ffffe097          	auipc	ra,0xffffe
    80006524:	378080e7          	jalr	888(ra) # 80004898 <bpin>
    log.lh.n++;
    80006528:	0001e797          	auipc	a5,0x1e
    8000652c:	d8078793          	addi	a5,a5,-640 # 800242a8 <log>
    80006530:	57dc                	lw	a5,44(a5)
    80006532:	2785                	addiw	a5,a5,1
    80006534:	0007871b          	sext.w	a4,a5
    80006538:	0001e797          	auipc	a5,0x1e
    8000653c:	d7078793          	addi	a5,a5,-656 # 800242a8 <log>
    80006540:	d7d8                	sw	a4,44(a5)
  }
  release(&log.lock);
    80006542:	0001e517          	auipc	a0,0x1e
    80006546:	d6650513          	addi	a0,a0,-666 # 800242a8 <log>
    8000654a:	ffffb097          	auipc	ra,0xffffb
    8000654e:	d88080e7          	jalr	-632(ra) # 800012d2 <release>
}
    80006552:	0001                	nop
    80006554:	70a2                	ld	ra,40(sp)
    80006556:	7402                	ld	s0,32(sp)
    80006558:	6145                	addi	sp,sp,48
    8000655a:	8082                	ret

000000008000655c <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    8000655c:	1101                	addi	sp,sp,-32
    8000655e:	ec06                	sd	ra,24(sp)
    80006560:	e822                	sd	s0,16(sp)
    80006562:	1000                	addi	s0,sp,32
    80006564:	fea43423          	sd	a0,-24(s0)
    80006568:	feb43023          	sd	a1,-32(s0)
  initlock(&lk->lk, "sleep lock");
    8000656c:	fe843783          	ld	a5,-24(s0)
    80006570:	07a1                	addi	a5,a5,8
    80006572:	00005597          	auipc	a1,0x5
    80006576:	05658593          	addi	a1,a1,86 # 8000b5c8 <etext+0x5c8>
    8000657a:	853e                	mv	a0,a5
    8000657c:	ffffb097          	auipc	ra,0xffffb
    80006580:	cc2080e7          	jalr	-830(ra) # 8000123e <initlock>
  lk->name = name;
    80006584:	fe843783          	ld	a5,-24(s0)
    80006588:	fe043703          	ld	a4,-32(s0)
    8000658c:	f398                	sd	a4,32(a5)
  lk->locked = 0;
    8000658e:	fe843783          	ld	a5,-24(s0)
    80006592:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    80006596:	fe843783          	ld	a5,-24(s0)
    8000659a:	0207a423          	sw	zero,40(a5)
}
    8000659e:	0001                	nop
    800065a0:	60e2                	ld	ra,24(sp)
    800065a2:	6442                	ld	s0,16(sp)
    800065a4:	6105                	addi	sp,sp,32
    800065a6:	8082                	ret

00000000800065a8 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    800065a8:	1101                	addi	sp,sp,-32
    800065aa:	ec06                	sd	ra,24(sp)
    800065ac:	e822                	sd	s0,16(sp)
    800065ae:	1000                	addi	s0,sp,32
    800065b0:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    800065b4:	fe843783          	ld	a5,-24(s0)
    800065b8:	07a1                	addi	a5,a5,8
    800065ba:	853e                	mv	a0,a5
    800065bc:	ffffb097          	auipc	ra,0xffffb
    800065c0:	cb2080e7          	jalr	-846(ra) # 8000126e <acquire>
  while (lk->locked) {
    800065c4:	a819                	j	800065da <acquiresleep+0x32>
    sleep(lk, &lk->lk);
    800065c6:	fe843783          	ld	a5,-24(s0)
    800065ca:	07a1                	addi	a5,a5,8
    800065cc:	85be                	mv	a1,a5
    800065ce:	fe843503          	ld	a0,-24(s0)
    800065d2:	ffffd097          	auipc	ra,0xffffd
    800065d6:	ed2080e7          	jalr	-302(ra) # 800034a4 <sleep>
  while (lk->locked) {
    800065da:	fe843783          	ld	a5,-24(s0)
    800065de:	439c                	lw	a5,0(a5)
    800065e0:	f3fd                	bnez	a5,800065c6 <acquiresleep+0x1e>
  }
  lk->locked = 1;
    800065e2:	fe843783          	ld	a5,-24(s0)
    800065e6:	4705                	li	a4,1
    800065e8:	c398                	sw	a4,0(a5)
  lk->pid = myproc()->pid;
    800065ea:	ffffc097          	auipc	ra,0xffffc
    800065ee:	22e080e7          	jalr	558(ra) # 80002818 <myproc>
    800065f2:	87aa                	mv	a5,a0
    800065f4:	5b98                	lw	a4,48(a5)
    800065f6:	fe843783          	ld	a5,-24(s0)
    800065fa:	d798                	sw	a4,40(a5)
  release(&lk->lk);
    800065fc:	fe843783          	ld	a5,-24(s0)
    80006600:	07a1                	addi	a5,a5,8
    80006602:	853e                	mv	a0,a5
    80006604:	ffffb097          	auipc	ra,0xffffb
    80006608:	cce080e7          	jalr	-818(ra) # 800012d2 <release>
}
    8000660c:	0001                	nop
    8000660e:	60e2                	ld	ra,24(sp)
    80006610:	6442                	ld	s0,16(sp)
    80006612:	6105                	addi	sp,sp,32
    80006614:	8082                	ret

0000000080006616 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80006616:	1101                	addi	sp,sp,-32
    80006618:	ec06                	sd	ra,24(sp)
    8000661a:	e822                	sd	s0,16(sp)
    8000661c:	1000                	addi	s0,sp,32
    8000661e:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80006622:	fe843783          	ld	a5,-24(s0)
    80006626:	07a1                	addi	a5,a5,8
    80006628:	853e                	mv	a0,a5
    8000662a:	ffffb097          	auipc	ra,0xffffb
    8000662e:	c44080e7          	jalr	-956(ra) # 8000126e <acquire>
  lk->locked = 0;
    80006632:	fe843783          	ld	a5,-24(s0)
    80006636:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    8000663a:	fe843783          	ld	a5,-24(s0)
    8000663e:	0207a423          	sw	zero,40(a5)
  wakeup(lk);
    80006642:	fe843503          	ld	a0,-24(s0)
    80006646:	ffffd097          	auipc	ra,0xffffd
    8000664a:	eda080e7          	jalr	-294(ra) # 80003520 <wakeup>
  release(&lk->lk);
    8000664e:	fe843783          	ld	a5,-24(s0)
    80006652:	07a1                	addi	a5,a5,8
    80006654:	853e                	mv	a0,a5
    80006656:	ffffb097          	auipc	ra,0xffffb
    8000665a:	c7c080e7          	jalr	-900(ra) # 800012d2 <release>
}
    8000665e:	0001                	nop
    80006660:	60e2                	ld	ra,24(sp)
    80006662:	6442                	ld	s0,16(sp)
    80006664:	6105                	addi	sp,sp,32
    80006666:	8082                	ret

0000000080006668 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80006668:	7139                	addi	sp,sp,-64
    8000666a:	fc06                	sd	ra,56(sp)
    8000666c:	f822                	sd	s0,48(sp)
    8000666e:	f426                	sd	s1,40(sp)
    80006670:	0080                	addi	s0,sp,64
    80006672:	fca43423          	sd	a0,-56(s0)
  int r;
  
  acquire(&lk->lk);
    80006676:	fc843783          	ld	a5,-56(s0)
    8000667a:	07a1                	addi	a5,a5,8
    8000667c:	853e                	mv	a0,a5
    8000667e:	ffffb097          	auipc	ra,0xffffb
    80006682:	bf0080e7          	jalr	-1040(ra) # 8000126e <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80006686:	fc843783          	ld	a5,-56(s0)
    8000668a:	439c                	lw	a5,0(a5)
    8000668c:	cf99                	beqz	a5,800066aa <holdingsleep+0x42>
    8000668e:	fc843783          	ld	a5,-56(s0)
    80006692:	5784                	lw	s1,40(a5)
    80006694:	ffffc097          	auipc	ra,0xffffc
    80006698:	184080e7          	jalr	388(ra) # 80002818 <myproc>
    8000669c:	87aa                	mv	a5,a0
    8000669e:	5b9c                	lw	a5,48(a5)
    800066a0:	8726                	mv	a4,s1
    800066a2:	00f71463          	bne	a4,a5,800066aa <holdingsleep+0x42>
    800066a6:	4785                	li	a5,1
    800066a8:	a011                	j	800066ac <holdingsleep+0x44>
    800066aa:	4781                	li	a5,0
    800066ac:	fcf42e23          	sw	a5,-36(s0)
  release(&lk->lk);
    800066b0:	fc843783          	ld	a5,-56(s0)
    800066b4:	07a1                	addi	a5,a5,8
    800066b6:	853e                	mv	a0,a5
    800066b8:	ffffb097          	auipc	ra,0xffffb
    800066bc:	c1a080e7          	jalr	-998(ra) # 800012d2 <release>
  return r;
    800066c0:	fdc42783          	lw	a5,-36(s0)
}
    800066c4:	853e                	mv	a0,a5
    800066c6:	70e2                	ld	ra,56(sp)
    800066c8:	7442                	ld	s0,48(sp)
    800066ca:	74a2                	ld	s1,40(sp)
    800066cc:	6121                	addi	sp,sp,64
    800066ce:	8082                	ret

00000000800066d0 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    800066d0:	1141                	addi	sp,sp,-16
    800066d2:	e406                	sd	ra,8(sp)
    800066d4:	e022                	sd	s0,0(sp)
    800066d6:	0800                	addi	s0,sp,16
  initlock(&ftable.lock, "ftable");
    800066d8:	00005597          	auipc	a1,0x5
    800066dc:	f0058593          	addi	a1,a1,-256 # 8000b5d8 <etext+0x5d8>
    800066e0:	0001e517          	auipc	a0,0x1e
    800066e4:	d1050513          	addi	a0,a0,-752 # 800243f0 <ftable>
    800066e8:	ffffb097          	auipc	ra,0xffffb
    800066ec:	b56080e7          	jalr	-1194(ra) # 8000123e <initlock>
}
    800066f0:	0001                	nop
    800066f2:	60a2                	ld	ra,8(sp)
    800066f4:	6402                	ld	s0,0(sp)
    800066f6:	0141                	addi	sp,sp,16
    800066f8:	8082                	ret

00000000800066fa <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    800066fa:	1101                	addi	sp,sp,-32
    800066fc:	ec06                	sd	ra,24(sp)
    800066fe:	e822                	sd	s0,16(sp)
    80006700:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80006702:	0001e517          	auipc	a0,0x1e
    80006706:	cee50513          	addi	a0,a0,-786 # 800243f0 <ftable>
    8000670a:	ffffb097          	auipc	ra,0xffffb
    8000670e:	b64080e7          	jalr	-1180(ra) # 8000126e <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006712:	0001e797          	auipc	a5,0x1e
    80006716:	cf678793          	addi	a5,a5,-778 # 80024408 <ftable+0x18>
    8000671a:	fef43423          	sd	a5,-24(s0)
    8000671e:	a815                	j	80006752 <filealloc+0x58>
    if(f->ref == 0){
    80006720:	fe843783          	ld	a5,-24(s0)
    80006724:	43dc                	lw	a5,4(a5)
    80006726:	e385                	bnez	a5,80006746 <filealloc+0x4c>
      f->ref = 1;
    80006728:	fe843783          	ld	a5,-24(s0)
    8000672c:	4705                	li	a4,1
    8000672e:	c3d8                	sw	a4,4(a5)
      release(&ftable.lock);
    80006730:	0001e517          	auipc	a0,0x1e
    80006734:	cc050513          	addi	a0,a0,-832 # 800243f0 <ftable>
    80006738:	ffffb097          	auipc	ra,0xffffb
    8000673c:	b9a080e7          	jalr	-1126(ra) # 800012d2 <release>
      return f;
    80006740:	fe843783          	ld	a5,-24(s0)
    80006744:	a805                	j	80006774 <filealloc+0x7a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006746:	fe843783          	ld	a5,-24(s0)
    8000674a:	02878793          	addi	a5,a5,40
    8000674e:	fef43423          	sd	a5,-24(s0)
    80006752:	0001f797          	auipc	a5,0x1f
    80006756:	c5678793          	addi	a5,a5,-938 # 800253a8 <ftable+0xfb8>
    8000675a:	fe843703          	ld	a4,-24(s0)
    8000675e:	fcf761e3          	bltu	a4,a5,80006720 <filealloc+0x26>
    }
  }
  release(&ftable.lock);
    80006762:	0001e517          	auipc	a0,0x1e
    80006766:	c8e50513          	addi	a0,a0,-882 # 800243f0 <ftable>
    8000676a:	ffffb097          	auipc	ra,0xffffb
    8000676e:	b68080e7          	jalr	-1176(ra) # 800012d2 <release>
  return 0;
    80006772:	4781                	li	a5,0
}
    80006774:	853e                	mv	a0,a5
    80006776:	60e2                	ld	ra,24(sp)
    80006778:	6442                	ld	s0,16(sp)
    8000677a:	6105                	addi	sp,sp,32
    8000677c:	8082                	ret

000000008000677e <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    8000677e:	1101                	addi	sp,sp,-32
    80006780:	ec06                	sd	ra,24(sp)
    80006782:	e822                	sd	s0,16(sp)
    80006784:	1000                	addi	s0,sp,32
    80006786:	fea43423          	sd	a0,-24(s0)
  acquire(&ftable.lock);
    8000678a:	0001e517          	auipc	a0,0x1e
    8000678e:	c6650513          	addi	a0,a0,-922 # 800243f0 <ftable>
    80006792:	ffffb097          	auipc	ra,0xffffb
    80006796:	adc080e7          	jalr	-1316(ra) # 8000126e <acquire>
  if(f->ref < 1)
    8000679a:	fe843783          	ld	a5,-24(s0)
    8000679e:	43dc                	lw	a5,4(a5)
    800067a0:	00f04a63          	bgtz	a5,800067b4 <filedup+0x36>
    panic("filedup");
    800067a4:	00005517          	auipc	a0,0x5
    800067a8:	e3c50513          	addi	a0,a0,-452 # 8000b5e0 <etext+0x5e0>
    800067ac:	ffffa097          	auipc	ra,0xffffa
    800067b0:	4d2080e7          	jalr	1234(ra) # 80000c7e <panic>
  f->ref++;
    800067b4:	fe843783          	ld	a5,-24(s0)
    800067b8:	43dc                	lw	a5,4(a5)
    800067ba:	2785                	addiw	a5,a5,1
    800067bc:	0007871b          	sext.w	a4,a5
    800067c0:	fe843783          	ld	a5,-24(s0)
    800067c4:	c3d8                	sw	a4,4(a5)
  release(&ftable.lock);
    800067c6:	0001e517          	auipc	a0,0x1e
    800067ca:	c2a50513          	addi	a0,a0,-982 # 800243f0 <ftable>
    800067ce:	ffffb097          	auipc	ra,0xffffb
    800067d2:	b04080e7          	jalr	-1276(ra) # 800012d2 <release>
  return f;
    800067d6:	fe843783          	ld	a5,-24(s0)
}
    800067da:	853e                	mv	a0,a5
    800067dc:	60e2                	ld	ra,24(sp)
    800067de:	6442                	ld	s0,16(sp)
    800067e0:	6105                	addi	sp,sp,32
    800067e2:	8082                	ret

00000000800067e4 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    800067e4:	715d                	addi	sp,sp,-80
    800067e6:	e486                	sd	ra,72(sp)
    800067e8:	e0a2                	sd	s0,64(sp)
    800067ea:	0880                	addi	s0,sp,80
    800067ec:	faa43c23          	sd	a0,-72(s0)
  struct file ff;

  acquire(&ftable.lock);
    800067f0:	0001e517          	auipc	a0,0x1e
    800067f4:	c0050513          	addi	a0,a0,-1024 # 800243f0 <ftable>
    800067f8:	ffffb097          	auipc	ra,0xffffb
    800067fc:	a76080e7          	jalr	-1418(ra) # 8000126e <acquire>
  if(f->ref < 1)
    80006800:	fb843783          	ld	a5,-72(s0)
    80006804:	43dc                	lw	a5,4(a5)
    80006806:	00f04a63          	bgtz	a5,8000681a <fileclose+0x36>
    panic("fileclose");
    8000680a:	00005517          	auipc	a0,0x5
    8000680e:	dde50513          	addi	a0,a0,-546 # 8000b5e8 <etext+0x5e8>
    80006812:	ffffa097          	auipc	ra,0xffffa
    80006816:	46c080e7          	jalr	1132(ra) # 80000c7e <panic>
  if(--f->ref > 0){
    8000681a:	fb843783          	ld	a5,-72(s0)
    8000681e:	43dc                	lw	a5,4(a5)
    80006820:	37fd                	addiw	a5,a5,-1
    80006822:	0007871b          	sext.w	a4,a5
    80006826:	fb843783          	ld	a5,-72(s0)
    8000682a:	c3d8                	sw	a4,4(a5)
    8000682c:	fb843783          	ld	a5,-72(s0)
    80006830:	43dc                	lw	a5,4(a5)
    80006832:	00f05b63          	blez	a5,80006848 <fileclose+0x64>
    release(&ftable.lock);
    80006836:	0001e517          	auipc	a0,0x1e
    8000683a:	bba50513          	addi	a0,a0,-1094 # 800243f0 <ftable>
    8000683e:	ffffb097          	auipc	ra,0xffffb
    80006842:	a94080e7          	jalr	-1388(ra) # 800012d2 <release>
    80006846:	a879                	j	800068e4 <fileclose+0x100>
    return;
  }
  ff = *f;
    80006848:	fb843783          	ld	a5,-72(s0)
    8000684c:	638c                	ld	a1,0(a5)
    8000684e:	6790                	ld	a2,8(a5)
    80006850:	6b94                	ld	a3,16(a5)
    80006852:	6f98                	ld	a4,24(a5)
    80006854:	739c                	ld	a5,32(a5)
    80006856:	fcb43423          	sd	a1,-56(s0)
    8000685a:	fcc43823          	sd	a2,-48(s0)
    8000685e:	fcd43c23          	sd	a3,-40(s0)
    80006862:	fee43023          	sd	a4,-32(s0)
    80006866:	fef43423          	sd	a5,-24(s0)
  f->ref = 0;
    8000686a:	fb843783          	ld	a5,-72(s0)
    8000686e:	0007a223          	sw	zero,4(a5)
  f->type = FD_NONE;
    80006872:	fb843783          	ld	a5,-72(s0)
    80006876:	0007a023          	sw	zero,0(a5)
  release(&ftable.lock);
    8000687a:	0001e517          	auipc	a0,0x1e
    8000687e:	b7650513          	addi	a0,a0,-1162 # 800243f0 <ftable>
    80006882:	ffffb097          	auipc	ra,0xffffb
    80006886:	a50080e7          	jalr	-1456(ra) # 800012d2 <release>

  if(ff.type == FD_PIPE){
    8000688a:	fc842783          	lw	a5,-56(s0)
    8000688e:	873e                	mv	a4,a5
    80006890:	4785                	li	a5,1
    80006892:	00f71e63          	bne	a4,a5,800068ae <fileclose+0xca>
    pipeclose(ff.pipe, ff.writable);
    80006896:	fd843783          	ld	a5,-40(s0)
    8000689a:	fd144703          	lbu	a4,-47(s0)
    8000689e:	2701                	sext.w	a4,a4
    800068a0:	85ba                	mv	a1,a4
    800068a2:	853e                	mv	a0,a5
    800068a4:	00000097          	auipc	ra,0x0
    800068a8:	5aa080e7          	jalr	1450(ra) # 80006e4e <pipeclose>
    800068ac:	a825                	j	800068e4 <fileclose+0x100>
  } else if(ff.type == FD_INODE || ff.type == FD_DEVICE){
    800068ae:	fc842783          	lw	a5,-56(s0)
    800068b2:	873e                	mv	a4,a5
    800068b4:	4789                	li	a5,2
    800068b6:	00f70863          	beq	a4,a5,800068c6 <fileclose+0xe2>
    800068ba:	fc842783          	lw	a5,-56(s0)
    800068be:	873e                	mv	a4,a5
    800068c0:	478d                	li	a5,3
    800068c2:	02f71163          	bne	a4,a5,800068e4 <fileclose+0x100>
    begin_op();
    800068c6:	00000097          	auipc	ra,0x0
    800068ca:	884080e7          	jalr	-1916(ra) # 8000614a <begin_op>
    iput(ff.ip);
    800068ce:	fe043783          	ld	a5,-32(s0)
    800068d2:	853e                	mv	a0,a5
    800068d4:	fffff097          	auipc	ra,0xfffff
    800068d8:	9aa080e7          	jalr	-1622(ra) # 8000527e <iput>
    end_op();
    800068dc:	00000097          	auipc	ra,0x0
    800068e0:	930080e7          	jalr	-1744(ra) # 8000620c <end_op>
  }
}
    800068e4:	60a6                	ld	ra,72(sp)
    800068e6:	6406                	ld	s0,64(sp)
    800068e8:	6161                	addi	sp,sp,80
    800068ea:	8082                	ret

00000000800068ec <filestat>:

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
    800068ec:	7139                	addi	sp,sp,-64
    800068ee:	fc06                	sd	ra,56(sp)
    800068f0:	f822                	sd	s0,48(sp)
    800068f2:	0080                	addi	s0,sp,64
    800068f4:	fca43423          	sd	a0,-56(s0)
    800068f8:	fcb43023          	sd	a1,-64(s0)
  struct proc *p = myproc();
    800068fc:	ffffc097          	auipc	ra,0xffffc
    80006900:	f1c080e7          	jalr	-228(ra) # 80002818 <myproc>
    80006904:	fea43423          	sd	a0,-24(s0)
  struct stat st;
  
  if(f->type == FD_INODE || f->type == FD_DEVICE){
    80006908:	fc843783          	ld	a5,-56(s0)
    8000690c:	439c                	lw	a5,0(a5)
    8000690e:	873e                	mv	a4,a5
    80006910:	4789                	li	a5,2
    80006912:	00f70963          	beq	a4,a5,80006924 <filestat+0x38>
    80006916:	fc843783          	ld	a5,-56(s0)
    8000691a:	439c                	lw	a5,0(a5)
    8000691c:	873e                	mv	a4,a5
    8000691e:	478d                	li	a5,3
    80006920:	06f71263          	bne	a4,a5,80006984 <filestat+0x98>
    ilock(f->ip);
    80006924:	fc843783          	ld	a5,-56(s0)
    80006928:	6f9c                	ld	a5,24(a5)
    8000692a:	853e                	mv	a0,a5
    8000692c:	ffffe097          	auipc	ra,0xffffe
    80006930:	7c4080e7          	jalr	1988(ra) # 800050f0 <ilock>
    stati(f->ip, &st);
    80006934:	fc843783          	ld	a5,-56(s0)
    80006938:	6f9c                	ld	a5,24(a5)
    8000693a:	fd040713          	addi	a4,s0,-48
    8000693e:	85ba                	mv	a1,a4
    80006940:	853e                	mv	a0,a5
    80006942:	fffff097          	auipc	ra,0xfffff
    80006946:	ce0080e7          	jalr	-800(ra) # 80005622 <stati>
    iunlock(f->ip);
    8000694a:	fc843783          	ld	a5,-56(s0)
    8000694e:	6f9c                	ld	a5,24(a5)
    80006950:	853e                	mv	a0,a5
    80006952:	fffff097          	auipc	ra,0xfffff
    80006956:	8d2080e7          	jalr	-1838(ra) # 80005224 <iunlock>
    if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    8000695a:	fe843783          	ld	a5,-24(s0)
    8000695e:	6bbc                	ld	a5,80(a5)
    80006960:	fd040713          	addi	a4,s0,-48
    80006964:	46e1                	li	a3,24
    80006966:	863a                	mv	a2,a4
    80006968:	fc043583          	ld	a1,-64(s0)
    8000696c:	853e                	mv	a0,a5
    8000696e:	ffffc097          	auipc	ra,0xffffc
    80006972:	978080e7          	jalr	-1672(ra) # 800022e6 <copyout>
    80006976:	87aa                	mv	a5,a0
    80006978:	0007d463          	bgez	a5,80006980 <filestat+0x94>
      return -1;
    8000697c:	57fd                	li	a5,-1
    8000697e:	a021                	j	80006986 <filestat+0x9a>
    return 0;
    80006980:	4781                	li	a5,0
    80006982:	a011                	j	80006986 <filestat+0x9a>
  }
  return -1;
    80006984:	57fd                	li	a5,-1
}
    80006986:	853e                	mv	a0,a5
    80006988:	70e2                	ld	ra,56(sp)
    8000698a:	7442                	ld	s0,48(sp)
    8000698c:	6121                	addi	sp,sp,64
    8000698e:	8082                	ret

0000000080006990 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80006990:	7139                	addi	sp,sp,-64
    80006992:	fc06                	sd	ra,56(sp)
    80006994:	f822                	sd	s0,48(sp)
    80006996:	0080                	addi	s0,sp,64
    80006998:	fca43c23          	sd	a0,-40(s0)
    8000699c:	fcb43823          	sd	a1,-48(s0)
    800069a0:	87b2                	mv	a5,a2
    800069a2:	fcf42623          	sw	a5,-52(s0)
  int r = 0;
    800069a6:	fe042623          	sw	zero,-20(s0)

  if(f->readable == 0)
    800069aa:	fd843783          	ld	a5,-40(s0)
    800069ae:	0087c783          	lbu	a5,8(a5)
    800069b2:	e399                	bnez	a5,800069b8 <fileread+0x28>
    return -1;
    800069b4:	57fd                	li	a5,-1
    800069b6:	aa1d                	j	80006aec <fileread+0x15c>

  if(f->type == FD_PIPE){
    800069b8:	fd843783          	ld	a5,-40(s0)
    800069bc:	439c                	lw	a5,0(a5)
    800069be:	873e                	mv	a4,a5
    800069c0:	4785                	li	a5,1
    800069c2:	02f71363          	bne	a4,a5,800069e8 <fileread+0x58>
    r = piperead(f->pipe, addr, n);
    800069c6:	fd843783          	ld	a5,-40(s0)
    800069ca:	6b9c                	ld	a5,16(a5)
    800069cc:	fcc42703          	lw	a4,-52(s0)
    800069d0:	863a                	mv	a2,a4
    800069d2:	fd043583          	ld	a1,-48(s0)
    800069d6:	853e                	mv	a0,a5
    800069d8:	00000097          	auipc	ra,0x0
    800069dc:	668080e7          	jalr	1640(ra) # 80007040 <piperead>
    800069e0:	87aa                	mv	a5,a0
    800069e2:	fef42623          	sw	a5,-20(s0)
    800069e6:	a209                	j	80006ae8 <fileread+0x158>
  } else if(f->type == FD_DEVICE){
    800069e8:	fd843783          	ld	a5,-40(s0)
    800069ec:	439c                	lw	a5,0(a5)
    800069ee:	873e                	mv	a4,a5
    800069f0:	478d                	li	a5,3
    800069f2:	06f71863          	bne	a4,a5,80006a62 <fileread+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    800069f6:	fd843783          	ld	a5,-40(s0)
    800069fa:	02479783          	lh	a5,36(a5)
    800069fe:	2781                	sext.w	a5,a5
    80006a00:	0207c863          	bltz	a5,80006a30 <fileread+0xa0>
    80006a04:	fd843783          	ld	a5,-40(s0)
    80006a08:	02479783          	lh	a5,36(a5)
    80006a0c:	0007871b          	sext.w	a4,a5
    80006a10:	47a5                	li	a5,9
    80006a12:	00e7cf63          	blt	a5,a4,80006a30 <fileread+0xa0>
    80006a16:	fd843783          	ld	a5,-40(s0)
    80006a1a:	02479783          	lh	a5,36(a5)
    80006a1e:	2781                	sext.w	a5,a5
    80006a20:	0001e717          	auipc	a4,0x1e
    80006a24:	93070713          	addi	a4,a4,-1744 # 80024350 <devsw>
    80006a28:	0792                	slli	a5,a5,0x4
    80006a2a:	97ba                	add	a5,a5,a4
    80006a2c:	639c                	ld	a5,0(a5)
    80006a2e:	e399                	bnez	a5,80006a34 <fileread+0xa4>
      return -1;
    80006a30:	57fd                	li	a5,-1
    80006a32:	a86d                	j	80006aec <fileread+0x15c>
    r = devsw[f->major].read(1, addr, n);
    80006a34:	fd843783          	ld	a5,-40(s0)
    80006a38:	02479783          	lh	a5,36(a5)
    80006a3c:	2781                	sext.w	a5,a5
    80006a3e:	0001e717          	auipc	a4,0x1e
    80006a42:	91270713          	addi	a4,a4,-1774 # 80024350 <devsw>
    80006a46:	0792                	slli	a5,a5,0x4
    80006a48:	97ba                	add	a5,a5,a4
    80006a4a:	6398                	ld	a4,0(a5)
    80006a4c:	fcc42783          	lw	a5,-52(s0)
    80006a50:	863e                	mv	a2,a5
    80006a52:	fd043583          	ld	a1,-48(s0)
    80006a56:	4505                	li	a0,1
    80006a58:	9702                	jalr	a4
    80006a5a:	87aa                	mv	a5,a0
    80006a5c:	fef42623          	sw	a5,-20(s0)
    80006a60:	a061                	j	80006ae8 <fileread+0x158>
  } else if(f->type == FD_INODE){
    80006a62:	fd843783          	ld	a5,-40(s0)
    80006a66:	439c                	lw	a5,0(a5)
    80006a68:	873e                	mv	a4,a5
    80006a6a:	4789                	li	a5,2
    80006a6c:	06f71663          	bne	a4,a5,80006ad8 <fileread+0x148>
    ilock(f->ip);
    80006a70:	fd843783          	ld	a5,-40(s0)
    80006a74:	6f9c                	ld	a5,24(a5)
    80006a76:	853e                	mv	a0,a5
    80006a78:	ffffe097          	auipc	ra,0xffffe
    80006a7c:	678080e7          	jalr	1656(ra) # 800050f0 <ilock>
    if((r = readi(f->ip, 1, addr, f->off, n)) > 0)
    80006a80:	fd843783          	ld	a5,-40(s0)
    80006a84:	6f88                	ld	a0,24(a5)
    80006a86:	fd843783          	ld	a5,-40(s0)
    80006a8a:	539c                	lw	a5,32(a5)
    80006a8c:	fcc42703          	lw	a4,-52(s0)
    80006a90:	86be                	mv	a3,a5
    80006a92:	fd043603          	ld	a2,-48(s0)
    80006a96:	4585                	li	a1,1
    80006a98:	fffff097          	auipc	ra,0xfffff
    80006a9c:	bee080e7          	jalr	-1042(ra) # 80005686 <readi>
    80006aa0:	87aa                	mv	a5,a0
    80006aa2:	fef42623          	sw	a5,-20(s0)
    80006aa6:	fec42783          	lw	a5,-20(s0)
    80006aaa:	2781                	sext.w	a5,a5
    80006aac:	00f05d63          	blez	a5,80006ac6 <fileread+0x136>
      f->off += r;
    80006ab0:	fd843783          	ld	a5,-40(s0)
    80006ab4:	5398                	lw	a4,32(a5)
    80006ab6:	fec42783          	lw	a5,-20(s0)
    80006aba:	9fb9                	addw	a5,a5,a4
    80006abc:	0007871b          	sext.w	a4,a5
    80006ac0:	fd843783          	ld	a5,-40(s0)
    80006ac4:	d398                	sw	a4,32(a5)
    iunlock(f->ip);
    80006ac6:	fd843783          	ld	a5,-40(s0)
    80006aca:	6f9c                	ld	a5,24(a5)
    80006acc:	853e                	mv	a0,a5
    80006ace:	ffffe097          	auipc	ra,0xffffe
    80006ad2:	756080e7          	jalr	1878(ra) # 80005224 <iunlock>
    80006ad6:	a809                	j	80006ae8 <fileread+0x158>
  } else {
    panic("fileread");
    80006ad8:	00005517          	auipc	a0,0x5
    80006adc:	b2050513          	addi	a0,a0,-1248 # 8000b5f8 <etext+0x5f8>
    80006ae0:	ffffa097          	auipc	ra,0xffffa
    80006ae4:	19e080e7          	jalr	414(ra) # 80000c7e <panic>
  }

  return r;
    80006ae8:	fec42783          	lw	a5,-20(s0)
}
    80006aec:	853e                	mv	a0,a5
    80006aee:	70e2                	ld	ra,56(sp)
    80006af0:	7442                	ld	s0,48(sp)
    80006af2:	6121                	addi	sp,sp,64
    80006af4:	8082                	ret

0000000080006af6 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80006af6:	715d                	addi	sp,sp,-80
    80006af8:	e486                	sd	ra,72(sp)
    80006afa:	e0a2                	sd	s0,64(sp)
    80006afc:	0880                	addi	s0,sp,80
    80006afe:	fca43423          	sd	a0,-56(s0)
    80006b02:	fcb43023          	sd	a1,-64(s0)
    80006b06:	87b2                	mv	a5,a2
    80006b08:	faf42e23          	sw	a5,-68(s0)
  int r, ret = 0;
    80006b0c:	fe042623          	sw	zero,-20(s0)

  if(f->writable == 0)
    80006b10:	fc843783          	ld	a5,-56(s0)
    80006b14:	0097c783          	lbu	a5,9(a5)
    80006b18:	e399                	bnez	a5,80006b1e <filewrite+0x28>
    return -1;
    80006b1a:	57fd                	li	a5,-1
    80006b1c:	aad1                	j	80006cf0 <filewrite+0x1fa>

  if(f->type == FD_PIPE){
    80006b1e:	fc843783          	ld	a5,-56(s0)
    80006b22:	439c                	lw	a5,0(a5)
    80006b24:	873e                	mv	a4,a5
    80006b26:	4785                	li	a5,1
    80006b28:	02f71363          	bne	a4,a5,80006b4e <filewrite+0x58>
    ret = pipewrite(f->pipe, addr, n);
    80006b2c:	fc843783          	ld	a5,-56(s0)
    80006b30:	6b9c                	ld	a5,16(a5)
    80006b32:	fbc42703          	lw	a4,-68(s0)
    80006b36:	863a                	mv	a2,a4
    80006b38:	fc043583          	ld	a1,-64(s0)
    80006b3c:	853e                	mv	a0,a5
    80006b3e:	00000097          	auipc	ra,0x0
    80006b42:	3b8080e7          	jalr	952(ra) # 80006ef6 <pipewrite>
    80006b46:	87aa                	mv	a5,a0
    80006b48:	fef42623          	sw	a5,-20(s0)
    80006b4c:	a245                	j	80006cec <filewrite+0x1f6>
  } else if(f->type == FD_DEVICE){
    80006b4e:	fc843783          	ld	a5,-56(s0)
    80006b52:	439c                	lw	a5,0(a5)
    80006b54:	873e                	mv	a4,a5
    80006b56:	478d                	li	a5,3
    80006b58:	06f71863          	bne	a4,a5,80006bc8 <filewrite+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80006b5c:	fc843783          	ld	a5,-56(s0)
    80006b60:	02479783          	lh	a5,36(a5)
    80006b64:	2781                	sext.w	a5,a5
    80006b66:	0207c863          	bltz	a5,80006b96 <filewrite+0xa0>
    80006b6a:	fc843783          	ld	a5,-56(s0)
    80006b6e:	02479783          	lh	a5,36(a5)
    80006b72:	0007871b          	sext.w	a4,a5
    80006b76:	47a5                	li	a5,9
    80006b78:	00e7cf63          	blt	a5,a4,80006b96 <filewrite+0xa0>
    80006b7c:	fc843783          	ld	a5,-56(s0)
    80006b80:	02479783          	lh	a5,36(a5)
    80006b84:	2781                	sext.w	a5,a5
    80006b86:	0001d717          	auipc	a4,0x1d
    80006b8a:	7ca70713          	addi	a4,a4,1994 # 80024350 <devsw>
    80006b8e:	0792                	slli	a5,a5,0x4
    80006b90:	97ba                	add	a5,a5,a4
    80006b92:	679c                	ld	a5,8(a5)
    80006b94:	e399                	bnez	a5,80006b9a <filewrite+0xa4>
      return -1;
    80006b96:	57fd                	li	a5,-1
    80006b98:	aaa1                	j	80006cf0 <filewrite+0x1fa>
    ret = devsw[f->major].write(1, addr, n);
    80006b9a:	fc843783          	ld	a5,-56(s0)
    80006b9e:	02479783          	lh	a5,36(a5)
    80006ba2:	2781                	sext.w	a5,a5
    80006ba4:	0001d717          	auipc	a4,0x1d
    80006ba8:	7ac70713          	addi	a4,a4,1964 # 80024350 <devsw>
    80006bac:	0792                	slli	a5,a5,0x4
    80006bae:	97ba                	add	a5,a5,a4
    80006bb0:	6798                	ld	a4,8(a5)
    80006bb2:	fbc42783          	lw	a5,-68(s0)
    80006bb6:	863e                	mv	a2,a5
    80006bb8:	fc043583          	ld	a1,-64(s0)
    80006bbc:	4505                	li	a0,1
    80006bbe:	9702                	jalr	a4
    80006bc0:	87aa                	mv	a5,a0
    80006bc2:	fef42623          	sw	a5,-20(s0)
    80006bc6:	a21d                	j	80006cec <filewrite+0x1f6>
  } else if(f->type == FD_INODE){
    80006bc8:	fc843783          	ld	a5,-56(s0)
    80006bcc:	439c                	lw	a5,0(a5)
    80006bce:	873e                	mv	a4,a5
    80006bd0:	4789                	li	a5,2
    80006bd2:	10f71563          	bne	a4,a5,80006cdc <filewrite+0x1e6>
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * BSIZE;
    80006bd6:	6785                	lui	a5,0x1
    80006bd8:	c007879b          	addiw	a5,a5,-1024
    80006bdc:	fef42023          	sw	a5,-32(s0)
    int i = 0;
    80006be0:	fe042423          	sw	zero,-24(s0)
    while(i < n){
    80006be4:	a0d9                	j	80006caa <filewrite+0x1b4>
      int n1 = n - i;
    80006be6:	fbc42703          	lw	a4,-68(s0)
    80006bea:	fe842783          	lw	a5,-24(s0)
    80006bee:	40f707bb          	subw	a5,a4,a5
    80006bf2:	fef42223          	sw	a5,-28(s0)
      if(n1 > max)
    80006bf6:	fe442703          	lw	a4,-28(s0)
    80006bfa:	fe042783          	lw	a5,-32(s0)
    80006bfe:	2701                	sext.w	a4,a4
    80006c00:	2781                	sext.w	a5,a5
    80006c02:	00e7d663          	bge	a5,a4,80006c0e <filewrite+0x118>
        n1 = max;
    80006c06:	fe042783          	lw	a5,-32(s0)
    80006c0a:	fef42223          	sw	a5,-28(s0)

      begin_op();
    80006c0e:	fffff097          	auipc	ra,0xfffff
    80006c12:	53c080e7          	jalr	1340(ra) # 8000614a <begin_op>
      ilock(f->ip);
    80006c16:	fc843783          	ld	a5,-56(s0)
    80006c1a:	6f9c                	ld	a5,24(a5)
    80006c1c:	853e                	mv	a0,a5
    80006c1e:	ffffe097          	auipc	ra,0xffffe
    80006c22:	4d2080e7          	jalr	1234(ra) # 800050f0 <ilock>
      if ((r = writei(f->ip, 1, addr + i, f->off, n1)) > 0)
    80006c26:	fc843783          	ld	a5,-56(s0)
    80006c2a:	6f88                	ld	a0,24(a5)
    80006c2c:	fe842703          	lw	a4,-24(s0)
    80006c30:	fc043783          	ld	a5,-64(s0)
    80006c34:	00f70633          	add	a2,a4,a5
    80006c38:	fc843783          	ld	a5,-56(s0)
    80006c3c:	539c                	lw	a5,32(a5)
    80006c3e:	fe442703          	lw	a4,-28(s0)
    80006c42:	86be                	mv	a3,a5
    80006c44:	4585                	li	a1,1
    80006c46:	fffff097          	auipc	ra,0xfffff
    80006c4a:	bca080e7          	jalr	-1078(ra) # 80005810 <writei>
    80006c4e:	87aa                	mv	a5,a0
    80006c50:	fcf42e23          	sw	a5,-36(s0)
    80006c54:	fdc42783          	lw	a5,-36(s0)
    80006c58:	2781                	sext.w	a5,a5
    80006c5a:	00f05d63          	blez	a5,80006c74 <filewrite+0x17e>
        f->off += r;
    80006c5e:	fc843783          	ld	a5,-56(s0)
    80006c62:	5398                	lw	a4,32(a5)
    80006c64:	fdc42783          	lw	a5,-36(s0)
    80006c68:	9fb9                	addw	a5,a5,a4
    80006c6a:	0007871b          	sext.w	a4,a5
    80006c6e:	fc843783          	ld	a5,-56(s0)
    80006c72:	d398                	sw	a4,32(a5)
      iunlock(f->ip);
    80006c74:	fc843783          	ld	a5,-56(s0)
    80006c78:	6f9c                	ld	a5,24(a5)
    80006c7a:	853e                	mv	a0,a5
    80006c7c:	ffffe097          	auipc	ra,0xffffe
    80006c80:	5a8080e7          	jalr	1448(ra) # 80005224 <iunlock>
      end_op();
    80006c84:	fffff097          	auipc	ra,0xfffff
    80006c88:	588080e7          	jalr	1416(ra) # 8000620c <end_op>

      if(r != n1){
    80006c8c:	fdc42703          	lw	a4,-36(s0)
    80006c90:	fe442783          	lw	a5,-28(s0)
    80006c94:	2701                	sext.w	a4,a4
    80006c96:	2781                	sext.w	a5,a5
    80006c98:	02f71263          	bne	a4,a5,80006cbc <filewrite+0x1c6>
        // error from writei
        break;
      }
      i += r;
    80006c9c:	fe842703          	lw	a4,-24(s0)
    80006ca0:	fdc42783          	lw	a5,-36(s0)
    80006ca4:	9fb9                	addw	a5,a5,a4
    80006ca6:	fef42423          	sw	a5,-24(s0)
    while(i < n){
    80006caa:	fe842703          	lw	a4,-24(s0)
    80006cae:	fbc42783          	lw	a5,-68(s0)
    80006cb2:	2701                	sext.w	a4,a4
    80006cb4:	2781                	sext.w	a5,a5
    80006cb6:	f2f748e3          	blt	a4,a5,80006be6 <filewrite+0xf0>
    80006cba:	a011                	j	80006cbe <filewrite+0x1c8>
        break;
    80006cbc:	0001                	nop
    }
    ret = (i == n ? n : -1);
    80006cbe:	fe842703          	lw	a4,-24(s0)
    80006cc2:	fbc42783          	lw	a5,-68(s0)
    80006cc6:	2701                	sext.w	a4,a4
    80006cc8:	2781                	sext.w	a5,a5
    80006cca:	00f71563          	bne	a4,a5,80006cd4 <filewrite+0x1de>
    80006cce:	fbc42783          	lw	a5,-68(s0)
    80006cd2:	a011                	j	80006cd6 <filewrite+0x1e0>
    80006cd4:	57fd                	li	a5,-1
    80006cd6:	fef42623          	sw	a5,-20(s0)
    80006cda:	a809                	j	80006cec <filewrite+0x1f6>
  } else {
    panic("filewrite");
    80006cdc:	00005517          	auipc	a0,0x5
    80006ce0:	92c50513          	addi	a0,a0,-1748 # 8000b608 <etext+0x608>
    80006ce4:	ffffa097          	auipc	ra,0xffffa
    80006ce8:	f9a080e7          	jalr	-102(ra) # 80000c7e <panic>
  }

  return ret;
    80006cec:	fec42783          	lw	a5,-20(s0)
}
    80006cf0:	853e                	mv	a0,a5
    80006cf2:	60a6                	ld	ra,72(sp)
    80006cf4:	6406                	ld	s0,64(sp)
    80006cf6:	6161                	addi	sp,sp,80
    80006cf8:	8082                	ret

0000000080006cfa <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
    80006cfa:	7179                	addi	sp,sp,-48
    80006cfc:	f406                	sd	ra,40(sp)
    80006cfe:	f022                	sd	s0,32(sp)
    80006d00:	1800                	addi	s0,sp,48
    80006d02:	fca43c23          	sd	a0,-40(s0)
    80006d06:	fcb43823          	sd	a1,-48(s0)
  struct pipe *pi;

  pi = 0;
    80006d0a:	fe043423          	sd	zero,-24(s0)
  *f0 = *f1 = 0;
    80006d0e:	fd043783          	ld	a5,-48(s0)
    80006d12:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
    80006d16:	fd043783          	ld	a5,-48(s0)
    80006d1a:	6398                	ld	a4,0(a5)
    80006d1c:	fd843783          	ld	a5,-40(s0)
    80006d20:	e398                	sd	a4,0(a5)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    80006d22:	00000097          	auipc	ra,0x0
    80006d26:	9d8080e7          	jalr	-1576(ra) # 800066fa <filealloc>
    80006d2a:	872a                	mv	a4,a0
    80006d2c:	fd843783          	ld	a5,-40(s0)
    80006d30:	e398                	sd	a4,0(a5)
    80006d32:	fd843783          	ld	a5,-40(s0)
    80006d36:	639c                	ld	a5,0(a5)
    80006d38:	c3e9                	beqz	a5,80006dfa <pipealloc+0x100>
    80006d3a:	00000097          	auipc	ra,0x0
    80006d3e:	9c0080e7          	jalr	-1600(ra) # 800066fa <filealloc>
    80006d42:	872a                	mv	a4,a0
    80006d44:	fd043783          	ld	a5,-48(s0)
    80006d48:	e398                	sd	a4,0(a5)
    80006d4a:	fd043783          	ld	a5,-48(s0)
    80006d4e:	639c                	ld	a5,0(a5)
    80006d50:	c7cd                	beqz	a5,80006dfa <pipealloc+0x100>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == 0)
    80006d52:	ffffa097          	auipc	ra,0xffffa
    80006d56:	3c8080e7          	jalr	968(ra) # 8000111a <kalloc>
    80006d5a:	fea43423          	sd	a0,-24(s0)
    80006d5e:	fe843783          	ld	a5,-24(s0)
    80006d62:	cfd1                	beqz	a5,80006dfe <pipealloc+0x104>
    goto bad;
  pi->readopen = 1;
    80006d64:	fe843783          	ld	a5,-24(s0)
    80006d68:	4705                	li	a4,1
    80006d6a:	22e7a023          	sw	a4,544(a5)
  pi->writeopen = 1;
    80006d6e:	fe843783          	ld	a5,-24(s0)
    80006d72:	4705                	li	a4,1
    80006d74:	22e7a223          	sw	a4,548(a5)
  pi->nwrite = 0;
    80006d78:	fe843783          	ld	a5,-24(s0)
    80006d7c:	2007ae23          	sw	zero,540(a5)
  pi->nread = 0;
    80006d80:	fe843783          	ld	a5,-24(s0)
    80006d84:	2007ac23          	sw	zero,536(a5)
  initlock(&pi->lock, "pipe");
    80006d88:	fe843783          	ld	a5,-24(s0)
    80006d8c:	00005597          	auipc	a1,0x5
    80006d90:	88c58593          	addi	a1,a1,-1908 # 8000b618 <etext+0x618>
    80006d94:	853e                	mv	a0,a5
    80006d96:	ffffa097          	auipc	ra,0xffffa
    80006d9a:	4a8080e7          	jalr	1192(ra) # 8000123e <initlock>
  (*f0)->type = FD_PIPE;
    80006d9e:	fd843783          	ld	a5,-40(s0)
    80006da2:	639c                	ld	a5,0(a5)
    80006da4:	4705                	li	a4,1
    80006da6:	c398                	sw	a4,0(a5)
  (*f0)->readable = 1;
    80006da8:	fd843783          	ld	a5,-40(s0)
    80006dac:	639c                	ld	a5,0(a5)
    80006dae:	4705                	li	a4,1
    80006db0:	00e78423          	sb	a4,8(a5)
  (*f0)->writable = 0;
    80006db4:	fd843783          	ld	a5,-40(s0)
    80006db8:	639c                	ld	a5,0(a5)
    80006dba:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80006dbe:	fd843783          	ld	a5,-40(s0)
    80006dc2:	639c                	ld	a5,0(a5)
    80006dc4:	fe843703          	ld	a4,-24(s0)
    80006dc8:	eb98                	sd	a4,16(a5)
  (*f1)->type = FD_PIPE;
    80006dca:	fd043783          	ld	a5,-48(s0)
    80006dce:	639c                	ld	a5,0(a5)
    80006dd0:	4705                	li	a4,1
    80006dd2:	c398                	sw	a4,0(a5)
  (*f1)->readable = 0;
    80006dd4:	fd043783          	ld	a5,-48(s0)
    80006dd8:	639c                	ld	a5,0(a5)
    80006dda:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80006dde:	fd043783          	ld	a5,-48(s0)
    80006de2:	639c                	ld	a5,0(a5)
    80006de4:	4705                	li	a4,1
    80006de6:	00e784a3          	sb	a4,9(a5)
  (*f1)->pipe = pi;
    80006dea:	fd043783          	ld	a5,-48(s0)
    80006dee:	639c                	ld	a5,0(a5)
    80006df0:	fe843703          	ld	a4,-24(s0)
    80006df4:	eb98                	sd	a4,16(a5)
  return 0;
    80006df6:	4781                	li	a5,0
    80006df8:	a0b1                	j	80006e44 <pipealloc+0x14a>
    goto bad;
    80006dfa:	0001                	nop
    80006dfc:	a011                	j	80006e00 <pipealloc+0x106>
    goto bad;
    80006dfe:	0001                	nop

 bad:
  if(pi)
    80006e00:	fe843783          	ld	a5,-24(s0)
    80006e04:	c799                	beqz	a5,80006e12 <pipealloc+0x118>
    kfree((char*)pi);
    80006e06:	fe843503          	ld	a0,-24(s0)
    80006e0a:	ffffa097          	auipc	ra,0xffffa
    80006e0e:	26c080e7          	jalr	620(ra) # 80001076 <kfree>
  if(*f0)
    80006e12:	fd843783          	ld	a5,-40(s0)
    80006e16:	639c                	ld	a5,0(a5)
    80006e18:	cb89                	beqz	a5,80006e2a <pipealloc+0x130>
    fileclose(*f0);
    80006e1a:	fd843783          	ld	a5,-40(s0)
    80006e1e:	639c                	ld	a5,0(a5)
    80006e20:	853e                	mv	a0,a5
    80006e22:	00000097          	auipc	ra,0x0
    80006e26:	9c2080e7          	jalr	-1598(ra) # 800067e4 <fileclose>
  if(*f1)
    80006e2a:	fd043783          	ld	a5,-48(s0)
    80006e2e:	639c                	ld	a5,0(a5)
    80006e30:	cb89                	beqz	a5,80006e42 <pipealloc+0x148>
    fileclose(*f1);
    80006e32:	fd043783          	ld	a5,-48(s0)
    80006e36:	639c                	ld	a5,0(a5)
    80006e38:	853e                	mv	a0,a5
    80006e3a:	00000097          	auipc	ra,0x0
    80006e3e:	9aa080e7          	jalr	-1622(ra) # 800067e4 <fileclose>
  return -1;
    80006e42:	57fd                	li	a5,-1
}
    80006e44:	853e                	mv	a0,a5
    80006e46:	70a2                	ld	ra,40(sp)
    80006e48:	7402                	ld	s0,32(sp)
    80006e4a:	6145                	addi	sp,sp,48
    80006e4c:	8082                	ret

0000000080006e4e <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    80006e4e:	1101                	addi	sp,sp,-32
    80006e50:	ec06                	sd	ra,24(sp)
    80006e52:	e822                	sd	s0,16(sp)
    80006e54:	1000                	addi	s0,sp,32
    80006e56:	fea43423          	sd	a0,-24(s0)
    80006e5a:	87ae                	mv	a5,a1
    80006e5c:	fef42223          	sw	a5,-28(s0)
  acquire(&pi->lock);
    80006e60:	fe843783          	ld	a5,-24(s0)
    80006e64:	853e                	mv	a0,a5
    80006e66:	ffffa097          	auipc	ra,0xffffa
    80006e6a:	408080e7          	jalr	1032(ra) # 8000126e <acquire>
  if(writable){
    80006e6e:	fe442783          	lw	a5,-28(s0)
    80006e72:	2781                	sext.w	a5,a5
    80006e74:	cf99                	beqz	a5,80006e92 <pipeclose+0x44>
    pi->writeopen = 0;
    80006e76:	fe843783          	ld	a5,-24(s0)
    80006e7a:	2207a223          	sw	zero,548(a5)
    wakeup(&pi->nread);
    80006e7e:	fe843783          	ld	a5,-24(s0)
    80006e82:	21878793          	addi	a5,a5,536
    80006e86:	853e                	mv	a0,a5
    80006e88:	ffffc097          	auipc	ra,0xffffc
    80006e8c:	698080e7          	jalr	1688(ra) # 80003520 <wakeup>
    80006e90:	a831                	j	80006eac <pipeclose+0x5e>
  } else {
    pi->readopen = 0;
    80006e92:	fe843783          	ld	a5,-24(s0)
    80006e96:	2207a023          	sw	zero,544(a5)
    wakeup(&pi->nwrite);
    80006e9a:	fe843783          	ld	a5,-24(s0)
    80006e9e:	21c78793          	addi	a5,a5,540
    80006ea2:	853e                	mv	a0,a5
    80006ea4:	ffffc097          	auipc	ra,0xffffc
    80006ea8:	67c080e7          	jalr	1660(ra) # 80003520 <wakeup>
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    80006eac:	fe843783          	ld	a5,-24(s0)
    80006eb0:	2207a783          	lw	a5,544(a5)
    80006eb4:	e785                	bnez	a5,80006edc <pipeclose+0x8e>
    80006eb6:	fe843783          	ld	a5,-24(s0)
    80006eba:	2247a783          	lw	a5,548(a5)
    80006ebe:	ef99                	bnez	a5,80006edc <pipeclose+0x8e>
    release(&pi->lock);
    80006ec0:	fe843783          	ld	a5,-24(s0)
    80006ec4:	853e                	mv	a0,a5
    80006ec6:	ffffa097          	auipc	ra,0xffffa
    80006eca:	40c080e7          	jalr	1036(ra) # 800012d2 <release>
    kfree((char*)pi);
    80006ece:	fe843503          	ld	a0,-24(s0)
    80006ed2:	ffffa097          	auipc	ra,0xffffa
    80006ed6:	1a4080e7          	jalr	420(ra) # 80001076 <kfree>
    80006eda:	a809                	j	80006eec <pipeclose+0x9e>
  } else
    release(&pi->lock);
    80006edc:	fe843783          	ld	a5,-24(s0)
    80006ee0:	853e                	mv	a0,a5
    80006ee2:	ffffa097          	auipc	ra,0xffffa
    80006ee6:	3f0080e7          	jalr	1008(ra) # 800012d2 <release>
}
    80006eea:	0001                	nop
    80006eec:	0001                	nop
    80006eee:	60e2                	ld	ra,24(sp)
    80006ef0:	6442                	ld	s0,16(sp)
    80006ef2:	6105                	addi	sp,sp,32
    80006ef4:	8082                	ret

0000000080006ef6 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    80006ef6:	715d                	addi	sp,sp,-80
    80006ef8:	e486                	sd	ra,72(sp)
    80006efa:	e0a2                	sd	s0,64(sp)
    80006efc:	0880                	addi	s0,sp,80
    80006efe:	fca43423          	sd	a0,-56(s0)
    80006f02:	fcb43023          	sd	a1,-64(s0)
    80006f06:	87b2                	mv	a5,a2
    80006f08:	faf42e23          	sw	a5,-68(s0)
  int i = 0;
    80006f0c:	fe042623          	sw	zero,-20(s0)
  struct proc *pr = myproc();
    80006f10:	ffffc097          	auipc	ra,0xffffc
    80006f14:	908080e7          	jalr	-1784(ra) # 80002818 <myproc>
    80006f18:	fea43023          	sd	a0,-32(s0)

  acquire(&pi->lock);
    80006f1c:	fc843783          	ld	a5,-56(s0)
    80006f20:	853e                	mv	a0,a5
    80006f22:	ffffa097          	auipc	ra,0xffffa
    80006f26:	34c080e7          	jalr	844(ra) # 8000126e <acquire>
  while(i < n){
    80006f2a:	a8d1                	j	80006ffe <pipewrite+0x108>
    if(pi->readopen == 0 || pr->killed){
    80006f2c:	fc843783          	ld	a5,-56(s0)
    80006f30:	2207a783          	lw	a5,544(a5)
    80006f34:	c789                	beqz	a5,80006f3e <pipewrite+0x48>
    80006f36:	fe043783          	ld	a5,-32(s0)
    80006f3a:	579c                	lw	a5,40(a5)
    80006f3c:	cb91                	beqz	a5,80006f50 <pipewrite+0x5a>
      release(&pi->lock);
    80006f3e:	fc843783          	ld	a5,-56(s0)
    80006f42:	853e                	mv	a0,a5
    80006f44:	ffffa097          	auipc	ra,0xffffa
    80006f48:	38e080e7          	jalr	910(ra) # 800012d2 <release>
      return -1;
    80006f4c:	57fd                	li	a5,-1
    80006f4e:	a0e5                	j	80007036 <pipewrite+0x140>
    }
    if(pi->nwrite == pi->nread + PIPESIZE){ //DOC: pipewrite-full
    80006f50:	fc843783          	ld	a5,-56(s0)
    80006f54:	21c7a703          	lw	a4,540(a5)
    80006f58:	fc843783          	ld	a5,-56(s0)
    80006f5c:	2187a783          	lw	a5,536(a5)
    80006f60:	2007879b          	addiw	a5,a5,512
    80006f64:	2781                	sext.w	a5,a5
    80006f66:	02f71863          	bne	a4,a5,80006f96 <pipewrite+0xa0>
      wakeup(&pi->nread);
    80006f6a:	fc843783          	ld	a5,-56(s0)
    80006f6e:	21878793          	addi	a5,a5,536
    80006f72:	853e                	mv	a0,a5
    80006f74:	ffffc097          	auipc	ra,0xffffc
    80006f78:	5ac080e7          	jalr	1452(ra) # 80003520 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    80006f7c:	fc843783          	ld	a5,-56(s0)
    80006f80:	21c78793          	addi	a5,a5,540
    80006f84:	fc843703          	ld	a4,-56(s0)
    80006f88:	85ba                	mv	a1,a4
    80006f8a:	853e                	mv	a0,a5
    80006f8c:	ffffc097          	auipc	ra,0xffffc
    80006f90:	518080e7          	jalr	1304(ra) # 800034a4 <sleep>
    80006f94:	a0ad                	j	80006ffe <pipewrite+0x108>
    } else {
      char ch;
      if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    80006f96:	fe043783          	ld	a5,-32(s0)
    80006f9a:	6ba8                	ld	a0,80(a5)
    80006f9c:	fec42703          	lw	a4,-20(s0)
    80006fa0:	fc043783          	ld	a5,-64(s0)
    80006fa4:	973e                	add	a4,a4,a5
    80006fa6:	fdf40793          	addi	a5,s0,-33
    80006faa:	4685                	li	a3,1
    80006fac:	863a                	mv	a2,a4
    80006fae:	85be                	mv	a1,a5
    80006fb0:	ffffb097          	auipc	ra,0xffffb
    80006fb4:	404080e7          	jalr	1028(ra) # 800023b4 <copyin>
    80006fb8:	87aa                	mv	a5,a0
    80006fba:	873e                	mv	a4,a5
    80006fbc:	57fd                	li	a5,-1
    80006fbe:	04f70963          	beq	a4,a5,80007010 <pipewrite+0x11a>
        break;
      pi->data[pi->nwrite++ % PIPESIZE] = ch;
    80006fc2:	fc843783          	ld	a5,-56(s0)
    80006fc6:	21c7a783          	lw	a5,540(a5)
    80006fca:	2781                	sext.w	a5,a5
    80006fcc:	0017871b          	addiw	a4,a5,1
    80006fd0:	0007069b          	sext.w	a3,a4
    80006fd4:	fc843703          	ld	a4,-56(s0)
    80006fd8:	20d72e23          	sw	a3,540(a4)
    80006fdc:	1ff7f793          	andi	a5,a5,511
    80006fe0:	2781                	sext.w	a5,a5
    80006fe2:	fdf44703          	lbu	a4,-33(s0)
    80006fe6:	fc843683          	ld	a3,-56(s0)
    80006fea:	1782                	slli	a5,a5,0x20
    80006fec:	9381                	srli	a5,a5,0x20
    80006fee:	97b6                	add	a5,a5,a3
    80006ff0:	00e78c23          	sb	a4,24(a5)
      i++;
    80006ff4:	fec42783          	lw	a5,-20(s0)
    80006ff8:	2785                	addiw	a5,a5,1
    80006ffa:	fef42623          	sw	a5,-20(s0)
  while(i < n){
    80006ffe:	fec42703          	lw	a4,-20(s0)
    80007002:	fbc42783          	lw	a5,-68(s0)
    80007006:	2701                	sext.w	a4,a4
    80007008:	2781                	sext.w	a5,a5
    8000700a:	f2f741e3          	blt	a4,a5,80006f2c <pipewrite+0x36>
    8000700e:	a011                	j	80007012 <pipewrite+0x11c>
        break;
    80007010:	0001                	nop
    }
  }
  wakeup(&pi->nread);
    80007012:	fc843783          	ld	a5,-56(s0)
    80007016:	21878793          	addi	a5,a5,536
    8000701a:	853e                	mv	a0,a5
    8000701c:	ffffc097          	auipc	ra,0xffffc
    80007020:	504080e7          	jalr	1284(ra) # 80003520 <wakeup>
  release(&pi->lock);
    80007024:	fc843783          	ld	a5,-56(s0)
    80007028:	853e                	mv	a0,a5
    8000702a:	ffffa097          	auipc	ra,0xffffa
    8000702e:	2a8080e7          	jalr	680(ra) # 800012d2 <release>

  return i;
    80007032:	fec42783          	lw	a5,-20(s0)
}
    80007036:	853e                	mv	a0,a5
    80007038:	60a6                	ld	ra,72(sp)
    8000703a:	6406                	ld	s0,64(sp)
    8000703c:	6161                	addi	sp,sp,80
    8000703e:	8082                	ret

0000000080007040 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    80007040:	715d                	addi	sp,sp,-80
    80007042:	e486                	sd	ra,72(sp)
    80007044:	e0a2                	sd	s0,64(sp)
    80007046:	0880                	addi	s0,sp,80
    80007048:	fca43423          	sd	a0,-56(s0)
    8000704c:	fcb43023          	sd	a1,-64(s0)
    80007050:	87b2                	mv	a5,a2
    80007052:	faf42e23          	sw	a5,-68(s0)
  int i;
  struct proc *pr = myproc();
    80007056:	ffffb097          	auipc	ra,0xffffb
    8000705a:	7c2080e7          	jalr	1986(ra) # 80002818 <myproc>
    8000705e:	fea43023          	sd	a0,-32(s0)
  char ch;

  acquire(&pi->lock);
    80007062:	fc843783          	ld	a5,-56(s0)
    80007066:	853e                	mv	a0,a5
    80007068:	ffffa097          	auipc	ra,0xffffa
    8000706c:	206080e7          	jalr	518(ra) # 8000126e <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80007070:	a815                	j	800070a4 <piperead+0x64>
    if(pr->killed){
    80007072:	fe043783          	ld	a5,-32(s0)
    80007076:	579c                	lw	a5,40(a5)
    80007078:	cb91                	beqz	a5,8000708c <piperead+0x4c>
      release(&pi->lock);
    8000707a:	fc843783          	ld	a5,-56(s0)
    8000707e:	853e                	mv	a0,a5
    80007080:	ffffa097          	auipc	ra,0xffffa
    80007084:	252080e7          	jalr	594(ra) # 800012d2 <release>
      return -1;
    80007088:	57fd                	li	a5,-1
    8000708a:	a8dd                	j	80007180 <piperead+0x140>
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    8000708c:	fc843783          	ld	a5,-56(s0)
    80007090:	21878793          	addi	a5,a5,536
    80007094:	fc843703          	ld	a4,-56(s0)
    80007098:	85ba                	mv	a1,a4
    8000709a:	853e                	mv	a0,a5
    8000709c:	ffffc097          	auipc	ra,0xffffc
    800070a0:	408080e7          	jalr	1032(ra) # 800034a4 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    800070a4:	fc843783          	ld	a5,-56(s0)
    800070a8:	2187a703          	lw	a4,536(a5)
    800070ac:	fc843783          	ld	a5,-56(s0)
    800070b0:	21c7a783          	lw	a5,540(a5)
    800070b4:	00f71763          	bne	a4,a5,800070c2 <piperead+0x82>
    800070b8:	fc843783          	ld	a5,-56(s0)
    800070bc:	2247a783          	lw	a5,548(a5)
    800070c0:	fbcd                	bnez	a5,80007072 <piperead+0x32>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    800070c2:	fe042623          	sw	zero,-20(s0)
    800070c6:	a8bd                	j	80007144 <piperead+0x104>
    if(pi->nread == pi->nwrite)
    800070c8:	fc843783          	ld	a5,-56(s0)
    800070cc:	2187a703          	lw	a4,536(a5)
    800070d0:	fc843783          	ld	a5,-56(s0)
    800070d4:	21c7a783          	lw	a5,540(a5)
    800070d8:	06f70f63          	beq	a4,a5,80007156 <piperead+0x116>
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    800070dc:	fc843783          	ld	a5,-56(s0)
    800070e0:	2187a783          	lw	a5,536(a5)
    800070e4:	2781                	sext.w	a5,a5
    800070e6:	0017871b          	addiw	a4,a5,1
    800070ea:	0007069b          	sext.w	a3,a4
    800070ee:	fc843703          	ld	a4,-56(s0)
    800070f2:	20d72c23          	sw	a3,536(a4)
    800070f6:	1ff7f793          	andi	a5,a5,511
    800070fa:	2781                	sext.w	a5,a5
    800070fc:	fc843703          	ld	a4,-56(s0)
    80007100:	1782                	slli	a5,a5,0x20
    80007102:	9381                	srli	a5,a5,0x20
    80007104:	97ba                	add	a5,a5,a4
    80007106:	0187c783          	lbu	a5,24(a5)
    8000710a:	fcf40fa3          	sb	a5,-33(s0)
    if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    8000710e:	fe043783          	ld	a5,-32(s0)
    80007112:	6ba8                	ld	a0,80(a5)
    80007114:	fec42703          	lw	a4,-20(s0)
    80007118:	fc043783          	ld	a5,-64(s0)
    8000711c:	97ba                	add	a5,a5,a4
    8000711e:	fdf40713          	addi	a4,s0,-33
    80007122:	4685                	li	a3,1
    80007124:	863a                	mv	a2,a4
    80007126:	85be                	mv	a1,a5
    80007128:	ffffb097          	auipc	ra,0xffffb
    8000712c:	1be080e7          	jalr	446(ra) # 800022e6 <copyout>
    80007130:	87aa                	mv	a5,a0
    80007132:	873e                	mv	a4,a5
    80007134:	57fd                	li	a5,-1
    80007136:	02f70263          	beq	a4,a5,8000715a <piperead+0x11a>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    8000713a:	fec42783          	lw	a5,-20(s0)
    8000713e:	2785                	addiw	a5,a5,1
    80007140:	fef42623          	sw	a5,-20(s0)
    80007144:	fec42703          	lw	a4,-20(s0)
    80007148:	fbc42783          	lw	a5,-68(s0)
    8000714c:	2701                	sext.w	a4,a4
    8000714e:	2781                	sext.w	a5,a5
    80007150:	f6f74ce3          	blt	a4,a5,800070c8 <piperead+0x88>
    80007154:	a021                	j	8000715c <piperead+0x11c>
      break;
    80007156:	0001                	nop
    80007158:	a011                	j	8000715c <piperead+0x11c>
      break;
    8000715a:	0001                	nop
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    8000715c:	fc843783          	ld	a5,-56(s0)
    80007160:	21c78793          	addi	a5,a5,540
    80007164:	853e                	mv	a0,a5
    80007166:	ffffc097          	auipc	ra,0xffffc
    8000716a:	3ba080e7          	jalr	954(ra) # 80003520 <wakeup>
  release(&pi->lock);
    8000716e:	fc843783          	ld	a5,-56(s0)
    80007172:	853e                	mv	a0,a5
    80007174:	ffffa097          	auipc	ra,0xffffa
    80007178:	15e080e7          	jalr	350(ra) # 800012d2 <release>
  return i;
    8000717c:	fec42783          	lw	a5,-20(s0)
}
    80007180:	853e                	mv	a0,a5
    80007182:	60a6                	ld	ra,72(sp)
    80007184:	6406                	ld	s0,64(sp)
    80007186:	6161                	addi	sp,sp,80
    80007188:	8082                	ret

000000008000718a <exec>:

static int loadseg(pde_t *pgdir, uint64 addr, struct inode *ip, uint offset, uint sz);

int
exec(char *path, char **argv)
{
    8000718a:	de010113          	addi	sp,sp,-544
    8000718e:	20113c23          	sd	ra,536(sp)
    80007192:	20813823          	sd	s0,528(sp)
    80007196:	20913423          	sd	s1,520(sp)
    8000719a:	1400                	addi	s0,sp,544
    8000719c:	dea43423          	sd	a0,-536(s0)
    800071a0:	deb43023          	sd	a1,-544(s0)
  char *s, *last;
  int i, off;
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
    800071a4:	fa043c23          	sd	zero,-72(s0)
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
    800071a8:	fa043023          	sd	zero,-96(s0)
  struct proc *p = myproc();
    800071ac:	ffffb097          	auipc	ra,0xffffb
    800071b0:	66c080e7          	jalr	1644(ra) # 80002818 <myproc>
    800071b4:	f8a43c23          	sd	a0,-104(s0)

  begin_op();
    800071b8:	fffff097          	auipc	ra,0xfffff
    800071bc:	f92080e7          	jalr	-110(ra) # 8000614a <begin_op>

  if((ip = namei(path)) == 0){
    800071c0:	de843503          	ld	a0,-536(s0)
    800071c4:	fffff097          	auipc	ra,0xfffff
    800071c8:	c22080e7          	jalr	-990(ra) # 80005de6 <namei>
    800071cc:	faa43423          	sd	a0,-88(s0)
    800071d0:	fa843783          	ld	a5,-88(s0)
    800071d4:	e799                	bnez	a5,800071e2 <exec+0x58>
    end_op();
    800071d6:	fffff097          	auipc	ra,0xfffff
    800071da:	036080e7          	jalr	54(ra) # 8000620c <end_op>
    return -1;
    800071de:	57fd                	li	a5,-1
    800071e0:	a90d                	j	80007612 <exec+0x488>
  }
  ilock(ip);
    800071e2:	fa843503          	ld	a0,-88(s0)
    800071e6:	ffffe097          	auipc	ra,0xffffe
    800071ea:	f0a080e7          	jalr	-246(ra) # 800050f0 <ilock>

  // Check ELF header
  if(readi(ip, 0, (uint64)&elf, 0, sizeof(elf)) != sizeof(elf))
    800071ee:	e3040793          	addi	a5,s0,-464
    800071f2:	04000713          	li	a4,64
    800071f6:	4681                	li	a3,0
    800071f8:	863e                	mv	a2,a5
    800071fa:	4581                	li	a1,0
    800071fc:	fa843503          	ld	a0,-88(s0)
    80007200:	ffffe097          	auipc	ra,0xffffe
    80007204:	486080e7          	jalr	1158(ra) # 80005686 <readi>
    80007208:	87aa                	mv	a5,a0
    8000720a:	873e                	mv	a4,a5
    8000720c:	04000793          	li	a5,64
    80007210:	38f71b63          	bne	a4,a5,800075a6 <exec+0x41c>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    80007214:	e3042783          	lw	a5,-464(s0)
    80007218:	873e                	mv	a4,a5
    8000721a:	464c47b7          	lui	a5,0x464c4
    8000721e:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
    80007222:	38f71463          	bne	a4,a5,800075aa <exec+0x420>
    goto bad;

  if((pagetable = proc_pagetable(p)) == 0)
    80007226:	f9843503          	ld	a0,-104(s0)
    8000722a:	ffffc097          	auipc	ra,0xffffc
    8000722e:	850080e7          	jalr	-1968(ra) # 80002a7a <proc_pagetable>
    80007232:	faa43023          	sd	a0,-96(s0)
    80007236:	fa043783          	ld	a5,-96(s0)
    8000723a:	36078a63          	beqz	a5,800075ae <exec+0x424>
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8000723e:	fc042623          	sw	zero,-52(s0)
    80007242:	e5043783          	ld	a5,-432(s0)
    80007246:	fcf42423          	sw	a5,-56(s0)
    8000724a:	a8e1                	j	80007322 <exec+0x198>
    if(readi(ip, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    8000724c:	df840793          	addi	a5,s0,-520
    80007250:	fc842683          	lw	a3,-56(s0)
    80007254:	03800713          	li	a4,56
    80007258:	863e                	mv	a2,a5
    8000725a:	4581                	li	a1,0
    8000725c:	fa843503          	ld	a0,-88(s0)
    80007260:	ffffe097          	auipc	ra,0xffffe
    80007264:	426080e7          	jalr	1062(ra) # 80005686 <readi>
    80007268:	87aa                	mv	a5,a0
    8000726a:	873e                	mv	a4,a5
    8000726c:	03800793          	li	a5,56
    80007270:	34f71163          	bne	a4,a5,800075b2 <exec+0x428>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
    80007274:	df842783          	lw	a5,-520(s0)
    80007278:	873e                	mv	a4,a5
    8000727a:	4785                	li	a5,1
    8000727c:	08f71663          	bne	a4,a5,80007308 <exec+0x17e>
      continue;
    if(ph.memsz < ph.filesz)
    80007280:	e2043703          	ld	a4,-480(s0)
    80007284:	e1843783          	ld	a5,-488(s0)
    80007288:	32f76763          	bltu	a4,a5,800075b6 <exec+0x42c>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
    8000728c:	e0843703          	ld	a4,-504(s0)
    80007290:	e2043783          	ld	a5,-480(s0)
    80007294:	973e                	add	a4,a4,a5
    80007296:	e0843783          	ld	a5,-504(s0)
    8000729a:	32f76063          	bltu	a4,a5,800075ba <exec+0x430>
      goto bad;
    uint64 sz1;
    if((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz)) == 0)
    8000729e:	e0843703          	ld	a4,-504(s0)
    800072a2:	e2043783          	ld	a5,-480(s0)
    800072a6:	97ba                	add	a5,a5,a4
    800072a8:	863e                	mv	a2,a5
    800072aa:	fb843583          	ld	a1,-72(s0)
    800072ae:	fa043503          	ld	a0,-96(s0)
    800072b2:	ffffb097          	auipc	ra,0xffffb
    800072b6:	c56080e7          	jalr	-938(ra) # 80001f08 <uvmalloc>
    800072ba:	f6a43823          	sd	a0,-144(s0)
    800072be:	f7043783          	ld	a5,-144(s0)
    800072c2:	2e078e63          	beqz	a5,800075be <exec+0x434>
      goto bad;
    sz = sz1;
    800072c6:	f7043783          	ld	a5,-144(s0)
    800072ca:	faf43c23          	sd	a5,-72(s0)
    if((ph.vaddr % PGSIZE) != 0)
    800072ce:	e0843703          	ld	a4,-504(s0)
    800072d2:	6785                	lui	a5,0x1
    800072d4:	17fd                	addi	a5,a5,-1
    800072d6:	8ff9                	and	a5,a5,a4
    800072d8:	2e079563          	bnez	a5,800075c2 <exec+0x438>
      goto bad;
    if(loadseg(pagetable, ph.vaddr, ip, ph.off, ph.filesz) < 0)
    800072dc:	e0843783          	ld	a5,-504(s0)
    800072e0:	e0043703          	ld	a4,-512(s0)
    800072e4:	0007069b          	sext.w	a3,a4
    800072e8:	e1843703          	ld	a4,-488(s0)
    800072ec:	2701                	sext.w	a4,a4
    800072ee:	fa843603          	ld	a2,-88(s0)
    800072f2:	85be                	mv	a1,a5
    800072f4:	fa043503          	ld	a0,-96(s0)
    800072f8:	00000097          	auipc	ra,0x0
    800072fc:	32e080e7          	jalr	814(ra) # 80007626 <loadseg>
    80007300:	87aa                	mv	a5,a0
    80007302:	2c07c263          	bltz	a5,800075c6 <exec+0x43c>
    80007306:	a011                	j	8000730a <exec+0x180>
      continue;
    80007308:	0001                	nop
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8000730a:	fcc42783          	lw	a5,-52(s0)
    8000730e:	2785                	addiw	a5,a5,1
    80007310:	fcf42623          	sw	a5,-52(s0)
    80007314:	fc842783          	lw	a5,-56(s0)
    80007318:	0387879b          	addiw	a5,a5,56
    8000731c:	2781                	sext.w	a5,a5
    8000731e:	fcf42423          	sw	a5,-56(s0)
    80007322:	e6845783          	lhu	a5,-408(s0)
    80007326:	0007871b          	sext.w	a4,a5
    8000732a:	fcc42783          	lw	a5,-52(s0)
    8000732e:	2781                	sext.w	a5,a5
    80007330:	f0e7cee3          	blt	a5,a4,8000724c <exec+0xc2>
      goto bad;
  }
  iunlockput(ip);
    80007334:	fa843503          	ld	a0,-88(s0)
    80007338:	ffffe097          	auipc	ra,0xffffe
    8000733c:	016080e7          	jalr	22(ra) # 8000534e <iunlockput>
  end_op();
    80007340:	fffff097          	auipc	ra,0xfffff
    80007344:	ecc080e7          	jalr	-308(ra) # 8000620c <end_op>
  ip = 0;
    80007348:	fa043423          	sd	zero,-88(s0)

  p = myproc();
    8000734c:	ffffb097          	auipc	ra,0xffffb
    80007350:	4cc080e7          	jalr	1228(ra) # 80002818 <myproc>
    80007354:	f8a43c23          	sd	a0,-104(s0)
  uint64 oldsz = p->sz;
    80007358:	f9843783          	ld	a5,-104(s0)
    8000735c:	67bc                	ld	a5,72(a5)
    8000735e:	f8f43823          	sd	a5,-112(s0)

  // Allocate two pages at the next page boundary.
  // Use the second as the user stack.
  sz = PGROUNDUP(sz);
    80007362:	fb843703          	ld	a4,-72(s0)
    80007366:	6785                	lui	a5,0x1
    80007368:	17fd                	addi	a5,a5,-1
    8000736a:	973e                	add	a4,a4,a5
    8000736c:	77fd                	lui	a5,0xfffff
    8000736e:	8ff9                	and	a5,a5,a4
    80007370:	faf43c23          	sd	a5,-72(s0)
  uint64 sz1;
  if((sz1 = uvmalloc(pagetable, sz, sz + 2*PGSIZE)) == 0)
    80007374:	fb843703          	ld	a4,-72(s0)
    80007378:	6789                	lui	a5,0x2
    8000737a:	97ba                	add	a5,a5,a4
    8000737c:	863e                	mv	a2,a5
    8000737e:	fb843583          	ld	a1,-72(s0)
    80007382:	fa043503          	ld	a0,-96(s0)
    80007386:	ffffb097          	auipc	ra,0xffffb
    8000738a:	b82080e7          	jalr	-1150(ra) # 80001f08 <uvmalloc>
    8000738e:	f8a43423          	sd	a0,-120(s0)
    80007392:	f8843783          	ld	a5,-120(s0)
    80007396:	22078a63          	beqz	a5,800075ca <exec+0x440>
    goto bad;
  sz = sz1;
    8000739a:	f8843783          	ld	a5,-120(s0)
    8000739e:	faf43c23          	sd	a5,-72(s0)
  uvmclear(pagetable, sz-2*PGSIZE);
    800073a2:	fb843703          	ld	a4,-72(s0)
    800073a6:	77f9                	lui	a5,0xffffe
    800073a8:	97ba                	add	a5,a5,a4
    800073aa:	85be                	mv	a1,a5
    800073ac:	fa043503          	ld	a0,-96(s0)
    800073b0:	ffffb097          	auipc	ra,0xffffb
    800073b4:	ee0080e7          	jalr	-288(ra) # 80002290 <uvmclear>
  sp = sz;
    800073b8:	fb843783          	ld	a5,-72(s0)
    800073bc:	faf43823          	sd	a5,-80(s0)
  stackbase = sp - PGSIZE;
    800073c0:	fb043703          	ld	a4,-80(s0)
    800073c4:	77fd                	lui	a5,0xfffff
    800073c6:	97ba                	add	a5,a5,a4
    800073c8:	f8f43023          	sd	a5,-128(s0)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    800073cc:	fc043023          	sd	zero,-64(s0)
    800073d0:	a845                	j	80007480 <exec+0x2f6>
    if(argc >= MAXARG)
    800073d2:	fc043703          	ld	a4,-64(s0)
    800073d6:	47fd                	li	a5,31
    800073d8:	1ee7eb63          	bltu	a5,a4,800075ce <exec+0x444>
      goto bad;
    sp -= strlen(argv[argc]) + 1;
    800073dc:	fc043783          	ld	a5,-64(s0)
    800073e0:	078e                	slli	a5,a5,0x3
    800073e2:	de043703          	ld	a4,-544(s0)
    800073e6:	97ba                	add	a5,a5,a4
    800073e8:	639c                	ld	a5,0(a5)
    800073ea:	853e                	mv	a0,a5
    800073ec:	ffffa097          	auipc	ra,0xffffa
    800073f0:	3d4080e7          	jalr	980(ra) # 800017c0 <strlen>
    800073f4:	87aa                	mv	a5,a0
    800073f6:	2785                	addiw	a5,a5,1
    800073f8:	2781                	sext.w	a5,a5
    800073fa:	873e                	mv	a4,a5
    800073fc:	fb043783          	ld	a5,-80(s0)
    80007400:	8f99                	sub	a5,a5,a4
    80007402:	faf43823          	sd	a5,-80(s0)
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    80007406:	fb043783          	ld	a5,-80(s0)
    8000740a:	9bc1                	andi	a5,a5,-16
    8000740c:	faf43823          	sd	a5,-80(s0)
    if(sp < stackbase)
    80007410:	fb043703          	ld	a4,-80(s0)
    80007414:	f8043783          	ld	a5,-128(s0)
    80007418:	1af76d63          	bltu	a4,a5,800075d2 <exec+0x448>
      goto bad;
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    8000741c:	fc043783          	ld	a5,-64(s0)
    80007420:	078e                	slli	a5,a5,0x3
    80007422:	de043703          	ld	a4,-544(s0)
    80007426:	97ba                	add	a5,a5,a4
    80007428:	6384                	ld	s1,0(a5)
    8000742a:	fc043783          	ld	a5,-64(s0)
    8000742e:	078e                	slli	a5,a5,0x3
    80007430:	de043703          	ld	a4,-544(s0)
    80007434:	97ba                	add	a5,a5,a4
    80007436:	639c                	ld	a5,0(a5)
    80007438:	853e                	mv	a0,a5
    8000743a:	ffffa097          	auipc	ra,0xffffa
    8000743e:	386080e7          	jalr	902(ra) # 800017c0 <strlen>
    80007442:	87aa                	mv	a5,a0
    80007444:	2785                	addiw	a5,a5,1
    80007446:	2781                	sext.w	a5,a5
    80007448:	86be                	mv	a3,a5
    8000744a:	8626                	mv	a2,s1
    8000744c:	fb043583          	ld	a1,-80(s0)
    80007450:	fa043503          	ld	a0,-96(s0)
    80007454:	ffffb097          	auipc	ra,0xffffb
    80007458:	e92080e7          	jalr	-366(ra) # 800022e6 <copyout>
    8000745c:	87aa                	mv	a5,a0
    8000745e:	1607cc63          	bltz	a5,800075d6 <exec+0x44c>
      goto bad;
    ustack[argc] = sp;
    80007462:	fc043783          	ld	a5,-64(s0)
    80007466:	078e                	slli	a5,a5,0x3
    80007468:	fe040713          	addi	a4,s0,-32
    8000746c:	97ba                	add	a5,a5,a4
    8000746e:	fb043703          	ld	a4,-80(s0)
    80007472:	e8e7b823          	sd	a4,-368(a5) # ffffffffffffee90 <end+0xffffffff7ffd5e90>
  for(argc = 0; argv[argc]; argc++) {
    80007476:	fc043783          	ld	a5,-64(s0)
    8000747a:	0785                	addi	a5,a5,1
    8000747c:	fcf43023          	sd	a5,-64(s0)
    80007480:	fc043783          	ld	a5,-64(s0)
    80007484:	078e                	slli	a5,a5,0x3
    80007486:	de043703          	ld	a4,-544(s0)
    8000748a:	97ba                	add	a5,a5,a4
    8000748c:	639c                	ld	a5,0(a5)
    8000748e:	f3b1                	bnez	a5,800073d2 <exec+0x248>
  }
  ustack[argc] = 0;
    80007490:	fc043783          	ld	a5,-64(s0)
    80007494:	078e                	slli	a5,a5,0x3
    80007496:	fe040713          	addi	a4,s0,-32
    8000749a:	97ba                	add	a5,a5,a4
    8000749c:	e807b823          	sd	zero,-368(a5)

  // push the array of argv[] pointers.
  sp -= (argc+1) * sizeof(uint64);
    800074a0:	fc043783          	ld	a5,-64(s0)
    800074a4:	0785                	addi	a5,a5,1
    800074a6:	078e                	slli	a5,a5,0x3
    800074a8:	fb043703          	ld	a4,-80(s0)
    800074ac:	40f707b3          	sub	a5,a4,a5
    800074b0:	faf43823          	sd	a5,-80(s0)
  sp -= sp % 16;
    800074b4:	fb043783          	ld	a5,-80(s0)
    800074b8:	9bc1                	andi	a5,a5,-16
    800074ba:	faf43823          	sd	a5,-80(s0)
  if(sp < stackbase)
    800074be:	fb043703          	ld	a4,-80(s0)
    800074c2:	f8043783          	ld	a5,-128(s0)
    800074c6:	10f76a63          	bltu	a4,a5,800075da <exec+0x450>
    goto bad;
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    800074ca:	fc043783          	ld	a5,-64(s0)
    800074ce:	0785                	addi	a5,a5,1
    800074d0:	00379713          	slli	a4,a5,0x3
    800074d4:	e7040793          	addi	a5,s0,-400
    800074d8:	86ba                	mv	a3,a4
    800074da:	863e                	mv	a2,a5
    800074dc:	fb043583          	ld	a1,-80(s0)
    800074e0:	fa043503          	ld	a0,-96(s0)
    800074e4:	ffffb097          	auipc	ra,0xffffb
    800074e8:	e02080e7          	jalr	-510(ra) # 800022e6 <copyout>
    800074ec:	87aa                	mv	a5,a0
    800074ee:	0e07c863          	bltz	a5,800075de <exec+0x454>
    goto bad;

  // arguments to user main(argc, argv)
  // argc is returned via the system call return
  // value, which goes in a0.
  p->trapframe->a1 = sp;
    800074f2:	f9843783          	ld	a5,-104(s0)
    800074f6:	6fbc                	ld	a5,88(a5)
    800074f8:	fb043703          	ld	a4,-80(s0)
    800074fc:	ffb8                	sd	a4,120(a5)

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    800074fe:	de843783          	ld	a5,-536(s0)
    80007502:	fcf43c23          	sd	a5,-40(s0)
    80007506:	fd843783          	ld	a5,-40(s0)
    8000750a:	fcf43823          	sd	a5,-48(s0)
    8000750e:	a025                	j	80007536 <exec+0x3ac>
    if(*s == '/')
    80007510:	fd843783          	ld	a5,-40(s0)
    80007514:	0007c783          	lbu	a5,0(a5)
    80007518:	873e                	mv	a4,a5
    8000751a:	02f00793          	li	a5,47
    8000751e:	00f71763          	bne	a4,a5,8000752c <exec+0x3a2>
      last = s+1;
    80007522:	fd843783          	ld	a5,-40(s0)
    80007526:	0785                	addi	a5,a5,1
    80007528:	fcf43823          	sd	a5,-48(s0)
  for(last=s=path; *s; s++)
    8000752c:	fd843783          	ld	a5,-40(s0)
    80007530:	0785                	addi	a5,a5,1
    80007532:	fcf43c23          	sd	a5,-40(s0)
    80007536:	fd843783          	ld	a5,-40(s0)
    8000753a:	0007c783          	lbu	a5,0(a5)
    8000753e:	fbe9                	bnez	a5,80007510 <exec+0x386>
  safestrcpy(p->name, last, sizeof(p->name));
    80007540:	f9843783          	ld	a5,-104(s0)
    80007544:	15878793          	addi	a5,a5,344
    80007548:	4641                	li	a2,16
    8000754a:	fd043583          	ld	a1,-48(s0)
    8000754e:	853e                	mv	a0,a5
    80007550:	ffffa097          	auipc	ra,0xffffa
    80007554:	1f6080e7          	jalr	502(ra) # 80001746 <safestrcpy>
    
  // Commit to the user image.
  oldpagetable = p->pagetable;
    80007558:	f9843783          	ld	a5,-104(s0)
    8000755c:	6bbc                	ld	a5,80(a5)
    8000755e:	f6f43c23          	sd	a5,-136(s0)
  p->pagetable = pagetable;
    80007562:	f9843783          	ld	a5,-104(s0)
    80007566:	fa043703          	ld	a4,-96(s0)
    8000756a:	ebb8                	sd	a4,80(a5)
  p->sz = sz;
    8000756c:	f9843783          	ld	a5,-104(s0)
    80007570:	fb843703          	ld	a4,-72(s0)
    80007574:	e7b8                	sd	a4,72(a5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80007576:	f9843783          	ld	a5,-104(s0)
    8000757a:	6fbc                	ld	a5,88(a5)
    8000757c:	e4843703          	ld	a4,-440(s0)
    80007580:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    80007582:	f9843783          	ld	a5,-104(s0)
    80007586:	6fbc                	ld	a5,88(a5)
    80007588:	fb043703          	ld	a4,-80(s0)
    8000758c:	fb98                	sd	a4,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    8000758e:	f9043583          	ld	a1,-112(s0)
    80007592:	f7843503          	ld	a0,-136(s0)
    80007596:	ffffb097          	auipc	ra,0xffffb
    8000759a:	5a4080e7          	jalr	1444(ra) # 80002b3a <proc_freepagetable>

  return argc; // this ends up in a0, the first argument to main(argc, argv)
    8000759e:	fc043783          	ld	a5,-64(s0)
    800075a2:	2781                	sext.w	a5,a5
    800075a4:	a0bd                	j	80007612 <exec+0x488>
    goto bad;
    800075a6:	0001                	nop
    800075a8:	a825                	j	800075e0 <exec+0x456>
    goto bad;
    800075aa:	0001                	nop
    800075ac:	a815                	j	800075e0 <exec+0x456>
    goto bad;
    800075ae:	0001                	nop
    800075b0:	a805                	j	800075e0 <exec+0x456>
      goto bad;
    800075b2:	0001                	nop
    800075b4:	a035                	j	800075e0 <exec+0x456>
      goto bad;
    800075b6:	0001                	nop
    800075b8:	a025                	j	800075e0 <exec+0x456>
      goto bad;
    800075ba:	0001                	nop
    800075bc:	a015                	j	800075e0 <exec+0x456>
      goto bad;
    800075be:	0001                	nop
    800075c0:	a005                	j	800075e0 <exec+0x456>
      goto bad;
    800075c2:	0001                	nop
    800075c4:	a831                	j	800075e0 <exec+0x456>
      goto bad;
    800075c6:	0001                	nop
    800075c8:	a821                	j	800075e0 <exec+0x456>
    goto bad;
    800075ca:	0001                	nop
    800075cc:	a811                	j	800075e0 <exec+0x456>
      goto bad;
    800075ce:	0001                	nop
    800075d0:	a801                	j	800075e0 <exec+0x456>
      goto bad;
    800075d2:	0001                	nop
    800075d4:	a031                	j	800075e0 <exec+0x456>
      goto bad;
    800075d6:	0001                	nop
    800075d8:	a021                	j	800075e0 <exec+0x456>
    goto bad;
    800075da:	0001                	nop
    800075dc:	a011                	j	800075e0 <exec+0x456>
    goto bad;
    800075de:	0001                	nop

 bad:
  if(pagetable)
    800075e0:	fa043783          	ld	a5,-96(s0)
    800075e4:	cb89                	beqz	a5,800075f6 <exec+0x46c>
    proc_freepagetable(pagetable, sz);
    800075e6:	fb843583          	ld	a1,-72(s0)
    800075ea:	fa043503          	ld	a0,-96(s0)
    800075ee:	ffffb097          	auipc	ra,0xffffb
    800075f2:	54c080e7          	jalr	1356(ra) # 80002b3a <proc_freepagetable>
  if(ip){
    800075f6:	fa843783          	ld	a5,-88(s0)
    800075fa:	cb99                	beqz	a5,80007610 <exec+0x486>
    iunlockput(ip);
    800075fc:	fa843503          	ld	a0,-88(s0)
    80007600:	ffffe097          	auipc	ra,0xffffe
    80007604:	d4e080e7          	jalr	-690(ra) # 8000534e <iunlockput>
    end_op();
    80007608:	fffff097          	auipc	ra,0xfffff
    8000760c:	c04080e7          	jalr	-1020(ra) # 8000620c <end_op>
  }
  return -1;
    80007610:	57fd                	li	a5,-1
}
    80007612:	853e                	mv	a0,a5
    80007614:	21813083          	ld	ra,536(sp)
    80007618:	21013403          	ld	s0,528(sp)
    8000761c:	20813483          	ld	s1,520(sp)
    80007620:	22010113          	addi	sp,sp,544
    80007624:	8082                	ret

0000000080007626 <loadseg>:
// va must be page-aligned
// and the pages from va to va+sz must already be mapped.
// Returns 0 on success, -1 on failure.
static int
loadseg(pagetable_t pagetable, uint64 va, struct inode *ip, uint offset, uint sz)
{
    80007626:	7139                	addi	sp,sp,-64
    80007628:	fc06                	sd	ra,56(sp)
    8000762a:	f822                	sd	s0,48(sp)
    8000762c:	0080                	addi	s0,sp,64
    8000762e:	fca43c23          	sd	a0,-40(s0)
    80007632:	fcb43823          	sd	a1,-48(s0)
    80007636:	fcc43423          	sd	a2,-56(s0)
    8000763a:	87b6                	mv	a5,a3
    8000763c:	fcf42223          	sw	a5,-60(s0)
    80007640:	87ba                	mv	a5,a4
    80007642:	fcf42023          	sw	a5,-64(s0)
  uint i, n;
  uint64 pa;

  for(i = 0; i < sz; i += PGSIZE){
    80007646:	fe042623          	sw	zero,-20(s0)
    8000764a:	a05d                	j	800076f0 <loadseg+0xca>
    pa = walkaddr(pagetable, va + i);
    8000764c:	fec46703          	lwu	a4,-20(s0)
    80007650:	fd043783          	ld	a5,-48(s0)
    80007654:	97ba                	add	a5,a5,a4
    80007656:	85be                	mv	a1,a5
    80007658:	fd843503          	ld	a0,-40(s0)
    8000765c:	ffffa097          	auipc	ra,0xffffa
    80007660:	538080e7          	jalr	1336(ra) # 80001b94 <walkaddr>
    80007664:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    80007668:	fe043783          	ld	a5,-32(s0)
    8000766c:	eb89                	bnez	a5,8000767e <loadseg+0x58>
      panic("loadseg: address should exist");
    8000766e:	00004517          	auipc	a0,0x4
    80007672:	fb250513          	addi	a0,a0,-78 # 8000b620 <etext+0x620>
    80007676:	ffff9097          	auipc	ra,0xffff9
    8000767a:	608080e7          	jalr	1544(ra) # 80000c7e <panic>
    if(sz - i < PGSIZE)
    8000767e:	fc042703          	lw	a4,-64(s0)
    80007682:	fec42783          	lw	a5,-20(s0)
    80007686:	40f707bb          	subw	a5,a4,a5
    8000768a:	2781                	sext.w	a5,a5
    8000768c:	873e                	mv	a4,a5
    8000768e:	6785                	lui	a5,0x1
    80007690:	00f77b63          	bgeu	a4,a5,800076a6 <loadseg+0x80>
      n = sz - i;
    80007694:	fc042703          	lw	a4,-64(s0)
    80007698:	fec42783          	lw	a5,-20(s0)
    8000769c:	40f707bb          	subw	a5,a4,a5
    800076a0:	fef42423          	sw	a5,-24(s0)
    800076a4:	a021                	j	800076ac <loadseg+0x86>
    else
      n = PGSIZE;
    800076a6:	6785                	lui	a5,0x1
    800076a8:	fef42423          	sw	a5,-24(s0)
    if(readi(ip, 0, (uint64)pa, offset+i, n) != n)
    800076ac:	fc442703          	lw	a4,-60(s0)
    800076b0:	fec42783          	lw	a5,-20(s0)
    800076b4:	9fb9                	addw	a5,a5,a4
    800076b6:	2781                	sext.w	a5,a5
    800076b8:	fe842703          	lw	a4,-24(s0)
    800076bc:	86be                	mv	a3,a5
    800076be:	fe043603          	ld	a2,-32(s0)
    800076c2:	4581                	li	a1,0
    800076c4:	fc843503          	ld	a0,-56(s0)
    800076c8:	ffffe097          	auipc	ra,0xffffe
    800076cc:	fbe080e7          	jalr	-66(ra) # 80005686 <readi>
    800076d0:	87aa                	mv	a5,a0
    800076d2:	0007871b          	sext.w	a4,a5
    800076d6:	fe842783          	lw	a5,-24(s0)
    800076da:	2781                	sext.w	a5,a5
    800076dc:	00e78463          	beq	a5,a4,800076e4 <loadseg+0xbe>
      return -1;
    800076e0:	57fd                	li	a5,-1
    800076e2:	a005                	j	80007702 <loadseg+0xdc>
  for(i = 0; i < sz; i += PGSIZE){
    800076e4:	fec42703          	lw	a4,-20(s0)
    800076e8:	6785                	lui	a5,0x1
    800076ea:	9fb9                	addw	a5,a5,a4
    800076ec:	fef42623          	sw	a5,-20(s0)
    800076f0:	fec42703          	lw	a4,-20(s0)
    800076f4:	fc042783          	lw	a5,-64(s0)
    800076f8:	2701                	sext.w	a4,a4
    800076fa:	2781                	sext.w	a5,a5
    800076fc:	f4f768e3          	bltu	a4,a5,8000764c <loadseg+0x26>
  }
  
  return 0;
    80007700:	4781                	li	a5,0
}
    80007702:	853e                	mv	a0,a5
    80007704:	70e2                	ld	ra,56(sp)
    80007706:	7442                	ld	s0,48(sp)
    80007708:	6121                	addi	sp,sp,64
    8000770a:	8082                	ret

000000008000770c <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    8000770c:	7139                	addi	sp,sp,-64
    8000770e:	fc06                	sd	ra,56(sp)
    80007710:	f822                	sd	s0,48(sp)
    80007712:	0080                	addi	s0,sp,64
    80007714:	87aa                	mv	a5,a0
    80007716:	fcb43823          	sd	a1,-48(s0)
    8000771a:	fcc43423          	sd	a2,-56(s0)
    8000771e:	fcf42e23          	sw	a5,-36(s0)
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    80007722:	fe440713          	addi	a4,s0,-28
    80007726:	fdc42783          	lw	a5,-36(s0)
    8000772a:	85ba                	mv	a1,a4
    8000772c:	853e                	mv	a0,a5
    8000772e:	ffffd097          	auipc	ra,0xffffd
    80007732:	99c080e7          	jalr	-1636(ra) # 800040ca <argint>
    80007736:	87aa                	mv	a5,a0
    80007738:	0007d463          	bgez	a5,80007740 <argfd+0x34>
    return -1;
    8000773c:	57fd                	li	a5,-1
    8000773e:	a8b1                	j	8000779a <argfd+0x8e>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    80007740:	fe442783          	lw	a5,-28(s0)
    80007744:	0207c863          	bltz	a5,80007774 <argfd+0x68>
    80007748:	fe442783          	lw	a5,-28(s0)
    8000774c:	873e                	mv	a4,a5
    8000774e:	47bd                	li	a5,15
    80007750:	02e7c263          	blt	a5,a4,80007774 <argfd+0x68>
    80007754:	ffffb097          	auipc	ra,0xffffb
    80007758:	0c4080e7          	jalr	196(ra) # 80002818 <myproc>
    8000775c:	872a                	mv	a4,a0
    8000775e:	fe442783          	lw	a5,-28(s0)
    80007762:	07e9                	addi	a5,a5,26
    80007764:	078e                	slli	a5,a5,0x3
    80007766:	97ba                	add	a5,a5,a4
    80007768:	639c                	ld	a5,0(a5)
    8000776a:	fef43423          	sd	a5,-24(s0)
    8000776e:	fe843783          	ld	a5,-24(s0)
    80007772:	e399                	bnez	a5,80007778 <argfd+0x6c>
    return -1;
    80007774:	57fd                	li	a5,-1
    80007776:	a015                	j	8000779a <argfd+0x8e>
  if(pfd)
    80007778:	fd043783          	ld	a5,-48(s0)
    8000777c:	c791                	beqz	a5,80007788 <argfd+0x7c>
    *pfd = fd;
    8000777e:	fe442703          	lw	a4,-28(s0)
    80007782:	fd043783          	ld	a5,-48(s0)
    80007786:	c398                	sw	a4,0(a5)
  if(pf)
    80007788:	fc843783          	ld	a5,-56(s0)
    8000778c:	c791                	beqz	a5,80007798 <argfd+0x8c>
    *pf = f;
    8000778e:	fc843783          	ld	a5,-56(s0)
    80007792:	fe843703          	ld	a4,-24(s0)
    80007796:	e398                	sd	a4,0(a5)
  return 0;
    80007798:	4781                	li	a5,0
}
    8000779a:	853e                	mv	a0,a5
    8000779c:	70e2                	ld	ra,56(sp)
    8000779e:	7442                	ld	s0,48(sp)
    800077a0:	6121                	addi	sp,sp,64
    800077a2:	8082                	ret

00000000800077a4 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    800077a4:	7179                	addi	sp,sp,-48
    800077a6:	f406                	sd	ra,40(sp)
    800077a8:	f022                	sd	s0,32(sp)
    800077aa:	1800                	addi	s0,sp,48
    800077ac:	fca43c23          	sd	a0,-40(s0)
  int fd;
  struct proc *p = myproc();
    800077b0:	ffffb097          	auipc	ra,0xffffb
    800077b4:	068080e7          	jalr	104(ra) # 80002818 <myproc>
    800077b8:	fea43023          	sd	a0,-32(s0)

  for(fd = 0; fd < NOFILE; fd++){
    800077bc:	fe042623          	sw	zero,-20(s0)
    800077c0:	a825                	j	800077f8 <fdalloc+0x54>
    if(p->ofile[fd] == 0){
    800077c2:	fe043703          	ld	a4,-32(s0)
    800077c6:	fec42783          	lw	a5,-20(s0)
    800077ca:	07e9                	addi	a5,a5,26
    800077cc:	078e                	slli	a5,a5,0x3
    800077ce:	97ba                	add	a5,a5,a4
    800077d0:	639c                	ld	a5,0(a5)
    800077d2:	ef91                	bnez	a5,800077ee <fdalloc+0x4a>
      p->ofile[fd] = f;
    800077d4:	fe043703          	ld	a4,-32(s0)
    800077d8:	fec42783          	lw	a5,-20(s0)
    800077dc:	07e9                	addi	a5,a5,26
    800077de:	078e                	slli	a5,a5,0x3
    800077e0:	97ba                	add	a5,a5,a4
    800077e2:	fd843703          	ld	a4,-40(s0)
    800077e6:	e398                	sd	a4,0(a5)
      return fd;
    800077e8:	fec42783          	lw	a5,-20(s0)
    800077ec:	a831                	j	80007808 <fdalloc+0x64>
  for(fd = 0; fd < NOFILE; fd++){
    800077ee:	fec42783          	lw	a5,-20(s0)
    800077f2:	2785                	addiw	a5,a5,1
    800077f4:	fef42623          	sw	a5,-20(s0)
    800077f8:	fec42783          	lw	a5,-20(s0)
    800077fc:	0007871b          	sext.w	a4,a5
    80007800:	47bd                	li	a5,15
    80007802:	fce7d0e3          	bge	a5,a4,800077c2 <fdalloc+0x1e>
    }
  }
  return -1;
    80007806:	57fd                	li	a5,-1
}
    80007808:	853e                	mv	a0,a5
    8000780a:	70a2                	ld	ra,40(sp)
    8000780c:	7402                	ld	s0,32(sp)
    8000780e:	6145                	addi	sp,sp,48
    80007810:	8082                	ret

0000000080007812 <sys_dup>:

uint64
sys_dup(void)
{
    80007812:	1101                	addi	sp,sp,-32
    80007814:	ec06                	sd	ra,24(sp)
    80007816:	e822                	sd	s0,16(sp)
    80007818:	1000                	addi	s0,sp,32
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    8000781a:	fe040793          	addi	a5,s0,-32
    8000781e:	863e                	mv	a2,a5
    80007820:	4581                	li	a1,0
    80007822:	4501                	li	a0,0
    80007824:	00000097          	auipc	ra,0x0
    80007828:	ee8080e7          	jalr	-280(ra) # 8000770c <argfd>
    8000782c:	87aa                	mv	a5,a0
    8000782e:	0007d463          	bgez	a5,80007836 <sys_dup+0x24>
    return -1;
    80007832:	57fd                	li	a5,-1
    80007834:	a81d                	j	8000786a <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
    80007836:	fe043783          	ld	a5,-32(s0)
    8000783a:	853e                	mv	a0,a5
    8000783c:	00000097          	auipc	ra,0x0
    80007840:	f68080e7          	jalr	-152(ra) # 800077a4 <fdalloc>
    80007844:	87aa                	mv	a5,a0
    80007846:	fef42623          	sw	a5,-20(s0)
    8000784a:	fec42783          	lw	a5,-20(s0)
    8000784e:	2781                	sext.w	a5,a5
    80007850:	0007d463          	bgez	a5,80007858 <sys_dup+0x46>
    return -1;
    80007854:	57fd                	li	a5,-1
    80007856:	a811                	j	8000786a <sys_dup+0x58>
  filedup(f);
    80007858:	fe043783          	ld	a5,-32(s0)
    8000785c:	853e                	mv	a0,a5
    8000785e:	fffff097          	auipc	ra,0xfffff
    80007862:	f20080e7          	jalr	-224(ra) # 8000677e <filedup>
  return fd;
    80007866:	fec42783          	lw	a5,-20(s0)
}
    8000786a:	853e                	mv	a0,a5
    8000786c:	60e2                	ld	ra,24(sp)
    8000786e:	6442                	ld	s0,16(sp)
    80007870:	6105                	addi	sp,sp,32
    80007872:	8082                	ret

0000000080007874 <sys_read>:

uint64
sys_read(void)
{
    80007874:	7179                	addi	sp,sp,-48
    80007876:	f406                	sd	ra,40(sp)
    80007878:	f022                	sd	s0,32(sp)
    8000787a:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8000787c:	fe840793          	addi	a5,s0,-24
    80007880:	863e                	mv	a2,a5
    80007882:	4581                	li	a1,0
    80007884:	4501                	li	a0,0
    80007886:	00000097          	auipc	ra,0x0
    8000788a:	e86080e7          	jalr	-378(ra) # 8000770c <argfd>
    8000788e:	87aa                	mv	a5,a0
    80007890:	0207c863          	bltz	a5,800078c0 <sys_read+0x4c>
    80007894:	fe440793          	addi	a5,s0,-28
    80007898:	85be                	mv	a1,a5
    8000789a:	4509                	li	a0,2
    8000789c:	ffffd097          	auipc	ra,0xffffd
    800078a0:	82e080e7          	jalr	-2002(ra) # 800040ca <argint>
    800078a4:	87aa                	mv	a5,a0
    800078a6:	0007cd63          	bltz	a5,800078c0 <sys_read+0x4c>
    800078aa:	fd840793          	addi	a5,s0,-40
    800078ae:	85be                	mv	a1,a5
    800078b0:	4505                	li	a0,1
    800078b2:	ffffd097          	auipc	ra,0xffffd
    800078b6:	850080e7          	jalr	-1968(ra) # 80004102 <argaddr>
    800078ba:	87aa                	mv	a5,a0
    800078bc:	0007d463          	bgez	a5,800078c4 <sys_read+0x50>
    return -1;
    800078c0:	57fd                	li	a5,-1
    800078c2:	a839                	j	800078e0 <sys_read+0x6c>
  return fileread(f, p, n);
    800078c4:	fe843783          	ld	a5,-24(s0)
    800078c8:	fd843703          	ld	a4,-40(s0)
    800078cc:	fe442683          	lw	a3,-28(s0)
    800078d0:	8636                	mv	a2,a3
    800078d2:	85ba                	mv	a1,a4
    800078d4:	853e                	mv	a0,a5
    800078d6:	fffff097          	auipc	ra,0xfffff
    800078da:	0ba080e7          	jalr	186(ra) # 80006990 <fileread>
    800078de:	87aa                	mv	a5,a0
}
    800078e0:	853e                	mv	a0,a5
    800078e2:	70a2                	ld	ra,40(sp)
    800078e4:	7402                	ld	s0,32(sp)
    800078e6:	6145                	addi	sp,sp,48
    800078e8:	8082                	ret

00000000800078ea <sys_write>:

uint64
sys_write(void)
{
    800078ea:	7179                	addi	sp,sp,-48
    800078ec:	f406                	sd	ra,40(sp)
    800078ee:	f022                	sd	s0,32(sp)
    800078f0:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    800078f2:	fe840793          	addi	a5,s0,-24
    800078f6:	863e                	mv	a2,a5
    800078f8:	4581                	li	a1,0
    800078fa:	4501                	li	a0,0
    800078fc:	00000097          	auipc	ra,0x0
    80007900:	e10080e7          	jalr	-496(ra) # 8000770c <argfd>
    80007904:	87aa                	mv	a5,a0
    80007906:	0207c863          	bltz	a5,80007936 <sys_write+0x4c>
    8000790a:	fe440793          	addi	a5,s0,-28
    8000790e:	85be                	mv	a1,a5
    80007910:	4509                	li	a0,2
    80007912:	ffffc097          	auipc	ra,0xffffc
    80007916:	7b8080e7          	jalr	1976(ra) # 800040ca <argint>
    8000791a:	87aa                	mv	a5,a0
    8000791c:	0007cd63          	bltz	a5,80007936 <sys_write+0x4c>
    80007920:	fd840793          	addi	a5,s0,-40
    80007924:	85be                	mv	a1,a5
    80007926:	4505                	li	a0,1
    80007928:	ffffc097          	auipc	ra,0xffffc
    8000792c:	7da080e7          	jalr	2010(ra) # 80004102 <argaddr>
    80007930:	87aa                	mv	a5,a0
    80007932:	0007d463          	bgez	a5,8000793a <sys_write+0x50>
    return -1;
    80007936:	57fd                	li	a5,-1
    80007938:	a839                	j	80007956 <sys_write+0x6c>

  return filewrite(f, p, n);
    8000793a:	fe843783          	ld	a5,-24(s0)
    8000793e:	fd843703          	ld	a4,-40(s0)
    80007942:	fe442683          	lw	a3,-28(s0)
    80007946:	8636                	mv	a2,a3
    80007948:	85ba                	mv	a1,a4
    8000794a:	853e                	mv	a0,a5
    8000794c:	fffff097          	auipc	ra,0xfffff
    80007950:	1aa080e7          	jalr	426(ra) # 80006af6 <filewrite>
    80007954:	87aa                	mv	a5,a0
}
    80007956:	853e                	mv	a0,a5
    80007958:	70a2                	ld	ra,40(sp)
    8000795a:	7402                	ld	s0,32(sp)
    8000795c:	6145                	addi	sp,sp,48
    8000795e:	8082                	ret

0000000080007960 <sys_close>:

uint64
sys_close(void)
{
    80007960:	1101                	addi	sp,sp,-32
    80007962:	ec06                	sd	ra,24(sp)
    80007964:	e822                	sd	s0,16(sp)
    80007966:	1000                	addi	s0,sp,32
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    80007968:	fe040713          	addi	a4,s0,-32
    8000796c:	fec40793          	addi	a5,s0,-20
    80007970:	863a                	mv	a2,a4
    80007972:	85be                	mv	a1,a5
    80007974:	4501                	li	a0,0
    80007976:	00000097          	auipc	ra,0x0
    8000797a:	d96080e7          	jalr	-618(ra) # 8000770c <argfd>
    8000797e:	87aa                	mv	a5,a0
    80007980:	0007d463          	bgez	a5,80007988 <sys_close+0x28>
    return -1;
    80007984:	57fd                	li	a5,-1
    80007986:	a02d                	j	800079b0 <sys_close+0x50>
  myproc()->ofile[fd] = 0;
    80007988:	ffffb097          	auipc	ra,0xffffb
    8000798c:	e90080e7          	jalr	-368(ra) # 80002818 <myproc>
    80007990:	872a                	mv	a4,a0
    80007992:	fec42783          	lw	a5,-20(s0)
    80007996:	07e9                	addi	a5,a5,26
    80007998:	078e                	slli	a5,a5,0x3
    8000799a:	97ba                	add	a5,a5,a4
    8000799c:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  fileclose(f);
    800079a0:	fe043783          	ld	a5,-32(s0)
    800079a4:	853e                	mv	a0,a5
    800079a6:	fffff097          	auipc	ra,0xfffff
    800079aa:	e3e080e7          	jalr	-450(ra) # 800067e4 <fileclose>
  return 0;
    800079ae:	4781                	li	a5,0
}
    800079b0:	853e                	mv	a0,a5
    800079b2:	60e2                	ld	ra,24(sp)
    800079b4:	6442                	ld	s0,16(sp)
    800079b6:	6105                	addi	sp,sp,32
    800079b8:	8082                	ret

00000000800079ba <sys_fstat>:

uint64
sys_fstat(void)
{
    800079ba:	1101                	addi	sp,sp,-32
    800079bc:	ec06                	sd	ra,24(sp)
    800079be:	e822                	sd	s0,16(sp)
    800079c0:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 st; // user pointer to struct stat

  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    800079c2:	fe840793          	addi	a5,s0,-24
    800079c6:	863e                	mv	a2,a5
    800079c8:	4581                	li	a1,0
    800079ca:	4501                	li	a0,0
    800079cc:	00000097          	auipc	ra,0x0
    800079d0:	d40080e7          	jalr	-704(ra) # 8000770c <argfd>
    800079d4:	87aa                	mv	a5,a0
    800079d6:	0007cd63          	bltz	a5,800079f0 <sys_fstat+0x36>
    800079da:	fe040793          	addi	a5,s0,-32
    800079de:	85be                	mv	a1,a5
    800079e0:	4505                	li	a0,1
    800079e2:	ffffc097          	auipc	ra,0xffffc
    800079e6:	720080e7          	jalr	1824(ra) # 80004102 <argaddr>
    800079ea:	87aa                	mv	a5,a0
    800079ec:	0007d463          	bgez	a5,800079f4 <sys_fstat+0x3a>
    return -1;
    800079f0:	57fd                	li	a5,-1
    800079f2:	a821                	j	80007a0a <sys_fstat+0x50>
  return filestat(f, st);
    800079f4:	fe843783          	ld	a5,-24(s0)
    800079f8:	fe043703          	ld	a4,-32(s0)
    800079fc:	85ba                	mv	a1,a4
    800079fe:	853e                	mv	a0,a5
    80007a00:	fffff097          	auipc	ra,0xfffff
    80007a04:	eec080e7          	jalr	-276(ra) # 800068ec <filestat>
    80007a08:	87aa                	mv	a5,a0
}
    80007a0a:	853e                	mv	a0,a5
    80007a0c:	60e2                	ld	ra,24(sp)
    80007a0e:	6442                	ld	s0,16(sp)
    80007a10:	6105                	addi	sp,sp,32
    80007a12:	8082                	ret

0000000080007a14 <sys_link>:

// Create the path new as a link to the same inode as old.
uint64
sys_link(void)
{
    80007a14:	7169                	addi	sp,sp,-304
    80007a16:	f606                	sd	ra,296(sp)
    80007a18:	f222                	sd	s0,288(sp)
    80007a1a:	1a00                	addi	s0,sp,304
  char name[DIRSIZ], new[MAXPATH], old[MAXPATH];
  struct inode *dp, *ip;

  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    80007a1c:	ed040793          	addi	a5,s0,-304
    80007a20:	08000613          	li	a2,128
    80007a24:	85be                	mv	a1,a5
    80007a26:	4501                	li	a0,0
    80007a28:	ffffc097          	auipc	ra,0xffffc
    80007a2c:	70e080e7          	jalr	1806(ra) # 80004136 <argstr>
    80007a30:	87aa                	mv	a5,a0
    80007a32:	0007cf63          	bltz	a5,80007a50 <sys_link+0x3c>
    80007a36:	f5040793          	addi	a5,s0,-176
    80007a3a:	08000613          	li	a2,128
    80007a3e:	85be                	mv	a1,a5
    80007a40:	4505                	li	a0,1
    80007a42:	ffffc097          	auipc	ra,0xffffc
    80007a46:	6f4080e7          	jalr	1780(ra) # 80004136 <argstr>
    80007a4a:	87aa                	mv	a5,a0
    80007a4c:	0007d463          	bgez	a5,80007a54 <sys_link+0x40>
    return -1;
    80007a50:	57fd                	li	a5,-1
    80007a52:	aab5                	j	80007bce <sys_link+0x1ba>

  begin_op();
    80007a54:	ffffe097          	auipc	ra,0xffffe
    80007a58:	6f6080e7          	jalr	1782(ra) # 8000614a <begin_op>
  if((ip = namei(old)) == 0){
    80007a5c:	ed040793          	addi	a5,s0,-304
    80007a60:	853e                	mv	a0,a5
    80007a62:	ffffe097          	auipc	ra,0xffffe
    80007a66:	384080e7          	jalr	900(ra) # 80005de6 <namei>
    80007a6a:	fea43423          	sd	a0,-24(s0)
    80007a6e:	fe843783          	ld	a5,-24(s0)
    80007a72:	e799                	bnez	a5,80007a80 <sys_link+0x6c>
    end_op();
    80007a74:	ffffe097          	auipc	ra,0xffffe
    80007a78:	798080e7          	jalr	1944(ra) # 8000620c <end_op>
    return -1;
    80007a7c:	57fd                	li	a5,-1
    80007a7e:	aa81                	j	80007bce <sys_link+0x1ba>
  }

  ilock(ip);
    80007a80:	fe843503          	ld	a0,-24(s0)
    80007a84:	ffffd097          	auipc	ra,0xffffd
    80007a88:	66c080e7          	jalr	1644(ra) # 800050f0 <ilock>
  if(ip->type == T_DIR){
    80007a8c:	fe843783          	ld	a5,-24(s0)
    80007a90:	04479783          	lh	a5,68(a5)
    80007a94:	0007871b          	sext.w	a4,a5
    80007a98:	4785                	li	a5,1
    80007a9a:	00f71e63          	bne	a4,a5,80007ab6 <sys_link+0xa2>
    iunlockput(ip);
    80007a9e:	fe843503          	ld	a0,-24(s0)
    80007aa2:	ffffe097          	auipc	ra,0xffffe
    80007aa6:	8ac080e7          	jalr	-1876(ra) # 8000534e <iunlockput>
    end_op();
    80007aaa:	ffffe097          	auipc	ra,0xffffe
    80007aae:	762080e7          	jalr	1890(ra) # 8000620c <end_op>
    return -1;
    80007ab2:	57fd                	li	a5,-1
    80007ab4:	aa29                	j	80007bce <sys_link+0x1ba>
  }

  ip->nlink++;
    80007ab6:	fe843783          	ld	a5,-24(s0)
    80007aba:	04a79783          	lh	a5,74(a5)
    80007abe:	17c2                	slli	a5,a5,0x30
    80007ac0:	93c1                	srli	a5,a5,0x30
    80007ac2:	2785                	addiw	a5,a5,1
    80007ac4:	17c2                	slli	a5,a5,0x30
    80007ac6:	93c1                	srli	a5,a5,0x30
    80007ac8:	0107971b          	slliw	a4,a5,0x10
    80007acc:	4107571b          	sraiw	a4,a4,0x10
    80007ad0:	fe843783          	ld	a5,-24(s0)
    80007ad4:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007ad8:	fe843503          	ld	a0,-24(s0)
    80007adc:	ffffd097          	auipc	ra,0xffffd
    80007ae0:	3c4080e7          	jalr	964(ra) # 80004ea0 <iupdate>
  iunlock(ip);
    80007ae4:	fe843503          	ld	a0,-24(s0)
    80007ae8:	ffffd097          	auipc	ra,0xffffd
    80007aec:	73c080e7          	jalr	1852(ra) # 80005224 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
    80007af0:	fd040713          	addi	a4,s0,-48
    80007af4:	f5040793          	addi	a5,s0,-176
    80007af8:	85ba                	mv	a1,a4
    80007afa:	853e                	mv	a0,a5
    80007afc:	ffffe097          	auipc	ra,0xffffe
    80007b00:	316080e7          	jalr	790(ra) # 80005e12 <nameiparent>
    80007b04:	fea43023          	sd	a0,-32(s0)
    80007b08:	fe043783          	ld	a5,-32(s0)
    80007b0c:	cba5                	beqz	a5,80007b7c <sys_link+0x168>
    goto bad;
  ilock(dp);
    80007b0e:	fe043503          	ld	a0,-32(s0)
    80007b12:	ffffd097          	auipc	ra,0xffffd
    80007b16:	5de080e7          	jalr	1502(ra) # 800050f0 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    80007b1a:	fe043783          	ld	a5,-32(s0)
    80007b1e:	4398                	lw	a4,0(a5)
    80007b20:	fe843783          	ld	a5,-24(s0)
    80007b24:	439c                	lw	a5,0(a5)
    80007b26:	02f71263          	bne	a4,a5,80007b4a <sys_link+0x136>
    80007b2a:	fe843783          	ld	a5,-24(s0)
    80007b2e:	43d8                	lw	a4,4(a5)
    80007b30:	fd040793          	addi	a5,s0,-48
    80007b34:	863a                	mv	a2,a4
    80007b36:	85be                	mv	a1,a5
    80007b38:	fe043503          	ld	a0,-32(s0)
    80007b3c:	ffffe097          	auipc	ra,0xffffe
    80007b40:	f90080e7          	jalr	-112(ra) # 80005acc <dirlink>
    80007b44:	87aa                	mv	a5,a0
    80007b46:	0007d963          	bgez	a5,80007b58 <sys_link+0x144>
    iunlockput(dp);
    80007b4a:	fe043503          	ld	a0,-32(s0)
    80007b4e:	ffffe097          	auipc	ra,0xffffe
    80007b52:	800080e7          	jalr	-2048(ra) # 8000534e <iunlockput>
    goto bad;
    80007b56:	a025                	j	80007b7e <sys_link+0x16a>
  }
  iunlockput(dp);
    80007b58:	fe043503          	ld	a0,-32(s0)
    80007b5c:	ffffd097          	auipc	ra,0xffffd
    80007b60:	7f2080e7          	jalr	2034(ra) # 8000534e <iunlockput>
  iput(ip);
    80007b64:	fe843503          	ld	a0,-24(s0)
    80007b68:	ffffd097          	auipc	ra,0xffffd
    80007b6c:	716080e7          	jalr	1814(ra) # 8000527e <iput>

  end_op();
    80007b70:	ffffe097          	auipc	ra,0xffffe
    80007b74:	69c080e7          	jalr	1692(ra) # 8000620c <end_op>

  return 0;
    80007b78:	4781                	li	a5,0
    80007b7a:	a891                	j	80007bce <sys_link+0x1ba>
    goto bad;
    80007b7c:	0001                	nop

bad:
  ilock(ip);
    80007b7e:	fe843503          	ld	a0,-24(s0)
    80007b82:	ffffd097          	auipc	ra,0xffffd
    80007b86:	56e080e7          	jalr	1390(ra) # 800050f0 <ilock>
  ip->nlink--;
    80007b8a:	fe843783          	ld	a5,-24(s0)
    80007b8e:	04a79783          	lh	a5,74(a5)
    80007b92:	17c2                	slli	a5,a5,0x30
    80007b94:	93c1                	srli	a5,a5,0x30
    80007b96:	37fd                	addiw	a5,a5,-1
    80007b98:	17c2                	slli	a5,a5,0x30
    80007b9a:	93c1                	srli	a5,a5,0x30
    80007b9c:	0107971b          	slliw	a4,a5,0x10
    80007ba0:	4107571b          	sraiw	a4,a4,0x10
    80007ba4:	fe843783          	ld	a5,-24(s0)
    80007ba8:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007bac:	fe843503          	ld	a0,-24(s0)
    80007bb0:	ffffd097          	auipc	ra,0xffffd
    80007bb4:	2f0080e7          	jalr	752(ra) # 80004ea0 <iupdate>
  iunlockput(ip);
    80007bb8:	fe843503          	ld	a0,-24(s0)
    80007bbc:	ffffd097          	auipc	ra,0xffffd
    80007bc0:	792080e7          	jalr	1938(ra) # 8000534e <iunlockput>
  end_op();
    80007bc4:	ffffe097          	auipc	ra,0xffffe
    80007bc8:	648080e7          	jalr	1608(ra) # 8000620c <end_op>
  return -1;
    80007bcc:	57fd                	li	a5,-1
}
    80007bce:	853e                	mv	a0,a5
    80007bd0:	70b2                	ld	ra,296(sp)
    80007bd2:	7412                	ld	s0,288(sp)
    80007bd4:	6155                	addi	sp,sp,304
    80007bd6:	8082                	ret

0000000080007bd8 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
    80007bd8:	7139                	addi	sp,sp,-64
    80007bda:	fc06                	sd	ra,56(sp)
    80007bdc:	f822                	sd	s0,48(sp)
    80007bde:	0080                	addi	s0,sp,64
    80007be0:	fca43423          	sd	a0,-56(s0)
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007be4:	02000793          	li	a5,32
    80007be8:	fef42623          	sw	a5,-20(s0)
    80007bec:	a0b1                	j	80007c38 <isdirempty+0x60>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007bee:	fd840793          	addi	a5,s0,-40
    80007bf2:	fec42683          	lw	a3,-20(s0)
    80007bf6:	4741                	li	a4,16
    80007bf8:	863e                	mv	a2,a5
    80007bfa:	4581                	li	a1,0
    80007bfc:	fc843503          	ld	a0,-56(s0)
    80007c00:	ffffe097          	auipc	ra,0xffffe
    80007c04:	a86080e7          	jalr	-1402(ra) # 80005686 <readi>
    80007c08:	87aa                	mv	a5,a0
    80007c0a:	873e                	mv	a4,a5
    80007c0c:	47c1                	li	a5,16
    80007c0e:	00f70a63          	beq	a4,a5,80007c22 <isdirempty+0x4a>
      panic("isdirempty: readi");
    80007c12:	00004517          	auipc	a0,0x4
    80007c16:	a2e50513          	addi	a0,a0,-1490 # 8000b640 <etext+0x640>
    80007c1a:	ffff9097          	auipc	ra,0xffff9
    80007c1e:	064080e7          	jalr	100(ra) # 80000c7e <panic>
    if(de.inum != 0)
    80007c22:	fd845783          	lhu	a5,-40(s0)
    80007c26:	c399                	beqz	a5,80007c2c <isdirempty+0x54>
      return 0;
    80007c28:	4781                	li	a5,0
    80007c2a:	a839                	j	80007c48 <isdirempty+0x70>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007c2c:	fec42783          	lw	a5,-20(s0)
    80007c30:	27c1                	addiw	a5,a5,16
    80007c32:	2781                	sext.w	a5,a5
    80007c34:	fef42623          	sw	a5,-20(s0)
    80007c38:	fc843783          	ld	a5,-56(s0)
    80007c3c:	47f8                	lw	a4,76(a5)
    80007c3e:	fec42783          	lw	a5,-20(s0)
    80007c42:	fae7e6e3          	bltu	a5,a4,80007bee <isdirempty+0x16>
  }
  return 1;
    80007c46:	4785                	li	a5,1
}
    80007c48:	853e                	mv	a0,a5
    80007c4a:	70e2                	ld	ra,56(sp)
    80007c4c:	7442                	ld	s0,48(sp)
    80007c4e:	6121                	addi	sp,sp,64
    80007c50:	8082                	ret

0000000080007c52 <sys_unlink>:

uint64
sys_unlink(void)
{
    80007c52:	7155                	addi	sp,sp,-208
    80007c54:	e586                	sd	ra,200(sp)
    80007c56:	e1a2                	sd	s0,192(sp)
    80007c58:	0980                	addi	s0,sp,208
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], path[MAXPATH];
  uint off;

  if(argstr(0, path, MAXPATH) < 0)
    80007c5a:	f4040793          	addi	a5,s0,-192
    80007c5e:	08000613          	li	a2,128
    80007c62:	85be                	mv	a1,a5
    80007c64:	4501                	li	a0,0
    80007c66:	ffffc097          	auipc	ra,0xffffc
    80007c6a:	4d0080e7          	jalr	1232(ra) # 80004136 <argstr>
    80007c6e:	87aa                	mv	a5,a0
    80007c70:	0007d463          	bgez	a5,80007c78 <sys_unlink+0x26>
    return -1;
    80007c74:	57fd                	li	a5,-1
    80007c76:	a2ed                	j	80007e60 <sys_unlink+0x20e>

  begin_op();
    80007c78:	ffffe097          	auipc	ra,0xffffe
    80007c7c:	4d2080e7          	jalr	1234(ra) # 8000614a <begin_op>
  if((dp = nameiparent(path, name)) == 0){
    80007c80:	fc040713          	addi	a4,s0,-64
    80007c84:	f4040793          	addi	a5,s0,-192
    80007c88:	85ba                	mv	a1,a4
    80007c8a:	853e                	mv	a0,a5
    80007c8c:	ffffe097          	auipc	ra,0xffffe
    80007c90:	186080e7          	jalr	390(ra) # 80005e12 <nameiparent>
    80007c94:	fea43423          	sd	a0,-24(s0)
    80007c98:	fe843783          	ld	a5,-24(s0)
    80007c9c:	e799                	bnez	a5,80007caa <sys_unlink+0x58>
    end_op();
    80007c9e:	ffffe097          	auipc	ra,0xffffe
    80007ca2:	56e080e7          	jalr	1390(ra) # 8000620c <end_op>
    return -1;
    80007ca6:	57fd                	li	a5,-1
    80007ca8:	aa65                	j	80007e60 <sys_unlink+0x20e>
  }

  ilock(dp);
    80007caa:	fe843503          	ld	a0,-24(s0)
    80007cae:	ffffd097          	auipc	ra,0xffffd
    80007cb2:	442080e7          	jalr	1090(ra) # 800050f0 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    80007cb6:	fc040793          	addi	a5,s0,-64
    80007cba:	00004597          	auipc	a1,0x4
    80007cbe:	99e58593          	addi	a1,a1,-1634 # 8000b658 <etext+0x658>
    80007cc2:	853e                	mv	a0,a5
    80007cc4:	ffffe097          	auipc	ra,0xffffe
    80007cc8:	cf2080e7          	jalr	-782(ra) # 800059b6 <namecmp>
    80007ccc:	87aa                	mv	a5,a0
    80007cce:	16078b63          	beqz	a5,80007e44 <sys_unlink+0x1f2>
    80007cd2:	fc040793          	addi	a5,s0,-64
    80007cd6:	00004597          	auipc	a1,0x4
    80007cda:	98a58593          	addi	a1,a1,-1654 # 8000b660 <etext+0x660>
    80007cde:	853e                	mv	a0,a5
    80007ce0:	ffffe097          	auipc	ra,0xffffe
    80007ce4:	cd6080e7          	jalr	-810(ra) # 800059b6 <namecmp>
    80007ce8:	87aa                	mv	a5,a0
    80007cea:	14078d63          	beqz	a5,80007e44 <sys_unlink+0x1f2>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    80007cee:	f3c40713          	addi	a4,s0,-196
    80007cf2:	fc040793          	addi	a5,s0,-64
    80007cf6:	863a                	mv	a2,a4
    80007cf8:	85be                	mv	a1,a5
    80007cfa:	fe843503          	ld	a0,-24(s0)
    80007cfe:	ffffe097          	auipc	ra,0xffffe
    80007d02:	ce6080e7          	jalr	-794(ra) # 800059e4 <dirlookup>
    80007d06:	fea43023          	sd	a0,-32(s0)
    80007d0a:	fe043783          	ld	a5,-32(s0)
    80007d0e:	12078d63          	beqz	a5,80007e48 <sys_unlink+0x1f6>
    goto bad;
  ilock(ip);
    80007d12:	fe043503          	ld	a0,-32(s0)
    80007d16:	ffffd097          	auipc	ra,0xffffd
    80007d1a:	3da080e7          	jalr	986(ra) # 800050f0 <ilock>

  if(ip->nlink < 1)
    80007d1e:	fe043783          	ld	a5,-32(s0)
    80007d22:	04a79783          	lh	a5,74(a5)
    80007d26:	2781                	sext.w	a5,a5
    80007d28:	00f04a63          	bgtz	a5,80007d3c <sys_unlink+0xea>
    panic("unlink: nlink < 1");
    80007d2c:	00004517          	auipc	a0,0x4
    80007d30:	93c50513          	addi	a0,a0,-1732 # 8000b668 <etext+0x668>
    80007d34:	ffff9097          	auipc	ra,0xffff9
    80007d38:	f4a080e7          	jalr	-182(ra) # 80000c7e <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
    80007d3c:	fe043783          	ld	a5,-32(s0)
    80007d40:	04479783          	lh	a5,68(a5)
    80007d44:	0007871b          	sext.w	a4,a5
    80007d48:	4785                	li	a5,1
    80007d4a:	02f71163          	bne	a4,a5,80007d6c <sys_unlink+0x11a>
    80007d4e:	fe043503          	ld	a0,-32(s0)
    80007d52:	00000097          	auipc	ra,0x0
    80007d56:	e86080e7          	jalr	-378(ra) # 80007bd8 <isdirempty>
    80007d5a:	87aa                	mv	a5,a0
    80007d5c:	eb81                	bnez	a5,80007d6c <sys_unlink+0x11a>
    iunlockput(ip);
    80007d5e:	fe043503          	ld	a0,-32(s0)
    80007d62:	ffffd097          	auipc	ra,0xffffd
    80007d66:	5ec080e7          	jalr	1516(ra) # 8000534e <iunlockput>
    goto bad;
    80007d6a:	a0c5                	j	80007e4a <sys_unlink+0x1f8>
  }

  memset(&de, 0, sizeof(de));
    80007d6c:	fd040793          	addi	a5,s0,-48
    80007d70:	4641                	li	a2,16
    80007d72:	4581                	li	a1,0
    80007d74:	853e                	mv	a0,a5
    80007d76:	ffff9097          	auipc	ra,0xffff9
    80007d7a:	6cc080e7          	jalr	1740(ra) # 80001442 <memset>
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007d7e:	fd040793          	addi	a5,s0,-48
    80007d82:	f3c42683          	lw	a3,-196(s0)
    80007d86:	4741                	li	a4,16
    80007d88:	863e                	mv	a2,a5
    80007d8a:	4581                	li	a1,0
    80007d8c:	fe843503          	ld	a0,-24(s0)
    80007d90:	ffffe097          	auipc	ra,0xffffe
    80007d94:	a80080e7          	jalr	-1408(ra) # 80005810 <writei>
    80007d98:	87aa                	mv	a5,a0
    80007d9a:	873e                	mv	a4,a5
    80007d9c:	47c1                	li	a5,16
    80007d9e:	00f70a63          	beq	a4,a5,80007db2 <sys_unlink+0x160>
    panic("unlink: writei");
    80007da2:	00004517          	auipc	a0,0x4
    80007da6:	8de50513          	addi	a0,a0,-1826 # 8000b680 <etext+0x680>
    80007daa:	ffff9097          	auipc	ra,0xffff9
    80007dae:	ed4080e7          	jalr	-300(ra) # 80000c7e <panic>
  if(ip->type == T_DIR){
    80007db2:	fe043783          	ld	a5,-32(s0)
    80007db6:	04479783          	lh	a5,68(a5)
    80007dba:	0007871b          	sext.w	a4,a5
    80007dbe:	4785                	li	a5,1
    80007dc0:	02f71963          	bne	a4,a5,80007df2 <sys_unlink+0x1a0>
    dp->nlink--;
    80007dc4:	fe843783          	ld	a5,-24(s0)
    80007dc8:	04a79783          	lh	a5,74(a5)
    80007dcc:	17c2                	slli	a5,a5,0x30
    80007dce:	93c1                	srli	a5,a5,0x30
    80007dd0:	37fd                	addiw	a5,a5,-1
    80007dd2:	17c2                	slli	a5,a5,0x30
    80007dd4:	93c1                	srli	a5,a5,0x30
    80007dd6:	0107971b          	slliw	a4,a5,0x10
    80007dda:	4107571b          	sraiw	a4,a4,0x10
    80007dde:	fe843783          	ld	a5,-24(s0)
    80007de2:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    80007de6:	fe843503          	ld	a0,-24(s0)
    80007dea:	ffffd097          	auipc	ra,0xffffd
    80007dee:	0b6080e7          	jalr	182(ra) # 80004ea0 <iupdate>
  }
  iunlockput(dp);
    80007df2:	fe843503          	ld	a0,-24(s0)
    80007df6:	ffffd097          	auipc	ra,0xffffd
    80007dfa:	558080e7          	jalr	1368(ra) # 8000534e <iunlockput>

  ip->nlink--;
    80007dfe:	fe043783          	ld	a5,-32(s0)
    80007e02:	04a79783          	lh	a5,74(a5)
    80007e06:	17c2                	slli	a5,a5,0x30
    80007e08:	93c1                	srli	a5,a5,0x30
    80007e0a:	37fd                	addiw	a5,a5,-1
    80007e0c:	17c2                	slli	a5,a5,0x30
    80007e0e:	93c1                	srli	a5,a5,0x30
    80007e10:	0107971b          	slliw	a4,a5,0x10
    80007e14:	4107571b          	sraiw	a4,a4,0x10
    80007e18:	fe043783          	ld	a5,-32(s0)
    80007e1c:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007e20:	fe043503          	ld	a0,-32(s0)
    80007e24:	ffffd097          	auipc	ra,0xffffd
    80007e28:	07c080e7          	jalr	124(ra) # 80004ea0 <iupdate>
  iunlockput(ip);
    80007e2c:	fe043503          	ld	a0,-32(s0)
    80007e30:	ffffd097          	auipc	ra,0xffffd
    80007e34:	51e080e7          	jalr	1310(ra) # 8000534e <iunlockput>

  end_op();
    80007e38:	ffffe097          	auipc	ra,0xffffe
    80007e3c:	3d4080e7          	jalr	980(ra) # 8000620c <end_op>

  return 0;
    80007e40:	4781                	li	a5,0
    80007e42:	a839                	j	80007e60 <sys_unlink+0x20e>
    goto bad;
    80007e44:	0001                	nop
    80007e46:	a011                	j	80007e4a <sys_unlink+0x1f8>
    goto bad;
    80007e48:	0001                	nop

bad:
  iunlockput(dp);
    80007e4a:	fe843503          	ld	a0,-24(s0)
    80007e4e:	ffffd097          	auipc	ra,0xffffd
    80007e52:	500080e7          	jalr	1280(ra) # 8000534e <iunlockput>
  end_op();
    80007e56:	ffffe097          	auipc	ra,0xffffe
    80007e5a:	3b6080e7          	jalr	950(ra) # 8000620c <end_op>
  return -1;
    80007e5e:	57fd                	li	a5,-1
}
    80007e60:	853e                	mv	a0,a5
    80007e62:	60ae                	ld	ra,200(sp)
    80007e64:	640e                	ld	s0,192(sp)
    80007e66:	6169                	addi	sp,sp,208
    80007e68:	8082                	ret

0000000080007e6a <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
    80007e6a:	7139                	addi	sp,sp,-64
    80007e6c:	fc06                	sd	ra,56(sp)
    80007e6e:	f822                	sd	s0,48(sp)
    80007e70:	0080                	addi	s0,sp,64
    80007e72:	fca43423          	sd	a0,-56(s0)
    80007e76:	87ae                	mv	a5,a1
    80007e78:	8736                	mv	a4,a3
    80007e7a:	fcf41323          	sh	a5,-58(s0)
    80007e7e:	87b2                	mv	a5,a2
    80007e80:	fcf41223          	sh	a5,-60(s0)
    80007e84:	87ba                	mv	a5,a4
    80007e86:	fcf41123          	sh	a5,-62(s0)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    80007e8a:	fd040793          	addi	a5,s0,-48
    80007e8e:	85be                	mv	a1,a5
    80007e90:	fc843503          	ld	a0,-56(s0)
    80007e94:	ffffe097          	auipc	ra,0xffffe
    80007e98:	f7e080e7          	jalr	-130(ra) # 80005e12 <nameiparent>
    80007e9c:	fea43423          	sd	a0,-24(s0)
    80007ea0:	fe843783          	ld	a5,-24(s0)
    80007ea4:	e399                	bnez	a5,80007eaa <create+0x40>
    return 0;
    80007ea6:	4781                	li	a5,0
    80007ea8:	a2d9                	j	8000806e <create+0x204>

  ilock(dp);
    80007eaa:	fe843503          	ld	a0,-24(s0)
    80007eae:	ffffd097          	auipc	ra,0xffffd
    80007eb2:	242080e7          	jalr	578(ra) # 800050f0 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
    80007eb6:	fd040793          	addi	a5,s0,-48
    80007eba:	4601                	li	a2,0
    80007ebc:	85be                	mv	a1,a5
    80007ebe:	fe843503          	ld	a0,-24(s0)
    80007ec2:	ffffe097          	auipc	ra,0xffffe
    80007ec6:	b22080e7          	jalr	-1246(ra) # 800059e4 <dirlookup>
    80007eca:	fea43023          	sd	a0,-32(s0)
    80007ece:	fe043783          	ld	a5,-32(s0)
    80007ed2:	c3ad                	beqz	a5,80007f34 <create+0xca>
    iunlockput(dp);
    80007ed4:	fe843503          	ld	a0,-24(s0)
    80007ed8:	ffffd097          	auipc	ra,0xffffd
    80007edc:	476080e7          	jalr	1142(ra) # 8000534e <iunlockput>
    ilock(ip);
    80007ee0:	fe043503          	ld	a0,-32(s0)
    80007ee4:	ffffd097          	auipc	ra,0xffffd
    80007ee8:	20c080e7          	jalr	524(ra) # 800050f0 <ilock>
    if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
    80007eec:	fc641783          	lh	a5,-58(s0)
    80007ef0:	0007871b          	sext.w	a4,a5
    80007ef4:	4789                	li	a5,2
    80007ef6:	02f71763          	bne	a4,a5,80007f24 <create+0xba>
    80007efa:	fe043783          	ld	a5,-32(s0)
    80007efe:	04479783          	lh	a5,68(a5)
    80007f02:	0007871b          	sext.w	a4,a5
    80007f06:	4789                	li	a5,2
    80007f08:	00f70b63          	beq	a4,a5,80007f1e <create+0xb4>
    80007f0c:	fe043783          	ld	a5,-32(s0)
    80007f10:	04479783          	lh	a5,68(a5)
    80007f14:	0007871b          	sext.w	a4,a5
    80007f18:	478d                	li	a5,3
    80007f1a:	00f71563          	bne	a4,a5,80007f24 <create+0xba>
      return ip;
    80007f1e:	fe043783          	ld	a5,-32(s0)
    80007f22:	a2b1                	j	8000806e <create+0x204>
    iunlockput(ip);
    80007f24:	fe043503          	ld	a0,-32(s0)
    80007f28:	ffffd097          	auipc	ra,0xffffd
    80007f2c:	426080e7          	jalr	1062(ra) # 8000534e <iunlockput>
    return 0;
    80007f30:	4781                	li	a5,0
    80007f32:	aa35                	j	8000806e <create+0x204>
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    80007f34:	fe843783          	ld	a5,-24(s0)
    80007f38:	439c                	lw	a5,0(a5)
    80007f3a:	fc641703          	lh	a4,-58(s0)
    80007f3e:	85ba                	mv	a1,a4
    80007f40:	853e                	mv	a0,a5
    80007f42:	ffffd097          	auipc	ra,0xffffd
    80007f46:	e62080e7          	jalr	-414(ra) # 80004da4 <ialloc>
    80007f4a:	fea43023          	sd	a0,-32(s0)
    80007f4e:	fe043783          	ld	a5,-32(s0)
    80007f52:	eb89                	bnez	a5,80007f64 <create+0xfa>
    panic("create: ialloc");
    80007f54:	00003517          	auipc	a0,0x3
    80007f58:	73c50513          	addi	a0,a0,1852 # 8000b690 <etext+0x690>
    80007f5c:	ffff9097          	auipc	ra,0xffff9
    80007f60:	d22080e7          	jalr	-734(ra) # 80000c7e <panic>

  ilock(ip);
    80007f64:	fe043503          	ld	a0,-32(s0)
    80007f68:	ffffd097          	auipc	ra,0xffffd
    80007f6c:	188080e7          	jalr	392(ra) # 800050f0 <ilock>
  ip->major = major;
    80007f70:	fe043783          	ld	a5,-32(s0)
    80007f74:	fc445703          	lhu	a4,-60(s0)
    80007f78:	04e79323          	sh	a4,70(a5)
  ip->minor = minor;
    80007f7c:	fe043783          	ld	a5,-32(s0)
    80007f80:	fc245703          	lhu	a4,-62(s0)
    80007f84:	04e79423          	sh	a4,72(a5)
  ip->nlink = 1;
    80007f88:	fe043783          	ld	a5,-32(s0)
    80007f8c:	4705                	li	a4,1
    80007f8e:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007f92:	fe043503          	ld	a0,-32(s0)
    80007f96:	ffffd097          	auipc	ra,0xffffd
    80007f9a:	f0a080e7          	jalr	-246(ra) # 80004ea0 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
    80007f9e:	fc641783          	lh	a5,-58(s0)
    80007fa2:	0007871b          	sext.w	a4,a5
    80007fa6:	4785                	li	a5,1
    80007fa8:	08f71363          	bne	a4,a5,8000802e <create+0x1c4>
    dp->nlink++;  // for ".."
    80007fac:	fe843783          	ld	a5,-24(s0)
    80007fb0:	04a79783          	lh	a5,74(a5)
    80007fb4:	17c2                	slli	a5,a5,0x30
    80007fb6:	93c1                	srli	a5,a5,0x30
    80007fb8:	2785                	addiw	a5,a5,1
    80007fba:	17c2                	slli	a5,a5,0x30
    80007fbc:	93c1                	srli	a5,a5,0x30
    80007fbe:	0107971b          	slliw	a4,a5,0x10
    80007fc2:	4107571b          	sraiw	a4,a4,0x10
    80007fc6:	fe843783          	ld	a5,-24(s0)
    80007fca:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    80007fce:	fe843503          	ld	a0,-24(s0)
    80007fd2:	ffffd097          	auipc	ra,0xffffd
    80007fd6:	ece080e7          	jalr	-306(ra) # 80004ea0 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
    80007fda:	fe043783          	ld	a5,-32(s0)
    80007fde:	43dc                	lw	a5,4(a5)
    80007fe0:	863e                	mv	a2,a5
    80007fe2:	00003597          	auipc	a1,0x3
    80007fe6:	67658593          	addi	a1,a1,1654 # 8000b658 <etext+0x658>
    80007fea:	fe043503          	ld	a0,-32(s0)
    80007fee:	ffffe097          	auipc	ra,0xffffe
    80007ff2:	ade080e7          	jalr	-1314(ra) # 80005acc <dirlink>
    80007ff6:	87aa                	mv	a5,a0
    80007ff8:	0207c363          	bltz	a5,8000801e <create+0x1b4>
    80007ffc:	fe843783          	ld	a5,-24(s0)
    80008000:	43dc                	lw	a5,4(a5)
    80008002:	863e                	mv	a2,a5
    80008004:	00003597          	auipc	a1,0x3
    80008008:	65c58593          	addi	a1,a1,1628 # 8000b660 <etext+0x660>
    8000800c:	fe043503          	ld	a0,-32(s0)
    80008010:	ffffe097          	auipc	ra,0xffffe
    80008014:	abc080e7          	jalr	-1348(ra) # 80005acc <dirlink>
    80008018:	87aa                	mv	a5,a0
    8000801a:	0007da63          	bgez	a5,8000802e <create+0x1c4>
      panic("create dots");
    8000801e:	00003517          	auipc	a0,0x3
    80008022:	68250513          	addi	a0,a0,1666 # 8000b6a0 <etext+0x6a0>
    80008026:	ffff9097          	auipc	ra,0xffff9
    8000802a:	c58080e7          	jalr	-936(ra) # 80000c7e <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    8000802e:	fe043783          	ld	a5,-32(s0)
    80008032:	43d8                	lw	a4,4(a5)
    80008034:	fd040793          	addi	a5,s0,-48
    80008038:	863a                	mv	a2,a4
    8000803a:	85be                	mv	a1,a5
    8000803c:	fe843503          	ld	a0,-24(s0)
    80008040:	ffffe097          	auipc	ra,0xffffe
    80008044:	a8c080e7          	jalr	-1396(ra) # 80005acc <dirlink>
    80008048:	87aa                	mv	a5,a0
    8000804a:	0007da63          	bgez	a5,8000805e <create+0x1f4>
    panic("create: dirlink");
    8000804e:	00003517          	auipc	a0,0x3
    80008052:	66250513          	addi	a0,a0,1634 # 8000b6b0 <etext+0x6b0>
    80008056:	ffff9097          	auipc	ra,0xffff9
    8000805a:	c28080e7          	jalr	-984(ra) # 80000c7e <panic>

  iunlockput(dp);
    8000805e:	fe843503          	ld	a0,-24(s0)
    80008062:	ffffd097          	auipc	ra,0xffffd
    80008066:	2ec080e7          	jalr	748(ra) # 8000534e <iunlockput>

  return ip;
    8000806a:	fe043783          	ld	a5,-32(s0)
}
    8000806e:	853e                	mv	a0,a5
    80008070:	70e2                	ld	ra,56(sp)
    80008072:	7442                	ld	s0,48(sp)
    80008074:	6121                	addi	sp,sp,64
    80008076:	8082                	ret

0000000080008078 <sys_open>:

uint64
sys_open(void)
{
    80008078:	7131                	addi	sp,sp,-192
    8000807a:	fd06                	sd	ra,184(sp)
    8000807c:	f922                	sd	s0,176(sp)
    8000807e:	0180                	addi	s0,sp,192
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  if((n = argstr(0, path, MAXPATH)) < 0 || argint(1, &omode) < 0)
    80008080:	f5040793          	addi	a5,s0,-176
    80008084:	08000613          	li	a2,128
    80008088:	85be                	mv	a1,a5
    8000808a:	4501                	li	a0,0
    8000808c:	ffffc097          	auipc	ra,0xffffc
    80008090:	0aa080e7          	jalr	170(ra) # 80004136 <argstr>
    80008094:	87aa                	mv	a5,a0
    80008096:	fef42223          	sw	a5,-28(s0)
    8000809a:	fe442783          	lw	a5,-28(s0)
    8000809e:	2781                	sext.w	a5,a5
    800080a0:	0007cd63          	bltz	a5,800080ba <sys_open+0x42>
    800080a4:	f4c40793          	addi	a5,s0,-180
    800080a8:	85be                	mv	a1,a5
    800080aa:	4505                	li	a0,1
    800080ac:	ffffc097          	auipc	ra,0xffffc
    800080b0:	01e080e7          	jalr	30(ra) # 800040ca <argint>
    800080b4:	87aa                	mv	a5,a0
    800080b6:	0007d463          	bgez	a5,800080be <sys_open+0x46>
    return -1;
    800080ba:	57fd                	li	a5,-1
    800080bc:	a429                	j	800082c6 <sys_open+0x24e>

  begin_op();
    800080be:	ffffe097          	auipc	ra,0xffffe
    800080c2:	08c080e7          	jalr	140(ra) # 8000614a <begin_op>

  if(omode & O_CREATE){
    800080c6:	f4c42783          	lw	a5,-180(s0)
    800080ca:	2007f793          	andi	a5,a5,512
    800080ce:	2781                	sext.w	a5,a5
    800080d0:	c795                	beqz	a5,800080fc <sys_open+0x84>
    ip = create(path, T_FILE, 0, 0);
    800080d2:	f5040793          	addi	a5,s0,-176
    800080d6:	4681                	li	a3,0
    800080d8:	4601                	li	a2,0
    800080da:	4589                	li	a1,2
    800080dc:	853e                	mv	a0,a5
    800080de:	00000097          	auipc	ra,0x0
    800080e2:	d8c080e7          	jalr	-628(ra) # 80007e6a <create>
    800080e6:	fea43423          	sd	a0,-24(s0)
    if(ip == 0){
    800080ea:	fe843783          	ld	a5,-24(s0)
    800080ee:	e7bd                	bnez	a5,8000815c <sys_open+0xe4>
      end_op();
    800080f0:	ffffe097          	auipc	ra,0xffffe
    800080f4:	11c080e7          	jalr	284(ra) # 8000620c <end_op>
      return -1;
    800080f8:	57fd                	li	a5,-1
    800080fa:	a2f1                	j	800082c6 <sys_open+0x24e>
    }
  } else {
    if((ip = namei(path)) == 0){
    800080fc:	f5040793          	addi	a5,s0,-176
    80008100:	853e                	mv	a0,a5
    80008102:	ffffe097          	auipc	ra,0xffffe
    80008106:	ce4080e7          	jalr	-796(ra) # 80005de6 <namei>
    8000810a:	fea43423          	sd	a0,-24(s0)
    8000810e:	fe843783          	ld	a5,-24(s0)
    80008112:	e799                	bnez	a5,80008120 <sys_open+0xa8>
      end_op();
    80008114:	ffffe097          	auipc	ra,0xffffe
    80008118:	0f8080e7          	jalr	248(ra) # 8000620c <end_op>
      return -1;
    8000811c:	57fd                	li	a5,-1
    8000811e:	a265                	j	800082c6 <sys_open+0x24e>
    }
    ilock(ip);
    80008120:	fe843503          	ld	a0,-24(s0)
    80008124:	ffffd097          	auipc	ra,0xffffd
    80008128:	fcc080e7          	jalr	-52(ra) # 800050f0 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
    8000812c:	fe843783          	ld	a5,-24(s0)
    80008130:	04479783          	lh	a5,68(a5)
    80008134:	0007871b          	sext.w	a4,a5
    80008138:	4785                	li	a5,1
    8000813a:	02f71163          	bne	a4,a5,8000815c <sys_open+0xe4>
    8000813e:	f4c42783          	lw	a5,-180(s0)
    80008142:	cf89                	beqz	a5,8000815c <sys_open+0xe4>
      iunlockput(ip);
    80008144:	fe843503          	ld	a0,-24(s0)
    80008148:	ffffd097          	auipc	ra,0xffffd
    8000814c:	206080e7          	jalr	518(ra) # 8000534e <iunlockput>
      end_op();
    80008150:	ffffe097          	auipc	ra,0xffffe
    80008154:	0bc080e7          	jalr	188(ra) # 8000620c <end_op>
      return -1;
    80008158:	57fd                	li	a5,-1
    8000815a:	a2b5                	j	800082c6 <sys_open+0x24e>
    }
  }

  if(ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)){
    8000815c:	fe843783          	ld	a5,-24(s0)
    80008160:	04479783          	lh	a5,68(a5)
    80008164:	0007871b          	sext.w	a4,a5
    80008168:	478d                	li	a5,3
    8000816a:	02f71e63          	bne	a4,a5,800081a6 <sys_open+0x12e>
    8000816e:	fe843783          	ld	a5,-24(s0)
    80008172:	04679783          	lh	a5,70(a5)
    80008176:	2781                	sext.w	a5,a5
    80008178:	0007cb63          	bltz	a5,8000818e <sys_open+0x116>
    8000817c:	fe843783          	ld	a5,-24(s0)
    80008180:	04679783          	lh	a5,70(a5)
    80008184:	0007871b          	sext.w	a4,a5
    80008188:	47a5                	li	a5,9
    8000818a:	00e7de63          	bge	a5,a4,800081a6 <sys_open+0x12e>
    iunlockput(ip);
    8000818e:	fe843503          	ld	a0,-24(s0)
    80008192:	ffffd097          	auipc	ra,0xffffd
    80008196:	1bc080e7          	jalr	444(ra) # 8000534e <iunlockput>
    end_op();
    8000819a:	ffffe097          	auipc	ra,0xffffe
    8000819e:	072080e7          	jalr	114(ra) # 8000620c <end_op>
    return -1;
    800081a2:	57fd                	li	a5,-1
    800081a4:	a20d                	j	800082c6 <sys_open+0x24e>
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    800081a6:	ffffe097          	auipc	ra,0xffffe
    800081aa:	554080e7          	jalr	1364(ra) # 800066fa <filealloc>
    800081ae:	fca43c23          	sd	a0,-40(s0)
    800081b2:	fd843783          	ld	a5,-40(s0)
    800081b6:	cf99                	beqz	a5,800081d4 <sys_open+0x15c>
    800081b8:	fd843503          	ld	a0,-40(s0)
    800081bc:	fffff097          	auipc	ra,0xfffff
    800081c0:	5e8080e7          	jalr	1512(ra) # 800077a4 <fdalloc>
    800081c4:	87aa                	mv	a5,a0
    800081c6:	fcf42a23          	sw	a5,-44(s0)
    800081ca:	fd442783          	lw	a5,-44(s0)
    800081ce:	2781                	sext.w	a5,a5
    800081d0:	0207d763          	bgez	a5,800081fe <sys_open+0x186>
    if(f)
    800081d4:	fd843783          	ld	a5,-40(s0)
    800081d8:	c799                	beqz	a5,800081e6 <sys_open+0x16e>
      fileclose(f);
    800081da:	fd843503          	ld	a0,-40(s0)
    800081de:	ffffe097          	auipc	ra,0xffffe
    800081e2:	606080e7          	jalr	1542(ra) # 800067e4 <fileclose>
    iunlockput(ip);
    800081e6:	fe843503          	ld	a0,-24(s0)
    800081ea:	ffffd097          	auipc	ra,0xffffd
    800081ee:	164080e7          	jalr	356(ra) # 8000534e <iunlockput>
    end_op();
    800081f2:	ffffe097          	auipc	ra,0xffffe
    800081f6:	01a080e7          	jalr	26(ra) # 8000620c <end_op>
    return -1;
    800081fa:	57fd                	li	a5,-1
    800081fc:	a0e9                	j	800082c6 <sys_open+0x24e>
  }

  if(ip->type == T_DEVICE){
    800081fe:	fe843783          	ld	a5,-24(s0)
    80008202:	04479783          	lh	a5,68(a5)
    80008206:	0007871b          	sext.w	a4,a5
    8000820a:	478d                	li	a5,3
    8000820c:	00f71f63          	bne	a4,a5,8000822a <sys_open+0x1b2>
    f->type = FD_DEVICE;
    80008210:	fd843783          	ld	a5,-40(s0)
    80008214:	470d                	li	a4,3
    80008216:	c398                	sw	a4,0(a5)
    f->major = ip->major;
    80008218:	fe843783          	ld	a5,-24(s0)
    8000821c:	04679703          	lh	a4,70(a5)
    80008220:	fd843783          	ld	a5,-40(s0)
    80008224:	02e79223          	sh	a4,36(a5)
    80008228:	a809                	j	8000823a <sys_open+0x1c2>
  } else {
    f->type = FD_INODE;
    8000822a:	fd843783          	ld	a5,-40(s0)
    8000822e:	4709                	li	a4,2
    80008230:	c398                	sw	a4,0(a5)
    f->off = 0;
    80008232:	fd843783          	ld	a5,-40(s0)
    80008236:	0207a023          	sw	zero,32(a5)
  }
  f->ip = ip;
    8000823a:	fd843783          	ld	a5,-40(s0)
    8000823e:	fe843703          	ld	a4,-24(s0)
    80008242:	ef98                	sd	a4,24(a5)
  f->readable = !(omode & O_WRONLY);
    80008244:	f4c42783          	lw	a5,-180(s0)
    80008248:	8b85                	andi	a5,a5,1
    8000824a:	2781                	sext.w	a5,a5
    8000824c:	0017b793          	seqz	a5,a5
    80008250:	0ff7f793          	andi	a5,a5,255
    80008254:	873e                	mv	a4,a5
    80008256:	fd843783          	ld	a5,-40(s0)
    8000825a:	00e78423          	sb	a4,8(a5)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    8000825e:	f4c42783          	lw	a5,-180(s0)
    80008262:	8b85                	andi	a5,a5,1
    80008264:	2781                	sext.w	a5,a5
    80008266:	e791                	bnez	a5,80008272 <sys_open+0x1fa>
    80008268:	f4c42783          	lw	a5,-180(s0)
    8000826c:	8b89                	andi	a5,a5,2
    8000826e:	2781                	sext.w	a5,a5
    80008270:	c399                	beqz	a5,80008276 <sys_open+0x1fe>
    80008272:	4785                	li	a5,1
    80008274:	a011                	j	80008278 <sys_open+0x200>
    80008276:	4781                	li	a5,0
    80008278:	0ff7f713          	andi	a4,a5,255
    8000827c:	fd843783          	ld	a5,-40(s0)
    80008280:	00e784a3          	sb	a4,9(a5)

  if((omode & O_TRUNC) && ip->type == T_FILE){
    80008284:	f4c42783          	lw	a5,-180(s0)
    80008288:	4007f793          	andi	a5,a5,1024
    8000828c:	2781                	sext.w	a5,a5
    8000828e:	c385                	beqz	a5,800082ae <sys_open+0x236>
    80008290:	fe843783          	ld	a5,-24(s0)
    80008294:	04479783          	lh	a5,68(a5)
    80008298:	0007871b          	sext.w	a4,a5
    8000829c:	4789                	li	a5,2
    8000829e:	00f71863          	bne	a4,a5,800082ae <sys_open+0x236>
    itrunc(ip);
    800082a2:	fe843503          	ld	a0,-24(s0)
    800082a6:	ffffd097          	auipc	ra,0xffffd
    800082aa:	232080e7          	jalr	562(ra) # 800054d8 <itrunc>
  }

  iunlock(ip);
    800082ae:	fe843503          	ld	a0,-24(s0)
    800082b2:	ffffd097          	auipc	ra,0xffffd
    800082b6:	f72080e7          	jalr	-142(ra) # 80005224 <iunlock>
  end_op();
    800082ba:	ffffe097          	auipc	ra,0xffffe
    800082be:	f52080e7          	jalr	-174(ra) # 8000620c <end_op>

  return fd;
    800082c2:	fd442783          	lw	a5,-44(s0)
}
    800082c6:	853e                	mv	a0,a5
    800082c8:	70ea                	ld	ra,184(sp)
    800082ca:	744a                	ld	s0,176(sp)
    800082cc:	6129                	addi	sp,sp,192
    800082ce:	8082                	ret

00000000800082d0 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    800082d0:	7135                	addi	sp,sp,-160
    800082d2:	ed06                	sd	ra,152(sp)
    800082d4:	e922                	sd	s0,144(sp)
    800082d6:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
    800082d8:	ffffe097          	auipc	ra,0xffffe
    800082dc:	e72080e7          	jalr	-398(ra) # 8000614a <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    800082e0:	f6840793          	addi	a5,s0,-152
    800082e4:	08000613          	li	a2,128
    800082e8:	85be                	mv	a1,a5
    800082ea:	4501                	li	a0,0
    800082ec:	ffffc097          	auipc	ra,0xffffc
    800082f0:	e4a080e7          	jalr	-438(ra) # 80004136 <argstr>
    800082f4:	87aa                	mv	a5,a0
    800082f6:	0207c163          	bltz	a5,80008318 <sys_mkdir+0x48>
    800082fa:	f6840793          	addi	a5,s0,-152
    800082fe:	4681                	li	a3,0
    80008300:	4601                	li	a2,0
    80008302:	4585                	li	a1,1
    80008304:	853e                	mv	a0,a5
    80008306:	00000097          	auipc	ra,0x0
    8000830a:	b64080e7          	jalr	-1180(ra) # 80007e6a <create>
    8000830e:	fea43423          	sd	a0,-24(s0)
    80008312:	fe843783          	ld	a5,-24(s0)
    80008316:	e799                	bnez	a5,80008324 <sys_mkdir+0x54>
    end_op();
    80008318:	ffffe097          	auipc	ra,0xffffe
    8000831c:	ef4080e7          	jalr	-268(ra) # 8000620c <end_op>
    return -1;
    80008320:	57fd                	li	a5,-1
    80008322:	a821                	j	8000833a <sys_mkdir+0x6a>
  }
  iunlockput(ip);
    80008324:	fe843503          	ld	a0,-24(s0)
    80008328:	ffffd097          	auipc	ra,0xffffd
    8000832c:	026080e7          	jalr	38(ra) # 8000534e <iunlockput>
  end_op();
    80008330:	ffffe097          	auipc	ra,0xffffe
    80008334:	edc080e7          	jalr	-292(ra) # 8000620c <end_op>
  return 0;
    80008338:	4781                	li	a5,0
}
    8000833a:	853e                	mv	a0,a5
    8000833c:	60ea                	ld	ra,152(sp)
    8000833e:	644a                	ld	s0,144(sp)
    80008340:	610d                	addi	sp,sp,160
    80008342:	8082                	ret

0000000080008344 <sys_mknod>:

uint64
sys_mknod(void)
{
    80008344:	7135                	addi	sp,sp,-160
    80008346:	ed06                	sd	ra,152(sp)
    80008348:	e922                	sd	s0,144(sp)
    8000834a:	1100                	addi	s0,sp,160
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
    8000834c:	ffffe097          	auipc	ra,0xffffe
    80008350:	dfe080e7          	jalr	-514(ra) # 8000614a <begin_op>
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008354:	f6840793          	addi	a5,s0,-152
    80008358:	08000613          	li	a2,128
    8000835c:	85be                	mv	a1,a5
    8000835e:	4501                	li	a0,0
    80008360:	ffffc097          	auipc	ra,0xffffc
    80008364:	dd6080e7          	jalr	-554(ra) # 80004136 <argstr>
    80008368:	87aa                	mv	a5,a0
    8000836a:	0607c263          	bltz	a5,800083ce <sys_mknod+0x8a>
     argint(1, &major) < 0 ||
    8000836e:	f6440793          	addi	a5,s0,-156
    80008372:	85be                	mv	a1,a5
    80008374:	4505                	li	a0,1
    80008376:	ffffc097          	auipc	ra,0xffffc
    8000837a:	d54080e7          	jalr	-684(ra) # 800040ca <argint>
    8000837e:	87aa                	mv	a5,a0
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008380:	0407c763          	bltz	a5,800083ce <sys_mknod+0x8a>
     argint(2, &minor) < 0 ||
    80008384:	f6040793          	addi	a5,s0,-160
    80008388:	85be                	mv	a1,a5
    8000838a:	4509                	li	a0,2
    8000838c:	ffffc097          	auipc	ra,0xffffc
    80008390:	d3e080e7          	jalr	-706(ra) # 800040ca <argint>
    80008394:	87aa                	mv	a5,a0
     argint(1, &major) < 0 ||
    80008396:	0207cc63          	bltz	a5,800083ce <sys_mknod+0x8a>
     (ip = create(path, T_DEVICE, major, minor)) == 0){
    8000839a:	f6442783          	lw	a5,-156(s0)
    8000839e:	0107971b          	slliw	a4,a5,0x10
    800083a2:	4107571b          	sraiw	a4,a4,0x10
    800083a6:	f6042783          	lw	a5,-160(s0)
    800083aa:	0107969b          	slliw	a3,a5,0x10
    800083ae:	4106d69b          	sraiw	a3,a3,0x10
    800083b2:	f6840793          	addi	a5,s0,-152
    800083b6:	863a                	mv	a2,a4
    800083b8:	458d                	li	a1,3
    800083ba:	853e                	mv	a0,a5
    800083bc:	00000097          	auipc	ra,0x0
    800083c0:	aae080e7          	jalr	-1362(ra) # 80007e6a <create>
    800083c4:	fea43423          	sd	a0,-24(s0)
     argint(2, &minor) < 0 ||
    800083c8:	fe843783          	ld	a5,-24(s0)
    800083cc:	e799                	bnez	a5,800083da <sys_mknod+0x96>
    end_op();
    800083ce:	ffffe097          	auipc	ra,0xffffe
    800083d2:	e3e080e7          	jalr	-450(ra) # 8000620c <end_op>
    return -1;
    800083d6:	57fd                	li	a5,-1
    800083d8:	a821                	j	800083f0 <sys_mknod+0xac>
  }
  iunlockput(ip);
    800083da:	fe843503          	ld	a0,-24(s0)
    800083de:	ffffd097          	auipc	ra,0xffffd
    800083e2:	f70080e7          	jalr	-144(ra) # 8000534e <iunlockput>
  end_op();
    800083e6:	ffffe097          	auipc	ra,0xffffe
    800083ea:	e26080e7          	jalr	-474(ra) # 8000620c <end_op>
  return 0;
    800083ee:	4781                	li	a5,0
}
    800083f0:	853e                	mv	a0,a5
    800083f2:	60ea                	ld	ra,152(sp)
    800083f4:	644a                	ld	s0,144(sp)
    800083f6:	610d                	addi	sp,sp,160
    800083f8:	8082                	ret

00000000800083fa <sys_chdir>:

uint64
sys_chdir(void)
{
    800083fa:	7135                	addi	sp,sp,-160
    800083fc:	ed06                	sd	ra,152(sp)
    800083fe:	e922                	sd	s0,144(sp)
    80008400:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
    80008402:	ffffa097          	auipc	ra,0xffffa
    80008406:	416080e7          	jalr	1046(ra) # 80002818 <myproc>
    8000840a:	fea43423          	sd	a0,-24(s0)
  
  begin_op();
    8000840e:	ffffe097          	auipc	ra,0xffffe
    80008412:	d3c080e7          	jalr	-708(ra) # 8000614a <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0){
    80008416:	f6040793          	addi	a5,s0,-160
    8000841a:	08000613          	li	a2,128
    8000841e:	85be                	mv	a1,a5
    80008420:	4501                	li	a0,0
    80008422:	ffffc097          	auipc	ra,0xffffc
    80008426:	d14080e7          	jalr	-748(ra) # 80004136 <argstr>
    8000842a:	87aa                	mv	a5,a0
    8000842c:	0007ce63          	bltz	a5,80008448 <sys_chdir+0x4e>
    80008430:	f6040793          	addi	a5,s0,-160
    80008434:	853e                	mv	a0,a5
    80008436:	ffffe097          	auipc	ra,0xffffe
    8000843a:	9b0080e7          	jalr	-1616(ra) # 80005de6 <namei>
    8000843e:	fea43023          	sd	a0,-32(s0)
    80008442:	fe043783          	ld	a5,-32(s0)
    80008446:	e799                	bnez	a5,80008454 <sys_chdir+0x5a>
    end_op();
    80008448:	ffffe097          	auipc	ra,0xffffe
    8000844c:	dc4080e7          	jalr	-572(ra) # 8000620c <end_op>
    return -1;
    80008450:	57fd                	li	a5,-1
    80008452:	a0b5                	j	800084be <sys_chdir+0xc4>
  }
  ilock(ip);
    80008454:	fe043503          	ld	a0,-32(s0)
    80008458:	ffffd097          	auipc	ra,0xffffd
    8000845c:	c98080e7          	jalr	-872(ra) # 800050f0 <ilock>
  if(ip->type != T_DIR){
    80008460:	fe043783          	ld	a5,-32(s0)
    80008464:	04479783          	lh	a5,68(a5)
    80008468:	0007871b          	sext.w	a4,a5
    8000846c:	4785                	li	a5,1
    8000846e:	00f70e63          	beq	a4,a5,8000848a <sys_chdir+0x90>
    iunlockput(ip);
    80008472:	fe043503          	ld	a0,-32(s0)
    80008476:	ffffd097          	auipc	ra,0xffffd
    8000847a:	ed8080e7          	jalr	-296(ra) # 8000534e <iunlockput>
    end_op();
    8000847e:	ffffe097          	auipc	ra,0xffffe
    80008482:	d8e080e7          	jalr	-626(ra) # 8000620c <end_op>
    return -1;
    80008486:	57fd                	li	a5,-1
    80008488:	a81d                	j	800084be <sys_chdir+0xc4>
  }
  iunlock(ip);
    8000848a:	fe043503          	ld	a0,-32(s0)
    8000848e:	ffffd097          	auipc	ra,0xffffd
    80008492:	d96080e7          	jalr	-618(ra) # 80005224 <iunlock>
  iput(p->cwd);
    80008496:	fe843783          	ld	a5,-24(s0)
    8000849a:	1507b783          	ld	a5,336(a5)
    8000849e:	853e                	mv	a0,a5
    800084a0:	ffffd097          	auipc	ra,0xffffd
    800084a4:	dde080e7          	jalr	-546(ra) # 8000527e <iput>
  end_op();
    800084a8:	ffffe097          	auipc	ra,0xffffe
    800084ac:	d64080e7          	jalr	-668(ra) # 8000620c <end_op>
  p->cwd = ip;
    800084b0:	fe843783          	ld	a5,-24(s0)
    800084b4:	fe043703          	ld	a4,-32(s0)
    800084b8:	14e7b823          	sd	a4,336(a5)
  return 0;
    800084bc:	4781                	li	a5,0
}
    800084be:	853e                	mv	a0,a5
    800084c0:	60ea                	ld	ra,152(sp)
    800084c2:	644a                	ld	s0,144(sp)
    800084c4:	610d                	addi	sp,sp,160
    800084c6:	8082                	ret

00000000800084c8 <sys_exec>:

uint64
sys_exec(void)
{
    800084c8:	7161                	addi	sp,sp,-432
    800084ca:	f706                	sd	ra,424(sp)
    800084cc:	f322                	sd	s0,416(sp)
    800084ce:	1b00                	addi	s0,sp,432
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, MAXPATH) < 0 || argaddr(1, &uargv) < 0){
    800084d0:	f6840793          	addi	a5,s0,-152
    800084d4:	08000613          	li	a2,128
    800084d8:	85be                	mv	a1,a5
    800084da:	4501                	li	a0,0
    800084dc:	ffffc097          	auipc	ra,0xffffc
    800084e0:	c5a080e7          	jalr	-934(ra) # 80004136 <argstr>
    800084e4:	87aa                	mv	a5,a0
    800084e6:	0007cd63          	bltz	a5,80008500 <sys_exec+0x38>
    800084ea:	e6040793          	addi	a5,s0,-416
    800084ee:	85be                	mv	a1,a5
    800084f0:	4505                	li	a0,1
    800084f2:	ffffc097          	auipc	ra,0xffffc
    800084f6:	c10080e7          	jalr	-1008(ra) # 80004102 <argaddr>
    800084fa:	87aa                	mv	a5,a0
    800084fc:	0007d463          	bgez	a5,80008504 <sys_exec+0x3c>
    return -1;
    80008500:	57fd                	li	a5,-1
    80008502:	a249                	j	80008684 <sys_exec+0x1bc>
  }
  memset(argv, 0, sizeof(argv));
    80008504:	e6840793          	addi	a5,s0,-408
    80008508:	10000613          	li	a2,256
    8000850c:	4581                	li	a1,0
    8000850e:	853e                	mv	a0,a5
    80008510:	ffff9097          	auipc	ra,0xffff9
    80008514:	f32080e7          	jalr	-206(ra) # 80001442 <memset>
  for(i=0;; i++){
    80008518:	fe042623          	sw	zero,-20(s0)
    if(i >= NELEM(argv)){
    8000851c:	fec42783          	lw	a5,-20(s0)
    80008520:	873e                	mv	a4,a5
    80008522:	47fd                	li	a5,31
    80008524:	10e7e463          	bltu	a5,a4,8000862c <sys_exec+0x164>
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80008528:	fec42783          	lw	a5,-20(s0)
    8000852c:	00379713          	slli	a4,a5,0x3
    80008530:	e6043783          	ld	a5,-416(s0)
    80008534:	97ba                	add	a5,a5,a4
    80008536:	e5840713          	addi	a4,s0,-424
    8000853a:	85ba                	mv	a1,a4
    8000853c:	853e                	mv	a0,a5
    8000853e:	ffffc097          	auipc	ra,0xffffc
    80008542:	a0e080e7          	jalr	-1522(ra) # 80003f4c <fetchaddr>
    80008546:	87aa                	mv	a5,a0
    80008548:	0e07c463          	bltz	a5,80008630 <sys_exec+0x168>
      goto bad;
    }
    if(uarg == 0){
    8000854c:	e5843783          	ld	a5,-424(s0)
    80008550:	eb95                	bnez	a5,80008584 <sys_exec+0xbc>
      argv[i] = 0;
    80008552:	fec42783          	lw	a5,-20(s0)
    80008556:	078e                	slli	a5,a5,0x3
    80008558:	ff040713          	addi	a4,s0,-16
    8000855c:	97ba                	add	a5,a5,a4
    8000855e:	e607bc23          	sd	zero,-392(a5)
      break;
    80008562:	0001                	nop
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);
    80008564:	e6840713          	addi	a4,s0,-408
    80008568:	f6840793          	addi	a5,s0,-152
    8000856c:	85ba                	mv	a1,a4
    8000856e:	853e                	mv	a0,a5
    80008570:	fffff097          	auipc	ra,0xfffff
    80008574:	c1a080e7          	jalr	-998(ra) # 8000718a <exec>
    80008578:	87aa                	mv	a5,a0
    8000857a:	fef42423          	sw	a5,-24(s0)

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8000857e:	fe042623          	sw	zero,-20(s0)
    80008582:	a059                	j	80008608 <sys_exec+0x140>
    argv[i] = kalloc();
    80008584:	ffff9097          	auipc	ra,0xffff9
    80008588:	b96080e7          	jalr	-1130(ra) # 8000111a <kalloc>
    8000858c:	872a                	mv	a4,a0
    8000858e:	fec42783          	lw	a5,-20(s0)
    80008592:	078e                	slli	a5,a5,0x3
    80008594:	ff040693          	addi	a3,s0,-16
    80008598:	97b6                	add	a5,a5,a3
    8000859a:	e6e7bc23          	sd	a4,-392(a5)
    if(argv[i] == 0)
    8000859e:	fec42783          	lw	a5,-20(s0)
    800085a2:	078e                	slli	a5,a5,0x3
    800085a4:	ff040713          	addi	a4,s0,-16
    800085a8:	97ba                	add	a5,a5,a4
    800085aa:	e787b783          	ld	a5,-392(a5)
    800085ae:	c3d9                	beqz	a5,80008634 <sys_exec+0x16c>
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    800085b0:	e5843703          	ld	a4,-424(s0)
    800085b4:	fec42783          	lw	a5,-20(s0)
    800085b8:	078e                	slli	a5,a5,0x3
    800085ba:	ff040693          	addi	a3,s0,-16
    800085be:	97b6                	add	a5,a5,a3
    800085c0:	e787b783          	ld	a5,-392(a5)
    800085c4:	6605                	lui	a2,0x1
    800085c6:	85be                	mv	a1,a5
    800085c8:	853a                	mv	a0,a4
    800085ca:	ffffc097          	auipc	ra,0xffffc
    800085ce:	9f0080e7          	jalr	-1552(ra) # 80003fba <fetchstr>
    800085d2:	87aa                	mv	a5,a0
    800085d4:	0607c263          	bltz	a5,80008638 <sys_exec+0x170>
  for(i=0;; i++){
    800085d8:	fec42783          	lw	a5,-20(s0)
    800085dc:	2785                	addiw	a5,a5,1
    800085de:	fef42623          	sw	a5,-20(s0)
    if(i >= NELEM(argv)){
    800085e2:	bf2d                	j	8000851c <sys_exec+0x54>
    kfree(argv[i]);
    800085e4:	fec42783          	lw	a5,-20(s0)
    800085e8:	078e                	slli	a5,a5,0x3
    800085ea:	ff040713          	addi	a4,s0,-16
    800085ee:	97ba                	add	a5,a5,a4
    800085f0:	e787b783          	ld	a5,-392(a5)
    800085f4:	853e                	mv	a0,a5
    800085f6:	ffff9097          	auipc	ra,0xffff9
    800085fa:	a80080e7          	jalr	-1408(ra) # 80001076 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800085fe:	fec42783          	lw	a5,-20(s0)
    80008602:	2785                	addiw	a5,a5,1
    80008604:	fef42623          	sw	a5,-20(s0)
    80008608:	fec42783          	lw	a5,-20(s0)
    8000860c:	873e                	mv	a4,a5
    8000860e:	47fd                	li	a5,31
    80008610:	00e7eb63          	bltu	a5,a4,80008626 <sys_exec+0x15e>
    80008614:	fec42783          	lw	a5,-20(s0)
    80008618:	078e                	slli	a5,a5,0x3
    8000861a:	ff040713          	addi	a4,s0,-16
    8000861e:	97ba                	add	a5,a5,a4
    80008620:	e787b783          	ld	a5,-392(a5)
    80008624:	f3e1                	bnez	a5,800085e4 <sys_exec+0x11c>

  return ret;
    80008626:	fe842783          	lw	a5,-24(s0)
    8000862a:	a8a9                	j	80008684 <sys_exec+0x1bc>
      goto bad;
    8000862c:	0001                	nop
    8000862e:	a031                	j	8000863a <sys_exec+0x172>
      goto bad;
    80008630:	0001                	nop
    80008632:	a021                	j	8000863a <sys_exec+0x172>
      goto bad;
    80008634:	0001                	nop
    80008636:	a011                	j	8000863a <sys_exec+0x172>
      goto bad;
    80008638:	0001                	nop

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8000863a:	fe042623          	sw	zero,-20(s0)
    8000863e:	a01d                	j	80008664 <sys_exec+0x19c>
    kfree(argv[i]);
    80008640:	fec42783          	lw	a5,-20(s0)
    80008644:	078e                	slli	a5,a5,0x3
    80008646:	ff040713          	addi	a4,s0,-16
    8000864a:	97ba                	add	a5,a5,a4
    8000864c:	e787b783          	ld	a5,-392(a5)
    80008650:	853e                	mv	a0,a5
    80008652:	ffff9097          	auipc	ra,0xffff9
    80008656:	a24080e7          	jalr	-1500(ra) # 80001076 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8000865a:	fec42783          	lw	a5,-20(s0)
    8000865e:	2785                	addiw	a5,a5,1
    80008660:	fef42623          	sw	a5,-20(s0)
    80008664:	fec42783          	lw	a5,-20(s0)
    80008668:	873e                	mv	a4,a5
    8000866a:	47fd                	li	a5,31
    8000866c:	00e7eb63          	bltu	a5,a4,80008682 <sys_exec+0x1ba>
    80008670:	fec42783          	lw	a5,-20(s0)
    80008674:	078e                	slli	a5,a5,0x3
    80008676:	ff040713          	addi	a4,s0,-16
    8000867a:	97ba                	add	a5,a5,a4
    8000867c:	e787b783          	ld	a5,-392(a5)
    80008680:	f3e1                	bnez	a5,80008640 <sys_exec+0x178>
  return -1;
    80008682:	57fd                	li	a5,-1
}
    80008684:	853e                	mv	a0,a5
    80008686:	70ba                	ld	ra,424(sp)
    80008688:	741a                	ld	s0,416(sp)
    8000868a:	615d                	addi	sp,sp,432
    8000868c:	8082                	ret

000000008000868e <sys_pipe>:

uint64
sys_pipe(void)
{
    8000868e:	7139                	addi	sp,sp,-64
    80008690:	fc06                	sd	ra,56(sp)
    80008692:	f822                	sd	s0,48(sp)
    80008694:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80008696:	ffffa097          	auipc	ra,0xffffa
    8000869a:	182080e7          	jalr	386(ra) # 80002818 <myproc>
    8000869e:	fea43423          	sd	a0,-24(s0)

  if(argaddr(0, &fdarray) < 0)
    800086a2:	fe040793          	addi	a5,s0,-32
    800086a6:	85be                	mv	a1,a5
    800086a8:	4501                	li	a0,0
    800086aa:	ffffc097          	auipc	ra,0xffffc
    800086ae:	a58080e7          	jalr	-1448(ra) # 80004102 <argaddr>
    800086b2:	87aa                	mv	a5,a0
    800086b4:	0007d463          	bgez	a5,800086bc <sys_pipe+0x2e>
    return -1;
    800086b8:	57fd                	li	a5,-1
    800086ba:	a215                	j	800087de <sys_pipe+0x150>
  if(pipealloc(&rf, &wf) < 0)
    800086bc:	fd040713          	addi	a4,s0,-48
    800086c0:	fd840793          	addi	a5,s0,-40
    800086c4:	85ba                	mv	a1,a4
    800086c6:	853e                	mv	a0,a5
    800086c8:	ffffe097          	auipc	ra,0xffffe
    800086cc:	632080e7          	jalr	1586(ra) # 80006cfa <pipealloc>
    800086d0:	87aa                	mv	a5,a0
    800086d2:	0007d463          	bgez	a5,800086da <sys_pipe+0x4c>
    return -1;
    800086d6:	57fd                	li	a5,-1
    800086d8:	a219                	j	800087de <sys_pipe+0x150>
  fd0 = -1;
    800086da:	57fd                	li	a5,-1
    800086dc:	fcf42623          	sw	a5,-52(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    800086e0:	fd843783          	ld	a5,-40(s0)
    800086e4:	853e                	mv	a0,a5
    800086e6:	fffff097          	auipc	ra,0xfffff
    800086ea:	0be080e7          	jalr	190(ra) # 800077a4 <fdalloc>
    800086ee:	87aa                	mv	a5,a0
    800086f0:	fcf42623          	sw	a5,-52(s0)
    800086f4:	fcc42783          	lw	a5,-52(s0)
    800086f8:	0207c063          	bltz	a5,80008718 <sys_pipe+0x8a>
    800086fc:	fd043783          	ld	a5,-48(s0)
    80008700:	853e                	mv	a0,a5
    80008702:	fffff097          	auipc	ra,0xfffff
    80008706:	0a2080e7          	jalr	162(ra) # 800077a4 <fdalloc>
    8000870a:	87aa                	mv	a5,a0
    8000870c:	fcf42423          	sw	a5,-56(s0)
    80008710:	fc842783          	lw	a5,-56(s0)
    80008714:	0207df63          	bgez	a5,80008752 <sys_pipe+0xc4>
    if(fd0 >= 0)
    80008718:	fcc42783          	lw	a5,-52(s0)
    8000871c:	0007cb63          	bltz	a5,80008732 <sys_pipe+0xa4>
      p->ofile[fd0] = 0;
    80008720:	fcc42783          	lw	a5,-52(s0)
    80008724:	fe843703          	ld	a4,-24(s0)
    80008728:	07e9                	addi	a5,a5,26
    8000872a:	078e                	slli	a5,a5,0x3
    8000872c:	97ba                	add	a5,a5,a4
    8000872e:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008732:	fd843783          	ld	a5,-40(s0)
    80008736:	853e                	mv	a0,a5
    80008738:	ffffe097          	auipc	ra,0xffffe
    8000873c:	0ac080e7          	jalr	172(ra) # 800067e4 <fileclose>
    fileclose(wf);
    80008740:	fd043783          	ld	a5,-48(s0)
    80008744:	853e                	mv	a0,a5
    80008746:	ffffe097          	auipc	ra,0xffffe
    8000874a:	09e080e7          	jalr	158(ra) # 800067e4 <fileclose>
    return -1;
    8000874e:	57fd                	li	a5,-1
    80008750:	a079                	j	800087de <sys_pipe+0x150>
  }
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008752:	fe843783          	ld	a5,-24(s0)
    80008756:	6bbc                	ld	a5,80(a5)
    80008758:	fe043703          	ld	a4,-32(s0)
    8000875c:	fcc40613          	addi	a2,s0,-52
    80008760:	4691                	li	a3,4
    80008762:	85ba                	mv	a1,a4
    80008764:	853e                	mv	a0,a5
    80008766:	ffffa097          	auipc	ra,0xffffa
    8000876a:	b80080e7          	jalr	-1152(ra) # 800022e6 <copyout>
    8000876e:	87aa                	mv	a5,a0
    80008770:	0207c463          	bltz	a5,80008798 <sys_pipe+0x10a>
     copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80008774:	fe843783          	ld	a5,-24(s0)
    80008778:	6bb8                	ld	a4,80(a5)
    8000877a:	fe043783          	ld	a5,-32(s0)
    8000877e:	0791                	addi	a5,a5,4
    80008780:	fc840613          	addi	a2,s0,-56
    80008784:	4691                	li	a3,4
    80008786:	85be                	mv	a1,a5
    80008788:	853a                	mv	a0,a4
    8000878a:	ffffa097          	auipc	ra,0xffffa
    8000878e:	b5c080e7          	jalr	-1188(ra) # 800022e6 <copyout>
    80008792:	87aa                	mv	a5,a0
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008794:	0407d463          	bgez	a5,800087dc <sys_pipe+0x14e>
    p->ofile[fd0] = 0;
    80008798:	fcc42783          	lw	a5,-52(s0)
    8000879c:	fe843703          	ld	a4,-24(s0)
    800087a0:	07e9                	addi	a5,a5,26
    800087a2:	078e                	slli	a5,a5,0x3
    800087a4:	97ba                	add	a5,a5,a4
    800087a6:	0007b023          	sd	zero,0(a5)
    p->ofile[fd1] = 0;
    800087aa:	fc842783          	lw	a5,-56(s0)
    800087ae:	fe843703          	ld	a4,-24(s0)
    800087b2:	07e9                	addi	a5,a5,26
    800087b4:	078e                	slli	a5,a5,0x3
    800087b6:	97ba                	add	a5,a5,a4
    800087b8:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    800087bc:	fd843783          	ld	a5,-40(s0)
    800087c0:	853e                	mv	a0,a5
    800087c2:	ffffe097          	auipc	ra,0xffffe
    800087c6:	022080e7          	jalr	34(ra) # 800067e4 <fileclose>
    fileclose(wf);
    800087ca:	fd043783          	ld	a5,-48(s0)
    800087ce:	853e                	mv	a0,a5
    800087d0:	ffffe097          	auipc	ra,0xffffe
    800087d4:	014080e7          	jalr	20(ra) # 800067e4 <fileclose>
    return -1;
    800087d8:	57fd                	li	a5,-1
    800087da:	a011                	j	800087de <sys_pipe+0x150>
  }
  return 0;
    800087dc:	4781                	li	a5,0
}
    800087de:	853e                	mv	a0,a5
    800087e0:	70e2                	ld	ra,56(sp)
    800087e2:	7442                	ld	s0,48(sp)
    800087e4:	6121                	addi	sp,sp,64
    800087e6:	8082                	ret
	...

00000000800087f0 <kernelvec>:
    800087f0:	7111                	addi	sp,sp,-256
    800087f2:	e006                	sd	ra,0(sp)
    800087f4:	e40a                	sd	sp,8(sp)
    800087f6:	e80e                	sd	gp,16(sp)
    800087f8:	ec12                	sd	tp,24(sp)
    800087fa:	f016                	sd	t0,32(sp)
    800087fc:	f41a                	sd	t1,40(sp)
    800087fe:	f81e                	sd	t2,48(sp)
    80008800:	fc22                	sd	s0,56(sp)
    80008802:	e0a6                	sd	s1,64(sp)
    80008804:	e4aa                	sd	a0,72(sp)
    80008806:	e8ae                	sd	a1,80(sp)
    80008808:	ecb2                	sd	a2,88(sp)
    8000880a:	f0b6                	sd	a3,96(sp)
    8000880c:	f4ba                	sd	a4,104(sp)
    8000880e:	f8be                	sd	a5,112(sp)
    80008810:	fcc2                	sd	a6,120(sp)
    80008812:	e146                	sd	a7,128(sp)
    80008814:	e54a                	sd	s2,136(sp)
    80008816:	e94e                	sd	s3,144(sp)
    80008818:	ed52                	sd	s4,152(sp)
    8000881a:	f156                	sd	s5,160(sp)
    8000881c:	f55a                	sd	s6,168(sp)
    8000881e:	f95e                	sd	s7,176(sp)
    80008820:	fd62                	sd	s8,184(sp)
    80008822:	e1e6                	sd	s9,192(sp)
    80008824:	e5ea                	sd	s10,200(sp)
    80008826:	e9ee                	sd	s11,208(sp)
    80008828:	edf2                	sd	t3,216(sp)
    8000882a:	f1f6                	sd	t4,224(sp)
    8000882c:	f5fa                	sd	t5,232(sp)
    8000882e:	f9fe                	sd	t6,240(sp)
    80008830:	cb4fb0ef          	jal	ra,80003ce4 <kerneltrap>
    80008834:	6082                	ld	ra,0(sp)
    80008836:	6122                	ld	sp,8(sp)
    80008838:	61c2                	ld	gp,16(sp)
    8000883a:	7282                	ld	t0,32(sp)
    8000883c:	7322                	ld	t1,40(sp)
    8000883e:	73c2                	ld	t2,48(sp)
    80008840:	7462                	ld	s0,56(sp)
    80008842:	6486                	ld	s1,64(sp)
    80008844:	6526                	ld	a0,72(sp)
    80008846:	65c6                	ld	a1,80(sp)
    80008848:	6666                	ld	a2,88(sp)
    8000884a:	7686                	ld	a3,96(sp)
    8000884c:	7726                	ld	a4,104(sp)
    8000884e:	77c6                	ld	a5,112(sp)
    80008850:	7866                	ld	a6,120(sp)
    80008852:	688a                	ld	a7,128(sp)
    80008854:	692a                	ld	s2,136(sp)
    80008856:	69ca                	ld	s3,144(sp)
    80008858:	6a6a                	ld	s4,152(sp)
    8000885a:	7a8a                	ld	s5,160(sp)
    8000885c:	7b2a                	ld	s6,168(sp)
    8000885e:	7bca                	ld	s7,176(sp)
    80008860:	7c6a                	ld	s8,184(sp)
    80008862:	6c8e                	ld	s9,192(sp)
    80008864:	6d2e                	ld	s10,200(sp)
    80008866:	6dce                	ld	s11,208(sp)
    80008868:	6e6e                	ld	t3,216(sp)
    8000886a:	7e8e                	ld	t4,224(sp)
    8000886c:	7f2e                	ld	t5,232(sp)
    8000886e:	7fce                	ld	t6,240(sp)
    80008870:	6111                	addi	sp,sp,256
    80008872:	10200073          	sret
    80008876:	00000013          	nop
    8000887a:	00000013          	nop
    8000887e:	0001                	nop

0000000080008880 <timervec>:
    80008880:	34051573          	csrrw	a0,mscratch,a0
    80008884:	e10c                	sd	a1,0(a0)
    80008886:	e510                	sd	a2,8(a0)
    80008888:	e914                	sd	a3,16(a0)
    8000888a:	6d0c                	ld	a1,24(a0)
    8000888c:	7110                	ld	a2,32(a0)
    8000888e:	6194                	ld	a3,0(a1)
    80008890:	96b2                	add	a3,a3,a2
    80008892:	e194                	sd	a3,0(a1)
    80008894:	4589                	li	a1,2
    80008896:	14459073          	csrw	sip,a1
    8000889a:	6914                	ld	a3,16(a0)
    8000889c:	6510                	ld	a2,8(a0)
    8000889e:	610c                	ld	a1,0(a0)
    800088a0:	34051573          	csrrw	a0,mscratch,a0
    800088a4:	30200073          	mret
	...

00000000800088aa <plicinit>:
// the riscv Platform Level Interrupt Controller (PLIC).
//

void
plicinit(void)
{
    800088aa:	1141                	addi	sp,sp,-16
    800088ac:	e422                	sd	s0,8(sp)
    800088ae:	0800                	addi	s0,sp,16
  // set desired IRQ priorities non-zero (otherwise disabled).
  *(uint32*)(PLIC + UART0_IRQ*4) = 1;
    800088b0:	0c0007b7          	lui	a5,0xc000
    800088b4:	02878793          	addi	a5,a5,40 # c000028 <_entry-0x73ffffd8>
    800088b8:	4705                	li	a4,1
    800088ba:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO0_IRQ*4) = 1;
    800088bc:	0c0007b7          	lui	a5,0xc000
    800088c0:	0791                	addi	a5,a5,4
    800088c2:	4705                	li	a4,1
    800088c4:	c398                	sw	a4,0(a5)
}
    800088c6:	0001                	nop
    800088c8:	6422                	ld	s0,8(sp)
    800088ca:	0141                	addi	sp,sp,16
    800088cc:	8082                	ret

00000000800088ce <plicinithart>:

void
plicinithart(void)
{
    800088ce:	1101                	addi	sp,sp,-32
    800088d0:	ec06                	sd	ra,24(sp)
    800088d2:	e822                	sd	s0,16(sp)
    800088d4:	1000                	addi	s0,sp,32
  int hart = cpuid();
    800088d6:	ffffa097          	auipc	ra,0xffffa
    800088da:	ee0080e7          	jalr	-288(ra) # 800027b6 <cpuid>
    800088de:	87aa                	mv	a5,a0
    800088e0:	fef42623          	sw	a5,-20(s0)
  
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART0_IRQ) | (1 << VIRTIO0_IRQ);
    800088e4:	fec42783          	lw	a5,-20(s0)
    800088e8:	0087979b          	slliw	a5,a5,0x8
    800088ec:	2781                	sext.w	a5,a5
    800088ee:	873e                	mv	a4,a5
    800088f0:	0c0027b7          	lui	a5,0xc002
    800088f4:	08078793          	addi	a5,a5,128 # c002080 <_entry-0x73ffdf80>
    800088f8:	97ba                	add	a5,a5,a4
    800088fa:	873e                	mv	a4,a5
    800088fc:	40200793          	li	a5,1026
    80008900:	c31c                	sw	a5,0(a4)

  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80008902:	fec42783          	lw	a5,-20(s0)
    80008906:	00d7979b          	slliw	a5,a5,0xd
    8000890a:	2781                	sext.w	a5,a5
    8000890c:	873e                	mv	a4,a5
    8000890e:	0c2017b7          	lui	a5,0xc201
    80008912:	97ba                	add	a5,a5,a4
    80008914:	0007a023          	sw	zero,0(a5) # c201000 <_entry-0x73dff000>
}
    80008918:	0001                	nop
    8000891a:	60e2                	ld	ra,24(sp)
    8000891c:	6442                	ld	s0,16(sp)
    8000891e:	6105                	addi	sp,sp,32
    80008920:	8082                	ret

0000000080008922 <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80008922:	1101                	addi	sp,sp,-32
    80008924:	ec06                	sd	ra,24(sp)
    80008926:	e822                	sd	s0,16(sp)
    80008928:	1000                	addi	s0,sp,32
  int hart = cpuid();
    8000892a:	ffffa097          	auipc	ra,0xffffa
    8000892e:	e8c080e7          	jalr	-372(ra) # 800027b6 <cpuid>
    80008932:	87aa                	mv	a5,a0
    80008934:	fef42623          	sw	a5,-20(s0)
  int irq = *(uint32*)PLIC_SCLAIM(hart);
    80008938:	fec42783          	lw	a5,-20(s0)
    8000893c:	00d7979b          	slliw	a5,a5,0xd
    80008940:	2781                	sext.w	a5,a5
    80008942:	873e                	mv	a4,a5
    80008944:	0c2017b7          	lui	a5,0xc201
    80008948:	0791                	addi	a5,a5,4
    8000894a:	97ba                	add	a5,a5,a4
    8000894c:	439c                	lw	a5,0(a5)
    8000894e:	fef42423          	sw	a5,-24(s0)
  return irq;
    80008952:	fe842783          	lw	a5,-24(s0)
}
    80008956:	853e                	mv	a0,a5
    80008958:	60e2                	ld	ra,24(sp)
    8000895a:	6442                	ld	s0,16(sp)
    8000895c:	6105                	addi	sp,sp,32
    8000895e:	8082                	ret

0000000080008960 <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80008960:	7179                	addi	sp,sp,-48
    80008962:	f406                	sd	ra,40(sp)
    80008964:	f022                	sd	s0,32(sp)
    80008966:	1800                	addi	s0,sp,48
    80008968:	87aa                	mv	a5,a0
    8000896a:	fcf42e23          	sw	a5,-36(s0)
  int hart = cpuid();
    8000896e:	ffffa097          	auipc	ra,0xffffa
    80008972:	e48080e7          	jalr	-440(ra) # 800027b6 <cpuid>
    80008976:	87aa                	mv	a5,a0
    80008978:	fef42623          	sw	a5,-20(s0)
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    8000897c:	fec42783          	lw	a5,-20(s0)
    80008980:	00d7979b          	slliw	a5,a5,0xd
    80008984:	2781                	sext.w	a5,a5
    80008986:	873e                	mv	a4,a5
    80008988:	0c2017b7          	lui	a5,0xc201
    8000898c:	0791                	addi	a5,a5,4
    8000898e:	97ba                	add	a5,a5,a4
    80008990:	873e                	mv	a4,a5
    80008992:	fdc42783          	lw	a5,-36(s0)
    80008996:	c31c                	sw	a5,0(a4)
}
    80008998:	0001                	nop
    8000899a:	70a2                	ld	ra,40(sp)
    8000899c:	7402                	ld	s0,32(sp)
    8000899e:	6145                	addi	sp,sp,48
    800089a0:	8082                	ret

00000000800089a2 <virtio_disk_init>:
  
} __attribute__ ((aligned (PGSIZE))) disk;

void
virtio_disk_init(void)
{
    800089a2:	7179                	addi	sp,sp,-48
    800089a4:	f406                	sd	ra,40(sp)
    800089a6:	f022                	sd	s0,32(sp)
    800089a8:	1800                	addi	s0,sp,48
  uint32 status = 0;
    800089aa:	fe042423          	sw	zero,-24(s0)

  initlock(&disk.vdisk_lock, "virtio_disk");
    800089ae:	00003597          	auipc	a1,0x3
    800089b2:	d1258593          	addi	a1,a1,-750 # 8000b6c0 <etext+0x6c0>
    800089b6:	0001f517          	auipc	a0,0x1f
    800089ba:	77250513          	addi	a0,a0,1906 # 80028128 <disk+0x2128>
    800089be:	ffff9097          	auipc	ra,0xffff9
    800089c2:	880080e7          	jalr	-1920(ra) # 8000123e <initlock>

  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    800089c6:	100017b7          	lui	a5,0x10001
    800089ca:	439c                	lw	a5,0(a5)
    800089cc:	2781                	sext.w	a5,a5
    800089ce:	873e                	mv	a4,a5
    800089d0:	747277b7          	lui	a5,0x74727
    800089d4:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xb8d968a>
    800089d8:	04f71063          	bne	a4,a5,80008a18 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    800089dc:	100017b7          	lui	a5,0x10001
    800089e0:	0791                	addi	a5,a5,4
    800089e2:	439c                	lw	a5,0(a5)
    800089e4:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    800089e6:	873e                	mv	a4,a5
    800089e8:	4785                	li	a5,1
    800089ea:	02f71763          	bne	a4,a5,80008a18 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    800089ee:	100017b7          	lui	a5,0x10001
    800089f2:	07a1                	addi	a5,a5,8
    800089f4:	439c                	lw	a5,0(a5)
    800089f6:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    800089f8:	873e                	mv	a4,a5
    800089fa:	4789                	li	a5,2
    800089fc:	00f71e63          	bne	a4,a5,80008a18 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80008a00:	100017b7          	lui	a5,0x10001
    80008a04:	07b1                	addi	a5,a5,12
    80008a06:	439c                	lw	a5,0(a5)
    80008a08:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008a0a:	873e                	mv	a4,a5
    80008a0c:	554d47b7          	lui	a5,0x554d4
    80008a10:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ab2baaf>
    80008a14:	00f70a63          	beq	a4,a5,80008a28 <virtio_disk_init+0x86>
    panic("could not find virtio disk");
    80008a18:	00003517          	auipc	a0,0x3
    80008a1c:	cb850513          	addi	a0,a0,-840 # 8000b6d0 <etext+0x6d0>
    80008a20:	ffff8097          	auipc	ra,0xffff8
    80008a24:	25e080e7          	jalr	606(ra) # 80000c7e <panic>
  }
  
  status |= VIRTIO_CONFIG_S_ACKNOWLEDGE;
    80008a28:	fe842783          	lw	a5,-24(s0)
    80008a2c:	0017e793          	ori	a5,a5,1
    80008a30:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008a34:	100017b7          	lui	a5,0x10001
    80008a38:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008a3c:	fe842703          	lw	a4,-24(s0)
    80008a40:	c398                	sw	a4,0(a5)

  status |= VIRTIO_CONFIG_S_DRIVER;
    80008a42:	fe842783          	lw	a5,-24(s0)
    80008a46:	0027e793          	ori	a5,a5,2
    80008a4a:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008a4e:	100017b7          	lui	a5,0x10001
    80008a52:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008a56:	fe842703          	lw	a4,-24(s0)
    80008a5a:	c398                	sw	a4,0(a5)

  // negotiate features
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    80008a5c:	100017b7          	lui	a5,0x10001
    80008a60:	07c1                	addi	a5,a5,16
    80008a62:	439c                	lw	a5,0(a5)
    80008a64:	2781                	sext.w	a5,a5
    80008a66:	1782                	slli	a5,a5,0x20
    80008a68:	9381                	srli	a5,a5,0x20
    80008a6a:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_RO);
    80008a6e:	fe043783          	ld	a5,-32(s0)
    80008a72:	fdf7f793          	andi	a5,a5,-33
    80008a76:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_SCSI);
    80008a7a:	fe043783          	ld	a5,-32(s0)
    80008a7e:	f7f7f793          	andi	a5,a5,-129
    80008a82:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_CONFIG_WCE);
    80008a86:	fe043703          	ld	a4,-32(s0)
    80008a8a:	77fd                	lui	a5,0xfffff
    80008a8c:	7ff78793          	addi	a5,a5,2047 # fffffffffffff7ff <end+0xffffffff7ffd67ff>
    80008a90:	8ff9                	and	a5,a5,a4
    80008a92:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_MQ);
    80008a96:	fe043703          	ld	a4,-32(s0)
    80008a9a:	77fd                	lui	a5,0xfffff
    80008a9c:	17fd                	addi	a5,a5,-1
    80008a9e:	8ff9                	and	a5,a5,a4
    80008aa0:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_F_ANY_LAYOUT);
    80008aa4:	fe043703          	ld	a4,-32(s0)
    80008aa8:	f80007b7          	lui	a5,0xf8000
    80008aac:	17fd                	addi	a5,a5,-1
    80008aae:	8ff9                	and	a5,a5,a4
    80008ab0:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_EVENT_IDX);
    80008ab4:	fe043703          	ld	a4,-32(s0)
    80008ab8:	e00007b7          	lui	a5,0xe0000
    80008abc:	17fd                	addi	a5,a5,-1
    80008abe:	8ff9                	and	a5,a5,a4
    80008ac0:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80008ac4:	fe043703          	ld	a4,-32(s0)
    80008ac8:	f00007b7          	lui	a5,0xf0000
    80008acc:	17fd                	addi	a5,a5,-1
    80008ace:	8ff9                	and	a5,a5,a4
    80008ad0:	fef43023          	sd	a5,-32(s0)
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80008ad4:	100017b7          	lui	a5,0x10001
    80008ad8:	02078793          	addi	a5,a5,32 # 10001020 <_entry-0x6fffefe0>
    80008adc:	fe043703          	ld	a4,-32(s0)
    80008ae0:	2701                	sext.w	a4,a4
    80008ae2:	c398                	sw	a4,0(a5)

  // tell device that feature negotiation is complete.
  status |= VIRTIO_CONFIG_S_FEATURES_OK;
    80008ae4:	fe842783          	lw	a5,-24(s0)
    80008ae8:	0087e793          	ori	a5,a5,8
    80008aec:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008af0:	100017b7          	lui	a5,0x10001
    80008af4:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008af8:	fe842703          	lw	a4,-24(s0)
    80008afc:	c398                	sw	a4,0(a5)

  // tell device we're completely ready.
  status |= VIRTIO_CONFIG_S_DRIVER_OK;
    80008afe:	fe842783          	lw	a5,-24(s0)
    80008b02:	0047e793          	ori	a5,a5,4
    80008b06:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80008b0a:	100017b7          	lui	a5,0x10001
    80008b0e:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80008b12:	fe842703          	lw	a4,-24(s0)
    80008b16:	c398                	sw	a4,0(a5)

  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    80008b18:	100017b7          	lui	a5,0x10001
    80008b1c:	02878793          	addi	a5,a5,40 # 10001028 <_entry-0x6fffefd8>
    80008b20:	6705                	lui	a4,0x1
    80008b22:	c398                	sw	a4,0(a5)

  // initialize queue 0.
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    80008b24:	100017b7          	lui	a5,0x10001
    80008b28:	03078793          	addi	a5,a5,48 # 10001030 <_entry-0x6fffefd0>
    80008b2c:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    80008b30:	100017b7          	lui	a5,0x10001
    80008b34:	03478793          	addi	a5,a5,52 # 10001034 <_entry-0x6fffefcc>
    80008b38:	439c                	lw	a5,0(a5)
    80008b3a:	fcf42e23          	sw	a5,-36(s0)
  if(max == 0)
    80008b3e:	fdc42783          	lw	a5,-36(s0)
    80008b42:	2781                	sext.w	a5,a5
    80008b44:	eb89                	bnez	a5,80008b56 <virtio_disk_init+0x1b4>
    panic("virtio disk has no queue 0");
    80008b46:	00003517          	auipc	a0,0x3
    80008b4a:	baa50513          	addi	a0,a0,-1110 # 8000b6f0 <etext+0x6f0>
    80008b4e:	ffff8097          	auipc	ra,0xffff8
    80008b52:	130080e7          	jalr	304(ra) # 80000c7e <panic>
  if(max < NUM)
    80008b56:	fdc42783          	lw	a5,-36(s0)
    80008b5a:	0007871b          	sext.w	a4,a5
    80008b5e:	479d                	li	a5,7
    80008b60:	00e7ea63          	bltu	a5,a4,80008b74 <virtio_disk_init+0x1d2>
    panic("virtio disk max queue too short");
    80008b64:	00003517          	auipc	a0,0x3
    80008b68:	bac50513          	addi	a0,a0,-1108 # 8000b710 <etext+0x710>
    80008b6c:	ffff8097          	auipc	ra,0xffff8
    80008b70:	112080e7          	jalr	274(ra) # 80000c7e <panic>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    80008b74:	100017b7          	lui	a5,0x10001
    80008b78:	03878793          	addi	a5,a5,56 # 10001038 <_entry-0x6fffefc8>
    80008b7c:	4721                	li	a4,8
    80008b7e:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    80008b80:	6609                	lui	a2,0x2
    80008b82:	4581                	li	a1,0
    80008b84:	0001d517          	auipc	a0,0x1d
    80008b88:	47c50513          	addi	a0,a0,1148 # 80026000 <disk>
    80008b8c:	ffff9097          	auipc	ra,0xffff9
    80008b90:	8b6080e7          	jalr	-1866(ra) # 80001442 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    80008b94:	0001d797          	auipc	a5,0x1d
    80008b98:	46c78793          	addi	a5,a5,1132 # 80026000 <disk>
    80008b9c:	00c7d713          	srli	a4,a5,0xc
    80008ba0:	100017b7          	lui	a5,0x10001
    80008ba4:	04078793          	addi	a5,a5,64 # 10001040 <_entry-0x6fffefc0>
    80008ba8:	2701                	sext.w	a4,a4
    80008baa:	c398                	sw	a4,0(a5)

  // desc = pages -- num * virtq_desc
  // avail = pages + 0x40 -- 2 * uint16, then num * uint16
  // used = pages + 4096 -- 2 * uint16, then num * vRingUsedElem

  disk.desc = (struct virtq_desc *) disk.pages;
    80008bac:	0001d717          	auipc	a4,0x1d
    80008bb0:	45470713          	addi	a4,a4,1108 # 80026000 <disk>
    80008bb4:	6789                	lui	a5,0x2
    80008bb6:	97ba                	add	a5,a5,a4
    80008bb8:	0001d717          	auipc	a4,0x1d
    80008bbc:	44870713          	addi	a4,a4,1096 # 80026000 <disk>
    80008bc0:	e398                	sd	a4,0(a5)
  disk.avail = (struct virtq_avail *)(disk.pages + NUM*sizeof(struct virtq_desc));
    80008bc2:	0001d717          	auipc	a4,0x1d
    80008bc6:	4be70713          	addi	a4,a4,1214 # 80026080 <disk+0x80>
    80008bca:	0001d697          	auipc	a3,0x1d
    80008bce:	43668693          	addi	a3,a3,1078 # 80026000 <disk>
    80008bd2:	6789                	lui	a5,0x2
    80008bd4:	97b6                	add	a5,a5,a3
    80008bd6:	e798                	sd	a4,8(a5)
  disk.used = (struct virtq_used *) (disk.pages + PGSIZE);
    80008bd8:	0001e717          	auipc	a4,0x1e
    80008bdc:	42870713          	addi	a4,a4,1064 # 80027000 <disk+0x1000>
    80008be0:	0001d697          	auipc	a3,0x1d
    80008be4:	42068693          	addi	a3,a3,1056 # 80026000 <disk>
    80008be8:	6789                	lui	a5,0x2
    80008bea:	97b6                	add	a5,a5,a3
    80008bec:	eb98                	sd	a4,16(a5)

  // all NUM descriptors start out unused.
  for(int i = 0; i < NUM; i++)
    80008bee:	fe042623          	sw	zero,-20(s0)
    80008bf2:	a015                	j	80008c16 <virtio_disk_init+0x274>
    disk.free[i] = 1;
    80008bf4:	0001d717          	auipc	a4,0x1d
    80008bf8:	40c70713          	addi	a4,a4,1036 # 80026000 <disk>
    80008bfc:	fec42783          	lw	a5,-20(s0)
    80008c00:	97ba                	add	a5,a5,a4
    80008c02:	6709                	lui	a4,0x2
    80008c04:	97ba                	add	a5,a5,a4
    80008c06:	4705                	li	a4,1
    80008c08:	00e78c23          	sb	a4,24(a5) # 2018 <_entry-0x7fffdfe8>
  for(int i = 0; i < NUM; i++)
    80008c0c:	fec42783          	lw	a5,-20(s0)
    80008c10:	2785                	addiw	a5,a5,1
    80008c12:	fef42623          	sw	a5,-20(s0)
    80008c16:	fec42783          	lw	a5,-20(s0)
    80008c1a:	0007871b          	sext.w	a4,a5
    80008c1e:	479d                	li	a5,7
    80008c20:	fce7dae3          	bge	a5,a4,80008bf4 <virtio_disk_init+0x252>

  // plic.c and trap.c arrange for interrupts from VIRTIO0_IRQ.
}
    80008c24:	0001                	nop
    80008c26:	0001                	nop
    80008c28:	70a2                	ld	ra,40(sp)
    80008c2a:	7402                	ld	s0,32(sp)
    80008c2c:	6145                	addi	sp,sp,48
    80008c2e:	8082                	ret

0000000080008c30 <alloc_desc>:

// find a free descriptor, mark it non-free, return its index.
static int
alloc_desc()
{
    80008c30:	1101                	addi	sp,sp,-32
    80008c32:	ec22                	sd	s0,24(sp)
    80008c34:	1000                	addi	s0,sp,32
  for(int i = 0; i < NUM; i++){
    80008c36:	fe042623          	sw	zero,-20(s0)
    80008c3a:	a081                	j	80008c7a <alloc_desc+0x4a>
    if(disk.free[i]){
    80008c3c:	0001d717          	auipc	a4,0x1d
    80008c40:	3c470713          	addi	a4,a4,964 # 80026000 <disk>
    80008c44:	fec42783          	lw	a5,-20(s0)
    80008c48:	97ba                	add	a5,a5,a4
    80008c4a:	6709                	lui	a4,0x2
    80008c4c:	97ba                	add	a5,a5,a4
    80008c4e:	0187c783          	lbu	a5,24(a5)
    80008c52:	cf99                	beqz	a5,80008c70 <alloc_desc+0x40>
      disk.free[i] = 0;
    80008c54:	0001d717          	auipc	a4,0x1d
    80008c58:	3ac70713          	addi	a4,a4,940 # 80026000 <disk>
    80008c5c:	fec42783          	lw	a5,-20(s0)
    80008c60:	97ba                	add	a5,a5,a4
    80008c62:	6709                	lui	a4,0x2
    80008c64:	97ba                	add	a5,a5,a4
    80008c66:	00078c23          	sb	zero,24(a5)
      return i;
    80008c6a:	fec42783          	lw	a5,-20(s0)
    80008c6e:	a831                	j	80008c8a <alloc_desc+0x5a>
  for(int i = 0; i < NUM; i++){
    80008c70:	fec42783          	lw	a5,-20(s0)
    80008c74:	2785                	addiw	a5,a5,1
    80008c76:	fef42623          	sw	a5,-20(s0)
    80008c7a:	fec42783          	lw	a5,-20(s0)
    80008c7e:	0007871b          	sext.w	a4,a5
    80008c82:	479d                	li	a5,7
    80008c84:	fae7dce3          	bge	a5,a4,80008c3c <alloc_desc+0xc>
    }
  }
  return -1;
    80008c88:	57fd                	li	a5,-1
}
    80008c8a:	853e                	mv	a0,a5
    80008c8c:	6462                	ld	s0,24(sp)
    80008c8e:	6105                	addi	sp,sp,32
    80008c90:	8082                	ret

0000000080008c92 <free_desc>:

// mark a descriptor as free.
static void
free_desc(int i)
{
    80008c92:	1101                	addi	sp,sp,-32
    80008c94:	ec06                	sd	ra,24(sp)
    80008c96:	e822                	sd	s0,16(sp)
    80008c98:	1000                	addi	s0,sp,32
    80008c9a:	87aa                	mv	a5,a0
    80008c9c:	fef42623          	sw	a5,-20(s0)
  if(i >= NUM)
    80008ca0:	fec42783          	lw	a5,-20(s0)
    80008ca4:	0007871b          	sext.w	a4,a5
    80008ca8:	479d                	li	a5,7
    80008caa:	00e7da63          	bge	a5,a4,80008cbe <free_desc+0x2c>
    panic("free_desc 1");
    80008cae:	00003517          	auipc	a0,0x3
    80008cb2:	a8250513          	addi	a0,a0,-1406 # 8000b730 <etext+0x730>
    80008cb6:	ffff8097          	auipc	ra,0xffff8
    80008cba:	fc8080e7          	jalr	-56(ra) # 80000c7e <panic>
  if(disk.free[i])
    80008cbe:	0001d717          	auipc	a4,0x1d
    80008cc2:	34270713          	addi	a4,a4,834 # 80026000 <disk>
    80008cc6:	fec42783          	lw	a5,-20(s0)
    80008cca:	97ba                	add	a5,a5,a4
    80008ccc:	6709                	lui	a4,0x2
    80008cce:	97ba                	add	a5,a5,a4
    80008cd0:	0187c783          	lbu	a5,24(a5)
    80008cd4:	cb89                	beqz	a5,80008ce6 <free_desc+0x54>
    panic("free_desc 2");
    80008cd6:	00003517          	auipc	a0,0x3
    80008cda:	a6a50513          	addi	a0,a0,-1430 # 8000b740 <etext+0x740>
    80008cde:	ffff8097          	auipc	ra,0xffff8
    80008ce2:	fa0080e7          	jalr	-96(ra) # 80000c7e <panic>
  disk.desc[i].addr = 0;
    80008ce6:	0001d717          	auipc	a4,0x1d
    80008cea:	31a70713          	addi	a4,a4,794 # 80026000 <disk>
    80008cee:	6789                	lui	a5,0x2
    80008cf0:	97ba                	add	a5,a5,a4
    80008cf2:	6398                	ld	a4,0(a5)
    80008cf4:	fec42783          	lw	a5,-20(s0)
    80008cf8:	0792                	slli	a5,a5,0x4
    80008cfa:	97ba                	add	a5,a5,a4
    80008cfc:	0007b023          	sd	zero,0(a5) # 2000 <_entry-0x7fffe000>
  disk.desc[i].len = 0;
    80008d00:	0001d717          	auipc	a4,0x1d
    80008d04:	30070713          	addi	a4,a4,768 # 80026000 <disk>
    80008d08:	6789                	lui	a5,0x2
    80008d0a:	97ba                	add	a5,a5,a4
    80008d0c:	6398                	ld	a4,0(a5)
    80008d0e:	fec42783          	lw	a5,-20(s0)
    80008d12:	0792                	slli	a5,a5,0x4
    80008d14:	97ba                	add	a5,a5,a4
    80008d16:	0007a423          	sw	zero,8(a5) # 2008 <_entry-0x7fffdff8>
  disk.desc[i].flags = 0;
    80008d1a:	0001d717          	auipc	a4,0x1d
    80008d1e:	2e670713          	addi	a4,a4,742 # 80026000 <disk>
    80008d22:	6789                	lui	a5,0x2
    80008d24:	97ba                	add	a5,a5,a4
    80008d26:	6398                	ld	a4,0(a5)
    80008d28:	fec42783          	lw	a5,-20(s0)
    80008d2c:	0792                	slli	a5,a5,0x4
    80008d2e:	97ba                	add	a5,a5,a4
    80008d30:	00079623          	sh	zero,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[i].next = 0;
    80008d34:	0001d717          	auipc	a4,0x1d
    80008d38:	2cc70713          	addi	a4,a4,716 # 80026000 <disk>
    80008d3c:	6789                	lui	a5,0x2
    80008d3e:	97ba                	add	a5,a5,a4
    80008d40:	6398                	ld	a4,0(a5)
    80008d42:	fec42783          	lw	a5,-20(s0)
    80008d46:	0792                	slli	a5,a5,0x4
    80008d48:	97ba                	add	a5,a5,a4
    80008d4a:	00079723          	sh	zero,14(a5) # 200e <_entry-0x7fffdff2>
  disk.free[i] = 1;
    80008d4e:	0001d717          	auipc	a4,0x1d
    80008d52:	2b270713          	addi	a4,a4,690 # 80026000 <disk>
    80008d56:	fec42783          	lw	a5,-20(s0)
    80008d5a:	97ba                	add	a5,a5,a4
    80008d5c:	6709                	lui	a4,0x2
    80008d5e:	97ba                	add	a5,a5,a4
    80008d60:	4705                	li	a4,1
    80008d62:	00e78c23          	sb	a4,24(a5)
  wakeup(&disk.free[0]);
    80008d66:	0001f517          	auipc	a0,0x1f
    80008d6a:	2b250513          	addi	a0,a0,690 # 80028018 <disk+0x2018>
    80008d6e:	ffffa097          	auipc	ra,0xffffa
    80008d72:	7b2080e7          	jalr	1970(ra) # 80003520 <wakeup>
}
    80008d76:	0001                	nop
    80008d78:	60e2                	ld	ra,24(sp)
    80008d7a:	6442                	ld	s0,16(sp)
    80008d7c:	6105                	addi	sp,sp,32
    80008d7e:	8082                	ret

0000000080008d80 <free_chain>:

// free a chain of descriptors.
static void
free_chain(int i)
{
    80008d80:	7179                	addi	sp,sp,-48
    80008d82:	f406                	sd	ra,40(sp)
    80008d84:	f022                	sd	s0,32(sp)
    80008d86:	1800                	addi	s0,sp,48
    80008d88:	87aa                	mv	a5,a0
    80008d8a:	fcf42e23          	sw	a5,-36(s0)
  while(1){
    int flag = disk.desc[i].flags;
    80008d8e:	0001d717          	auipc	a4,0x1d
    80008d92:	27270713          	addi	a4,a4,626 # 80026000 <disk>
    80008d96:	6789                	lui	a5,0x2
    80008d98:	97ba                	add	a5,a5,a4
    80008d9a:	6398                	ld	a4,0(a5)
    80008d9c:	fdc42783          	lw	a5,-36(s0)
    80008da0:	0792                	slli	a5,a5,0x4
    80008da2:	97ba                	add	a5,a5,a4
    80008da4:	00c7d783          	lhu	a5,12(a5) # 200c <_entry-0x7fffdff4>
    80008da8:	fef42623          	sw	a5,-20(s0)
    int nxt = disk.desc[i].next;
    80008dac:	0001d717          	auipc	a4,0x1d
    80008db0:	25470713          	addi	a4,a4,596 # 80026000 <disk>
    80008db4:	6789                	lui	a5,0x2
    80008db6:	97ba                	add	a5,a5,a4
    80008db8:	6398                	ld	a4,0(a5)
    80008dba:	fdc42783          	lw	a5,-36(s0)
    80008dbe:	0792                	slli	a5,a5,0x4
    80008dc0:	97ba                	add	a5,a5,a4
    80008dc2:	00e7d783          	lhu	a5,14(a5) # 200e <_entry-0x7fffdff2>
    80008dc6:	fef42423          	sw	a5,-24(s0)
    free_desc(i);
    80008dca:	fdc42783          	lw	a5,-36(s0)
    80008dce:	853e                	mv	a0,a5
    80008dd0:	00000097          	auipc	ra,0x0
    80008dd4:	ec2080e7          	jalr	-318(ra) # 80008c92 <free_desc>
    if(flag & VRING_DESC_F_NEXT)
    80008dd8:	fec42783          	lw	a5,-20(s0)
    80008ddc:	8b85                	andi	a5,a5,1
    80008dde:	2781                	sext.w	a5,a5
    80008de0:	c791                	beqz	a5,80008dec <free_chain+0x6c>
      i = nxt;
    80008de2:	fe842783          	lw	a5,-24(s0)
    80008de6:	fcf42e23          	sw	a5,-36(s0)
  while(1){
    80008dea:	b755                	j	80008d8e <free_chain+0xe>
    else
      break;
    80008dec:	0001                	nop
  }
}
    80008dee:	0001                	nop
    80008df0:	70a2                	ld	ra,40(sp)
    80008df2:	7402                	ld	s0,32(sp)
    80008df4:	6145                	addi	sp,sp,48
    80008df6:	8082                	ret

0000000080008df8 <alloc3_desc>:

// allocate three descriptors (they need not be contiguous).
// disk transfers always use three descriptors.
static int
alloc3_desc(int *idx)
{
    80008df8:	7139                	addi	sp,sp,-64
    80008dfa:	fc06                	sd	ra,56(sp)
    80008dfc:	f822                	sd	s0,48(sp)
    80008dfe:	f426                	sd	s1,40(sp)
    80008e00:	0080                	addi	s0,sp,64
    80008e02:	fca43423          	sd	a0,-56(s0)
  for(int i = 0; i < 3; i++){
    80008e06:	fc042e23          	sw	zero,-36(s0)
    80008e0a:	a895                	j	80008e7e <alloc3_desc+0x86>
    idx[i] = alloc_desc();
    80008e0c:	fdc42783          	lw	a5,-36(s0)
    80008e10:	078a                	slli	a5,a5,0x2
    80008e12:	fc843703          	ld	a4,-56(s0)
    80008e16:	00f704b3          	add	s1,a4,a5
    80008e1a:	00000097          	auipc	ra,0x0
    80008e1e:	e16080e7          	jalr	-490(ra) # 80008c30 <alloc_desc>
    80008e22:	87aa                	mv	a5,a0
    80008e24:	c09c                	sw	a5,0(s1)
    if(idx[i] < 0){
    80008e26:	fdc42783          	lw	a5,-36(s0)
    80008e2a:	078a                	slli	a5,a5,0x2
    80008e2c:	fc843703          	ld	a4,-56(s0)
    80008e30:	97ba                	add	a5,a5,a4
    80008e32:	439c                	lw	a5,0(a5)
    80008e34:	0407d063          	bgez	a5,80008e74 <alloc3_desc+0x7c>
      for(int j = 0; j < i; j++)
    80008e38:	fc042c23          	sw	zero,-40(s0)
    80008e3c:	a015                	j	80008e60 <alloc3_desc+0x68>
        free_desc(idx[j]);
    80008e3e:	fd842783          	lw	a5,-40(s0)
    80008e42:	078a                	slli	a5,a5,0x2
    80008e44:	fc843703          	ld	a4,-56(s0)
    80008e48:	97ba                	add	a5,a5,a4
    80008e4a:	439c                	lw	a5,0(a5)
    80008e4c:	853e                	mv	a0,a5
    80008e4e:	00000097          	auipc	ra,0x0
    80008e52:	e44080e7          	jalr	-444(ra) # 80008c92 <free_desc>
      for(int j = 0; j < i; j++)
    80008e56:	fd842783          	lw	a5,-40(s0)
    80008e5a:	2785                	addiw	a5,a5,1
    80008e5c:	fcf42c23          	sw	a5,-40(s0)
    80008e60:	fd842703          	lw	a4,-40(s0)
    80008e64:	fdc42783          	lw	a5,-36(s0)
    80008e68:	2701                	sext.w	a4,a4
    80008e6a:	2781                	sext.w	a5,a5
    80008e6c:	fcf749e3          	blt	a4,a5,80008e3e <alloc3_desc+0x46>
      return -1;
    80008e70:	57fd                	li	a5,-1
    80008e72:	a831                	j	80008e8e <alloc3_desc+0x96>
  for(int i = 0; i < 3; i++){
    80008e74:	fdc42783          	lw	a5,-36(s0)
    80008e78:	2785                	addiw	a5,a5,1
    80008e7a:	fcf42e23          	sw	a5,-36(s0)
    80008e7e:	fdc42783          	lw	a5,-36(s0)
    80008e82:	0007871b          	sext.w	a4,a5
    80008e86:	4789                	li	a5,2
    80008e88:	f8e7d2e3          	bge	a5,a4,80008e0c <alloc3_desc+0x14>
    }
  }
  return 0;
    80008e8c:	4781                	li	a5,0
}
    80008e8e:	853e                	mv	a0,a5
    80008e90:	70e2                	ld	ra,56(sp)
    80008e92:	7442                	ld	s0,48(sp)
    80008e94:	74a2                	ld	s1,40(sp)
    80008e96:	6121                	addi	sp,sp,64
    80008e98:	8082                	ret

0000000080008e9a <virtio_disk_rw>:

void
virtio_disk_rw(struct buf *b, int write)
{
    80008e9a:	7139                	addi	sp,sp,-64
    80008e9c:	fc06                	sd	ra,56(sp)
    80008e9e:	f822                	sd	s0,48(sp)
    80008ea0:	0080                	addi	s0,sp,64
    80008ea2:	fca43423          	sd	a0,-56(s0)
    80008ea6:	87ae                	mv	a5,a1
    80008ea8:	fcf42223          	sw	a5,-60(s0)
  uint64 sector = b->blockno * (BSIZE / 512);
    80008eac:	fc843783          	ld	a5,-56(s0)
    80008eb0:	47dc                	lw	a5,12(a5)
    80008eb2:	0017979b          	slliw	a5,a5,0x1
    80008eb6:	2781                	sext.w	a5,a5
    80008eb8:	1782                	slli	a5,a5,0x20
    80008eba:	9381                	srli	a5,a5,0x20
    80008ebc:	fef43423          	sd	a5,-24(s0)

  acquire(&disk.vdisk_lock);
    80008ec0:	0001f517          	auipc	a0,0x1f
    80008ec4:	26850513          	addi	a0,a0,616 # 80028128 <disk+0x2128>
    80008ec8:	ffff8097          	auipc	ra,0xffff8
    80008ecc:	3a6080e7          	jalr	934(ra) # 8000126e <acquire>
  // data, one for a 1-byte status result.

  // allocate the three descriptors.
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
    80008ed0:	fd040793          	addi	a5,s0,-48
    80008ed4:	853e                	mv	a0,a5
    80008ed6:	00000097          	auipc	ra,0x0
    80008eda:	f22080e7          	jalr	-222(ra) # 80008df8 <alloc3_desc>
    80008ede:	87aa                	mv	a5,a0
    80008ee0:	cf91                	beqz	a5,80008efc <virtio_disk_rw+0x62>
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    80008ee2:	0001f597          	auipc	a1,0x1f
    80008ee6:	24658593          	addi	a1,a1,582 # 80028128 <disk+0x2128>
    80008eea:	0001f517          	auipc	a0,0x1f
    80008eee:	12e50513          	addi	a0,a0,302 # 80028018 <disk+0x2018>
    80008ef2:	ffffa097          	auipc	ra,0xffffa
    80008ef6:	5b2080e7          	jalr	1458(ra) # 800034a4 <sleep>
    if(alloc3_desc(idx) == 0) {
    80008efa:	bfd9                	j	80008ed0 <virtio_disk_rw+0x36>
      break;
    80008efc:	0001                	nop
  }

  // format the three descriptors.
  // qemu's virtio-blk.c reads them.

  struct virtio_blk_req *buf0 = &disk.ops[idx[0]];
    80008efe:	fd042783          	lw	a5,-48(s0)
    80008f02:	20078793          	addi	a5,a5,512
    80008f06:	00479713          	slli	a4,a5,0x4
    80008f0a:	0001d797          	auipc	a5,0x1d
    80008f0e:	0f678793          	addi	a5,a5,246 # 80026000 <disk>
    80008f12:	97ba                	add	a5,a5,a4
    80008f14:	0a878793          	addi	a5,a5,168
    80008f18:	fef43023          	sd	a5,-32(s0)

  if(write)
    80008f1c:	fc442783          	lw	a5,-60(s0)
    80008f20:	2781                	sext.w	a5,a5
    80008f22:	c791                	beqz	a5,80008f2e <virtio_disk_rw+0x94>
    buf0->type = VIRTIO_BLK_T_OUT; // write the disk
    80008f24:	fe043783          	ld	a5,-32(s0)
    80008f28:	4705                	li	a4,1
    80008f2a:	c398                	sw	a4,0(a5)
    80008f2c:	a029                	j	80008f36 <virtio_disk_rw+0x9c>
  else
    buf0->type = VIRTIO_BLK_T_IN; // read the disk
    80008f2e:	fe043783          	ld	a5,-32(s0)
    80008f32:	0007a023          	sw	zero,0(a5)
  buf0->reserved = 0;
    80008f36:	fe043783          	ld	a5,-32(s0)
    80008f3a:	0007a223          	sw	zero,4(a5)
  buf0->sector = sector;
    80008f3e:	fe043783          	ld	a5,-32(s0)
    80008f42:	fe843703          	ld	a4,-24(s0)
    80008f46:	e798                	sd	a4,8(a5)

  disk.desc[idx[0]].addr = (uint64) buf0;
    80008f48:	0001d717          	auipc	a4,0x1d
    80008f4c:	0b870713          	addi	a4,a4,184 # 80026000 <disk>
    80008f50:	6789                	lui	a5,0x2
    80008f52:	97ba                	add	a5,a5,a4
    80008f54:	6398                	ld	a4,0(a5)
    80008f56:	fd042783          	lw	a5,-48(s0)
    80008f5a:	0792                	slli	a5,a5,0x4
    80008f5c:	97ba                	add	a5,a5,a4
    80008f5e:	fe043703          	ld	a4,-32(s0)
    80008f62:	e398                	sd	a4,0(a5)
  disk.desc[idx[0]].len = sizeof(struct virtio_blk_req);
    80008f64:	0001d717          	auipc	a4,0x1d
    80008f68:	09c70713          	addi	a4,a4,156 # 80026000 <disk>
    80008f6c:	6789                	lui	a5,0x2
    80008f6e:	97ba                	add	a5,a5,a4
    80008f70:	6398                	ld	a4,0(a5)
    80008f72:	fd042783          	lw	a5,-48(s0)
    80008f76:	0792                	slli	a5,a5,0x4
    80008f78:	97ba                	add	a5,a5,a4
    80008f7a:	4741                	li	a4,16
    80008f7c:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    80008f7e:	0001d717          	auipc	a4,0x1d
    80008f82:	08270713          	addi	a4,a4,130 # 80026000 <disk>
    80008f86:	6789                	lui	a5,0x2
    80008f88:	97ba                	add	a5,a5,a4
    80008f8a:	6398                	ld	a4,0(a5)
    80008f8c:	fd042783          	lw	a5,-48(s0)
    80008f90:	0792                	slli	a5,a5,0x4
    80008f92:	97ba                	add	a5,a5,a4
    80008f94:	4705                	li	a4,1
    80008f96:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[0]].next = idx[1];
    80008f9a:	fd442683          	lw	a3,-44(s0)
    80008f9e:	0001d717          	auipc	a4,0x1d
    80008fa2:	06270713          	addi	a4,a4,98 # 80026000 <disk>
    80008fa6:	6789                	lui	a5,0x2
    80008fa8:	97ba                	add	a5,a5,a4
    80008faa:	6398                	ld	a4,0(a5)
    80008fac:	fd042783          	lw	a5,-48(s0)
    80008fb0:	0792                	slli	a5,a5,0x4
    80008fb2:	97ba                	add	a5,a5,a4
    80008fb4:	03069713          	slli	a4,a3,0x30
    80008fb8:	9341                	srli	a4,a4,0x30
    80008fba:	00e79723          	sh	a4,14(a5) # 200e <_entry-0x7fffdff2>

  disk.desc[idx[1]].addr = (uint64) b->data;
    80008fbe:	fc843783          	ld	a5,-56(s0)
    80008fc2:	05878693          	addi	a3,a5,88
    80008fc6:	0001d717          	auipc	a4,0x1d
    80008fca:	03a70713          	addi	a4,a4,58 # 80026000 <disk>
    80008fce:	6789                	lui	a5,0x2
    80008fd0:	97ba                	add	a5,a5,a4
    80008fd2:	6398                	ld	a4,0(a5)
    80008fd4:	fd442783          	lw	a5,-44(s0)
    80008fd8:	0792                	slli	a5,a5,0x4
    80008fda:	97ba                	add	a5,a5,a4
    80008fdc:	8736                	mv	a4,a3
    80008fde:	e398                	sd	a4,0(a5)
  disk.desc[idx[1]].len = BSIZE;
    80008fe0:	0001d717          	auipc	a4,0x1d
    80008fe4:	02070713          	addi	a4,a4,32 # 80026000 <disk>
    80008fe8:	6789                	lui	a5,0x2
    80008fea:	97ba                	add	a5,a5,a4
    80008fec:	6398                	ld	a4,0(a5)
    80008fee:	fd442783          	lw	a5,-44(s0)
    80008ff2:	0792                	slli	a5,a5,0x4
    80008ff4:	97ba                	add	a5,a5,a4
    80008ff6:	40000713          	li	a4,1024
    80008ffa:	c798                	sw	a4,8(a5)
  if(write)
    80008ffc:	fc442783          	lw	a5,-60(s0)
    80009000:	2781                	sext.w	a5,a5
    80009002:	cf99                	beqz	a5,80009020 <virtio_disk_rw+0x186>
    disk.desc[idx[1]].flags = 0; // device reads b->data
    80009004:	0001d717          	auipc	a4,0x1d
    80009008:	ffc70713          	addi	a4,a4,-4 # 80026000 <disk>
    8000900c:	6789                	lui	a5,0x2
    8000900e:	97ba                	add	a5,a5,a4
    80009010:	6398                	ld	a4,0(a5)
    80009012:	fd442783          	lw	a5,-44(s0)
    80009016:	0792                	slli	a5,a5,0x4
    80009018:	97ba                	add	a5,a5,a4
    8000901a:	00079623          	sh	zero,12(a5) # 200c <_entry-0x7fffdff4>
    8000901e:	a839                	j	8000903c <virtio_disk_rw+0x1a2>
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80009020:	0001d717          	auipc	a4,0x1d
    80009024:	fe070713          	addi	a4,a4,-32 # 80026000 <disk>
    80009028:	6789                	lui	a5,0x2
    8000902a:	97ba                	add	a5,a5,a4
    8000902c:	6398                	ld	a4,0(a5)
    8000902e:	fd442783          	lw	a5,-44(s0)
    80009032:	0792                	slli	a5,a5,0x4
    80009034:	97ba                	add	a5,a5,a4
    80009036:	4709                	li	a4,2
    80009038:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    8000903c:	0001d717          	auipc	a4,0x1d
    80009040:	fc470713          	addi	a4,a4,-60 # 80026000 <disk>
    80009044:	6789                	lui	a5,0x2
    80009046:	97ba                	add	a5,a5,a4
    80009048:	6398                	ld	a4,0(a5)
    8000904a:	fd442783          	lw	a5,-44(s0)
    8000904e:	0792                	slli	a5,a5,0x4
    80009050:	97ba                	add	a5,a5,a4
    80009052:	00c7d703          	lhu	a4,12(a5) # 200c <_entry-0x7fffdff4>
    80009056:	0001d697          	auipc	a3,0x1d
    8000905a:	faa68693          	addi	a3,a3,-86 # 80026000 <disk>
    8000905e:	6789                	lui	a5,0x2
    80009060:	97b6                	add	a5,a5,a3
    80009062:	6394                	ld	a3,0(a5)
    80009064:	fd442783          	lw	a5,-44(s0)
    80009068:	0792                	slli	a5,a5,0x4
    8000906a:	97b6                	add	a5,a5,a3
    8000906c:	00176713          	ori	a4,a4,1
    80009070:	1742                	slli	a4,a4,0x30
    80009072:	9341                	srli	a4,a4,0x30
    80009074:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[1]].next = idx[2];
    80009078:	fd842683          	lw	a3,-40(s0)
    8000907c:	0001d717          	auipc	a4,0x1d
    80009080:	f8470713          	addi	a4,a4,-124 # 80026000 <disk>
    80009084:	6789                	lui	a5,0x2
    80009086:	97ba                	add	a5,a5,a4
    80009088:	6398                	ld	a4,0(a5)
    8000908a:	fd442783          	lw	a5,-44(s0)
    8000908e:	0792                	slli	a5,a5,0x4
    80009090:	97ba                	add	a5,a5,a4
    80009092:	03069713          	slli	a4,a3,0x30
    80009096:	9341                	srli	a4,a4,0x30
    80009098:	00e79723          	sh	a4,14(a5) # 200e <_entry-0x7fffdff2>

  disk.info[idx[0]].status = 0xff; // device writes 0 on success
    8000909c:	fd042783          	lw	a5,-48(s0)
    800090a0:	0001d717          	auipc	a4,0x1d
    800090a4:	f6070713          	addi	a4,a4,-160 # 80026000 <disk>
    800090a8:	20078793          	addi	a5,a5,512
    800090ac:	0792                	slli	a5,a5,0x4
    800090ae:	97ba                	add	a5,a5,a4
    800090b0:	577d                	li	a4,-1
    800090b2:	02e78823          	sb	a4,48(a5)
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    800090b6:	fd042783          	lw	a5,-48(s0)
    800090ba:	20078793          	addi	a5,a5,512
    800090be:	00479713          	slli	a4,a5,0x4
    800090c2:	0001d797          	auipc	a5,0x1d
    800090c6:	f3e78793          	addi	a5,a5,-194 # 80026000 <disk>
    800090ca:	97ba                	add	a5,a5,a4
    800090cc:	03078693          	addi	a3,a5,48
    800090d0:	0001d717          	auipc	a4,0x1d
    800090d4:	f3070713          	addi	a4,a4,-208 # 80026000 <disk>
    800090d8:	6789                	lui	a5,0x2
    800090da:	97ba                	add	a5,a5,a4
    800090dc:	6398                	ld	a4,0(a5)
    800090de:	fd842783          	lw	a5,-40(s0)
    800090e2:	0792                	slli	a5,a5,0x4
    800090e4:	97ba                	add	a5,a5,a4
    800090e6:	8736                	mv	a4,a3
    800090e8:	e398                	sd	a4,0(a5)
  disk.desc[idx[2]].len = 1;
    800090ea:	0001d717          	auipc	a4,0x1d
    800090ee:	f1670713          	addi	a4,a4,-234 # 80026000 <disk>
    800090f2:	6789                	lui	a5,0x2
    800090f4:	97ba                	add	a5,a5,a4
    800090f6:	6398                	ld	a4,0(a5)
    800090f8:	fd842783          	lw	a5,-40(s0)
    800090fc:	0792                	slli	a5,a5,0x4
    800090fe:	97ba                	add	a5,a5,a4
    80009100:	4705                	li	a4,1
    80009102:	c798                	sw	a4,8(a5)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80009104:	0001d717          	auipc	a4,0x1d
    80009108:	efc70713          	addi	a4,a4,-260 # 80026000 <disk>
    8000910c:	6789                	lui	a5,0x2
    8000910e:	97ba                	add	a5,a5,a4
    80009110:	6398                	ld	a4,0(a5)
    80009112:	fd842783          	lw	a5,-40(s0)
    80009116:	0792                	slli	a5,a5,0x4
    80009118:	97ba                	add	a5,a5,a4
    8000911a:	4709                	li	a4,2
    8000911c:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[2]].next = 0;
    80009120:	0001d717          	auipc	a4,0x1d
    80009124:	ee070713          	addi	a4,a4,-288 # 80026000 <disk>
    80009128:	6789                	lui	a5,0x2
    8000912a:	97ba                	add	a5,a5,a4
    8000912c:	6398                	ld	a4,0(a5)
    8000912e:	fd842783          	lw	a5,-40(s0)
    80009132:	0792                	slli	a5,a5,0x4
    80009134:	97ba                	add	a5,a5,a4
    80009136:	00079723          	sh	zero,14(a5) # 200e <_entry-0x7fffdff2>

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    8000913a:	fc843783          	ld	a5,-56(s0)
    8000913e:	4705                	li	a4,1
    80009140:	c3d8                	sw	a4,4(a5)
  disk.info[idx[0]].b = b;
    80009142:	fd042783          	lw	a5,-48(s0)
    80009146:	0001d717          	auipc	a4,0x1d
    8000914a:	eba70713          	addi	a4,a4,-326 # 80026000 <disk>
    8000914e:	20078793          	addi	a5,a5,512
    80009152:	0792                	slli	a5,a5,0x4
    80009154:	97ba                	add	a5,a5,a4
    80009156:	fc843703          	ld	a4,-56(s0)
    8000915a:	f798                	sd	a4,40(a5)

  // tell the device the first index in our chain of descriptors.
  disk.avail->ring[disk.avail->idx % NUM] = idx[0];
    8000915c:	fd042603          	lw	a2,-48(s0)
    80009160:	0001d717          	auipc	a4,0x1d
    80009164:	ea070713          	addi	a4,a4,-352 # 80026000 <disk>
    80009168:	6789                	lui	a5,0x2
    8000916a:	97ba                	add	a5,a5,a4
    8000916c:	6794                	ld	a3,8(a5)
    8000916e:	0001d717          	auipc	a4,0x1d
    80009172:	e9270713          	addi	a4,a4,-366 # 80026000 <disk>
    80009176:	6789                	lui	a5,0x2
    80009178:	97ba                	add	a5,a5,a4
    8000917a:	679c                	ld	a5,8(a5)
    8000917c:	0027d783          	lhu	a5,2(a5) # 2002 <_entry-0x7fffdffe>
    80009180:	2781                	sext.w	a5,a5
    80009182:	8b9d                	andi	a5,a5,7
    80009184:	2781                	sext.w	a5,a5
    80009186:	03061713          	slli	a4,a2,0x30
    8000918a:	9341                	srli	a4,a4,0x30
    8000918c:	0786                	slli	a5,a5,0x1
    8000918e:	97b6                	add	a5,a5,a3
    80009190:	00e79223          	sh	a4,4(a5)

  __sync_synchronize();
    80009194:	0ff0000f          	fence

  // tell the device another avail ring entry is available.
  disk.avail->idx += 1; // not % NUM ...
    80009198:	0001d717          	auipc	a4,0x1d
    8000919c:	e6870713          	addi	a4,a4,-408 # 80026000 <disk>
    800091a0:	6789                	lui	a5,0x2
    800091a2:	97ba                	add	a5,a5,a4
    800091a4:	679c                	ld	a5,8(a5)
    800091a6:	0027d703          	lhu	a4,2(a5) # 2002 <_entry-0x7fffdffe>
    800091aa:	0001d697          	auipc	a3,0x1d
    800091ae:	e5668693          	addi	a3,a3,-426 # 80026000 <disk>
    800091b2:	6789                	lui	a5,0x2
    800091b4:	97b6                	add	a5,a5,a3
    800091b6:	679c                	ld	a5,8(a5)
    800091b8:	2705                	addiw	a4,a4,1
    800091ba:	1742                	slli	a4,a4,0x30
    800091bc:	9341                	srli	a4,a4,0x30
    800091be:	00e79123          	sh	a4,2(a5) # 2002 <_entry-0x7fffdffe>

  __sync_synchronize();
    800091c2:	0ff0000f          	fence

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    800091c6:	100017b7          	lui	a5,0x10001
    800091ca:	05078793          	addi	a5,a5,80 # 10001050 <_entry-0x6fffefb0>
    800091ce:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    800091d2:	a819                	j	800091e8 <virtio_disk_rw+0x34e>
    sleep(b, &disk.vdisk_lock);
    800091d4:	0001f597          	auipc	a1,0x1f
    800091d8:	f5458593          	addi	a1,a1,-172 # 80028128 <disk+0x2128>
    800091dc:	fc843503          	ld	a0,-56(s0)
    800091e0:	ffffa097          	auipc	ra,0xffffa
    800091e4:	2c4080e7          	jalr	708(ra) # 800034a4 <sleep>
  while(b->disk == 1) {
    800091e8:	fc843783          	ld	a5,-56(s0)
    800091ec:	43dc                	lw	a5,4(a5)
    800091ee:	873e                	mv	a4,a5
    800091f0:	4785                	li	a5,1
    800091f2:	fef701e3          	beq	a4,a5,800091d4 <virtio_disk_rw+0x33a>
  }

  disk.info[idx[0]].b = 0;
    800091f6:	fd042783          	lw	a5,-48(s0)
    800091fa:	0001d717          	auipc	a4,0x1d
    800091fe:	e0670713          	addi	a4,a4,-506 # 80026000 <disk>
    80009202:	20078793          	addi	a5,a5,512
    80009206:	0792                	slli	a5,a5,0x4
    80009208:	97ba                	add	a5,a5,a4
    8000920a:	0207b423          	sd	zero,40(a5)
  free_chain(idx[0]);
    8000920e:	fd042783          	lw	a5,-48(s0)
    80009212:	853e                	mv	a0,a5
    80009214:	00000097          	auipc	ra,0x0
    80009218:	b6c080e7          	jalr	-1172(ra) # 80008d80 <free_chain>

  release(&disk.vdisk_lock);
    8000921c:	0001f517          	auipc	a0,0x1f
    80009220:	f0c50513          	addi	a0,a0,-244 # 80028128 <disk+0x2128>
    80009224:	ffff8097          	auipc	ra,0xffff8
    80009228:	0ae080e7          	jalr	174(ra) # 800012d2 <release>
}
    8000922c:	0001                	nop
    8000922e:	70e2                	ld	ra,56(sp)
    80009230:	7442                	ld	s0,48(sp)
    80009232:	6121                	addi	sp,sp,64
    80009234:	8082                	ret

0000000080009236 <virtio_disk_intr>:

void
virtio_disk_intr()
{
    80009236:	1101                	addi	sp,sp,-32
    80009238:	ec06                	sd	ra,24(sp)
    8000923a:	e822                	sd	s0,16(sp)
    8000923c:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    8000923e:	0001f517          	auipc	a0,0x1f
    80009242:	eea50513          	addi	a0,a0,-278 # 80028128 <disk+0x2128>
    80009246:	ffff8097          	auipc	ra,0xffff8
    8000924a:	028080e7          	jalr	40(ra) # 8000126e <acquire>
  // we've seen this interrupt, which the following line does.
  // this may race with the device writing new entries to
  // the "used" ring, in which case we may process the new
  // completion entries in this interrupt, and have nothing to do
  // in the next interrupt, which is harmless.
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    8000924e:	100017b7          	lui	a5,0x10001
    80009252:	06078793          	addi	a5,a5,96 # 10001060 <_entry-0x6fffefa0>
    80009256:	439c                	lw	a5,0(a5)
    80009258:	0007871b          	sext.w	a4,a5
    8000925c:	100017b7          	lui	a5,0x10001
    80009260:	06478793          	addi	a5,a5,100 # 10001064 <_entry-0x6fffef9c>
    80009264:	8b0d                	andi	a4,a4,3
    80009266:	2701                	sext.w	a4,a4
    80009268:	c398                	sw	a4,0(a5)

  __sync_synchronize();
    8000926a:	0ff0000f          	fence

  // the device increments disk.used->idx when it
  // adds an entry to the used ring.

  while(disk.used_idx != disk.used->idx){
    8000926e:	a855                	j	80009322 <virtio_disk_intr+0xec>
    __sync_synchronize();
    80009270:	0ff0000f          	fence
    int id = disk.used->ring[disk.used_idx % NUM].id;
    80009274:	0001d717          	auipc	a4,0x1d
    80009278:	d8c70713          	addi	a4,a4,-628 # 80026000 <disk>
    8000927c:	6789                	lui	a5,0x2
    8000927e:	97ba                	add	a5,a5,a4
    80009280:	6b98                	ld	a4,16(a5)
    80009282:	0001d697          	auipc	a3,0x1d
    80009286:	d7e68693          	addi	a3,a3,-642 # 80026000 <disk>
    8000928a:	6789                	lui	a5,0x2
    8000928c:	97b6                	add	a5,a5,a3
    8000928e:	0207d783          	lhu	a5,32(a5) # 2020 <_entry-0x7fffdfe0>
    80009292:	2781                	sext.w	a5,a5
    80009294:	8b9d                	andi	a5,a5,7
    80009296:	2781                	sext.w	a5,a5
    80009298:	078e                	slli	a5,a5,0x3
    8000929a:	97ba                	add	a5,a5,a4
    8000929c:	43dc                	lw	a5,4(a5)
    8000929e:	fef42623          	sw	a5,-20(s0)

    if(disk.info[id].status != 0)
    800092a2:	0001d717          	auipc	a4,0x1d
    800092a6:	d5e70713          	addi	a4,a4,-674 # 80026000 <disk>
    800092aa:	fec42783          	lw	a5,-20(s0)
    800092ae:	20078793          	addi	a5,a5,512
    800092b2:	0792                	slli	a5,a5,0x4
    800092b4:	97ba                	add	a5,a5,a4
    800092b6:	0307c783          	lbu	a5,48(a5)
    800092ba:	cb89                	beqz	a5,800092cc <virtio_disk_intr+0x96>
      panic("virtio_disk_intr status");
    800092bc:	00002517          	auipc	a0,0x2
    800092c0:	49450513          	addi	a0,a0,1172 # 8000b750 <etext+0x750>
    800092c4:	ffff8097          	auipc	ra,0xffff8
    800092c8:	9ba080e7          	jalr	-1606(ra) # 80000c7e <panic>

    struct buf *b = disk.info[id].b;
    800092cc:	0001d717          	auipc	a4,0x1d
    800092d0:	d3470713          	addi	a4,a4,-716 # 80026000 <disk>
    800092d4:	fec42783          	lw	a5,-20(s0)
    800092d8:	20078793          	addi	a5,a5,512
    800092dc:	0792                	slli	a5,a5,0x4
    800092de:	97ba                	add	a5,a5,a4
    800092e0:	779c                	ld	a5,40(a5)
    800092e2:	fef43023          	sd	a5,-32(s0)
    b->disk = 0;   // disk is done with buf
    800092e6:	fe043783          	ld	a5,-32(s0)
    800092ea:	0007a223          	sw	zero,4(a5)
    wakeup(b);
    800092ee:	fe043503          	ld	a0,-32(s0)
    800092f2:	ffffa097          	auipc	ra,0xffffa
    800092f6:	22e080e7          	jalr	558(ra) # 80003520 <wakeup>

    disk.used_idx += 1;
    800092fa:	0001d717          	auipc	a4,0x1d
    800092fe:	d0670713          	addi	a4,a4,-762 # 80026000 <disk>
    80009302:	6789                	lui	a5,0x2
    80009304:	97ba                	add	a5,a5,a4
    80009306:	0207d783          	lhu	a5,32(a5) # 2020 <_entry-0x7fffdfe0>
    8000930a:	2785                	addiw	a5,a5,1
    8000930c:	03079713          	slli	a4,a5,0x30
    80009310:	9341                	srli	a4,a4,0x30
    80009312:	0001d697          	auipc	a3,0x1d
    80009316:	cee68693          	addi	a3,a3,-786 # 80026000 <disk>
    8000931a:	6789                	lui	a5,0x2
    8000931c:	97b6                	add	a5,a5,a3
    8000931e:	02e79023          	sh	a4,32(a5) # 2020 <_entry-0x7fffdfe0>
  while(disk.used_idx != disk.used->idx){
    80009322:	0001d717          	auipc	a4,0x1d
    80009326:	cde70713          	addi	a4,a4,-802 # 80026000 <disk>
    8000932a:	6789                	lui	a5,0x2
    8000932c:	97ba                	add	a5,a5,a4
    8000932e:	0207d683          	lhu	a3,32(a5) # 2020 <_entry-0x7fffdfe0>
    80009332:	0001d717          	auipc	a4,0x1d
    80009336:	cce70713          	addi	a4,a4,-818 # 80026000 <disk>
    8000933a:	6789                	lui	a5,0x2
    8000933c:	97ba                	add	a5,a5,a4
    8000933e:	6b9c                	ld	a5,16(a5)
    80009340:	0027d783          	lhu	a5,2(a5) # 2002 <_entry-0x7fffdffe>
    80009344:	0006871b          	sext.w	a4,a3
    80009348:	2781                	sext.w	a5,a5
    8000934a:	f2f713e3          	bne	a4,a5,80009270 <virtio_disk_intr+0x3a>
  }

  release(&disk.vdisk_lock);
    8000934e:	0001f517          	auipc	a0,0x1f
    80009352:	dda50513          	addi	a0,a0,-550 # 80028128 <disk+0x2128>
    80009356:	ffff8097          	auipc	ra,0xffff8
    8000935a:	f7c080e7          	jalr	-132(ra) # 800012d2 <release>
}
    8000935e:	0001                	nop
    80009360:	60e2                	ld	ra,24(sp)
    80009362:	6442                	ld	s0,16(sp)
    80009364:	6105                	addi	sp,sp,32
    80009366:	8082                	ret
	...

000000008000a000 <_trampoline>:
    8000a000:	14051573          	csrrw	a0,sscratch,a0
    8000a004:	02153423          	sd	ra,40(a0)
    8000a008:	02253823          	sd	sp,48(a0)
    8000a00c:	02353c23          	sd	gp,56(a0)
    8000a010:	04453023          	sd	tp,64(a0)
    8000a014:	04553423          	sd	t0,72(a0)
    8000a018:	04653823          	sd	t1,80(a0)
    8000a01c:	04753c23          	sd	t2,88(a0)
    8000a020:	f120                	sd	s0,96(a0)
    8000a022:	f524                	sd	s1,104(a0)
    8000a024:	fd2c                	sd	a1,120(a0)
    8000a026:	e150                	sd	a2,128(a0)
    8000a028:	e554                	sd	a3,136(a0)
    8000a02a:	e958                	sd	a4,144(a0)
    8000a02c:	ed5c                	sd	a5,152(a0)
    8000a02e:	0b053023          	sd	a6,160(a0)
    8000a032:	0b153423          	sd	a7,168(a0)
    8000a036:	0b253823          	sd	s2,176(a0)
    8000a03a:	0b353c23          	sd	s3,184(a0)
    8000a03e:	0d453023          	sd	s4,192(a0)
    8000a042:	0d553423          	sd	s5,200(a0)
    8000a046:	0d653823          	sd	s6,208(a0)
    8000a04a:	0d753c23          	sd	s7,216(a0)
    8000a04e:	0f853023          	sd	s8,224(a0)
    8000a052:	0f953423          	sd	s9,232(a0)
    8000a056:	0fa53823          	sd	s10,240(a0)
    8000a05a:	0fb53c23          	sd	s11,248(a0)
    8000a05e:	11c53023          	sd	t3,256(a0)
    8000a062:	11d53423          	sd	t4,264(a0)
    8000a066:	11e53823          	sd	t5,272(a0)
    8000a06a:	11f53c23          	sd	t6,280(a0)
    8000a06e:	140022f3          	csrr	t0,sscratch
    8000a072:	06553823          	sd	t0,112(a0)
    8000a076:	00853103          	ld	sp,8(a0)
    8000a07a:	02053203          	ld	tp,32(a0)
    8000a07e:	01053283          	ld	t0,16(a0)
    8000a082:	00053303          	ld	t1,0(a0)
    8000a086:	18031073          	csrw	satp,t1
    8000a08a:	12000073          	sfence.vma
    8000a08e:	8282                	jr	t0

000000008000a090 <userret>:
    8000a090:	18059073          	csrw	satp,a1
    8000a094:	12000073          	sfence.vma
    8000a098:	07053283          	ld	t0,112(a0)
    8000a09c:	14029073          	csrw	sscratch,t0
    8000a0a0:	02853083          	ld	ra,40(a0)
    8000a0a4:	03053103          	ld	sp,48(a0)
    8000a0a8:	03853183          	ld	gp,56(a0)
    8000a0ac:	04053203          	ld	tp,64(a0)
    8000a0b0:	04853283          	ld	t0,72(a0)
    8000a0b4:	05053303          	ld	t1,80(a0)
    8000a0b8:	05853383          	ld	t2,88(a0)
    8000a0bc:	7120                	ld	s0,96(a0)
    8000a0be:	7524                	ld	s1,104(a0)
    8000a0c0:	7d2c                	ld	a1,120(a0)
    8000a0c2:	6150                	ld	a2,128(a0)
    8000a0c4:	6554                	ld	a3,136(a0)
    8000a0c6:	6958                	ld	a4,144(a0)
    8000a0c8:	6d5c                	ld	a5,152(a0)
    8000a0ca:	0a053803          	ld	a6,160(a0)
    8000a0ce:	0a853883          	ld	a7,168(a0)
    8000a0d2:	0b053903          	ld	s2,176(a0)
    8000a0d6:	0b853983          	ld	s3,184(a0)
    8000a0da:	0c053a03          	ld	s4,192(a0)
    8000a0de:	0c853a83          	ld	s5,200(a0)
    8000a0e2:	0d053b03          	ld	s6,208(a0)
    8000a0e6:	0d853b83          	ld	s7,216(a0)
    8000a0ea:	0e053c03          	ld	s8,224(a0)
    8000a0ee:	0e853c83          	ld	s9,232(a0)
    8000a0f2:	0f053d03          	ld	s10,240(a0)
    8000a0f6:	0f853d83          	ld	s11,248(a0)
    8000a0fa:	10053e03          	ld	t3,256(a0)
    8000a0fe:	10853e83          	ld	t4,264(a0)
    8000a102:	11053f03          	ld	t5,272(a0)
    8000a106:	11853f83          	ld	t6,280(a0)
    8000a10a:	14051573          	csrrw	a0,sscratch,a0
    8000a10e:	10200073          	sret
	...
