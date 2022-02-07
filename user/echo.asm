
user/_echo:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/stat.h"
#include "user/user.h"

int
main(int argc, char *argv[])
{
   0:	7139                	addi	sp,sp,-64
   2:	fc06                	sd	ra,56(sp)
   4:	f822                	sd	s0,48(sp)
   6:	f426                	sd	s1,40(sp)
   8:	0080                	addi	s0,sp,64
   a:	87aa                	mv	a5,a0
   c:	fcb43023          	sd	a1,-64(s0)
  10:	fcf42623          	sw	a5,-52(s0)
  int i;

  for(i = 1; i < argc; i++){
  14:	4785                	li	a5,1
  16:	fcf42e23          	sw	a5,-36(s0)
  1a:	a051                	j	9e <main+0x9e>
    write(1, argv[i], strlen(argv[i]));
  1c:	fdc42783          	lw	a5,-36(s0)
  20:	078e                	slli	a5,a5,0x3
  22:	fc043703          	ld	a4,-64(s0)
  26:	97ba                	add	a5,a5,a4
  28:	6384                	ld	s1,0(a5)
  2a:	fdc42783          	lw	a5,-36(s0)
  2e:	078e                	slli	a5,a5,0x3
  30:	fc043703          	ld	a4,-64(s0)
  34:	97ba                	add	a5,a5,a4
  36:	639c                	ld	a5,0(a5)
  38:	853e                	mv	a0,a5
  3a:	00000097          	auipc	ra,0x0
  3e:	12e080e7          	jalr	302(ra) # 168 <strlen>
  42:	87aa                	mv	a5,a0
  44:	2781                	sext.w	a5,a5
  46:	2781                	sext.w	a5,a5
  48:	863e                	mv	a2,a5
  4a:	85a6                	mv	a1,s1
  4c:	4505                	li	a0,1
  4e:	00000097          	auipc	ra,0x0
  52:	51a080e7          	jalr	1306(ra) # 568 <write>
    if(i + 1 < argc){
  56:	fdc42783          	lw	a5,-36(s0)
  5a:	2785                	addiw	a5,a5,1
  5c:	0007871b          	sext.w	a4,a5
  60:	fcc42783          	lw	a5,-52(s0)
  64:	2781                	sext.w	a5,a5
  66:	00f75d63          	bge	a4,a5,80 <main+0x80>
      write(1, " ", 1);
  6a:	4605                	li	a2,1
  6c:	00001597          	auipc	a1,0x1
  70:	d3c58593          	addi	a1,a1,-708 # da8 <malloc+0x140>
  74:	4505                	li	a0,1
  76:	00000097          	auipc	ra,0x0
  7a:	4f2080e7          	jalr	1266(ra) # 568 <write>
  7e:	a819                	j	94 <main+0x94>
    } else {
      write(1, "\n", 1);
  80:	4605                	li	a2,1
  82:	00001597          	auipc	a1,0x1
  86:	d2e58593          	addi	a1,a1,-722 # db0 <malloc+0x148>
  8a:	4505                	li	a0,1
  8c:	00000097          	auipc	ra,0x0
  90:	4dc080e7          	jalr	1244(ra) # 568 <write>
  for(i = 1; i < argc; i++){
  94:	fdc42783          	lw	a5,-36(s0)
  98:	2785                	addiw	a5,a5,1
  9a:	fcf42e23          	sw	a5,-36(s0)
  9e:	fdc42703          	lw	a4,-36(s0)
  a2:	fcc42783          	lw	a5,-52(s0)
  a6:	2701                	sext.w	a4,a4
  a8:	2781                	sext.w	a5,a5
  aa:	f6f749e3          	blt	a4,a5,1c <main+0x1c>
    }
  }
  exit(0);
  ae:	4501                	li	a0,0
  b0:	00000097          	auipc	ra,0x0
  b4:	498080e7          	jalr	1176(ra) # 548 <exit>

00000000000000b8 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
  b8:	7179                	addi	sp,sp,-48
  ba:	f422                	sd	s0,40(sp)
  bc:	1800                	addi	s0,sp,48
  be:	fca43c23          	sd	a0,-40(s0)
  c2:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
  c6:	fd843783          	ld	a5,-40(s0)
  ca:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
  ce:	0001                	nop
  d0:	fd043703          	ld	a4,-48(s0)
  d4:	00170793          	addi	a5,a4,1
  d8:	fcf43823          	sd	a5,-48(s0)
  dc:	fd843783          	ld	a5,-40(s0)
  e0:	00178693          	addi	a3,a5,1
  e4:	fcd43c23          	sd	a3,-40(s0)
  e8:	00074703          	lbu	a4,0(a4)
  ec:	00e78023          	sb	a4,0(a5)
  f0:	0007c783          	lbu	a5,0(a5)
  f4:	fff1                	bnez	a5,d0 <strcpy+0x18>
    ;
  return os;
  f6:	fe843783          	ld	a5,-24(s0)
}
  fa:	853e                	mv	a0,a5
  fc:	7422                	ld	s0,40(sp)
  fe:	6145                	addi	sp,sp,48
 100:	8082                	ret

0000000000000102 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 102:	1101                	addi	sp,sp,-32
 104:	ec22                	sd	s0,24(sp)
 106:	1000                	addi	s0,sp,32
 108:	fea43423          	sd	a0,-24(s0)
 10c:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
 110:	a819                	j	126 <strcmp+0x24>
    p++, q++;
 112:	fe843783          	ld	a5,-24(s0)
 116:	0785                	addi	a5,a5,1
 118:	fef43423          	sd	a5,-24(s0)
 11c:	fe043783          	ld	a5,-32(s0)
 120:	0785                	addi	a5,a5,1
 122:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
 126:	fe843783          	ld	a5,-24(s0)
 12a:	0007c783          	lbu	a5,0(a5)
 12e:	cb99                	beqz	a5,144 <strcmp+0x42>
 130:	fe843783          	ld	a5,-24(s0)
 134:	0007c703          	lbu	a4,0(a5)
 138:	fe043783          	ld	a5,-32(s0)
 13c:	0007c783          	lbu	a5,0(a5)
 140:	fcf709e3          	beq	a4,a5,112 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
 144:	fe843783          	ld	a5,-24(s0)
 148:	0007c783          	lbu	a5,0(a5)
 14c:	0007871b          	sext.w	a4,a5
 150:	fe043783          	ld	a5,-32(s0)
 154:	0007c783          	lbu	a5,0(a5)
 158:	2781                	sext.w	a5,a5
 15a:	40f707bb          	subw	a5,a4,a5
 15e:	2781                	sext.w	a5,a5
}
 160:	853e                	mv	a0,a5
 162:	6462                	ld	s0,24(sp)
 164:	6105                	addi	sp,sp,32
 166:	8082                	ret

0000000000000168 <strlen>:

uint
strlen(const char *s)
{
 168:	7179                	addi	sp,sp,-48
 16a:	f422                	sd	s0,40(sp)
 16c:	1800                	addi	s0,sp,48
 16e:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
 172:	fe042623          	sw	zero,-20(s0)
 176:	a031                	j	182 <strlen+0x1a>
 178:	fec42783          	lw	a5,-20(s0)
 17c:	2785                	addiw	a5,a5,1
 17e:	fef42623          	sw	a5,-20(s0)
 182:	fec42783          	lw	a5,-20(s0)
 186:	fd843703          	ld	a4,-40(s0)
 18a:	97ba                	add	a5,a5,a4
 18c:	0007c783          	lbu	a5,0(a5)
 190:	f7e5                	bnez	a5,178 <strlen+0x10>
    ;
  return n;
 192:	fec42783          	lw	a5,-20(s0)
}
 196:	853e                	mv	a0,a5
 198:	7422                	ld	s0,40(sp)
 19a:	6145                	addi	sp,sp,48
 19c:	8082                	ret

000000000000019e <memset>:

