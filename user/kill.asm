
user/_kill:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/stat.h"
#include "user/user.h"

int
main(int argc, char **argv)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	1800                	addi	s0,sp,48
   8:	87aa                	mv	a5,a0
   a:	fcb43823          	sd	a1,-48(s0)
   e:	fcf42e23          	sw	a5,-36(s0)
  int i;

  if(argc < 2){
  12:	fdc42783          	lw	a5,-36(s0)
  16:	0007871b          	sext.w	a4,a5
  1a:	4785                	li	a5,1
  1c:	02e7c063          	blt	a5,a4,3c <main+0x3c>
    fprintf(2, "usage: kill pid...\n");
  20:	00001597          	auipc	a1,0x1
  24:	d6058593          	addi	a1,a1,-672 # d80 <malloc+0x144>
  28:	4509                	li	a0,2
  2a:	00001097          	auipc	ra,0x1
  2e:	9c8080e7          	jalr	-1592(ra) # 9f2 <fprintf>
    exit(1);
  32:	4505                	li	a0,1
  34:	00000097          	auipc	ra,0x0
  38:	4e8080e7          	jalr	1256(ra) # 51c <exit>
  }
  for(i=1; i<argc; i++)
  3c:	4785                	li	a5,1
  3e:	fef42623          	sw	a5,-20(s0)
  42:	a805                	j	72 <main+0x72>
    kill(atoi(argv[i]));
  44:	fec42783          	lw	a5,-20(s0)
  48:	078e                	slli	a5,a5,0x3
  4a:	fd043703          	ld	a4,-48(s0)
  4e:	97ba                	add	a5,a5,a4
  50:	639c                	ld	a5,0(a5)
  52:	853e                	mv	a0,a5
  54:	00000097          	auipc	ra,0x0
  58:	2d0080e7          	jalr	720(ra) # 324 <atoi>
  5c:	87aa                	mv	a5,a0
  5e:	853e                	mv	a0,a5
  60:	00000097          	auipc	ra,0x0
  64:	4ec080e7          	jalr	1260(ra) # 54c <kill>
  for(i=1; i<argc; i++)
  68:	fec42783          	lw	a5,-20(s0)
  6c:	2785                	addiw	a5,a5,1
  6e:	fef42623          	sw	a5,-20(s0)
  72:	fec42703          	lw	a4,-20(s0)
  76:	fdc42783          	lw	a5,-36(s0)
  7a:	2701                	sext.w	a4,a4
  7c:	2781                	sext.w	a5,a5
  7e:	fcf743e3          	blt	a4,a5,44 <main+0x44>
  exit(0);
  82:	4501                	li	a0,0
  84:	00000097          	auipc	ra,0x0
  88:	498080e7          	jalr	1176(ra) # 51c <exit>

000000000000008c <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
  8c:	7179                	addi	sp,sp,-48
  8e:	f422                	sd	s0,40(sp)
  90:	1800                	addi	s0,sp,48
  92:	fca43c23          	sd	a0,-40(s0)
  96:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
  9a:	fd843783          	ld	a5,-40(s0)
  9e:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
  a2:	0001                	nop
  a4:	fd043703          	ld	a4,-48(s0)
  a8:	00170793          	addi	a5,a4,1
  ac:	fcf43823          	sd	a5,-48(s0)
  b0:	fd843783          	ld	a5,-40(s0)
  b4:	00178693          	addi	a3,a5,1
  b8:	fcd43c23          	sd	a3,-40(s0)
  bc:	00074703          	lbu	a4,0(a4)
  c0:	00e78023          	sb	a4,0(a5)
  c4:	0007c783          	lbu	a5,0(a5)
  c8:	fff1                	bnez	a5,a4 <strcpy+0x18>
    ;
  return os;
  ca:	fe843783          	ld	a5,-24(s0)
}
  ce:	853e                	mv	a0,a5
  d0:	7422                	ld	s0,40(sp)
  d2:	6145                	addi	sp,sp,48
  d4:	8082                	ret

00000000000000d6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  d6:	1101                	addi	sp,sp,-32
  d8:	ec22                	sd	s0,24(sp)
  da:	1000                	addi	s0,sp,32
  dc:	fea43423          	sd	a0,-24(s0)
  e0:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
  e4:	a819                	j	fa <strcmp+0x24>
    p++, q++;
  e6:	fe843783          	ld	a5,-24(s0)
  ea:	0785                	addi	a5,a5,1
  ec:	fef43423          	sd	a5,-24(s0)
  f0:	fe043783          	ld	a5,-32(s0)
  f4:	0785                	addi	a5,a5,1
  f6:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
  fa:	fe843783          	ld	a5,-24(s0)
  fe:	0007c783          	lbu	a5,0(a5)
 102:	cb99                	beqz	a5,118 <strcmp+0x42>
 104:	fe843783          	ld	a5,-24(s0)
 108:	0007c703          	lbu	a4,0(a5)
 10c:	fe043783          	ld	a5,-32(s0)
 110:	0007c783          	lbu	a5,0(a5)
 114:	fcf709e3          	beq	a4,a5,e6 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
 118:	fe843783          	ld	a5,-24(s0)
 11c:	0007c783          	lbu	a5,0(a5)
 120:	0007871b          	sext.w	a4,a5
 124:	fe043783          	ld	a5,-32(s0)
 128:	0007c783          	lbu	a5,0(a5)
 12c:	2781                	sext.w	a5,a5
 12e:	40f707bb          	subw	a5,a4,a5
 132:	2781                	sext.w	a5,a5
}
 134:	853e                	mv	a0,a5
 136:	6462                	ld	s0,24(sp)
 138:	6105                	addi	sp,sp,32
 13a:	8082                	ret

000000000000013c <strlen>:

uint
strlen(const char *s)
{
 13c:	7179                	addi	sp,sp,-48
 13e:	f422                	sd	s0,40(sp)
 140:	1800                	addi	s0,sp,48
 142:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
 146:	fe042623          	sw	zero,-20(s0)
 14a:	a031                	j	156 <strlen+0x1a>
 14c:	fec42783          	lw	a5,-20(s0)
 150:	2785                	addiw	a5,a5,1
 152:	fef42623          	sw	a5,-20(s0)
 156:	fec42783          	lw	a5,-20(s0)
 15a:	fd843703          	ld	a4,-40(s0)
 15e:	97ba                	add	a5,a5,a4
 160:	0007c783          	lbu	a5,0(a5)
 164:	f7e5                	bnez	a5,14c <strlen+0x10>
    ;
  return n;
 166:	fec42783          	lw	a5,-20(s0)
}
 16a:	853e                	mv	a0,a5
 16c:	7422                	ld	s0,40(sp)
 16e:	6145                	addi	sp,sp,48
 170:	8082                	ret

0000000000000172 <memset>:

void*
memset(void *dst, int c, uint n)
{
 172:	7179                	addi	sp,sp,-48
 174:	f422                	sd	s0,40(sp)
 176:	1800                	addi	s0,sp,48
 178:	fca43c23          	sd	a0,-40(s0)
 17c:	87ae                	mv	a5,a1
 17e:	8732                	mv	a4,a2
 180:	fcf42a23          	sw	a5,-44(s0)
 184:	87ba                	mv	a5,a4
 186:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
 18a:	fd843783          	ld	a5,-40(s0)
 18e:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
 192:	fe042623          	sw	zero,-20(s0)
 196:	a00d                	j	1b8 <memset+0x46>
    cdst[i] = c;
 198:	fec42783          	lw	a5,-20(s0)
 19c:	fe043703          	ld	a4,-32(s0)
 1a0:	97ba                	add	a5,a5,a4
 1a2:	fd442703          	lw	a4,-44(s0)
 1a6:	0ff77713          	andi	a4,a4,255
 1aa:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
 1ae:	fec42783          	lw	a5,-20(s0)
 1b2:	2785                	addiw	a5,a5,1
 1b4:	fef42623          	sw	a5,-20(s0)
 1b8:	fec42703          	lw	a4,-20(s0)
 1bc:	fd042783          	lw	a5,-48(s0)
 1c0:	2781                	sext.w	a5,a5
 1c2:	fcf76be3          	bltu	a4,a5,198 <memset+0x26>
  }
  return dst;
 1c6:	fd843783          	ld	a5,-40(s0)
}
 1ca:	853e                	mv	a0,a5
 1cc:	7422                	ld	s0,40(sp)
 1ce:	6145                	addi	sp,sp,48
 1d0:	8082                	ret