void*
memset(void *dst, int c, uint n)
{
 19e:	7179                	addi	sp,sp,-48
 1a0:	f422                	sd	s0,40(sp)
 1a2:	1800                	addi	s0,sp,48
 1a4:	fca43c23          	sd	a0,-40(s0)
 1a8:	87ae                	mv	a5,a1
 1aa:	8732                	mv	a4,a2
 1ac:	fcf42a23          	sw	a5,-44(s0)
 1b0:	87ba                	mv	a5,a4
 1b2:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
 1b6:	fd843783          	ld	a5,-40(s0)
 1ba:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
 1be:	fe042623          	sw	zero,-20(s0)
 1c2:	a00d                	j	1e4 <memset+0x46>
    cdst[i] = c;
 1c4:	fec42783          	lw	a5,-20(s0)
 1c8:	fe043703          	ld	a4,-32(s0)
 1cc:	97ba                	add	a5,a5,a4
 1ce:	fd442703          	lw	a4,-44(s0)
 1d2:	0ff77713          	andi	a4,a4,255
 1d6:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
 1da:	fec42783          	lw	a5,-20(s0)
 1de:	2785                	addiw	a5,a5,1
 1e0:	fef42623          	sw	a5,-20(s0)
 1e4:	fec42703          	lw	a4,-20(s0)
 1e8:	fd042783          	lw	a5,-48(s0)
 1ec:	2781                	sext.w	a5,a5
 1ee:	fcf76be3          	bltu	a4,a5,1c4 <memset+0x26>
  }
  return dst;
 1f2:	fd843783          	ld	a5,-40(s0)
}
 1f6:	853e                	mv	a0,a5
 1f8:	7422                	ld	s0,40(sp)
 1fa:	6145                	addi	sp,sp,48
 1fc:	8082                	ret

00000000000001fe <strchr>:

char*
strchr(const char *s, char c)
{
 1fe:	1101                	addi	sp,sp,-32
 200:	ec22                	sd	s0,24(sp)
 202:	1000                	addi	s0,sp,32
 204:	fea43423          	sd	a0,-24(s0)
 208:	87ae                	mv	a5,a1
 20a:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
 20e:	a01d                	j	234 <strchr+0x36>
    if(*s == c)
 210:	fe843783          	ld	a5,-24(s0)
 214:	0007c703          	lbu	a4,0(a5)
 218:	fe744783          	lbu	a5,-25(s0)
 21c:	0ff7f793          	andi	a5,a5,255
 220:	00e79563          	bne	a5,a4,22a <strchr+0x2c>
      return (char*)s;
 224:	fe843783          	ld	a5,-24(s0)
 228:	a821                	j	240 <strchr+0x42>
  for(; *s; s++)
 22a:	fe843783          	ld	a5,-24(s0)
 22e:	0785                	addi	a5,a5,1
 230:	fef43423          	sd	a5,-24(s0)
 234:	fe843783          	ld	a5,-24(s0)
 238:	0007c783          	lbu	a5,0(a5)
 23c:	fbf1                	bnez	a5,210 <strchr+0x12>
  return 0;
 23e:	4781                	li	a5,0
}
 240:	853e                	mv	a0,a5
 242:	6462                	ld	s0,24(sp)
 244:	6105                	addi	sp,sp,32
 246:	8082                	ret

0000000000000248 <gets>:

char*
gets(char *buf, int max)
{
 248:	7179                	addi	sp,sp,-48
 24a:	f406                	sd	ra,40(sp)
 24c:	f022                	sd	s0,32(sp)
 24e:	1800                	addi	s0,sp,48
 250:	fca43c23          	sd	a0,-40(s0)
 254:	87ae                	mv	a5,a1
 256:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 25a:	fe042623          	sw	zero,-20(s0)
 25e:	a8a1                	j	2b6 <gets+0x6e>
    cc = read(0, &c, 1);
 260:	fe740793          	addi	a5,s0,-25
 264:	4605                	li	a2,1
 266:	85be                	mv	a1,a5
 268:	4501                	li	a0,0
 26a:	00000097          	auipc	ra,0x0
 26e:	2f6080e7          	jalr	758(ra) # 560 <read>
 272:	87aa                	mv	a5,a0
 274:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
 278:	fe842783          	lw	a5,-24(s0)
 27c:	2781                	sext.w	a5,a5
 27e:	04f05763          	blez	a5,2cc <gets+0x84>
      break;
    buf[i++] = c;
 282:	fec42783          	lw	a5,-20(s0)
 286:	0017871b          	addiw	a4,a5,1
 28a:	fee42623          	sw	a4,-20(s0)
 28e:	873e                	mv	a4,a5
 290:	fd843783          	ld	a5,-40(s0)
 294:	97ba                	add	a5,a5,a4
 296:	fe744703          	lbu	a4,-25(s0)
 29a:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
 29e:	fe744783          	lbu	a5,-25(s0)
 2a2:	873e                	mv	a4,a5
 2a4:	47a9                	li	a5,10
 2a6:	02f70463          	beq	a4,a5,2ce <gets+0x86>
 2aa:	fe744783          	lbu	a5,-25(s0)
 2ae:	873e                	mv	a4,a5
 2b0:	47b5                	li	a5,13
 2b2:	00f70e63          	beq	a4,a5,2ce <gets+0x86>
  for(i=0; i+1 < max; ){
 2b6:	fec42783          	lw	a5,-20(s0)
 2ba:	2785                	addiw	a5,a5,1
 2bc:	0007871b          	sext.w	a4,a5
 2c0:	fd442783          	lw	a5,-44(s0)
 2c4:	2781                	sext.w	a5,a5
 2c6:	f8f74de3          	blt	a4,a5,260 <gets+0x18>
 2ca:	a011                	j	2ce <gets+0x86>
      break;
 2cc:	0001                	nop
      break;
  }
  buf[i] = '\0';
 2ce:	fec42783          	lw	a5,-20(s0)
 2d2:	fd843703          	ld	a4,-40(s0)
 2d6:	97ba                	add	a5,a5,a4
 2d8:	00078023          	sb	zero,0(a5)
  return buf;
 2dc:	fd843783          	ld	a5,-40(s0)
}
 2e0:	853e                	mv	a0,a5
 2e2:	70a2                	ld	ra,40(sp)
 2e4:	7402                	ld	s0,32(sp)
 2e6:	6145                	addi	sp,sp,48
 2e8:	8082                	ret

00000000000002ea <stat>:

int
stat(const char *n, struct stat *st)
{
 2ea:	7179                	addi	sp,sp,-48
 2ec:	f406                	sd	ra,40(sp)
 2ee:	f022                	sd	s0,32(sp)
 2f0:	1800                	addi	s0,sp,48
 2f2:	fca43c23          	sd	a0,-40(s0)
 2f6:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2fa:	4581                	li	a1,0
 2fc:	fd843503          	ld	a0,-40(s0)
 300:	00000097          	auipc	ra,0x0
 304:	288080e7          	jalr	648(ra) # 588 <open>
 308:	87aa                	mv	a5,a0
 30a:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
 30e:	fec42783          	lw	a5,-20(s0)
 312:	2781                	sext.w	a5,a5
 314:	0007d463          	bgez	a5,31c <stat+0x32>
    return -1;
 318:	57fd                	li	a5,-1
 31a:	a035                	j	346 <stat+0x5c>
  r = fstat(fd, st);
 31c:	fec42783          	lw	a5,-20(s0)
 320:	fd043583          	ld	a1,-48(s0)
 324:	853e                	mv	a0,a5
 326:	00000097          	auipc	ra,0x0
 32a:	27a080e7          	jalr	634(ra) # 5a0 <fstat>
 32e:	87aa                	mv	a5,a0
 330:	fef42423          	sw	a5,-24(s0)
  close(fd);
 334:	fec42783          	lw	a5,-20(s0)
 338:	853e                	mv	a0,a5
 33a:	00000097          	auipc	ra,0x0
 33e:	236080e7          	jalr	566(ra) # 570 <close>
  return r;
 342:	fe842783          	lw	a5,-24(s0)
}
 346:	853e                	mv	a0,a5
 348:	70a2                	ld	ra,40(sp)
 34a:	7402                	ld	s0,32(sp)
 34c:	6145                	addi	sp,sp,48
 34e:	8082                	ret