00000000000001d2 <strchr>:

char*
strchr(const char *s, char c)
{
 1d2:	1101                	addi	sp,sp,-32
 1d4:	ec22                	sd	s0,24(sp)
 1d6:	1000                	addi	s0,sp,32
 1d8:	fea43423          	sd	a0,-24(s0)
 1dc:	87ae                	mv	a5,a1
 1de:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
 1e2:	a01d                	j	208 <strchr+0x36>
    if(*s == c)
 1e4:	fe843783          	ld	a5,-24(s0)
 1e8:	0007c703          	lbu	a4,0(a5)
 1ec:	fe744783          	lbu	a5,-25(s0)
 1f0:	0ff7f793          	andi	a5,a5,255
 1f4:	00e79563          	bne	a5,a4,1fe <strchr+0x2c>
      return (char*)s;
 1f8:	fe843783          	ld	a5,-24(s0)
 1fc:	a821                	j	214 <strchr+0x42>
  for(; *s; s++)
 1fe:	fe843783          	ld	a5,-24(s0)
 202:	0785                	addi	a5,a5,1
 204:	fef43423          	sd	a5,-24(s0)
 208:	fe843783          	ld	a5,-24(s0)
 20c:	0007c783          	lbu	a5,0(a5)
 210:	fbf1                	bnez	a5,1e4 <strchr+0x12>
  return 0;
 212:	4781                	li	a5,0
}
 214:	853e                	mv	a0,a5
 216:	6462                	ld	s0,24(sp)
 218:	6105                	addi	sp,sp,32
 21a:	8082                	ret

000000000000021c <gets>:

char*
gets(char *buf, int max)
{
 21c:	7179                	addi	sp,sp,-48
 21e:	f406                	sd	ra,40(sp)
 220:	f022                	sd	s0,32(sp)
 222:	1800                	addi	s0,sp,48
 224:	fca43c23          	sd	a0,-40(s0)
 228:	87ae                	mv	a5,a1
 22a:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 22e:	fe042623          	sw	zero,-20(s0)
 232:	a8a1                	j	28a <gets+0x6e>
    cc = read(0, &c, 1);
 234:	fe740793          	addi	a5,s0,-25
 238:	4605                	li	a2,1
 23a:	85be                	mv	a1,a5
 23c:	4501                	li	a0,0
 23e:	00000097          	auipc	ra,0x0
 242:	2f6080e7          	jalr	758(ra) # 534 <read>
 246:	87aa                	mv	a5,a0
 248:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
 24c:	fe842783          	lw	a5,-24(s0)
 250:	2781                	sext.w	a5,a5
 252:	04f05763          	blez	a5,2a0 <gets+0x84>
      break;
    buf[i++] = c;
 256:	fec42783          	lw	a5,-20(s0)
 25a:	0017871b          	addiw	a4,a5,1
 25e:	fee42623          	sw	a4,-20(s0)
 262:	873e                	mv	a4,a5
 264:	fd843783          	ld	a5,-40(s0)
 268:	97ba                	add	a5,a5,a4
 26a:	fe744703          	lbu	a4,-25(s0)
 26e:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
 272:	fe744783          	lbu	a5,-25(s0)
 276:	873e                	mv	a4,a5
 278:	47a9                	li	a5,10
 27a:	02f70463          	beq	a4,a5,2a2 <gets+0x86>
 27e:	fe744783          	lbu	a5,-25(s0)
 282:	873e                	mv	a4,a5
 284:	47b5                	li	a5,13
 286:	00f70e63          	beq	a4,a5,2a2 <gets+0x86>
  for(i=0; i+1 < max; ){
 28a:	fec42783          	lw	a5,-20(s0)
 28e:	2785                	addiw	a5,a5,1
 290:	0007871b          	sext.w	a4,a5
 294:	fd442783          	lw	a5,-44(s0)
 298:	2781                	sext.w	a5,a5
 29a:	f8f74de3          	blt	a4,a5,234 <gets+0x18>
 29e:	a011                	j	2a2 <gets+0x86>
      break;
 2a0:	0001                	nop
      break;
  }
  buf[i] = '\0';
 2a2:	fec42783          	lw	a5,-20(s0)
 2a6:	fd843703          	ld	a4,-40(s0)
 2aa:	97ba                	add	a5,a5,a4
 2ac:	00078023          	sb	zero,0(a5)
  return buf;
 2b0:	fd843783          	ld	a5,-40(s0)
}
 2b4:	853e                	mv	a0,a5
 2b6:	70a2                	ld	ra,40(sp)
 2b8:	7402                	ld	s0,32(sp)
 2ba:	6145                	addi	sp,sp,48
 2bc:	8082                	ret

00000000000002be <stat>:

int
stat(const char *n, struct stat *st)
{
 2be:	7179                	addi	sp,sp,-48
 2c0:	f406                	sd	ra,40(sp)
 2c2:	f022                	sd	s0,32(sp)
 2c4:	1800                	addi	s0,sp,48
 2c6:	fca43c23          	sd	a0,-40(s0)
 2ca:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2ce:	4581                	li	a1,0
 2d0:	fd843503          	ld	a0,-40(s0)
 2d4:	00000097          	auipc	ra,0x0
 2d8:	288080e7          	jalr	648(ra) # 55c <open>
 2dc:	87aa                	mv	a5,a0
 2de:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
 2e2:	fec42783          	lw	a5,-20(s0)
 2e6:	2781                	sext.w	a5,a5
 2e8:	0007d463          	bgez	a5,2f0 <stat+0x32>
    return -1;
 2ec:	57fd                	li	a5,-1
 2ee:	a035                	j	31a <stat+0x5c>
  r = fstat(fd, st);
 2f0:	fec42783          	lw	a5,-20(s0)
 2f4:	fd043583          	ld	a1,-48(s0)
 2f8:	853e                	mv	a0,a5
 2fa:	00000097          	auipc	ra,0x0
 2fe:	27a080e7          	jalr	634(ra) # 574 <fstat>
 302:	87aa                	mv	a5,a0
 304:	fef42423          	sw	a5,-24(s0)
  close(fd);
 308:	fec42783          	lw	a5,-20(s0)
 30c:	853e                	mv	a0,a5
 30e:	00000097          	auipc	ra,0x0
 312:	236080e7          	jalr	566(ra) # 544 <close>
  return r;
 316:	fe842783          	lw	a5,-24(s0)
}
 31a:	853e                	mv	a0,a5
 31c:	70a2                	ld	ra,40(sp)
 31e:	7402                	ld	s0,32(sp)
 320:	6145                	addi	sp,sp,48
 322:	8082                	ret

0000000000000324 <atoi>:

int
atoi(const char *s)
{
 324:	7179                	addi	sp,sp,-48
 326:	f422                	sd	s0,40(sp)
 328:	1800                	addi	s0,sp,48
 32a:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
 32e:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
 332:	a815                	j	366 <atoi+0x42>
    n = n*10 + *s++ - '0';
 334:	fec42703          	lw	a4,-20(s0)
 338:	87ba                	mv	a5,a4
 33a:	0027979b          	slliw	a5,a5,0x2
 33e:	9fb9                	addw	a5,a5,a4
 340:	0017979b          	slliw	a5,a5,0x1
 344:	0007871b          	sext.w	a4,a5
 348:	fd843783          	ld	a5,-40(s0)
 34c:	00178693          	addi	a3,a5,1
 350:	fcd43c23          	sd	a3,-40(s0)
 354:	0007c783          	lbu	a5,0(a5)
 358:	2781                	sext.w	a5,a5
 35a:	9fb9                	addw	a5,a5,a4
 35c:	2781                	sext.w	a5,a5
 35e:	fd07879b          	addiw	a5,a5,-48
 362:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
 366:	fd843783          	ld	a5,-40(s0)
 36a:	0007c783          	lbu	a5,0(a5)
 36e:	873e                	mv	a4,a5
 370:	02f00793          	li	a5,47
 374:	00e7fb63          	bgeu	a5,a4,38a <atoi+0x66>
 378:	fd843783          	ld	a5,-40(s0)
 37c:	0007c783          	lbu	a5,0(a5)
 380:	873e                	mv	a4,a5
 382:	03900793          	li	a5,57
 386:	fae7f7e3          	bgeu	a5,a4,334 <atoi+0x10>
  return n;
 38a:	fec42783          	lw	a5,-20(s0)
}
 38e:	853e                	mv	a0,a5
 390:	7422                	ld	s0,40(sp)
 392:	6145                	addi	sp,sp,48
 394:	8082                	ret

0000000000000396 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 396:	7139                	addi	sp,sp,-64
 398:	fc22                	sd	s0,56(sp)
 39a:	0080                	addi	s0,sp,64
 39c:	fca43c23          	sd	a0,-40(s0)
 3a0:	fcb43823          	sd	a1,-48(s0)
 3a4:	87b2                	mv	a5,a2
 3a6:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
 3aa:	fd843783          	ld	a5,-40(s0)
 3ae:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
 3b2:	fd043783          	ld	a5,-48(s0)
 3b6:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
 3ba:	fe043703          	ld	a4,-32(s0)
 3be:	fe843783          	ld	a5,-24(s0)
 3c2:	02e7fc63          	bgeu	a5,a4,3fa <memmove+0x64>
    while(n-- > 0)
 3c6:	a00d                	j	3e8 <memmove+0x52>
      *dst++ = *src++;
 3c8:	fe043703          	ld	a4,-32(s0)
 3cc:	00170793          	addi	a5,a4,1
 3d0:	fef43023          	sd	a5,-32(s0)
 3d4:	fe843783          	ld	a5,-24(s0)
 3d8:	00178693          	addi	a3,a5,1
 3dc:	fed43423          	sd	a3,-24(s0)
 3e0:	00074703          	lbu	a4,0(a4)
 3e4:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 3e8:	fcc42783          	lw	a5,-52(s0)
 3ec:	fff7871b          	addiw	a4,a5,-1
 3f0:	fce42623          	sw	a4,-52(s0)
 3f4:	fcf04ae3          	bgtz	a5,3c8 <memmove+0x32>
 3f8:	a891                	j	44c <memmove+0xb6>
  } else {
    dst += n;
 3fa:	fcc42783          	lw	a5,-52(s0)
 3fe:	fe843703          	ld	a4,-24(s0)
 402:	97ba                	add	a5,a5,a4
 404:	fef43423          	sd	a5,-24(s0)
    src += n;
 408:	fcc42783          	lw	a5,-52(s0)
 40c:	fe043703          	ld	a4,-32(s0)
 410:	97ba                	add	a5,a5,a4
 412:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
 416:	a01d                	j	43c <memmove+0xa6>
      *--dst = *--src;
 418:	fe043783          	ld	a5,-32(s0)
 41c:	17fd                	addi	a5,a5,-1
 41e:	fef43023          	sd	a5,-32(s0)
 422:	fe843783          	ld	a5,-24(s0)
 426:	17fd                	addi	a5,a5,-1
 428:	fef43423          	sd	a5,-24(s0)
 42c:	fe043783          	ld	a5,-32(s0)
 430:	0007c703          	lbu	a4,0(a5)
 434:	fe843783          	ld	a5,-24(s0)
 438:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 43c:	fcc42783          	lw	a5,-52(s0)
 440:	fff7871b          	addiw	a4,a5,-1
 444:	fce42623          	sw	a4,-52(s0)
 448:	fcf048e3          	bgtz	a5,418 <memmove+0x82>
  }
  return vdst;
 44c:	fd843783          	ld	a5,-40(s0)
}
 450:	853e                	mv	a0,a5
 452:	7462                	ld	s0,56(sp)
 454:	6121                	addi	sp,sp,64
 456:	8082                	ret

0000000000000458 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 458:	7139                	addi	sp,sp,-64
 45a:	fc22                	sd	s0,56(sp)
 45c:	0080                	addi	s0,sp,64
 45e:	fca43c23          	sd	a0,-40(s0)
 462:	fcb43823          	sd	a1,-48(s0)
 466:	87b2                	mv	a5,a2
 468:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
 46c:	fd843783          	ld	a5,-40(s0)
 470:	fef43423          	sd	a5,-24(s0)
 474:	fd043783          	ld	a5,-48(s0)
 478:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 47c:	a0a1                	j	4c4 <memcmp+0x6c>
    if (*p1 != *p2) {
 47e:	fe843783          	ld	a5,-24(s0)
 482:	0007c703          	lbu	a4,0(a5)
 486:	fe043783          	ld	a5,-32(s0)
 48a:	0007c783          	lbu	a5,0(a5)
 48e:	02f70163          	beq	a4,a5,4b0 <memcmp+0x58>
      return *p1 - *p2;
 492:	fe843783          	ld	a5,-24(s0)
 496:	0007c783          	lbu	a5,0(a5)
 49a:	0007871b          	sext.w	a4,a5
 49e:	fe043783          	ld	a5,-32(s0)
 4a2:	0007c783          	lbu	a5,0(a5)
 4a6:	2781                	sext.w	a5,a5
 4a8:	40f707bb          	subw	a5,a4,a5
 4ac:	2781                	sext.w	a5,a5
 4ae:	a01d                	j	4d4 <memcmp+0x7c>
    }
    p1++;
 4b0:	fe843783          	ld	a5,-24(s0)
 4b4:	0785                	addi	a5,a5,1
 4b6:	fef43423          	sd	a5,-24(s0)
    p2++;
 4ba:	fe043783          	ld	a5,-32(s0)
 4be:	0785                	addi	a5,a5,1
 4c0:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 4c4:	fcc42783          	lw	a5,-52(s0)
 4c8:	fff7871b          	addiw	a4,a5,-1
 4cc:	fce42623          	sw	a4,-52(s0)
 4d0:	f7dd                	bnez	a5,47e <memcmp+0x26>
  }
  return 0;
 4d2:	4781                	li	a5,0
}
 4d4:	853e                	mv	a0,a5
 4d6:	7462                	ld	s0,56(sp)
 4d8:	6121                	addi	sp,sp,64
 4da:	8082                	ret

00000000000004dc <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 4dc:	7179                	addi	sp,sp,-48
 4de:	f406                	sd	ra,40(sp)
 4e0:	f022                	sd	s0,32(sp)
 4e2:	1800                	addi	s0,sp,48
 4e4:	fea43423          	sd	a0,-24(s0)
 4e8:	feb43023          	sd	a1,-32(s0)
 4ec:	87b2                	mv	a5,a2
 4ee:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
 4f2:	fdc42783          	lw	a5,-36(s0)
 4f6:	863e                	mv	a2,a5
 4f8:	fe043583          	ld	a1,-32(s0)
 4fc:	fe843503          	ld	a0,-24(s0)
 500:	00000097          	auipc	ra,0x0
 504:	e96080e7          	jalr	-362(ra) # 396 <memmove>
 508:	87aa                	mv	a5,a0
}
 50a:	853e                	mv	a0,a5
 50c:	70a2                	ld	ra,40(sp)
 50e:	7402                	ld	s0,32(sp)
 510:	6145                	addi	sp,sp,48
 512:	8082                	ret

0000000000000514 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 514:	4885                	li	a7,1
 ecall
 516:	00000073          	ecall
 ret
 51a:	8082                	ret