0000000000000350 <atoi>:

int
atoi(const char *s)
{
 350:	7179                	addi	sp,sp,-48
 352:	f422                	sd	s0,40(sp)
 354:	1800                	addi	s0,sp,48
 356:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
 35a:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
 35e:	a815                	j	392 <atoi+0x42>
    n = n*10 + *s++ - '0';
 360:	fec42703          	lw	a4,-20(s0)
 364:	87ba                	mv	a5,a4
 366:	0027979b          	slliw	a5,a5,0x2
 36a:	9fb9                	addw	a5,a5,a4
 36c:	0017979b          	slliw	a5,a5,0x1
 370:	0007871b          	sext.w	a4,a5
 374:	fd843783          	ld	a5,-40(s0)
 378:	00178693          	addi	a3,a5,1
 37c:	fcd43c23          	sd	a3,-40(s0)
 380:	0007c783          	lbu	a5,0(a5)
 384:	2781                	sext.w	a5,a5
 386:	9fb9                	addw	a5,a5,a4
 388:	2781                	sext.w	a5,a5
 38a:	fd07879b          	addiw	a5,a5,-48
 38e:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
 392:	fd843783          	ld	a5,-40(s0)
 396:	0007c783          	lbu	a5,0(a5)
 39a:	873e                	mv	a4,a5
 39c:	02f00793          	li	a5,47
 3a0:	00e7fb63          	bgeu	a5,a4,3b6 <atoi+0x66>
 3a4:	fd843783          	ld	a5,-40(s0)
 3a8:	0007c783          	lbu	a5,0(a5)
 3ac:	873e                	mv	a4,a5
 3ae:	03900793          	li	a5,57
 3b2:	fae7f7e3          	bgeu	a5,a4,360 <atoi+0x10>
  return n;
 3b6:	fec42783          	lw	a5,-20(s0)
}
 3ba:	853e                	mv	a0,a5
 3bc:	7422                	ld	s0,40(sp)
 3be:	6145                	addi	sp,sp,48
 3c0:	8082                	ret

00000000000003c2 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3c2:	7139                	addi	sp,sp,-64
 3c4:	fc22                	sd	s0,56(sp)
 3c6:	0080                	addi	s0,sp,64
 3c8:	fca43c23          	sd	a0,-40(s0)
 3cc:	fcb43823          	sd	a1,-48(s0)
 3d0:	87b2                	mv	a5,a2
 3d2:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
 3d6:	fd843783          	ld	a5,-40(s0)
 3da:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
 3de:	fd043783          	ld	a5,-48(s0)
 3e2:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
 3e6:	fe043703          	ld	a4,-32(s0)
 3ea:	fe843783          	ld	a5,-24(s0)
 3ee:	02e7fc63          	bgeu	a5,a4,426 <memmove+0x64>
    while(n-- > 0)
 3f2:	a00d                	j	414 <memmove+0x52>
      *dst++ = *src++;
 3f4:	fe043703          	ld	a4,-32(s0)
 3f8:	00170793          	addi	a5,a4,1
 3fc:	fef43023          	sd	a5,-32(s0)
 400:	fe843783          	ld	a5,-24(s0)
 404:	00178693          	addi	a3,a5,1
 408:	fed43423          	sd	a3,-24(s0)
 40c:	00074703          	lbu	a4,0(a4)
 410:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 414:	fcc42783          	lw	a5,-52(s0)
 418:	fff7871b          	addiw	a4,a5,-1
 41c:	fce42623          	sw	a4,-52(s0)
 420:	fcf04ae3          	bgtz	a5,3f4 <memmove+0x32>
 424:	a891                	j	478 <memmove+0xb6>
  } else {
    dst += n;
 426:	fcc42783          	lw	a5,-52(s0)
 42a:	fe843703          	ld	a4,-24(s0)
 42e:	97ba                	add	a5,a5,a4
 430:	fef43423          	sd	a5,-24(s0)
    src += n;
 434:	fcc42783          	lw	a5,-52(s0)
 438:	fe043703          	ld	a4,-32(s0)
 43c:	97ba                	add	a5,a5,a4
 43e:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
 442:	a01d                	j	468 <memmove+0xa6>
      *--dst = *--src;
 444:	fe043783          	ld	a5,-32(s0)
 448:	17fd                	addi	a5,a5,-1
 44a:	fef43023          	sd	a5,-32(s0)
 44e:	fe843783          	ld	a5,-24(s0)
 452:	17fd                	addi	a5,a5,-1
 454:	fef43423          	sd	a5,-24(s0)
 458:	fe043783          	ld	a5,-32(s0)
 45c:	0007c703          	lbu	a4,0(a5)
 460:	fe843783          	ld	a5,-24(s0)
 464:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 468:	fcc42783          	lw	a5,-52(s0)
 46c:	fff7871b          	addiw	a4,a5,-1
 470:	fce42623          	sw	a4,-52(s0)
 474:	fcf048e3          	bgtz	a5,444 <memmove+0x82>
  }
  return vdst;
 478:	fd843783          	ld	a5,-40(s0)
}
 47c:	853e                	mv	a0,a5
 47e:	7462                	ld	s0,56(sp)
 480:	6121                	addi	sp,sp,64
 482:	8082                	ret

0000000000000484 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 484:	7139                	addi	sp,sp,-64
 486:	fc22                	sd	s0,56(sp)
 488:	0080                	addi	s0,sp,64
 48a:	fca43c23          	sd	a0,-40(s0)
 48e:	fcb43823          	sd	a1,-48(s0)
 492:	87b2                	mv	a5,a2
 494:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
 498:	fd843783          	ld	a5,-40(s0)
 49c:	fef43423          	sd	a5,-24(s0)
 4a0:	fd043783          	ld	a5,-48(s0)
 4a4:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 4a8:	a0a1                	j	4f0 <memcmp+0x6c>
    if (*p1 != *p2) {
 4aa:	fe843783          	ld	a5,-24(s0)
 4ae:	0007c703          	lbu	a4,0(a5)
 4b2:	fe043783          	ld	a5,-32(s0)
 4b6:	0007c783          	lbu	a5,0(a5)
 4ba:	02f70163          	beq	a4,a5,4dc <memcmp+0x58>
      return *p1 - *p2;
 4be:	fe843783          	ld	a5,-24(s0)
 4c2:	0007c783          	lbu	a5,0(a5)
 4c6:	0007871b          	sext.w	a4,a5
 4ca:	fe043783          	ld	a5,-32(s0)
 4ce:	0007c783          	lbu	a5,0(a5)
 4d2:	2781                	sext.w	a5,a5
 4d4:	40f707bb          	subw	a5,a4,a5
 4d8:	2781                	sext.w	a5,a5
 4da:	a01d                	j	500 <memcmp+0x7c>
    }
    p1++;
 4dc:	fe843783          	ld	a5,-24(s0)
 4e0:	0785                	addi	a5,a5,1
 4e2:	fef43423          	sd	a5,-24(s0)
    p2++;
 4e6:	fe043783          	ld	a5,-32(s0)
 4ea:	0785                	addi	a5,a5,1
 4ec:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 4f0:	fcc42783          	lw	a5,-52(s0)
 4f4:	fff7871b          	addiw	a4,a5,-1
 4f8:	fce42623          	sw	a4,-52(s0)
 4fc:	f7dd                	bnez	a5,4aa <memcmp+0x26>
  }
  return 0;
 4fe:	4781                	li	a5,0
}
 500:	853e                	mv	a0,a5
 502:	7462                	ld	s0,56(sp)
 504:	6121                	addi	sp,sp,64
 506:	8082                	ret

0000000000000508 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 508:	7179                	addi	sp,sp,-48
 50a:	f406                	sd	ra,40(sp)
 50c:	f022                	sd	s0,32(sp)
 50e:	1800                	addi	s0,sp,48
 510:	fea43423          	sd	a0,-24(s0)
 514:	feb43023          	sd	a1,-32(s0)
 518:	87b2                	mv	a5,a2
 51a:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
 51e:	fdc42783          	lw	a5,-36(s0)
 522:	863e                	mv	a2,a5
 524:	fe043583          	ld	a1,-32(s0)
 528:	fe843503          	ld	a0,-24(s0)
 52c:	00000097          	auipc	ra,0x0
 530:	e96080e7          	jalr	-362(ra) # 3c2 <memmove>
 534:	87aa                	mv	a5,a0
}
 536:	853e                	mv	a0,a5
 538:	70a2                	ld	ra,40(sp)
 53a:	7402                	ld	s0,32(sp)
 53c:	6145                	addi	sp,sp,48
 53e:	8082                	ret

0000000000000540 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 540:	4885                	li	a7,1
 ecall
 542:	00000073          	ecall
 ret
 546:	8082                	ret

0000000000000548 <exit>:
.global exit
exit:
 li a7, SYS_exit
 548:	4889                	li	a7,2
 ecall
 54a:	00000073          	ecall
 ret
 54e:	8082                	ret

0000000000000550 <wait>:
.global wait
wait:
 li a7, SYS_wait
 550:	488d                	li	a7,3
 ecall
 552:	00000073          	ecall
 ret
 556:	8082                	ret

0000000000000558 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 558:	4891                	li	a7,4
 ecall
 55a:	00000073          	ecall
 ret
 55e:	8082                	ret

0000000000000560 <read>:
.global read
read:
 li a7, SYS_read
 560:	4895                	li	a7,5
 ecall
 562:	00000073          	ecall
 ret
 566:	8082                	ret

0000000000000568 <write>:
.global write
write:
 li a7, SYS_write
 568:	48c1                	li	a7,16
 ecall
 56a:	00000073          	ecall
 ret
 56e:	8082                	ret

0000000000000570 <close>:
.global close
close:
 li a7, SYS_close
 570:	48d5                	li	a7,21
 ecall
 572:	00000073          	ecall
 ret
 576:	8082                	ret

0000000000000578 <kill>:
.global kill
kill:
 li a7, SYS_kill
 578:	4899                	li	a7,6
 ecall
 57a:	00000073          	ecall
 ret
 57e:	8082                	ret

0000000000000580 <exec>:
.global exec
exec:
 li a7, SYS_exec
 580:	489d                	li	a7,7
 ecall
 582:	00000073          	ecall
 ret
 586:	8082                	ret

0000000000000588 <open>:
.global open
open:
 li a7, SYS_open
 588:	48bd                	li	a7,15
 ecall
 58a:	00000073          	ecall
 ret
 58e:	8082                	ret

0000000000000590 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 590:	48c5                	li	a7,17
 ecall
 592:	00000073          	ecall
 ret
 596:	8082                	ret

0000000000000598 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 598:	48c9                	li	a7,18
 ecall
 59a:	00000073          	ecall
 ret
 59e:	8082                	ret

00000000000005a0 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 5a0:	48a1                	li	a7,8
 ecall
 5a2:	00000073          	ecall
 ret
 5a6:	8082                	ret

00000000000005a8 <link>:
.global link
link:
 li a7, SYS_link
 5a8:	48cd                	li	a7,19
 ecall
 5aa:	00000073          	ecall
 ret
 5ae:	8082                	ret

00000000000005b0 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 5b0:	48d1                	li	a7,20
 ecall
 5b2:	00000073          	ecall
 ret
 5b6:	8082                	ret

00000000000005b8 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 5b8:	48a5                	li	a7,9
 ecall
 5ba:	00000073          	ecall
 ret
 5be:	8082                	ret

00000000000005c0 <dup>:
.global dup
dup:
 li a7, SYS_dup
 5c0:	48a9                	li	a7,10
 ecall
 5c2:	00000073          	ecall
 ret
 5c6:	8082                	ret

00000000000005c8 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 5c8:	48ad                	li	a7,11
 ecall
 5ca:	00000073          	ecall
 ret
 5ce:	8082                	ret

00000000000005d0 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 5d0:	48b1                	li	a7,12
 ecall
 5d2:	00000073          	ecall
 ret
 5d6:	8082                	ret

00000000000005d8 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 5d8:	48b5                	li	a7,13
 ecall
 5da:	00000073          	ecall
 ret
 5de:	8082                	ret

00000000000005e0 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 5e0:	48b9                	li	a7,14
 ecall
 5e2:	00000073          	ecall
 ret
 5e6:	8082                	ret

00000000000005e8 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 5e8:	1101                	addi	sp,sp,-32
 5ea:	ec06                	sd	ra,24(sp)
 5ec:	e822                	sd	s0,16(sp)
 5ee:	1000                	addi	s0,sp,32
 5f0:	87aa                	mv	a5,a0
 5f2:	872e                	mv	a4,a1
 5f4:	fef42623          	sw	a5,-20(s0)
 5f8:	87ba                	mv	a5,a4
 5fa:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
 5fe:	feb40713          	addi	a4,s0,-21
 602:	fec42783          	lw	a5,-20(s0)
 606:	4605                	li	a2,1
 608:	85ba                	mv	a1,a4
 60a:	853e                	mv	a0,a5
 60c:	00000097          	auipc	ra,0x0
 610:	f5c080e7          	jalr	-164(ra) # 568 <write>
}
 614:	0001                	nop
 616:	60e2                	ld	ra,24(sp)
 618:	6442                	ld	s0,16(sp)
 61a:	6105                	addi	sp,sp,32
 61c:	8082                	ret

000000000000061e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 61e:	7139                	addi	sp,sp,-64
 620:	fc06                	sd	ra,56(sp)
 622:	f822                	sd	s0,48(sp)
 624:	0080                	addi	s0,sp,64
 626:	87aa                	mv	a5,a0
 628:	8736                	mv	a4,a3
 62a:	fcf42623          	sw	a5,-52(s0)
 62e:	87ae                	mv	a5,a1
 630:	fcf42423          	sw	a5,-56(s0)
 634:	87b2                	mv	a5,a2
 636:	fcf42223          	sw	a5,-60(s0)
 63a:	87ba                	mv	a5,a4
 63c:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 640:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
 644:	fc042783          	lw	a5,-64(s0)
 648:	2781                	sext.w	a5,a5
 64a:	c38d                	beqz	a5,66c <printint+0x4e>
 64c:	fc842783          	lw	a5,-56(s0)
 650:	2781                	sext.w	a5,a5
 652:	0007dd63          	bgez	a5,66c <printint+0x4e>
    neg = 1;
 656:	4785                	li	a5,1
 658:	fef42423          	sw	a5,-24(s0)
    x = -xx;
 65c:	fc842783          	lw	a5,-56(s0)
 660:	40f007bb          	negw	a5,a5
 664:	2781                	sext.w	a5,a5
 666:	fef42223          	sw	a5,-28(s0)
 66a:	a029                	j	674 <printint+0x56>
  } else {
    x = xx;
 66c:	fc842783          	lw	a5,-56(s0)
 670:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
 674:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
 678:	fc442783          	lw	a5,-60(s0)
 67c:	fe442703          	lw	a4,-28(s0)
 680:	02f777bb          	remuw	a5,a4,a5
 684:	0007861b          	sext.w	a2,a5
 688:	fec42783          	lw	a5,-20(s0)
 68c:	0017871b          	addiw	a4,a5,1
 690:	fee42623          	sw	a4,-20(s0)
 694:	00000697          	auipc	a3,0x0
 698:	72c68693          	addi	a3,a3,1836 # dc0 <digits>
 69c:	02061713          	slli	a4,a2,0x20
 6a0:	9301                	srli	a4,a4,0x20
 6a2:	9736                	add	a4,a4,a3
 6a4:	00074703          	lbu	a4,0(a4)
 6a8:	ff040693          	addi	a3,s0,-16
 6ac:	97b6                	add	a5,a5,a3
 6ae:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
 6b2:	fc442783          	lw	a5,-60(s0)
 6b6:	fe442703          	lw	a4,-28(s0)
 6ba:	02f757bb          	divuw	a5,a4,a5
 6be:	fef42223          	sw	a5,-28(s0)
 6c2:	fe442783          	lw	a5,-28(s0)
 6c6:	2781                	sext.w	a5,a5
 6c8:	fbc5                	bnez	a5,678 <printint+0x5a>
  if(neg)
 6ca:	fe842783          	lw	a5,-24(s0)
 6ce:	2781                	sext.w	a5,a5
 6d0:	cf95                	beqz	a5,70c <printint+0xee>
    buf[i++] = '-';
 6d2:	fec42783          	lw	a5,-20(s0)
 6d6:	0017871b          	addiw	a4,a5,1
 6da:	fee42623          	sw	a4,-20(s0)
 6de:	ff040713          	addi	a4,s0,-16
 6e2:	97ba                	add	a5,a5,a4
 6e4:	02d00713          	li	a4,45
 6e8:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
 6ec:	a005                	j	70c <printint+0xee>
    putc(fd, buf[i]);
 6ee:	fec42783          	lw	a5,-20(s0)
 6f2:	ff040713          	addi	a4,s0,-16
 6f6:	97ba                	add	a5,a5,a4
 6f8:	fe07c703          	lbu	a4,-32(a5)
 6fc:	fcc42783          	lw	a5,-52(s0)
 700:	85ba                	mv	a1,a4
 702:	853e                	mv	a0,a5
 704:	00000097          	auipc	ra,0x0
 708:	ee4080e7          	jalr	-284(ra) # 5e8 <putc>
  while(--i >= 0)
 70c:	fec42783          	lw	a5,-20(s0)
 710:	37fd                	addiw	a5,a5,-1
 712:	fef42623          	sw	a5,-20(s0)
 716:	fec42783          	lw	a5,-20(s0)
 71a:	2781                	sext.w	a5,a5
 71c:	fc07d9e3          	bgez	a5,6ee <printint+0xd0>
}
 720:	0001                	nop
 722:	0001                	nop
 724:	70e2                	ld	ra,56(sp)
 726:	7442                	ld	s0,48(sp)
 728:	6121                	addi	sp,sp,64
 72a:	8082                	ret