000000000000051c <exit>:
.global exit
exit:
 li a7, SYS_exit
 51c:	4889                	li	a7,2
 ecall
 51e:	00000073          	ecall
 ret
 522:	8082                	ret

0000000000000524 <wait>:
.global wait
wait:
 li a7, SYS_wait
 524:	488d                	li	a7,3
 ecall
 526:	00000073          	ecall
 ret
 52a:	8082                	ret

000000000000052c <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 52c:	4891                	li	a7,4
 ecall
 52e:	00000073          	ecall
 ret
 532:	8082                	ret

0000000000000534 <read>:
.global read
read:
 li a7, SYS_read
 534:	4895                	li	a7,5
 ecall
 536:	00000073          	ecall
 ret
 53a:	8082                	ret

000000000000053c <write>:
.global write
write:
 li a7, SYS_write
 53c:	48c1                	li	a7,16
 ecall
 53e:	00000073          	ecall
 ret
 542:	8082                	ret

0000000000000544 <close>:
.global close
close:
 li a7, SYS_close
 544:	48d5                	li	a7,21
 ecall
 546:	00000073          	ecall
 ret
 54a:	8082                	ret

000000000000054c <kill>:
.global kill
kill:
 li a7, SYS_kill
 54c:	4899                	li	a7,6
 ecall
 54e:	00000073          	ecall
 ret
 552:	8082                	ret

0000000000000554 <exec>:
.global exec
exec:
 li a7, SYS_exec
 554:	489d                	li	a7,7
 ecall
 556:	00000073          	ecall
 ret
 55a:	8082                	ret

000000000000055c <open>:
.global open
open:
 li a7, SYS_open
 55c:	48bd                	li	a7,15
 ecall
 55e:	00000073          	ecall
 ret
 562:	8082                	ret

0000000000000564 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 564:	48c5                	li	a7,17
 ecall
 566:	00000073          	ecall
 ret
 56a:	8082                	ret

000000000000056c <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 56c:	48c9                	li	a7,18
 ecall
 56e:	00000073          	ecall
 ret
 572:	8082                	ret

0000000000000574 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 574:	48a1                	li	a7,8
 ecall
 576:	00000073          	ecall
 ret
 57a:	8082                	ret

000000000000057c <link>:
.global link
link:
 li a7, SYS_link
 57c:	48cd                	li	a7,19
 ecall
 57e:	00000073          	ecall
 ret
 582:	8082                	ret

0000000000000584 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 584:	48d1                	li	a7,20
 ecall
 586:	00000073          	ecall
 ret
 58a:	8082                	ret

000000000000058c <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 58c:	48a5                	li	a7,9
 ecall
 58e:	00000073          	ecall
 ret
 592:	8082                	ret

0000000000000594 <dup>:
.global dup
dup:
 li a7, SYS_dup
 594:	48a9                	li	a7,10
 ecall
 596:	00000073          	ecall
 ret
 59a:	8082                	ret

000000000000059c <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 59c:	48ad                	li	a7,11
 ecall
 59e:	00000073          	ecall
 ret
 5a2:	8082                	ret

00000000000005a4 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 5a4:	48b1                	li	a7,12
 ecall
 5a6:	00000073          	ecall
 ret
 5aa:	8082                	ret

00000000000005ac <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 5ac:	48b5                	li	a7,13
 ecall
 5ae:	00000073          	ecall
 ret
 5b2:	8082                	ret

00000000000005b4 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 5b4:	48b9                	li	a7,14
 ecall
 5b6:	00000073          	ecall
 ret
 5ba:	8082                	ret

00000000000005bc <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 5bc:	1101                	addi	sp,sp,-32
 5be:	ec06                	sd	ra,24(sp)
 5c0:	e822                	sd	s0,16(sp)
 5c2:	1000                	addi	s0,sp,32
 5c4:	87aa                	mv	a5,a0
 5c6:	872e                	mv	a4,a1
 5c8:	fef42623          	sw	a5,-20(s0)
 5cc:	87ba                	mv	a5,a4
 5ce:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
 5d2:	feb40713          	addi	a4,s0,-21
 5d6:	fec42783          	lw	a5,-20(s0)
 5da:	4605                	li	a2,1
 5dc:	85ba                	mv	a1,a4
 5de:	853e                	mv	a0,a5
 5e0:	00000097          	auipc	ra,0x0
 5e4:	f5c080e7          	jalr	-164(ra) # 53c <write>
}
 5e8:	0001                	nop
 5ea:	60e2                	ld	ra,24(sp)
 5ec:	6442                	ld	s0,16(sp)
 5ee:	6105                	addi	sp,sp,32
 5f0:	8082                	ret

00000000000005f2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5f2:	7139                	addi	sp,sp,-64
 5f4:	fc06                	sd	ra,56(sp)
 5f6:	f822                	sd	s0,48(sp)
 5f8:	0080                	addi	s0,sp,64
 5fa:	87aa                	mv	a5,a0
 5fc:	8736                	mv	a4,a3
 5fe:	fcf42623          	sw	a5,-52(s0)
 602:	87ae                	mv	a5,a1
 604:	fcf42423          	sw	a5,-56(s0)
 608:	87b2                	mv	a5,a2
 60a:	fcf42223          	sw	a5,-60(s0)
 60e:	87ba                	mv	a5,a4
 610:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 614:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
 618:	fc042783          	lw	a5,-64(s0)
 61c:	2781                	sext.w	a5,a5
 61e:	c38d                	beqz	a5,640 <printint+0x4e>
 620:	fc842783          	lw	a5,-56(s0)
 624:	2781                	sext.w	a5,a5
 626:	0007dd63          	bgez	a5,640 <printint+0x4e>
    neg = 1;
 62a:	4785                	li	a5,1
 62c:	fef42423          	sw	a5,-24(s0)
    x = -xx;
 630:	fc842783          	lw	a5,-56(s0)
 634:	40f007bb          	negw	a5,a5
 638:	2781                	sext.w	a5,a5
 63a:	fef42223          	sw	a5,-28(s0)
 63e:	a029                	j	648 <printint+0x56>
  } else {
    x = xx;
 640:	fc842783          	lw	a5,-56(s0)
 644:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
 648:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
 64c:	fc442783          	lw	a5,-60(s0)
 650:	fe442703          	lw	a4,-28(s0)
 654:	02f777bb          	remuw	a5,a4,a5
 658:	0007861b          	sext.w	a2,a5
 65c:	fec42783          	lw	a5,-20(s0)
 660:	0017871b          	addiw	a4,a5,1
 664:	fee42623          	sw	a4,-20(s0)
 668:	00000697          	auipc	a3,0x0
 66c:	73868693          	addi	a3,a3,1848 # da0 <digits>
 670:	02061713          	slli	a4,a2,0x20
 674:	9301                	srli	a4,a4,0x20
 676:	9736                	add	a4,a4,a3
 678:	00074703          	lbu	a4,0(a4)
 67c:	ff040693          	addi	a3,s0,-16
 680:	97b6                	add	a5,a5,a3
 682:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
 686:	fc442783          	lw	a5,-60(s0)
 68a:	fe442703          	lw	a4,-28(s0)
 68e:	02f757bb          	divuw	a5,a4,a5
 692:	fef42223          	sw	a5,-28(s0)
 696:	fe442783          	lw	a5,-28(s0)
 69a:	2781                	sext.w	a5,a5
 69c:	fbc5                	bnez	a5,64c <printint+0x5a>
  if(neg)
 69e:	fe842783          	lw	a5,-24(s0)
 6a2:	2781                	sext.w	a5,a5
 6a4:	cf95                	beqz	a5,6e0 <printint+0xee>
    buf[i++] = '-';
 6a6:	fec42783          	lw	a5,-20(s0)
 6aa:	0017871b          	addiw	a4,a5,1
 6ae:	fee42623          	sw	a4,-20(s0)
 6b2:	ff040713          	addi	a4,s0,-16
 6b6:	97ba                	add	a5,a5,a4
 6b8:	02d00713          	li	a4,45
 6bc:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
 6c0:	a005                	j	6e0 <printint+0xee>
    putc(fd, buf[i]);
 6c2:	fec42783          	lw	a5,-20(s0)
 6c6:	ff040713          	addi	a4,s0,-16
 6ca:	97ba                	add	a5,a5,a4
 6cc:	fe07c703          	lbu	a4,-32(a5)
 6d0:	fcc42783          	lw	a5,-52(s0)
 6d4:	85ba                	mv	a1,a4
 6d6:	853e                	mv	a0,a5
 6d8:	00000097          	auipc	ra,0x0
 6dc:	ee4080e7          	jalr	-284(ra) # 5bc <putc>
  while(--i >= 0)
 6e0:	fec42783          	lw	a5,-20(s0)
 6e4:	37fd                	addiw	a5,a5,-1
 6e6:	fef42623          	sw	a5,-20(s0)
 6ea:	fec42783          	lw	a5,-20(s0)
 6ee:	2781                	sext.w	a5,a5
 6f0:	fc07d9e3          	bgez	a5,6c2 <printint+0xd0>
}
 6f4:	0001                	nop
 6f6:	0001                	nop
 6f8:	70e2                	ld	ra,56(sp)
 6fa:	7442                	ld	s0,48(sp)
 6fc:	6121                	addi	sp,sp,64
 6fe:	8082                	ret