000000000000072c <printptr>:

static void
printptr(int fd, uint64 x) {
 72c:	7179                	addi	sp,sp,-48
 72e:	f406                	sd	ra,40(sp)
 730:	f022                	sd	s0,32(sp)
 732:	1800                	addi	s0,sp,48
 734:	87aa                	mv	a5,a0
 736:	fcb43823          	sd	a1,-48(s0)
 73a:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
 73e:	fdc42783          	lw	a5,-36(s0)
 742:	03000593          	li	a1,48
 746:	853e                	mv	a0,a5
 748:	00000097          	auipc	ra,0x0
 74c:	ea0080e7          	jalr	-352(ra) # 5e8 <putc>
  putc(fd, 'x');
 750:	fdc42783          	lw	a5,-36(s0)
 754:	07800593          	li	a1,120
 758:	853e                	mv	a0,a5
 75a:	00000097          	auipc	ra,0x0
 75e:	e8e080e7          	jalr	-370(ra) # 5e8 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 762:	fe042623          	sw	zero,-20(s0)
 766:	a82d                	j	7a0 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 768:	fd043783          	ld	a5,-48(s0)
 76c:	93f1                	srli	a5,a5,0x3c
 76e:	00000717          	auipc	a4,0x0
 772:	65270713          	addi	a4,a4,1618 # dc0 <digits>
 776:	97ba                	add	a5,a5,a4
 778:	0007c703          	lbu	a4,0(a5)
 77c:	fdc42783          	lw	a5,-36(s0)
 780:	85ba                	mv	a1,a4
 782:	853e                	mv	a0,a5
 784:	00000097          	auipc	ra,0x0
 788:	e64080e7          	jalr	-412(ra) # 5e8 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 78c:	fec42783          	lw	a5,-20(s0)
 790:	2785                	addiw	a5,a5,1
 792:	fef42623          	sw	a5,-20(s0)
 796:	fd043783          	ld	a5,-48(s0)
 79a:	0792                	slli	a5,a5,0x4
 79c:	fcf43823          	sd	a5,-48(s0)
 7a0:	fec42783          	lw	a5,-20(s0)
 7a4:	873e                	mv	a4,a5
 7a6:	47bd                	li	a5,15
 7a8:	fce7f0e3          	bgeu	a5,a4,768 <printptr+0x3c>
}
 7ac:	0001                	nop
 7ae:	0001                	nop
 7b0:	70a2                	ld	ra,40(sp)
 7b2:	7402                	ld	s0,32(sp)
 7b4:	6145                	addi	sp,sp,48
 7b6:	8082                	ret

00000000000007b8 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 7b8:	715d                	addi	sp,sp,-80
 7ba:	e486                	sd	ra,72(sp)
 7bc:	e0a2                	sd	s0,64(sp)
 7be:	0880                	addi	s0,sp,80
 7c0:	87aa                	mv	a5,a0
 7c2:	fcb43023          	sd	a1,-64(s0)
 7c6:	fac43c23          	sd	a2,-72(s0)
 7ca:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
 7ce:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 7d2:	fe042223          	sw	zero,-28(s0)
 7d6:	a42d                	j	a00 <vprintf+0x248>
    c = fmt[i] & 0xff;
 7d8:	fe442783          	lw	a5,-28(s0)
 7dc:	fc043703          	ld	a4,-64(s0)
 7e0:	97ba                	add	a5,a5,a4
 7e2:	0007c783          	lbu	a5,0(a5)
 7e6:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
 7ea:	fe042783          	lw	a5,-32(s0)
 7ee:	2781                	sext.w	a5,a5
 7f0:	eb9d                	bnez	a5,826 <vprintf+0x6e>
      if(c == '%'){
 7f2:	fdc42783          	lw	a5,-36(s0)
 7f6:	0007871b          	sext.w	a4,a5
 7fa:	02500793          	li	a5,37
 7fe:	00f71763          	bne	a4,a5,80c <vprintf+0x54>
        state = '%';
 802:	02500793          	li	a5,37
 806:	fef42023          	sw	a5,-32(s0)
 80a:	a2f5                	j	9f6 <vprintf+0x23e>
      } else {
        putc(fd, c);
 80c:	fdc42783          	lw	a5,-36(s0)
 810:	0ff7f713          	andi	a4,a5,255
 814:	fcc42783          	lw	a5,-52(s0)
 818:	85ba                	mv	a1,a4
 81a:	853e                	mv	a0,a5
 81c:	00000097          	auipc	ra,0x0
 820:	dcc080e7          	jalr	-564(ra) # 5e8 <putc>
 824:	aac9                	j	9f6 <vprintf+0x23e>
      }
    } else if(state == '%'){
 826:	fe042783          	lw	a5,-32(s0)
 82a:	0007871b          	sext.w	a4,a5
 82e:	02500793          	li	a5,37
 832:	1cf71263          	bne	a4,a5,9f6 <vprintf+0x23e>
      if(c == 'd'){
 836:	fdc42783          	lw	a5,-36(s0)
 83a:	0007871b          	sext.w	a4,a5
 83e:	06400793          	li	a5,100
 842:	02f71463          	bne	a4,a5,86a <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
 846:	fb843783          	ld	a5,-72(s0)
 84a:	00878713          	addi	a4,a5,8
 84e:	fae43c23          	sd	a4,-72(s0)
 852:	4398                	lw	a4,0(a5)
 854:	fcc42783          	lw	a5,-52(s0)
 858:	4685                	li	a3,1
 85a:	4629                	li	a2,10
 85c:	85ba                	mv	a1,a4
 85e:	853e                	mv	a0,a5
 860:	00000097          	auipc	ra,0x0
 864:	dbe080e7          	jalr	-578(ra) # 61e <printint>
 868:	a269                	j	9f2 <vprintf+0x23a>
      } else if(c == 'l') {
 86a:	fdc42783          	lw	a5,-36(s0)
 86e:	0007871b          	sext.w	a4,a5
 872:	06c00793          	li	a5,108
 876:	02f71663          	bne	a4,a5,8a2 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
 87a:	fb843783          	ld	a5,-72(s0)
 87e:	00878713          	addi	a4,a5,8
 882:	fae43c23          	sd	a4,-72(s0)
 886:	639c                	ld	a5,0(a5)
 888:	0007871b          	sext.w	a4,a5
 88c:	fcc42783          	lw	a5,-52(s0)
 890:	4681                	li	a3,0
 892:	4629                	li	a2,10
 894:	85ba                	mv	a1,a4
 896:	853e                	mv	a0,a5
 898:	00000097          	auipc	ra,0x0
 89c:	d86080e7          	jalr	-634(ra) # 61e <printint>
 8a0:	aa89                	j	9f2 <vprintf+0x23a>
      } else if(c == 'x') {
 8a2:	fdc42783          	lw	a5,-36(s0)
 8a6:	0007871b          	sext.w	a4,a5
 8aa:	07800793          	li	a5,120
 8ae:	02f71463          	bne	a4,a5,8d6 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
 8b2:	fb843783          	ld	a5,-72(s0)
 8b6:	00878713          	addi	a4,a5,8
 8ba:	fae43c23          	sd	a4,-72(s0)
 8be:	4398                	lw	a4,0(a5)
 8c0:	fcc42783          	lw	a5,-52(s0)
 8c4:	4681                	li	a3,0
 8c6:	4641                	li	a2,16
 8c8:	85ba                	mv	a1,a4
 8ca:	853e                	mv	a0,a5
 8cc:	00000097          	auipc	ra,0x0
 8d0:	d52080e7          	jalr	-686(ra) # 61e <printint>
 8d4:	aa39                	j	9f2 <vprintf+0x23a>
      } else if(c == 'p') {
 8d6:	fdc42783          	lw	a5,-36(s0)
 8da:	0007871b          	sext.w	a4,a5
 8de:	07000793          	li	a5,112
 8e2:	02f71263          	bne	a4,a5,906 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
 8e6:	fb843783          	ld	a5,-72(s0)
 8ea:	00878713          	addi	a4,a5,8
 8ee:	fae43c23          	sd	a4,-72(s0)
 8f2:	6398                	ld	a4,0(a5)
 8f4:	fcc42783          	lw	a5,-52(s0)
 8f8:	85ba                	mv	a1,a4
 8fa:	853e                	mv	a0,a5
 8fc:	00000097          	auipc	ra,0x0
 900:	e30080e7          	jalr	-464(ra) # 72c <printptr>
 904:	a0fd                	j	9f2 <vprintf+0x23a>
      } else if(c == 's'){
 906:	fdc42783          	lw	a5,-36(s0)
 90a:	0007871b          	sext.w	a4,a5
 90e:	07300793          	li	a5,115
 912:	04f71c63          	bne	a4,a5,96a <vprintf+0x1b2>
        s = va_arg(ap, char*);
 916:	fb843783          	ld	a5,-72(s0)
 91a:	00878713          	addi	a4,a5,8
 91e:	fae43c23          	sd	a4,-72(s0)
 922:	639c                	ld	a5,0(a5)
 924:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
 928:	fe843783          	ld	a5,-24(s0)
 92c:	eb8d                	bnez	a5,95e <vprintf+0x1a6>
          s = "(null)";
 92e:	00000797          	auipc	a5,0x0
 932:	48a78793          	addi	a5,a5,1162 # db8 <malloc+0x150>
 936:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 93a:	a015                	j	95e <vprintf+0x1a6>
          putc(fd, *s);
 93c:	fe843783          	ld	a5,-24(s0)
 940:	0007c703          	lbu	a4,0(a5)
 944:	fcc42783          	lw	a5,-52(s0)
 948:	85ba                	mv	a1,a4
 94a:	853e                	mv	a0,a5
 94c:	00000097          	auipc	ra,0x0
 950:	c9c080e7          	jalr	-868(ra) # 5e8 <putc>
          s++;
 954:	fe843783          	ld	a5,-24(s0)
 958:	0785                	addi	a5,a5,1
 95a:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 95e:	fe843783          	ld	a5,-24(s0)
 962:	0007c783          	lbu	a5,0(a5)
 966:	fbf9                	bnez	a5,93c <vprintf+0x184>
 968:	a069                	j	9f2 <vprintf+0x23a>
        }
      } else if(c == 'c'){
 96a:	fdc42783          	lw	a5,-36(s0)
 96e:	0007871b          	sext.w	a4,a5
 972:	06300793          	li	a5,99
 976:	02f71463          	bne	a4,a5,99e <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
 97a:	fb843783          	ld	a5,-72(s0)
 97e:	00878713          	addi	a4,a5,8
 982:	fae43c23          	sd	a4,-72(s0)
 986:	439c                	lw	a5,0(a5)
 988:	0ff7f713          	andi	a4,a5,255
 98c:	fcc42783          	lw	a5,-52(s0)
 990:	85ba                	mv	a1,a4
 992:	853e                	mv	a0,a5
 994:	00000097          	auipc	ra,0x0
 998:	c54080e7          	jalr	-940(ra) # 5e8 <putc>
 99c:	a899                	j	9f2 <vprintf+0x23a>
      } else if(c == '%'){
 99e:	fdc42783          	lw	a5,-36(s0)
 9a2:	0007871b          	sext.w	a4,a5
 9a6:	02500793          	li	a5,37
 9aa:	00f71f63          	bne	a4,a5,9c8 <vprintf+0x210>
        putc(fd, c);
 9ae:	fdc42783          	lw	a5,-36(s0)
 9b2:	0ff7f713          	andi	a4,a5,255
 9b6:	fcc42783          	lw	a5,-52(s0)
 9ba:	85ba                	mv	a1,a4
 9bc:	853e                	mv	a0,a5
 9be:	00000097          	auipc	ra,0x0
 9c2:	c2a080e7          	jalr	-982(ra) # 5e8 <putc>
 9c6:	a035                	j	9f2 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 9c8:	fcc42783          	lw	a5,-52(s0)
 9cc:	02500593          	li	a1,37
 9d0:	853e                	mv	a0,a5
 9d2:	00000097          	auipc	ra,0x0
 9d6:	c16080e7          	jalr	-1002(ra) # 5e8 <putc>
        putc(fd, c);
 9da:	fdc42783          	lw	a5,-36(s0)
 9de:	0ff7f713          	andi	a4,a5,255
 9e2:	fcc42783          	lw	a5,-52(s0)
 9e6:	85ba                	mv	a1,a4
 9e8:	853e                	mv	a0,a5
 9ea:	00000097          	auipc	ra,0x0
 9ee:	bfe080e7          	jalr	-1026(ra) # 5e8 <putc>
      }
      state = 0;
 9f2:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 9f6:	fe442783          	lw	a5,-28(s0)
 9fa:	2785                	addiw	a5,a5,1
 9fc:	fef42223          	sw	a5,-28(s0)
 a00:	fe442783          	lw	a5,-28(s0)
 a04:	fc043703          	ld	a4,-64(s0)
 a08:	97ba                	add	a5,a5,a4
 a0a:	0007c783          	lbu	a5,0(a5)
 a0e:	dc0795e3          	bnez	a5,7d8 <vprintf+0x20>
    }
  }
}
 a12:	0001                	nop
 a14:	0001                	nop
 a16:	60a6                	ld	ra,72(sp)
 a18:	6406                	ld	s0,64(sp)
 a1a:	6161                	addi	sp,sp,80
 a1c:	8082                	ret