0000000000000700 <printptr>:

static void
printptr(int fd, uint64 x) {
 700:	7179                	addi	sp,sp,-48
 702:	f406                	sd	ra,40(sp)
 704:	f022                	sd	s0,32(sp)
 706:	1800                	addi	s0,sp,48
 708:	87aa                	mv	a5,a0
 70a:	fcb43823          	sd	a1,-48(s0)
 70e:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
 712:	fdc42783          	lw	a5,-36(s0)
 716:	03000593          	li	a1,48
 71a:	853e                	mv	a0,a5
 71c:	00000097          	auipc	ra,0x0
 720:	ea0080e7          	jalr	-352(ra) # 5bc <putc>
  putc(fd, 'x');
 724:	fdc42783          	lw	a5,-36(s0)
 728:	07800593          	li	a1,120
 72c:	853e                	mv	a0,a5
 72e:	00000097          	auipc	ra,0x0
 732:	e8e080e7          	jalr	-370(ra) # 5bc <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 736:	fe042623          	sw	zero,-20(s0)
 73a:	a82d                	j	774 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 73c:	fd043783          	ld	a5,-48(s0)
 740:	93f1                	srli	a5,a5,0x3c
 742:	00000717          	auipc	a4,0x0
 746:	65e70713          	addi	a4,a4,1630 # da0 <digits>
 74a:	97ba                	add	a5,a5,a4
 74c:	0007c703          	lbu	a4,0(a5)
 750:	fdc42783          	lw	a5,-36(s0)
 754:	85ba                	mv	a1,a4
 756:	853e                	mv	a0,a5
 758:	00000097          	auipc	ra,0x0
 75c:	e64080e7          	jalr	-412(ra) # 5bc <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 760:	fec42783          	lw	a5,-20(s0)
 764:	2785                	addiw	a5,a5,1
 766:	fef42623          	sw	a5,-20(s0)
 76a:	fd043783          	ld	a5,-48(s0)
 76e:	0792                	slli	a5,a5,0x4
 770:	fcf43823          	sd	a5,-48(s0)
 774:	fec42783          	lw	a5,-20(s0)
 778:	873e                	mv	a4,a5
 77a:	47bd                	li	a5,15
 77c:	fce7f0e3          	bgeu	a5,a4,73c <printptr+0x3c>
}
 780:	0001                	nop
 782:	0001                	nop
 784:	70a2                	ld	ra,40(sp)
 786:	7402                	ld	s0,32(sp)
 788:	6145                	addi	sp,sp,48
 78a:	8082                	ret