0000000000000a1e <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 a1e:	7159                	addi	sp,sp,-112
 a20:	fc06                	sd	ra,56(sp)
 a22:	f822                	sd	s0,48(sp)
 a24:	0080                	addi	s0,sp,64
 a26:	fcb43823          	sd	a1,-48(s0)
 a2a:	e010                	sd	a2,0(s0)
 a2c:	e414                	sd	a3,8(s0)
 a2e:	e818                	sd	a4,16(s0)
 a30:	ec1c                	sd	a5,24(s0)
 a32:	03043023          	sd	a6,32(s0)
 a36:	03143423          	sd	a7,40(s0)
 a3a:	87aa                	mv	a5,a0
 a3c:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
 a40:	03040793          	addi	a5,s0,48
 a44:	fcf43423          	sd	a5,-56(s0)
 a48:	fc843783          	ld	a5,-56(s0)
 a4c:	fd078793          	addi	a5,a5,-48
 a50:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
 a54:	fe843703          	ld	a4,-24(s0)
 a58:	fdc42783          	lw	a5,-36(s0)
 a5c:	863a                	mv	a2,a4
 a5e:	fd043583          	ld	a1,-48(s0)
 a62:	853e                	mv	a0,a5
 a64:	00000097          	auipc	ra,0x0
 a68:	d54080e7          	jalr	-684(ra) # 7b8 <vprintf>
}
 a6c:	0001                	nop
 a6e:	70e2                	ld	ra,56(sp)
 a70:	7442                	ld	s0,48(sp)
 a72:	6165                	addi	sp,sp,112
 a74:	8082                	ret

0000000000000a76 <printf>:

void
printf(const char *fmt, ...)
{
 a76:	7159                	addi	sp,sp,-112
 a78:	f406                	sd	ra,40(sp)
 a7a:	f022                	sd	s0,32(sp)
 a7c:	1800                	addi	s0,sp,48
 a7e:	fca43c23          	sd	a0,-40(s0)
 a82:	e40c                	sd	a1,8(s0)
 a84:	e810                	sd	a2,16(s0)
 a86:	ec14                	sd	a3,24(s0)
 a88:	f018                	sd	a4,32(s0)
 a8a:	f41c                	sd	a5,40(s0)
 a8c:	03043823          	sd	a6,48(s0)
 a90:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 a94:	04040793          	addi	a5,s0,64
 a98:	fcf43823          	sd	a5,-48(s0)
 a9c:	fd043783          	ld	a5,-48(s0)
 aa0:	fc878793          	addi	a5,a5,-56
 aa4:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
 aa8:	fe843783          	ld	a5,-24(s0)
 aac:	863e                	mv	a2,a5
 aae:	fd843583          	ld	a1,-40(s0)
 ab2:	4505                	li	a0,1
 ab4:	00000097          	auipc	ra,0x0
 ab8:	d04080e7          	jalr	-764(ra) # 7b8 <vprintf>
}
 abc:	0001                	nop
 abe:	70a2                	ld	ra,40(sp)
 ac0:	7402                	ld	s0,32(sp)
 ac2:	6165                	addi	sp,sp,112
 ac4:	8082                	ret

0000000000000ac6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 ac6:	7179                	addi	sp,sp,-48
 ac8:	f422                	sd	s0,40(sp)
 aca:	1800                	addi	s0,sp,48
 acc:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 ad0:	fd843783          	ld	a5,-40(s0)
 ad4:	17c1                	addi	a5,a5,-16
 ad6:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ada:	00000797          	auipc	a5,0x0
 ade:	30e78793          	addi	a5,a5,782 # de8 <freep>
 ae2:	639c                	ld	a5,0(a5)
 ae4:	fef43423          	sd	a5,-24(s0)
 ae8:	a815                	j	b1c <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 aea:	fe843783          	ld	a5,-24(s0)
 aee:	639c                	ld	a5,0(a5)
 af0:	fe843703          	ld	a4,-24(s0)
 af4:	00f76f63          	bltu	a4,a5,b12 <free+0x4c>
 af8:	fe043703          	ld	a4,-32(s0)
 afc:	fe843783          	ld	a5,-24(s0)
 b00:	02e7eb63          	bltu	a5,a4,b36 <free+0x70>
 b04:	fe843783          	ld	a5,-24(s0)
 b08:	639c                	ld	a5,0(a5)
 b0a:	fe043703          	ld	a4,-32(s0)
 b0e:	02f76463          	bltu	a4,a5,b36 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b12:	fe843783          	ld	a5,-24(s0)
 b16:	639c                	ld	a5,0(a5)
 b18:	fef43423          	sd	a5,-24(s0)
 b1c:	fe043703          	ld	a4,-32(s0)
 b20:	fe843783          	ld	a5,-24(s0)
 b24:	fce7f3e3          	bgeu	a5,a4,aea <free+0x24>
 b28:	fe843783          	ld	a5,-24(s0)
 b2c:	639c                	ld	a5,0(a5)
 b2e:	fe043703          	ld	a4,-32(s0)
 b32:	faf77ce3          	bgeu	a4,a5,aea <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b36:	fe043783          	ld	a5,-32(s0)
 b3a:	479c                	lw	a5,8(a5)
 b3c:	1782                	slli	a5,a5,0x20
 b3e:	9381                	srli	a5,a5,0x20
 b40:	0792                	slli	a5,a5,0x4
 b42:	fe043703          	ld	a4,-32(s0)
 b46:	973e                	add	a4,a4,a5
 b48:	fe843783          	ld	a5,-24(s0)
 b4c:	639c                	ld	a5,0(a5)
 b4e:	02f71763          	bne	a4,a5,b7c <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
 b52:	fe043783          	ld	a5,-32(s0)
 b56:	4798                	lw	a4,8(a5)
 b58:	fe843783          	ld	a5,-24(s0)
 b5c:	639c                	ld	a5,0(a5)
 b5e:	479c                	lw	a5,8(a5)
 b60:	9fb9                	addw	a5,a5,a4
 b62:	0007871b          	sext.w	a4,a5
 b66:	fe043783          	ld	a5,-32(s0)
 b6a:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
 b6c:	fe843783          	ld	a5,-24(s0)
 b70:	639c                	ld	a5,0(a5)
 b72:	6398                	ld	a4,0(a5)
 b74:	fe043783          	ld	a5,-32(s0)
 b78:	e398                	sd	a4,0(a5)
 b7a:	a039                	j	b88 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
 b7c:	fe843783          	ld	a5,-24(s0)
 b80:	6398                	ld	a4,0(a5)
 b82:	fe043783          	ld	a5,-32(s0)
 b86:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
 b88:	fe843783          	ld	a5,-24(s0)
 b8c:	479c                	lw	a5,8(a5)
 b8e:	1782                	slli	a5,a5,0x20
 b90:	9381                	srli	a5,a5,0x20
 b92:	0792                	slli	a5,a5,0x4
 b94:	fe843703          	ld	a4,-24(s0)
 b98:	97ba                	add	a5,a5,a4
 b9a:	fe043703          	ld	a4,-32(s0)
 b9e:	02f71563          	bne	a4,a5,bc8 <free+0x102>
    p->s.size += bp->s.size;
 ba2:	fe843783          	ld	a5,-24(s0)
 ba6:	4798                	lw	a4,8(a5)
 ba8:	fe043783          	ld	a5,-32(s0)
 bac:	479c                	lw	a5,8(a5)
 bae:	9fb9                	addw	a5,a5,a4
 bb0:	0007871b          	sext.w	a4,a5
 bb4:	fe843783          	ld	a5,-24(s0)
 bb8:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 bba:	fe043783          	ld	a5,-32(s0)
 bbe:	6398                	ld	a4,0(a5)
 bc0:	fe843783          	ld	a5,-24(s0)
 bc4:	e398                	sd	a4,0(a5)
 bc6:	a031                	j	bd2 <free+0x10c>
  } else
    p->s.ptr = bp;
 bc8:	fe843783          	ld	a5,-24(s0)
 bcc:	fe043703          	ld	a4,-32(s0)
 bd0:	e398                	sd	a4,0(a5)
  freep = p;
 bd2:	00000797          	auipc	a5,0x0
 bd6:	21678793          	addi	a5,a5,534 # de8 <freep>
 bda:	fe843703          	ld	a4,-24(s0)
 bde:	e398                	sd	a4,0(a5)
}
 be0:	0001                	nop
 be2:	7422                	ld	s0,40(sp)
 be4:	6145                	addi	sp,sp,48
 be6:	8082                	ret

0000000000000be8 <morecore>:

static Header*
morecore(uint nu)
{
 be8:	7179                	addi	sp,sp,-48
 bea:	f406                	sd	ra,40(sp)
 bec:	f022                	sd	s0,32(sp)
 bee:	1800                	addi	s0,sp,48
 bf0:	87aa                	mv	a5,a0
 bf2:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
 bf6:	fdc42783          	lw	a5,-36(s0)
 bfa:	0007871b          	sext.w	a4,a5
 bfe:	6785                	lui	a5,0x1
 c00:	00f77563          	bgeu	a4,a5,c0a <morecore+0x22>
    nu = 4096;
 c04:	6785                	lui	a5,0x1
 c06:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
 c0a:	fdc42783          	lw	a5,-36(s0)
 c0e:	0047979b          	slliw	a5,a5,0x4
 c12:	2781                	sext.w	a5,a5
 c14:	2781                	sext.w	a5,a5
 c16:	853e                	mv	a0,a5
 c18:	00000097          	auipc	ra,0x0
 c1c:	9b8080e7          	jalr	-1608(ra) # 5d0 <sbrk>
 c20:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
 c24:	fe843703          	ld	a4,-24(s0)
 c28:	57fd                	li	a5,-1
 c2a:	00f71463          	bne	a4,a5,c32 <morecore+0x4a>
    return 0;
 c2e:	4781                	li	a5,0
 c30:	a03d                	j	c5e <morecore+0x76>
  hp = (Header*)p;
 c32:	fe843783          	ld	a5,-24(s0)
 c36:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
 c3a:	fe043783          	ld	a5,-32(s0)
 c3e:	fdc42703          	lw	a4,-36(s0)
 c42:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
 c44:	fe043783          	ld	a5,-32(s0)
 c48:	07c1                	addi	a5,a5,16
 c4a:	853e                	mv	a0,a5
 c4c:	00000097          	auipc	ra,0x0
 c50:	e7a080e7          	jalr	-390(ra) # ac6 <free>
  return freep;
 c54:	00000797          	auipc	a5,0x0
 c58:	19478793          	addi	a5,a5,404 # de8 <freep>
 c5c:	639c                	ld	a5,0(a5)
}
 c5e:	853e                	mv	a0,a5
 c60:	70a2                	ld	ra,40(sp)
 c62:	7402                	ld	s0,32(sp)
 c64:	6145                	addi	sp,sp,48
 c66:	8082                	ret

0000000000000c68 <malloc>:

void*
malloc(uint nbytes)
{
 c68:	7139                	addi	sp,sp,-64
 c6a:	fc06                	sd	ra,56(sp)
 c6c:	f822                	sd	s0,48(sp)
 c6e:	0080                	addi	s0,sp,64
 c70:	87aa                	mv	a5,a0
 c72:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c76:	fcc46783          	lwu	a5,-52(s0)
 c7a:	07bd                	addi	a5,a5,15
 c7c:	8391                	srli	a5,a5,0x4
 c7e:	2781                	sext.w	a5,a5
 c80:	2785                	addiw	a5,a5,1
 c82:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
 c86:	00000797          	auipc	a5,0x0
 c8a:	16278793          	addi	a5,a5,354 # de8 <freep>
 c8e:	639c                	ld	a5,0(a5)
 c90:	fef43023          	sd	a5,-32(s0)
 c94:	fe043783          	ld	a5,-32(s0)
 c98:	ef95                	bnez	a5,cd4 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
 c9a:	00000797          	auipc	a5,0x0
 c9e:	13e78793          	addi	a5,a5,318 # dd8 <base>
 ca2:	fef43023          	sd	a5,-32(s0)
 ca6:	00000797          	auipc	a5,0x0
 caa:	14278793          	addi	a5,a5,322 # de8 <freep>
 cae:	fe043703          	ld	a4,-32(s0)
 cb2:	e398                	sd	a4,0(a5)
 cb4:	00000797          	auipc	a5,0x0
 cb8:	13478793          	addi	a5,a5,308 # de8 <freep>
 cbc:	6398                	ld	a4,0(a5)
 cbe:	00000797          	auipc	a5,0x0
 cc2:	11a78793          	addi	a5,a5,282 # dd8 <base>
 cc6:	e398                	sd	a4,0(a5)
    base.s.size = 0;
 cc8:	00000797          	auipc	a5,0x0
 ccc:	11078793          	addi	a5,a5,272 # dd8 <base>
 cd0:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 cd4:	fe043783          	ld	a5,-32(s0)
 cd8:	639c                	ld	a5,0(a5)
 cda:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 cde:	fe843783          	ld	a5,-24(s0)
 ce2:	4798                	lw	a4,8(a5)
 ce4:	fdc42783          	lw	a5,-36(s0)
 ce8:	2781                	sext.w	a5,a5
 cea:	06f76863          	bltu	a4,a5,d5a <malloc+0xf2>
      if(p->s.size == nunits)
 cee:	fe843783          	ld	a5,-24(s0)
 cf2:	4798                	lw	a4,8(a5)
 cf4:	fdc42783          	lw	a5,-36(s0)
 cf8:	2781                	sext.w	a5,a5
 cfa:	00e79963          	bne	a5,a4,d0c <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
 cfe:	fe843783          	ld	a5,-24(s0)
 d02:	6398                	ld	a4,0(a5)
 d04:	fe043783          	ld	a5,-32(s0)
 d08:	e398                	sd	a4,0(a5)
 d0a:	a82d                	j	d44 <malloc+0xdc>
      else {
        p->s.size -= nunits;
 d0c:	fe843783          	ld	a5,-24(s0)
 d10:	4798                	lw	a4,8(a5)
 d12:	fdc42783          	lw	a5,-36(s0)
 d16:	40f707bb          	subw	a5,a4,a5
 d1a:	0007871b          	sext.w	a4,a5
 d1e:	fe843783          	ld	a5,-24(s0)
 d22:	c798                	sw	a4,8(a5)
        p += p->s.size;
 d24:	fe843783          	ld	a5,-24(s0)
 d28:	479c                	lw	a5,8(a5)
 d2a:	1782                	slli	a5,a5,0x20
 d2c:	9381                	srli	a5,a5,0x20
 d2e:	0792                	slli	a5,a5,0x4
 d30:	fe843703          	ld	a4,-24(s0)
 d34:	97ba                	add	a5,a5,a4
 d36:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
 d3a:	fe843783          	ld	a5,-24(s0)
 d3e:	fdc42703          	lw	a4,-36(s0)
 d42:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
 d44:	00000797          	auipc	a5,0x0
 d48:	0a478793          	addi	a5,a5,164 # de8 <freep>
 d4c:	fe043703          	ld	a4,-32(s0)
 d50:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
 d52:	fe843783          	ld	a5,-24(s0)
 d56:	07c1                	addi	a5,a5,16
 d58:	a091                	j	d9c <malloc+0x134>
    }
    if(p == freep)
 d5a:	00000797          	auipc	a5,0x0
 d5e:	08e78793          	addi	a5,a5,142 # de8 <freep>
 d62:	639c                	ld	a5,0(a5)
 d64:	fe843703          	ld	a4,-24(s0)
 d68:	02f71063          	bne	a4,a5,d88 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
 d6c:	fdc42783          	lw	a5,-36(s0)
 d70:	853e                	mv	a0,a5
 d72:	00000097          	auipc	ra,0x0
 d76:	e76080e7          	jalr	-394(ra) # be8 <morecore>
 d7a:	fea43423          	sd	a0,-24(s0)
 d7e:	fe843783          	ld	a5,-24(s0)
 d82:	e399                	bnez	a5,d88 <malloc+0x120>
        return 0;
 d84:	4781                	li	a5,0
 d86:	a819                	j	d9c <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d88:	fe843783          	ld	a5,-24(s0)
 d8c:	fef43023          	sd	a5,-32(s0)
 d90:	fe843783          	ld	a5,-24(s0)
 d94:	639c                	ld	a5,0(a5)
 d96:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 d9a:	b791                	j	cde <malloc+0x76>
  }
}
 d9c:	853e                	mv	a0,a5
 d9e:	70e2                	ld	ra,56(sp)
 da0:	7442                	ld	s0,48(sp)
 da2:	6121                	addi	sp,sp,64
 da4:	8082                	ret