000000000000078c <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 78c:	715d                	addi	sp,sp,-80
 78e:	e486                	sd	ra,72(sp)
 790:	e0a2                	sd	s0,64(sp)
 792:	0880                	addi	s0,sp,80
 794:	87aa                	mv	a5,a0
 796:	fcb43023          	sd	a1,-64(s0)
 79a:	fac43c23          	sd	a2,-72(s0)
 79e:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
 7a2:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 7a6:	fe042223          	sw	zero,-28(s0)
 7aa:	a42d                	j	9d4 <vprintf+0x248>
    c = fmt[i] & 0xff;
 7ac:	fe442783          	lw	a5,-28(s0)
 7b0:	fc043703          	ld	a4,-64(s0)
 7b4:	97ba                	add	a5,a5,a4
 7b6:	0007c783          	lbu	a5,0(a5)
 7ba:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
 7be:	fe042783          	lw	a5,-32(s0)
 7c2:	2781                	sext.w	a5,a5
 7c4:	eb9d                	bnez	a5,7fa <vprintf+0x6e>
      if(c == '%'){
 7c6:	fdc42783          	lw	a5,-36(s0)
 7ca:	0007871b          	sext.w	a4,a5
 7ce:	02500793          	li	a5,37
 7d2:	00f71763          	bne	a4,a5,7e0 <vprintf+0x54>
        state = '%';
 7d6:	02500793          	li	a5,37
 7da:	fef42023          	sw	a5,-32(s0)
 7de:	a2f5                	j	9ca <vprintf+0x23e>
      } else {
        putc(fd, c);
 7e0:	fdc42783          	lw	a5,-36(s0)
 7e4:	0ff7f713          	andi	a4,a5,255
 7e8:	fcc42783          	lw	a5,-52(s0)
 7ec:	85ba                	mv	a1,a4
 7ee:	853e                	mv	a0,a5
 7f0:	00000097          	auipc	ra,0x0
 7f4:	dcc080e7          	jalr	-564(ra) # 5bc <putc>
 7f8:	aac9                	j	9ca <vprintf+0x23e>
      }
    } else if(state == '%'){
 7fa:	fe042783          	lw	a5,-32(s0)
 7fe:	0007871b          	sext.w	a4,a5
 802:	02500793          	li	a5,37
 806:	1cf71263          	bne	a4,a5,9ca <vprintf+0x23e>
      if(c == 'd'){
 80a:	fdc42783          	lw	a5,-36(s0)
 80e:	0007871b          	sext.w	a4,a5
 812:	06400793          	li	a5,100
 816:	02f71463          	bne	a4,a5,83e <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
 81a:	fb843783          	ld	a5,-72(s0)
 81e:	00878713          	addi	a4,a5,8
 822:	fae43c23          	sd	a4,-72(s0)
 826:	4398                	lw	a4,0(a5)
 828:	fcc42783          	lw	a5,-52(s0)
 82c:	4685                	li	a3,1
 82e:	4629                	li	a2,10
 830:	85ba                	mv	a1,a4
 832:	853e                	mv	a0,a5
 834:	00000097          	auipc	ra,0x0
 838:	dbe080e7          	jalr	-578(ra) # 5f2 <printint>
 83c:	a269                	j	9c6 <vprintf+0x23a>
      } else if(c == 'l') {
 83e:	fdc42783          	lw	a5,-36(s0)
 842:	0007871b          	sext.w	a4,a5
 846:	06c00793          	li	a5,108
 84a:	02f71663          	bne	a4,a5,876 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
 84e:	fb843783          	ld	a5,-72(s0)
 852:	00878713          	addi	a4,a5,8
 856:	fae43c23          	sd	a4,-72(s0)
 85a:	639c                	ld	a5,0(a5)
 85c:	0007871b          	sext.w	a4,a5
 860:	fcc42783          	lw	a5,-52(s0)
 864:	4681                	li	a3,0
 866:	4629                	li	a2,10
 868:	85ba                	mv	a1,a4
 86a:	853e                	mv	a0,a5
 86c:	00000097          	auipc	ra,0x0
 870:	d86080e7          	jalr	-634(ra) # 5f2 <printint>
 874:	aa89                	j	9c6 <vprintf+0x23a>
      } else if(c == 'x') {
 876:	fdc42783          	lw	a5,-36(s0)
 87a:	0007871b          	sext.w	a4,a5
 87e:	07800793          	li	a5,120
 882:	02f71463          	bne	a4,a5,8aa <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
 886:	fb843783          	ld	a5,-72(s0)
 88a:	00878713          	addi	a4,a5,8
 88e:	fae43c23          	sd	a4,-72(s0)
 892:	4398                	lw	a4,0(a5)
 894:	fcc42783          	lw	a5,-52(s0)
 898:	4681                	li	a3,0
 89a:	4641                	li	a2,16
 89c:	85ba                	mv	a1,a4
 89e:	853e                	mv	a0,a5
 8a0:	00000097          	auipc	ra,0x0
 8a4:	d52080e7          	jalr	-686(ra) # 5f2 <printint>
 8a8:	aa39                	j	9c6 <vprintf+0x23a>
      } else if(c == 'p') {
 8aa:	fdc42783          	lw	a5,-36(s0)
 8ae:	0007871b          	sext.w	a4,a5
 8b2:	07000793          	li	a5,112
 8b6:	02f71263          	bne	a4,a5,8da <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
 8ba:	fb843783          	ld	a5,-72(s0)
 8be:	00878713          	addi	a4,a5,8
 8c2:	fae43c23          	sd	a4,-72(s0)
 8c6:	6398                	ld	a4,0(a5)
 8c8:	fcc42783          	lw	a5,-52(s0)
 8cc:	85ba                	mv	a1,a4
 8ce:	853e                	mv	a0,a5
 8d0:	00000097          	auipc	ra,0x0
 8d4:	e30080e7          	jalr	-464(ra) # 700 <printptr>
 8d8:	a0fd                	j	9c6 <vprintf+0x23a>
      } else if(c == 's'){
 8da:	fdc42783          	lw	a5,-36(s0)
 8de:	0007871b          	sext.w	a4,a5
 8e2:	07300793          	li	a5,115
 8e6:	04f71c63          	bne	a4,a5,93e <vprintf+0x1b2>
        s = va_arg(ap, char*);
 8ea:	fb843783          	ld	a5,-72(s0)
 8ee:	00878713          	addi	a4,a5,8
 8f2:	fae43c23          	sd	a4,-72(s0)
 8f6:	639c                	ld	a5,0(a5)
 8f8:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
 8fc:	fe843783          	ld	a5,-24(s0)
 900:	eb8d                	bnez	a5,932 <vprintf+0x1a6>
          s = "(null)";
 902:	00000797          	auipc	a5,0x0
 906:	49678793          	addi	a5,a5,1174 # d98 <malloc+0x15c>
 90a:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 90e:	a015                	j	932 <vprintf+0x1a6>
          putc(fd, *s);
 910:	fe843783          	ld	a5,-24(s0)
 914:	0007c703          	lbu	a4,0(a5)
 918:	fcc42783          	lw	a5,-52(s0)
 91c:	85ba                	mv	a1,a4
 91e:	853e                	mv	a0,a5
 920:	00000097          	auipc	ra,0x0
 924:	c9c080e7          	jalr	-868(ra) # 5bc <putc>
          s++;
 928:	fe843783          	ld	a5,-24(s0)
 92c:	0785                	addi	a5,a5,1
 92e:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 932:	fe843783          	ld	a5,-24(s0)
 936:	0007c783          	lbu	a5,0(a5)
 93a:	fbf9                	bnez	a5,910 <vprintf+0x184>
 93c:	a069                	j	9c6 <vprintf+0x23a>
        }
      } else if(c == 'c'){
 93e:	fdc42783          	lw	a5,-36(s0)
 942:	0007871b          	sext.w	a4,a5
 946:	06300793          	li	a5,99
 94a:	02f71463          	bne	a4,a5,972 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
 94e:	fb843783          	ld	a5,-72(s0)
 952:	00878713          	addi	a4,a5,8
 956:	fae43c23          	sd	a4,-72(s0)
 95a:	439c                	lw	a5,0(a5)
 95c:	0ff7f713          	andi	a4,a5,255
 960:	fcc42783          	lw	a5,-52(s0)
 964:	85ba                	mv	a1,a4
 966:	853e                	mv	a0,a5
 968:	00000097          	auipc	ra,0x0
 96c:	c54080e7          	jalr	-940(ra) # 5bc <putc>
 970:	a899                	j	9c6 <vprintf+0x23a>
      } else if(c == '%'){
 972:	fdc42783          	lw	a5,-36(s0)
 976:	0007871b          	sext.w	a4,a5
 97a:	02500793          	li	a5,37
 97e:	00f71f63          	bne	a4,a5,99c <vprintf+0x210>
        putc(fd, c);
 982:	fdc42783          	lw	a5,-36(s0)
 986:	0ff7f713          	andi	a4,a5,255
 98a:	fcc42783          	lw	a5,-52(s0)
 98e:	85ba                	mv	a1,a4
 990:	853e                	mv	a0,a5
 992:	00000097          	auipc	ra,0x0
 996:	c2a080e7          	jalr	-982(ra) # 5bc <putc>
 99a:	a035                	j	9c6 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 99c:	fcc42783          	lw	a5,-52(s0)
 9a0:	02500593          	li	a1,37
 9a4:	853e                	mv	a0,a5
 9a6:	00000097          	auipc	ra,0x0
 9aa:	c16080e7          	jalr	-1002(ra) # 5bc <putc>
        putc(fd, c);
 9ae:	fdc42783          	lw	a5,-36(s0)
 9b2:	0ff7f713          	andi	a4,a5,255
 9b6:	fcc42783          	lw	a5,-52(s0)
 9ba:	85ba                	mv	a1,a4
 9bc:	853e                	mv	a0,a5
 9be:	00000097          	auipc	ra,0x0
 9c2:	bfe080e7          	jalr	-1026(ra) # 5bc <putc>
      }
      state = 0;
 9c6:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 9ca:	fe442783          	lw	a5,-28(s0)
 9ce:	2785                	addiw	a5,a5,1
 9d0:	fef42223          	sw	a5,-28(s0)
 9d4:	fe442783          	lw	a5,-28(s0)
 9d8:	fc043703          	ld	a4,-64(s0)
 9dc:	97ba                	add	a5,a5,a4
 9de:	0007c783          	lbu	a5,0(a5)
 9e2:	dc0795e3          	bnez	a5,7ac <vprintf+0x20>
    }
  }
}
 9e6:	0001                	nop
 9e8:	0001                	nop
 9ea:	60a6                	ld	ra,72(sp)
 9ec:	6406                	ld	s0,64(sp)
 9ee:	6161                	addi	sp,sp,80
 9f0:	8082                	ret

00000000000009f2 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 9f2:	7159                	addi	sp,sp,-112
 9f4:	fc06                	sd	ra,56(sp)
 9f6:	f822                	sd	s0,48(sp)
 9f8:	0080                	addi	s0,sp,64
 9fa:	fcb43823          	sd	a1,-48(s0)
 9fe:	e010                	sd	a2,0(s0)
 a00:	e414                	sd	a3,8(s0)
 a02:	e818                	sd	a4,16(s0)
 a04:	ec1c                	sd	a5,24(s0)
 a06:	03043023          	sd	a6,32(s0)
 a0a:	03143423          	sd	a7,40(s0)
 a0e:	87aa                	mv	a5,a0
 a10:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
 a14:	03040793          	addi	a5,s0,48
 a18:	fcf43423          	sd	a5,-56(s0)
 a1c:	fc843783          	ld	a5,-56(s0)
 a20:	fd078793          	addi	a5,a5,-48
 a24:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
 a28:	fe843703          	ld	a4,-24(s0)
 a2c:	fdc42783          	lw	a5,-36(s0)
 a30:	863a                	mv	a2,a4
 a32:	fd043583          	ld	a1,-48(s0)
 a36:	853e                	mv	a0,a5
 a38:	00000097          	auipc	ra,0x0
 a3c:	d54080e7          	jalr	-684(ra) # 78c <vprintf>
}
 a40:	0001                	nop
 a42:	70e2                	ld	ra,56(sp)
 a44:	7442                	ld	s0,48(sp)
 a46:	6165                	addi	sp,sp,112
 a48:	8082                	ret

0000000000000a4a <printf>:

void
printf(const char *fmt, ...)
{
 a4a:	7159                	addi	sp,sp,-112
 a4c:	f406                	sd	ra,40(sp)
 a4e:	f022                	sd	s0,32(sp)
 a50:	1800                	addi	s0,sp,48
 a52:	fca43c23          	sd	a0,-40(s0)
 a56:	e40c                	sd	a1,8(s0)
 a58:	e810                	sd	a2,16(s0)
 a5a:	ec14                	sd	a3,24(s0)
 a5c:	f018                	sd	a4,32(s0)
 a5e:	f41c                	sd	a5,40(s0)
 a60:	03043823          	sd	a6,48(s0)
 a64:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 a68:	04040793          	addi	a5,s0,64
 a6c:	fcf43823          	sd	a5,-48(s0)
 a70:	fd043783          	ld	a5,-48(s0)
 a74:	fc878793          	addi	a5,a5,-56
 a78:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
 a7c:	fe843783          	ld	a5,-24(s0)
 a80:	863e                	mv	a2,a5
 a82:	fd843583          	ld	a1,-40(s0)
 a86:	4505                	li	a0,1
 a88:	00000097          	auipc	ra,0x0
 a8c:	d04080e7          	jalr	-764(ra) # 78c <vprintf>
}
 a90:	0001                	nop
 a92:	70a2                	ld	ra,40(sp)
 a94:	7402                	ld	s0,32(sp)
 a96:	6165                	addi	sp,sp,112
 a98:	8082                	ret

0000000000000a9a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a9a:	7179                	addi	sp,sp,-48
 a9c:	f422                	sd	s0,40(sp)
 a9e:	1800                	addi	s0,sp,48
 aa0:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 aa4:	fd843783          	ld	a5,-40(s0)
 aa8:	17c1                	addi	a5,a5,-16
 aaa:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 aae:	00000797          	auipc	a5,0x0
 ab2:	31a78793          	addi	a5,a5,794 # dc8 <freep>
 ab6:	639c                	ld	a5,0(a5)
 ab8:	fef43423          	sd	a5,-24(s0)
 abc:	a815                	j	af0 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 abe:	fe843783          	ld	a5,-24(s0)
 ac2:	639c                	ld	a5,0(a5)
 ac4:	fe843703          	ld	a4,-24(s0)
 ac8:	00f76f63          	bltu	a4,a5,ae6 <free+0x4c>
 acc:	fe043703          	ld	a4,-32(s0)
 ad0:	fe843783          	ld	a5,-24(s0)
 ad4:	02e7eb63          	bltu	a5,a4,b0a <free+0x70>
 ad8:	fe843783          	ld	a5,-24(s0)
 adc:	639c                	ld	a5,0(a5)
 ade:	fe043703          	ld	a4,-32(s0)
 ae2:	02f76463          	bltu	a4,a5,b0a <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ae6:	fe843783          	ld	a5,-24(s0)
 aea:	639c                	ld	a5,0(a5)
 aec:	fef43423          	sd	a5,-24(s0)
 af0:	fe043703          	ld	a4,-32(s0)
 af4:	fe843783          	ld	a5,-24(s0)
 af8:	fce7f3e3          	bgeu	a5,a4,abe <free+0x24>
 afc:	fe843783          	ld	a5,-24(s0)
 b00:	639c                	ld	a5,0(a5)
 b02:	fe043703          	ld	a4,-32(s0)
 b06:	faf77ce3          	bgeu	a4,a5,abe <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b0a:	fe043783          	ld	a5,-32(s0)
 b0e:	479c                	lw	a5,8(a5)
 b10:	1782                	slli	a5,a5,0x20
 b12:	9381                	srli	a5,a5,0x20
 b14:	0792                	slli	a5,a5,0x4
 b16:	fe043703          	ld	a4,-32(s0)
 b1a:	973e                	add	a4,a4,a5
 b1c:	fe843783          	ld	a5,-24(s0)
 b20:	639c                	ld	a5,0(a5)
 b22:	02f71763          	bne	a4,a5,b50 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
 b26:	fe043783          	ld	a5,-32(s0)
 b2a:	4798                	lw	a4,8(a5)
 b2c:	fe843783          	ld	a5,-24(s0)
 b30:	639c                	ld	a5,0(a5)
 b32:	479c                	lw	a5,8(a5)
 b34:	9fb9                	addw	a5,a5,a4
 b36:	0007871b          	sext.w	a4,a5
 b3a:	fe043783          	ld	a5,-32(s0)
 b3e:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
 b40:	fe843783          	ld	a5,-24(s0)
 b44:	639c                	ld	a5,0(a5)
 b46:	6398                	ld	a4,0(a5)
 b48:	fe043783          	ld	a5,-32(s0)
 b4c:	e398                	sd	a4,0(a5)
 b4e:	a039                	j	b5c <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
 b50:	fe843783          	ld	a5,-24(s0)
 b54:	6398                	ld	a4,0(a5)
 b56:	fe043783          	ld	a5,-32(s0)
 b5a:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
 b5c:	fe843783          	ld	a5,-24(s0)
 b60:	479c                	lw	a5,8(a5)
 b62:	1782                	slli	a5,a5,0x20
 b64:	9381                	srli	a5,a5,0x20
 b66:	0792                	slli	a5,a5,0x4
 b68:	fe843703          	ld	a4,-24(s0)
 b6c:	97ba                	add	a5,a5,a4
 b6e:	fe043703          	ld	a4,-32(s0)
 b72:	02f71563          	bne	a4,a5,b9c <free+0x102>
    p->s.size += bp->s.size;
 b76:	fe843783          	ld	a5,-24(s0)
 b7a:	4798                	lw	a4,8(a5)
 b7c:	fe043783          	ld	a5,-32(s0)
 b80:	479c                	lw	a5,8(a5)
 b82:	9fb9                	addw	a5,a5,a4
 b84:	0007871b          	sext.w	a4,a5
 b88:	fe843783          	ld	a5,-24(s0)
 b8c:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 b8e:	fe043783          	ld	a5,-32(s0)
 b92:	6398                	ld	a4,0(a5)
 b94:	fe843783          	ld	a5,-24(s0)
 b98:	e398                	sd	a4,0(a5)
 b9a:	a031                	j	ba6 <free+0x10c>
  } else
    p->s.ptr = bp;
 b9c:	fe843783          	ld	a5,-24(s0)
 ba0:	fe043703          	ld	a4,-32(s0)
 ba4:	e398                	sd	a4,0(a5)
  freep = p;
 ba6:	00000797          	auipc	a5,0x0
 baa:	22278793          	addi	a5,a5,546 # dc8 <freep>
 bae:	fe843703          	ld	a4,-24(s0)
 bb2:	e398                	sd	a4,0(a5)
}
 bb4:	0001                	nop
 bb6:	7422                	ld	s0,40(sp)
 bb8:	6145                	addi	sp,sp,48
 bba:	8082                	ret

0000000000000bbc <morecore>:

static Header*
morecore(uint nu)
{
 bbc:	7179                	addi	sp,sp,-48
 bbe:	f406                	sd	ra,40(sp)
 bc0:	f022                	sd	s0,32(sp)
 bc2:	1800                	addi	s0,sp,48
 bc4:	87aa                	mv	a5,a0
 bc6:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
 bca:	fdc42783          	lw	a5,-36(s0)
 bce:	0007871b          	sext.w	a4,a5
 bd2:	6785                	lui	a5,0x1
 bd4:	00f77563          	bgeu	a4,a5,bde <morecore+0x22>
    nu = 4096;
 bd8:	6785                	lui	a5,0x1
 bda:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
 bde:	fdc42783          	lw	a5,-36(s0)
 be2:	0047979b          	slliw	a5,a5,0x4
 be6:	2781                	sext.w	a5,a5
 be8:	2781                	sext.w	a5,a5
 bea:	853e                	mv	a0,a5
 bec:	00000097          	auipc	ra,0x0
 bf0:	9b8080e7          	jalr	-1608(ra) # 5a4 <sbrk>
 bf4:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
 bf8:	fe843703          	ld	a4,-24(s0)
 bfc:	57fd                	li	a5,-1
 bfe:	00f71463          	bne	a4,a5,c06 <morecore+0x4a>
    return 0;
 c02:	4781                	li	a5,0
 c04:	a03d                	j	c32 <morecore+0x76>
  hp = (Header*)p;
 c06:	fe843783          	ld	a5,-24(s0)
 c0a:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
 c0e:	fe043783          	ld	a5,-32(s0)
 c12:	fdc42703          	lw	a4,-36(s0)
 c16:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
 c18:	fe043783          	ld	a5,-32(s0)
 c1c:	07c1                	addi	a5,a5,16
 c1e:	853e                	mv	a0,a5
 c20:	00000097          	auipc	ra,0x0
 c24:	e7a080e7          	jalr	-390(ra) # a9a <free>
  return freep;
 c28:	00000797          	auipc	a5,0x0
 c2c:	1a078793          	addi	a5,a5,416 # dc8 <freep>
 c30:	639c                	ld	a5,0(a5)
}
 c32:	853e                	mv	a0,a5
 c34:	70a2                	ld	ra,40(sp)
 c36:	7402                	ld	s0,32(sp)
 c38:	6145                	addi	sp,sp,48
 c3a:	8082                	ret

0000000000000c3c <malloc>:

void*
malloc(uint nbytes)
{
 c3c:	7139                	addi	sp,sp,-64
 c3e:	fc06                	sd	ra,56(sp)
 c40:	f822                	sd	s0,48(sp)
 c42:	0080                	addi	s0,sp,64
 c44:	87aa                	mv	a5,a0
 c46:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c4a:	fcc46783          	lwu	a5,-52(s0)
 c4e:	07bd                	addi	a5,a5,15
 c50:	8391                	srli	a5,a5,0x4
 c52:	2781                	sext.w	a5,a5
 c54:	2785                	addiw	a5,a5,1
 c56:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
 c5a:	00000797          	auipc	a5,0x0
 c5e:	16e78793          	addi	a5,a5,366 # dc8 <freep>
 c62:	639c                	ld	a5,0(a5)
 c64:	fef43023          	sd	a5,-32(s0)
 c68:	fe043783          	ld	a5,-32(s0)
 c6c:	ef95                	bnez	a5,ca8 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
 c6e:	00000797          	auipc	a5,0x0
 c72:	14a78793          	addi	a5,a5,330 # db8 <base>
 c76:	fef43023          	sd	a5,-32(s0)
 c7a:	00000797          	auipc	a5,0x0
 c7e:	14e78793          	addi	a5,a5,334 # dc8 <freep>
 c82:	fe043703          	ld	a4,-32(s0)
 c86:	e398                	sd	a4,0(a5)
 c88:	00000797          	auipc	a5,0x0
 c8c:	14078793          	addi	a5,a5,320 # dc8 <freep>
 c90:	6398                	ld	a4,0(a5)
 c92:	00000797          	auipc	a5,0x0
 c96:	12678793          	addi	a5,a5,294 # db8 <base>
 c9a:	e398                	sd	a4,0(a5)
    base.s.size = 0;
 c9c:	00000797          	auipc	a5,0x0
 ca0:	11c78793          	addi	a5,a5,284 # db8 <base>
 ca4:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ca8:	fe043783          	ld	a5,-32(s0)
 cac:	639c                	ld	a5,0(a5)
 cae:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 cb2:	fe843783          	ld	a5,-24(s0)
 cb6:	4798                	lw	a4,8(a5)
 cb8:	fdc42783          	lw	a5,-36(s0)
 cbc:	2781                	sext.w	a5,a5
 cbe:	06f76863          	bltu	a4,a5,d2e <malloc+0xf2>
      if(p->s.size == nunits)
 cc2:	fe843783          	ld	a5,-24(s0)
 cc6:	4798                	lw	a4,8(a5)
 cc8:	fdc42783          	lw	a5,-36(s0)
 ccc:	2781                	sext.w	a5,a5
 cce:	00e79963          	bne	a5,a4,ce0 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
 cd2:	fe843783          	ld	a5,-24(s0)
 cd6:	6398                	ld	a4,0(a5)
 cd8:	fe043783          	ld	a5,-32(s0)
 cdc:	e398                	sd	a4,0(a5)
 cde:	a82d                	j	d18 <malloc+0xdc>
      else {
        p->s.size -= nunits;
 ce0:	fe843783          	ld	a5,-24(s0)
 ce4:	4798                	lw	a4,8(a5)
 ce6:	fdc42783          	lw	a5,-36(s0)
 cea:	40f707bb          	subw	a5,a4,a5
 cee:	0007871b          	sext.w	a4,a5
 cf2:	fe843783          	ld	a5,-24(s0)
 cf6:	c798                	sw	a4,8(a5)
        p += p->s.size;
 cf8:	fe843783          	ld	a5,-24(s0)
 cfc:	479c                	lw	a5,8(a5)
 cfe:	1782                	slli	a5,a5,0x20
 d00:	9381                	srli	a5,a5,0x20
 d02:	0792                	slli	a5,a5,0x4
 d04:	fe843703          	ld	a4,-24(s0)
 d08:	97ba                	add	a5,a5,a4
 d0a:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
 d0e:	fe843783          	ld	a5,-24(s0)
 d12:	fdc42703          	lw	a4,-36(s0)
 d16:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
 d18:	00000797          	auipc	a5,0x0
 d1c:	0b078793          	addi	a5,a5,176 # dc8 <freep>
 d20:	fe043703          	ld	a4,-32(s0)
 d24:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
 d26:	fe843783          	ld	a5,-24(s0)
 d2a:	07c1                	addi	a5,a5,16
 d2c:	a091                	j	d70 <malloc+0x134>
    }
    if(p == freep)
 d2e:	00000797          	auipc	a5,0x0
 d32:	09a78793          	addi	a5,a5,154 # dc8 <freep>
 d36:	639c                	ld	a5,0(a5)
 d38:	fe843703          	ld	a4,-24(s0)
 d3c:	02f71063          	bne	a4,a5,d5c <malloc+0x120>
      if((p = morecore(nunits)) == 0)
 d40:	fdc42783          	lw	a5,-36(s0)
 d44:	853e                	mv	a0,a5
 d46:	00000097          	auipc	ra,0x0
 d4a:	e76080e7          	jalr	-394(ra) # bbc <morecore>
 d4e:	fea43423          	sd	a0,-24(s0)
 d52:	fe843783          	ld	a5,-24(s0)
 d56:	e399                	bnez	a5,d5c <malloc+0x120>
        return 0;
 d58:	4781                	li	a5,0
 d5a:	a819                	j	d70 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d5c:	fe843783          	ld	a5,-24(s0)
 d60:	fef43023          	sd	a5,-32(s0)
 d64:	fe843783          	ld	a5,-24(s0)
 d68:	639c                	ld	a5,0(a5)
 d6a:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 d6e:	b791                	j	cb2 <malloc+0x76>
  }
}
 d70:	853e                	mv	a0,a5
 d72:	70e2                	ld	ra,56(sp)
 d74:	7442                	ld	s0,48(sp)
 d76:	6121                	addi	sp,sp,64
 d78:	8082                	ret
