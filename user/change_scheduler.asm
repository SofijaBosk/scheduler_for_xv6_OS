
user/_change_scheduler:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/fs.h"
//#include <string.h>

int
main(int args, char *argv[])
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	1800                	addi	s0,sp,48
   8:	87aa                	mv	a5,a0
   a:	fcb43823          	sd	a1,-48(s0)
   e:	fcf42e23          	sw	a5,-36(s0)
//    char c=argv[2][0];
//    int ex=c-'0';
//    //float nes=c-'0';
    int ex=atoi(argv[2]);
  12:	fd043783          	ld	a5,-48(s0)
  16:	07c1                	addi	a5,a5,16
  18:	639c                	ld	a5,0(a5)
  1a:	853e                	mv	a0,a5
  1c:	00000097          	auipc	ra,0x0
  20:	320080e7          	jalr	800(ra) # 33c <atoi>
  24:	87aa                	mv	a5,a0
  26:	fef42623          	sw	a5,-20(s0)
    int bool=atoi(argv[3]);
  2a:	fd043783          	ld	a5,-48(s0)
  2e:	07e1                	addi	a5,a5,24
  30:	639c                	ld	a5,0(a5)
  32:	853e                	mv	a0,a5
  34:	00000097          	auipc	ra,0x0
  38:	308080e7          	jalr	776(ra) # 33c <atoi>
  3c:	87aa                	mv	a5,a0
  3e:	fef42423          	sw	a5,-24(s0)
    printf("Broj: %d \n ",ex);
  42:	fec42783          	lw	a5,-20(s0)
  46:	85be                	mv	a1,a5
  48:	00001517          	auipc	a0,0x1
  4c:	d5850513          	addi	a0,a0,-680 # da0 <malloc+0x144>
  50:	00001097          	auipc	ra,0x1
  54:	a1a080e7          	jalr	-1510(ra) # a6a <printf>
    //printf("Broj: %d \n ",s);
   // printf("FLOAT: %f \n ",nes);
    if(argv[1]){
  58:	fd043783          	ld	a5,-48(s0)
  5c:	07a1                	addi	a5,a5,8
  5e:	639c                	ld	a5,0(a5)
  60:	c78d                	beqz	a5,8a <main+0x8a>
        changeSchedulingAlgorithm(argv[1],ex,bool);
  62:	fd043783          	ld	a5,-48(s0)
  66:	07a1                	addi	a5,a5,8
  68:	639c                	ld	a5,0(a5)
  6a:	fe842683          	lw	a3,-24(s0)
  6e:	fec42703          	lw	a4,-20(s0)
  72:	8636                	mv	a2,a3
  74:	85ba                	mv	a1,a4
  76:	853e                	mv	a0,a5
  78:	00000097          	auipc	ra,0x0
  7c:	55c080e7          	jalr	1372(ra) # 5d4 <changeSchedulingAlgorithm>
        exit(0);
  80:	4501                	li	a0,0
  82:	00000097          	auipc	ra,0x0
  86:	4b2080e7          	jalr	1202(ra) # 534 <exit>
    }
    else{
        printf("Not enough parameters \n");
  8a:	00001517          	auipc	a0,0x1
  8e:	d2650513          	addi	a0,a0,-730 # db0 <malloc+0x154>
  92:	00001097          	auipc	ra,0x1
  96:	9d8080e7          	jalr	-1576(ra) # a6a <printf>
        exit(-2);
  9a:	5579                	li	a0,-2
  9c:	00000097          	auipc	ra,0x0
  a0:	498080e7          	jalr	1176(ra) # 534 <exit>

00000000000000a4 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
  a4:	7179                	addi	sp,sp,-48
  a6:	f422                	sd	s0,40(sp)
  a8:	1800                	addi	s0,sp,48
  aa:	fca43c23          	sd	a0,-40(s0)
  ae:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
  b2:	fd843783          	ld	a5,-40(s0)
  b6:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
  ba:	0001                	nop
  bc:	fd043703          	ld	a4,-48(s0)
  c0:	00170793          	addi	a5,a4,1
  c4:	fcf43823          	sd	a5,-48(s0)
  c8:	fd843783          	ld	a5,-40(s0)
  cc:	00178693          	addi	a3,a5,1
  d0:	fcd43c23          	sd	a3,-40(s0)
  d4:	00074703          	lbu	a4,0(a4)
  d8:	00e78023          	sb	a4,0(a5)
  dc:	0007c783          	lbu	a5,0(a5)
  e0:	fff1                	bnez	a5,bc <strcpy+0x18>
    ;
  return os;
  e2:	fe843783          	ld	a5,-24(s0)
}
  e6:	853e                	mv	a0,a5
  e8:	7422                	ld	s0,40(sp)
  ea:	6145                	addi	sp,sp,48
  ec:	8082                	ret

00000000000000ee <strcmp>:

int
strcmp(const char *p, const char *q)
{
  ee:	1101                	addi	sp,sp,-32
  f0:	ec22                	sd	s0,24(sp)
  f2:	1000                	addi	s0,sp,32
  f4:	fea43423          	sd	a0,-24(s0)
  f8:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
  fc:	a819                	j	112 <strcmp+0x24>
    p++, q++;
  fe:	fe843783          	ld	a5,-24(s0)
 102:	0785                	addi	a5,a5,1
 104:	fef43423          	sd	a5,-24(s0)
 108:	fe043783          	ld	a5,-32(s0)
 10c:	0785                	addi	a5,a5,1
 10e:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
 112:	fe843783          	ld	a5,-24(s0)
 116:	0007c783          	lbu	a5,0(a5)
 11a:	cb99                	beqz	a5,130 <strcmp+0x42>
 11c:	fe843783          	ld	a5,-24(s0)
 120:	0007c703          	lbu	a4,0(a5)
 124:	fe043783          	ld	a5,-32(s0)
 128:	0007c783          	lbu	a5,0(a5)
 12c:	fcf709e3          	beq	a4,a5,fe <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
 130:	fe843783          	ld	a5,-24(s0)
 134:	0007c783          	lbu	a5,0(a5)
 138:	0007871b          	sext.w	a4,a5
 13c:	fe043783          	ld	a5,-32(s0)
 140:	0007c783          	lbu	a5,0(a5)
 144:	2781                	sext.w	a5,a5
 146:	40f707bb          	subw	a5,a4,a5
 14a:	2781                	sext.w	a5,a5
}
 14c:	853e                	mv	a0,a5
 14e:	6462                	ld	s0,24(sp)
 150:	6105                	addi	sp,sp,32
 152:	8082                	ret

0000000000000154 <strlen>:

uint
strlen(const char *s)
{
 154:	7179                	addi	sp,sp,-48
 156:	f422                	sd	s0,40(sp)
 158:	1800                	addi	s0,sp,48
 15a:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
 15e:	fe042623          	sw	zero,-20(s0)
 162:	a031                	j	16e <strlen+0x1a>
 164:	fec42783          	lw	a5,-20(s0)
 168:	2785                	addiw	a5,a5,1
 16a:	fef42623          	sw	a5,-20(s0)
 16e:	fec42783          	lw	a5,-20(s0)
 172:	fd843703          	ld	a4,-40(s0)
 176:	97ba                	add	a5,a5,a4
 178:	0007c783          	lbu	a5,0(a5)
 17c:	f7e5                	bnez	a5,164 <strlen+0x10>
    ;
  return n;
 17e:	fec42783          	lw	a5,-20(s0)
}
 182:	853e                	mv	a0,a5
 184:	7422                	ld	s0,40(sp)
 186:	6145                	addi	sp,sp,48
 188:	8082                	ret

000000000000018a <memset>:

void*
memset(void *dst, int c, uint n)
{
 18a:	7179                	addi	sp,sp,-48
 18c:	f422                	sd	s0,40(sp)
 18e:	1800                	addi	s0,sp,48
 190:	fca43c23          	sd	a0,-40(s0)
 194:	87ae                	mv	a5,a1
 196:	8732                	mv	a4,a2
 198:	fcf42a23          	sw	a5,-44(s0)
 19c:	87ba                	mv	a5,a4
 19e:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
 1a2:	fd843783          	ld	a5,-40(s0)
 1a6:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
 1aa:	fe042623          	sw	zero,-20(s0)
 1ae:	a00d                	j	1d0 <memset+0x46>
    cdst[i] = c;
 1b0:	fec42783          	lw	a5,-20(s0)
 1b4:	fe043703          	ld	a4,-32(s0)
 1b8:	97ba                	add	a5,a5,a4
 1ba:	fd442703          	lw	a4,-44(s0)
 1be:	0ff77713          	andi	a4,a4,255
 1c2:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
 1c6:	fec42783          	lw	a5,-20(s0)
 1ca:	2785                	addiw	a5,a5,1
 1cc:	fef42623          	sw	a5,-20(s0)
 1d0:	fec42703          	lw	a4,-20(s0)
 1d4:	fd042783          	lw	a5,-48(s0)
 1d8:	2781                	sext.w	a5,a5
 1da:	fcf76be3          	bltu	a4,a5,1b0 <memset+0x26>
  }
  return dst;
 1de:	fd843783          	ld	a5,-40(s0)
}
 1e2:	853e                	mv	a0,a5
 1e4:	7422                	ld	s0,40(sp)
 1e6:	6145                	addi	sp,sp,48
 1e8:	8082                	ret

00000000000001ea <strchr>:

char*
strchr(const char *s, char c)
{
 1ea:	1101                	addi	sp,sp,-32
 1ec:	ec22                	sd	s0,24(sp)
 1ee:	1000                	addi	s0,sp,32
 1f0:	fea43423          	sd	a0,-24(s0)
 1f4:	87ae                	mv	a5,a1
 1f6:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
 1fa:	a01d                	j	220 <strchr+0x36>
    if(*s == c)
 1fc:	fe843783          	ld	a5,-24(s0)
 200:	0007c703          	lbu	a4,0(a5)
 204:	fe744783          	lbu	a5,-25(s0)
 208:	0ff7f793          	andi	a5,a5,255
 20c:	00e79563          	bne	a5,a4,216 <strchr+0x2c>
      return (char*)s;
 210:	fe843783          	ld	a5,-24(s0)
 214:	a821                	j	22c <strchr+0x42>
  for(; *s; s++)
 216:	fe843783          	ld	a5,-24(s0)
 21a:	0785                	addi	a5,a5,1
 21c:	fef43423          	sd	a5,-24(s0)
 220:	fe843783          	ld	a5,-24(s0)
 224:	0007c783          	lbu	a5,0(a5)
 228:	fbf1                	bnez	a5,1fc <strchr+0x12>
  return 0;
 22a:	4781                	li	a5,0
}
 22c:	853e                	mv	a0,a5
 22e:	6462                	ld	s0,24(sp)
 230:	6105                	addi	sp,sp,32
 232:	8082                	ret

0000000000000234 <gets>:

char*
gets(char *buf, int max)
{
 234:	7179                	addi	sp,sp,-48
 236:	f406                	sd	ra,40(sp)
 238:	f022                	sd	s0,32(sp)
 23a:	1800                	addi	s0,sp,48
 23c:	fca43c23          	sd	a0,-40(s0)
 240:	87ae                	mv	a5,a1
 242:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 246:	fe042623          	sw	zero,-20(s0)
 24a:	a8a1                	j	2a2 <gets+0x6e>
    cc = read(0, &c, 1);
 24c:	fe740793          	addi	a5,s0,-25
 250:	4605                	li	a2,1
 252:	85be                	mv	a1,a5
 254:	4501                	li	a0,0
 256:	00000097          	auipc	ra,0x0
 25a:	2f6080e7          	jalr	758(ra) # 54c <read>
 25e:	87aa                	mv	a5,a0
 260:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
 264:	fe842783          	lw	a5,-24(s0)
 268:	2781                	sext.w	a5,a5
 26a:	04f05763          	blez	a5,2b8 <gets+0x84>
      break;
    buf[i++] = c;
 26e:	fec42783          	lw	a5,-20(s0)
 272:	0017871b          	addiw	a4,a5,1
 276:	fee42623          	sw	a4,-20(s0)
 27a:	873e                	mv	a4,a5
 27c:	fd843783          	ld	a5,-40(s0)
 280:	97ba                	add	a5,a5,a4
 282:	fe744703          	lbu	a4,-25(s0)
 286:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
 28a:	fe744783          	lbu	a5,-25(s0)
 28e:	873e                	mv	a4,a5
 290:	47a9                	li	a5,10
 292:	02f70463          	beq	a4,a5,2ba <gets+0x86>
 296:	fe744783          	lbu	a5,-25(s0)
 29a:	873e                	mv	a4,a5
 29c:	47b5                	li	a5,13
 29e:	00f70e63          	beq	a4,a5,2ba <gets+0x86>
  for(i=0; i+1 < max; ){
 2a2:	fec42783          	lw	a5,-20(s0)
 2a6:	2785                	addiw	a5,a5,1
 2a8:	0007871b          	sext.w	a4,a5
 2ac:	fd442783          	lw	a5,-44(s0)
 2b0:	2781                	sext.w	a5,a5
 2b2:	f8f74de3          	blt	a4,a5,24c <gets+0x18>
 2b6:	a011                	j	2ba <gets+0x86>
      break;
 2b8:	0001                	nop
      break;
  }
  buf[i] = '\0';
 2ba:	fec42783          	lw	a5,-20(s0)
 2be:	fd843703          	ld	a4,-40(s0)
 2c2:	97ba                	add	a5,a5,a4
 2c4:	00078023          	sb	zero,0(a5)
  return buf;
 2c8:	fd843783          	ld	a5,-40(s0)
}
 2cc:	853e                	mv	a0,a5
 2ce:	70a2                	ld	ra,40(sp)
 2d0:	7402                	ld	s0,32(sp)
 2d2:	6145                	addi	sp,sp,48
 2d4:	8082                	ret

00000000000002d6 <stat>:

int
stat(const char *n, struct stat *st)
{
 2d6:	7179                	addi	sp,sp,-48
 2d8:	f406                	sd	ra,40(sp)
 2da:	f022                	sd	s0,32(sp)
 2dc:	1800                	addi	s0,sp,48
 2de:	fca43c23          	sd	a0,-40(s0)
 2e2:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e6:	4581                	li	a1,0
 2e8:	fd843503          	ld	a0,-40(s0)
 2ec:	00000097          	auipc	ra,0x0
 2f0:	288080e7          	jalr	648(ra) # 574 <open>
 2f4:	87aa                	mv	a5,a0
 2f6:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
 2fa:	fec42783          	lw	a5,-20(s0)
 2fe:	2781                	sext.w	a5,a5
 300:	0007d463          	bgez	a5,308 <stat+0x32>
    return -1;
 304:	57fd                	li	a5,-1
 306:	a035                	j	332 <stat+0x5c>
  r = fstat(fd, st);
 308:	fec42783          	lw	a5,-20(s0)
 30c:	fd043583          	ld	a1,-48(s0)
 310:	853e                	mv	a0,a5
 312:	00000097          	auipc	ra,0x0
 316:	27a080e7          	jalr	634(ra) # 58c <fstat>
 31a:	87aa                	mv	a5,a0
 31c:	fef42423          	sw	a5,-24(s0)
  close(fd);
 320:	fec42783          	lw	a5,-20(s0)
 324:	853e                	mv	a0,a5
 326:	00000097          	auipc	ra,0x0
 32a:	236080e7          	jalr	566(ra) # 55c <close>
  return r;
 32e:	fe842783          	lw	a5,-24(s0)
}
 332:	853e                	mv	a0,a5
 334:	70a2                	ld	ra,40(sp)
 336:	7402                	ld	s0,32(sp)
 338:	6145                	addi	sp,sp,48
 33a:	8082                	ret

000000000000033c <atoi>:

int
atoi(const char *s)
{
 33c:	7179                	addi	sp,sp,-48
 33e:	f422                	sd	s0,40(sp)
 340:	1800                	addi	s0,sp,48
 342:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
 346:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
 34a:	a815                	j	37e <atoi+0x42>
    n = n*10 + *s++ - '0';
 34c:	fec42703          	lw	a4,-20(s0)
 350:	87ba                	mv	a5,a4
 352:	0027979b          	slliw	a5,a5,0x2
 356:	9fb9                	addw	a5,a5,a4
 358:	0017979b          	slliw	a5,a5,0x1
 35c:	0007871b          	sext.w	a4,a5
 360:	fd843783          	ld	a5,-40(s0)
 364:	00178693          	addi	a3,a5,1
 368:	fcd43c23          	sd	a3,-40(s0)
 36c:	0007c783          	lbu	a5,0(a5)
 370:	2781                	sext.w	a5,a5
 372:	9fb9                	addw	a5,a5,a4
 374:	2781                	sext.w	a5,a5
 376:	fd07879b          	addiw	a5,a5,-48
 37a:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
 37e:	fd843783          	ld	a5,-40(s0)
 382:	0007c783          	lbu	a5,0(a5)
 386:	873e                	mv	a4,a5
 388:	02f00793          	li	a5,47
 38c:	00e7fb63          	bgeu	a5,a4,3a2 <atoi+0x66>
 390:	fd843783          	ld	a5,-40(s0)
 394:	0007c783          	lbu	a5,0(a5)
 398:	873e                	mv	a4,a5
 39a:	03900793          	li	a5,57
 39e:	fae7f7e3          	bgeu	a5,a4,34c <atoi+0x10>
  return n;
 3a2:	fec42783          	lw	a5,-20(s0)
}
 3a6:	853e                	mv	a0,a5
 3a8:	7422                	ld	s0,40(sp)
 3aa:	6145                	addi	sp,sp,48
 3ac:	8082                	ret

00000000000003ae <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3ae:	7139                	addi	sp,sp,-64
 3b0:	fc22                	sd	s0,56(sp)
 3b2:	0080                	addi	s0,sp,64
 3b4:	fca43c23          	sd	a0,-40(s0)
 3b8:	fcb43823          	sd	a1,-48(s0)
 3bc:	87b2                	mv	a5,a2
 3be:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
 3c2:	fd843783          	ld	a5,-40(s0)
 3c6:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
 3ca:	fd043783          	ld	a5,-48(s0)
 3ce:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
 3d2:	fe043703          	ld	a4,-32(s0)
 3d6:	fe843783          	ld	a5,-24(s0)
 3da:	02e7fc63          	bgeu	a5,a4,412 <memmove+0x64>
    while(n-- > 0)
 3de:	a00d                	j	400 <memmove+0x52>
      *dst++ = *src++;
 3e0:	fe043703          	ld	a4,-32(s0)
 3e4:	00170793          	addi	a5,a4,1
 3e8:	fef43023          	sd	a5,-32(s0)
 3ec:	fe843783          	ld	a5,-24(s0)
 3f0:	00178693          	addi	a3,a5,1
 3f4:	fed43423          	sd	a3,-24(s0)
 3f8:	00074703          	lbu	a4,0(a4)
 3fc:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 400:	fcc42783          	lw	a5,-52(s0)
 404:	fff7871b          	addiw	a4,a5,-1
 408:	fce42623          	sw	a4,-52(s0)
 40c:	fcf04ae3          	bgtz	a5,3e0 <memmove+0x32>
 410:	a891                	j	464 <memmove+0xb6>
  } else {
    dst += n;
 412:	fcc42783          	lw	a5,-52(s0)
 416:	fe843703          	ld	a4,-24(s0)
 41a:	97ba                	add	a5,a5,a4
 41c:	fef43423          	sd	a5,-24(s0)
    src += n;
 420:	fcc42783          	lw	a5,-52(s0)
 424:	fe043703          	ld	a4,-32(s0)
 428:	97ba                	add	a5,a5,a4
 42a:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
 42e:	a01d                	j	454 <memmove+0xa6>
      *--dst = *--src;
 430:	fe043783          	ld	a5,-32(s0)
 434:	17fd                	addi	a5,a5,-1
 436:	fef43023          	sd	a5,-32(s0)
 43a:	fe843783          	ld	a5,-24(s0)
 43e:	17fd                	addi	a5,a5,-1
 440:	fef43423          	sd	a5,-24(s0)
 444:	fe043783          	ld	a5,-32(s0)
 448:	0007c703          	lbu	a4,0(a5)
 44c:	fe843783          	ld	a5,-24(s0)
 450:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 454:	fcc42783          	lw	a5,-52(s0)
 458:	fff7871b          	addiw	a4,a5,-1
 45c:	fce42623          	sw	a4,-52(s0)
 460:	fcf048e3          	bgtz	a5,430 <memmove+0x82>
  }
  return vdst;
 464:	fd843783          	ld	a5,-40(s0)
}
 468:	853e                	mv	a0,a5
 46a:	7462                	ld	s0,56(sp)
 46c:	6121                	addi	sp,sp,64
 46e:	8082                	ret

0000000000000470 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 470:	7139                	addi	sp,sp,-64
 472:	fc22                	sd	s0,56(sp)
 474:	0080                	addi	s0,sp,64
 476:	fca43c23          	sd	a0,-40(s0)
 47a:	fcb43823          	sd	a1,-48(s0)
 47e:	87b2                	mv	a5,a2
 480:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
 484:	fd843783          	ld	a5,-40(s0)
 488:	fef43423          	sd	a5,-24(s0)
 48c:	fd043783          	ld	a5,-48(s0)
 490:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 494:	a0a1                	j	4dc <memcmp+0x6c>
    if (*p1 != *p2) {
 496:	fe843783          	ld	a5,-24(s0)
 49a:	0007c703          	lbu	a4,0(a5)
 49e:	fe043783          	ld	a5,-32(s0)
 4a2:	0007c783          	lbu	a5,0(a5)
 4a6:	02f70163          	beq	a4,a5,4c8 <memcmp+0x58>
      return *p1 - *p2;
 4aa:	fe843783          	ld	a5,-24(s0)
 4ae:	0007c783          	lbu	a5,0(a5)
 4b2:	0007871b          	sext.w	a4,a5
 4b6:	fe043783          	ld	a5,-32(s0)
 4ba:	0007c783          	lbu	a5,0(a5)
 4be:	2781                	sext.w	a5,a5
 4c0:	40f707bb          	subw	a5,a4,a5
 4c4:	2781                	sext.w	a5,a5
 4c6:	a01d                	j	4ec <memcmp+0x7c>
    }
    p1++;
 4c8:	fe843783          	ld	a5,-24(s0)
 4cc:	0785                	addi	a5,a5,1
 4ce:	fef43423          	sd	a5,-24(s0)
    p2++;
 4d2:	fe043783          	ld	a5,-32(s0)
 4d6:	0785                	addi	a5,a5,1
 4d8:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 4dc:	fcc42783          	lw	a5,-52(s0)
 4e0:	fff7871b          	addiw	a4,a5,-1
 4e4:	fce42623          	sw	a4,-52(s0)
 4e8:	f7dd                	bnez	a5,496 <memcmp+0x26>
  }
  return 0;
 4ea:	4781                	li	a5,0
}
 4ec:	853e                	mv	a0,a5
 4ee:	7462                	ld	s0,56(sp)
 4f0:	6121                	addi	sp,sp,64
 4f2:	8082                	ret

00000000000004f4 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 4f4:	7179                	addi	sp,sp,-48
 4f6:	f406                	sd	ra,40(sp)
 4f8:	f022                	sd	s0,32(sp)
 4fa:	1800                	addi	s0,sp,48
 4fc:	fea43423          	sd	a0,-24(s0)
 500:	feb43023          	sd	a1,-32(s0)
 504:	87b2                	mv	a5,a2
 506:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
 50a:	fdc42783          	lw	a5,-36(s0)
 50e:	863e                	mv	a2,a5
 510:	fe043583          	ld	a1,-32(s0)
 514:	fe843503          	ld	a0,-24(s0)
 518:	00000097          	auipc	ra,0x0
 51c:	e96080e7          	jalr	-362(ra) # 3ae <memmove>
 520:	87aa                	mv	a5,a0
}
 522:	853e                	mv	a0,a5
 524:	70a2                	ld	ra,40(sp)
 526:	7402                	ld	s0,32(sp)
 528:	6145                	addi	sp,sp,48
 52a:	8082                	ret

000000000000052c <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 52c:	4885                	li	a7,1
 ecall
 52e:	00000073          	ecall
 ret
 532:	8082                	ret

0000000000000534 <exit>:
.global exit
exit:
 li a7, SYS_exit
 534:	4889                	li	a7,2
 ecall
 536:	00000073          	ecall
 ret
 53a:	8082                	ret

000000000000053c <wait>:
.global wait
wait:
 li a7, SYS_wait
 53c:	488d                	li	a7,3
 ecall
 53e:	00000073          	ecall
 ret
 542:	8082                	ret

0000000000000544 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 544:	4891                	li	a7,4
 ecall
 546:	00000073          	ecall
 ret
 54a:	8082                	ret

000000000000054c <read>:
.global read
read:
 li a7, SYS_read
 54c:	4895                	li	a7,5
 ecall
 54e:	00000073          	ecall
 ret
 552:	8082                	ret

0000000000000554 <write>:
.global write
write:
 li a7, SYS_write
 554:	48c1                	li	a7,16
 ecall
 556:	00000073          	ecall
 ret
 55a:	8082                	ret

000000000000055c <close>:
.global close
close:
 li a7, SYS_close
 55c:	48d5                	li	a7,21
 ecall
 55e:	00000073          	ecall
 ret
 562:	8082                	ret

0000000000000564 <kill>:
.global kill
kill:
 li a7, SYS_kill
 564:	4899                	li	a7,6
 ecall
 566:	00000073          	ecall
 ret
 56a:	8082                	ret

000000000000056c <exec>:
.global exec
exec:
 li a7, SYS_exec
 56c:	489d                	li	a7,7
 ecall
 56e:	00000073          	ecall
 ret
 572:	8082                	ret

0000000000000574 <open>:
.global open
open:
 li a7, SYS_open
 574:	48bd                	li	a7,15
 ecall
 576:	00000073          	ecall
 ret
 57a:	8082                	ret

000000000000057c <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 57c:	48c5                	li	a7,17
 ecall
 57e:	00000073          	ecall
 ret
 582:	8082                	ret

0000000000000584 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 584:	48c9                	li	a7,18
 ecall
 586:	00000073          	ecall
 ret
 58a:	8082                	ret

000000000000058c <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 58c:	48a1                	li	a7,8
 ecall
 58e:	00000073          	ecall
 ret
 592:	8082                	ret

0000000000000594 <link>:
.global link
link:
 li a7, SYS_link
 594:	48cd                	li	a7,19
 ecall
 596:	00000073          	ecall
 ret
 59a:	8082                	ret

000000000000059c <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 59c:	48d1                	li	a7,20
 ecall
 59e:	00000073          	ecall
 ret
 5a2:	8082                	ret

00000000000005a4 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 5a4:	48a5                	li	a7,9
 ecall
 5a6:	00000073          	ecall
 ret
 5aa:	8082                	ret

00000000000005ac <dup>:
.global dup
dup:
 li a7, SYS_dup
 5ac:	48a9                	li	a7,10
 ecall
 5ae:	00000073          	ecall
 ret
 5b2:	8082                	ret

00000000000005b4 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 5b4:	48ad                	li	a7,11
 ecall
 5b6:	00000073          	ecall
 ret
 5ba:	8082                	ret

00000000000005bc <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 5bc:	48b1                	li	a7,12
 ecall
 5be:	00000073          	ecall
 ret
 5c2:	8082                	ret

00000000000005c4 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 5c4:	48b5                	li	a7,13
 ecall
 5c6:	00000073          	ecall
 ret
 5ca:	8082                	ret

00000000000005cc <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 5cc:	48b9                	li	a7,14
 ecall
 5ce:	00000073          	ecall
 ret
 5d2:	8082                	ret

00000000000005d4 <changeSchedulingAlgorithm>:
.global changeSchedulingAlgorithm
changeSchedulingAlgorithm:
 li a7, SYS_changeSchedulingAlgorithm
 5d4:	48d9                	li	a7,22
 ecall
 5d6:	00000073          	ecall
 ret
 5da:	8082                	ret

00000000000005dc <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 5dc:	1101                	addi	sp,sp,-32
 5de:	ec06                	sd	ra,24(sp)
 5e0:	e822                	sd	s0,16(sp)
 5e2:	1000                	addi	s0,sp,32
 5e4:	87aa                	mv	a5,a0
 5e6:	872e                	mv	a4,a1
 5e8:	fef42623          	sw	a5,-20(s0)
 5ec:	87ba                	mv	a5,a4
 5ee:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
 5f2:	feb40713          	addi	a4,s0,-21
 5f6:	fec42783          	lw	a5,-20(s0)
 5fa:	4605                	li	a2,1
 5fc:	85ba                	mv	a1,a4
 5fe:	853e                	mv	a0,a5
 600:	00000097          	auipc	ra,0x0
 604:	f54080e7          	jalr	-172(ra) # 554 <write>
}
 608:	0001                	nop
 60a:	60e2                	ld	ra,24(sp)
 60c:	6442                	ld	s0,16(sp)
 60e:	6105                	addi	sp,sp,32
 610:	8082                	ret

0000000000000612 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 612:	7139                	addi	sp,sp,-64
 614:	fc06                	sd	ra,56(sp)
 616:	f822                	sd	s0,48(sp)
 618:	0080                	addi	s0,sp,64
 61a:	87aa                	mv	a5,a0
 61c:	8736                	mv	a4,a3
 61e:	fcf42623          	sw	a5,-52(s0)
 622:	87ae                	mv	a5,a1
 624:	fcf42423          	sw	a5,-56(s0)
 628:	87b2                	mv	a5,a2
 62a:	fcf42223          	sw	a5,-60(s0)
 62e:	87ba                	mv	a5,a4
 630:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 634:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
 638:	fc042783          	lw	a5,-64(s0)
 63c:	2781                	sext.w	a5,a5
 63e:	c38d                	beqz	a5,660 <printint+0x4e>
 640:	fc842783          	lw	a5,-56(s0)
 644:	2781                	sext.w	a5,a5
 646:	0007dd63          	bgez	a5,660 <printint+0x4e>
    neg = 1;
 64a:	4785                	li	a5,1
 64c:	fef42423          	sw	a5,-24(s0)
    x = -xx;
 650:	fc842783          	lw	a5,-56(s0)
 654:	40f007bb          	negw	a5,a5
 658:	2781                	sext.w	a5,a5
 65a:	fef42223          	sw	a5,-28(s0)
 65e:	a029                	j	668 <printint+0x56>
  } else {
    x = xx;
 660:	fc842783          	lw	a5,-56(s0)
 664:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
 668:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
 66c:	fc442783          	lw	a5,-60(s0)
 670:	fe442703          	lw	a4,-28(s0)
 674:	02f777bb          	remuw	a5,a4,a5
 678:	0007861b          	sext.w	a2,a5
 67c:	fec42783          	lw	a5,-20(s0)
 680:	0017871b          	addiw	a4,a5,1
 684:	fee42623          	sw	a4,-20(s0)
 688:	00000697          	auipc	a3,0x0
 68c:	74868693          	addi	a3,a3,1864 # dd0 <digits>
 690:	02061713          	slli	a4,a2,0x20
 694:	9301                	srli	a4,a4,0x20
 696:	9736                	add	a4,a4,a3
 698:	00074703          	lbu	a4,0(a4)
 69c:	ff040693          	addi	a3,s0,-16
 6a0:	97b6                	add	a5,a5,a3
 6a2:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
 6a6:	fc442783          	lw	a5,-60(s0)
 6aa:	fe442703          	lw	a4,-28(s0)
 6ae:	02f757bb          	divuw	a5,a4,a5
 6b2:	fef42223          	sw	a5,-28(s0)
 6b6:	fe442783          	lw	a5,-28(s0)
 6ba:	2781                	sext.w	a5,a5
 6bc:	fbc5                	bnez	a5,66c <printint+0x5a>
  if(neg)
 6be:	fe842783          	lw	a5,-24(s0)
 6c2:	2781                	sext.w	a5,a5
 6c4:	cf95                	beqz	a5,700 <printint+0xee>
    buf[i++] = '-';
 6c6:	fec42783          	lw	a5,-20(s0)
 6ca:	0017871b          	addiw	a4,a5,1
 6ce:	fee42623          	sw	a4,-20(s0)
 6d2:	ff040713          	addi	a4,s0,-16
 6d6:	97ba                	add	a5,a5,a4
 6d8:	02d00713          	li	a4,45
 6dc:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
 6e0:	a005                	j	700 <printint+0xee>
    putc(fd, buf[i]);
 6e2:	fec42783          	lw	a5,-20(s0)
 6e6:	ff040713          	addi	a4,s0,-16
 6ea:	97ba                	add	a5,a5,a4
 6ec:	fe07c703          	lbu	a4,-32(a5)
 6f0:	fcc42783          	lw	a5,-52(s0)
 6f4:	85ba                	mv	a1,a4
 6f6:	853e                	mv	a0,a5
 6f8:	00000097          	auipc	ra,0x0
 6fc:	ee4080e7          	jalr	-284(ra) # 5dc <putc>
  while(--i >= 0)
 700:	fec42783          	lw	a5,-20(s0)
 704:	37fd                	addiw	a5,a5,-1
 706:	fef42623          	sw	a5,-20(s0)
 70a:	fec42783          	lw	a5,-20(s0)
 70e:	2781                	sext.w	a5,a5
 710:	fc07d9e3          	bgez	a5,6e2 <printint+0xd0>
}
 714:	0001                	nop
 716:	0001                	nop
 718:	70e2                	ld	ra,56(sp)
 71a:	7442                	ld	s0,48(sp)
 71c:	6121                	addi	sp,sp,64
 71e:	8082                	ret

0000000000000720 <printptr>:

static void
printptr(int fd, uint64 x) {
 720:	7179                	addi	sp,sp,-48
 722:	f406                	sd	ra,40(sp)
 724:	f022                	sd	s0,32(sp)
 726:	1800                	addi	s0,sp,48
 728:	87aa                	mv	a5,a0
 72a:	fcb43823          	sd	a1,-48(s0)
 72e:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
 732:	fdc42783          	lw	a5,-36(s0)
 736:	03000593          	li	a1,48
 73a:	853e                	mv	a0,a5
 73c:	00000097          	auipc	ra,0x0
 740:	ea0080e7          	jalr	-352(ra) # 5dc <putc>
  putc(fd, 'x');
 744:	fdc42783          	lw	a5,-36(s0)
 748:	07800593          	li	a1,120
 74c:	853e                	mv	a0,a5
 74e:	00000097          	auipc	ra,0x0
 752:	e8e080e7          	jalr	-370(ra) # 5dc <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 756:	fe042623          	sw	zero,-20(s0)
 75a:	a82d                	j	794 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 75c:	fd043783          	ld	a5,-48(s0)
 760:	93f1                	srli	a5,a5,0x3c
 762:	00000717          	auipc	a4,0x0
 766:	66e70713          	addi	a4,a4,1646 # dd0 <digits>
 76a:	97ba                	add	a5,a5,a4
 76c:	0007c703          	lbu	a4,0(a5)
 770:	fdc42783          	lw	a5,-36(s0)
 774:	85ba                	mv	a1,a4
 776:	853e                	mv	a0,a5
 778:	00000097          	auipc	ra,0x0
 77c:	e64080e7          	jalr	-412(ra) # 5dc <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 780:	fec42783          	lw	a5,-20(s0)
 784:	2785                	addiw	a5,a5,1
 786:	fef42623          	sw	a5,-20(s0)
 78a:	fd043783          	ld	a5,-48(s0)
 78e:	0792                	slli	a5,a5,0x4
 790:	fcf43823          	sd	a5,-48(s0)
 794:	fec42783          	lw	a5,-20(s0)
 798:	873e                	mv	a4,a5
 79a:	47bd                	li	a5,15
 79c:	fce7f0e3          	bgeu	a5,a4,75c <printptr+0x3c>
}
 7a0:	0001                	nop
 7a2:	0001                	nop
 7a4:	70a2                	ld	ra,40(sp)
 7a6:	7402                	ld	s0,32(sp)
 7a8:	6145                	addi	sp,sp,48
 7aa:	8082                	ret

00000000000007ac <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 7ac:	715d                	addi	sp,sp,-80
 7ae:	e486                	sd	ra,72(sp)
 7b0:	e0a2                	sd	s0,64(sp)
 7b2:	0880                	addi	s0,sp,80
 7b4:	87aa                	mv	a5,a0
 7b6:	fcb43023          	sd	a1,-64(s0)
 7ba:	fac43c23          	sd	a2,-72(s0)
 7be:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
 7c2:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 7c6:	fe042223          	sw	zero,-28(s0)
 7ca:	a42d                	j	9f4 <vprintf+0x248>
    c = fmt[i] & 0xff;
 7cc:	fe442783          	lw	a5,-28(s0)
 7d0:	fc043703          	ld	a4,-64(s0)
 7d4:	97ba                	add	a5,a5,a4
 7d6:	0007c783          	lbu	a5,0(a5)
 7da:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
 7de:	fe042783          	lw	a5,-32(s0)
 7e2:	2781                	sext.w	a5,a5
 7e4:	eb9d                	bnez	a5,81a <vprintf+0x6e>
      if(c == '%'){
 7e6:	fdc42783          	lw	a5,-36(s0)
 7ea:	0007871b          	sext.w	a4,a5
 7ee:	02500793          	li	a5,37
 7f2:	00f71763          	bne	a4,a5,800 <vprintf+0x54>
        state = '%';
 7f6:	02500793          	li	a5,37
 7fa:	fef42023          	sw	a5,-32(s0)
 7fe:	a2f5                	j	9ea <vprintf+0x23e>
      } else {
        putc(fd, c);
 800:	fdc42783          	lw	a5,-36(s0)
 804:	0ff7f713          	andi	a4,a5,255
 808:	fcc42783          	lw	a5,-52(s0)
 80c:	85ba                	mv	a1,a4
 80e:	853e                	mv	a0,a5
 810:	00000097          	auipc	ra,0x0
 814:	dcc080e7          	jalr	-564(ra) # 5dc <putc>
 818:	aac9                	j	9ea <vprintf+0x23e>
      }
    } else if(state == '%'){
 81a:	fe042783          	lw	a5,-32(s0)
 81e:	0007871b          	sext.w	a4,a5
 822:	02500793          	li	a5,37
 826:	1cf71263          	bne	a4,a5,9ea <vprintf+0x23e>
      if(c == 'd'){
 82a:	fdc42783          	lw	a5,-36(s0)
 82e:	0007871b          	sext.w	a4,a5
 832:	06400793          	li	a5,100
 836:	02f71463          	bne	a4,a5,85e <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
 83a:	fb843783          	ld	a5,-72(s0)
 83e:	00878713          	addi	a4,a5,8
 842:	fae43c23          	sd	a4,-72(s0)
 846:	4398                	lw	a4,0(a5)
 848:	fcc42783          	lw	a5,-52(s0)
 84c:	4685                	li	a3,1
 84e:	4629                	li	a2,10
 850:	85ba                	mv	a1,a4
 852:	853e                	mv	a0,a5
 854:	00000097          	auipc	ra,0x0
 858:	dbe080e7          	jalr	-578(ra) # 612 <printint>
 85c:	a269                	j	9e6 <vprintf+0x23a>
      } else if(c == 'l') {
 85e:	fdc42783          	lw	a5,-36(s0)
 862:	0007871b          	sext.w	a4,a5
 866:	06c00793          	li	a5,108
 86a:	02f71663          	bne	a4,a5,896 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
 86e:	fb843783          	ld	a5,-72(s0)
 872:	00878713          	addi	a4,a5,8
 876:	fae43c23          	sd	a4,-72(s0)
 87a:	639c                	ld	a5,0(a5)
 87c:	0007871b          	sext.w	a4,a5
 880:	fcc42783          	lw	a5,-52(s0)
 884:	4681                	li	a3,0
 886:	4629                	li	a2,10
 888:	85ba                	mv	a1,a4
 88a:	853e                	mv	a0,a5
 88c:	00000097          	auipc	ra,0x0
 890:	d86080e7          	jalr	-634(ra) # 612 <printint>
 894:	aa89                	j	9e6 <vprintf+0x23a>
      } else if(c == 'x') {
 896:	fdc42783          	lw	a5,-36(s0)
 89a:	0007871b          	sext.w	a4,a5
 89e:	07800793          	li	a5,120
 8a2:	02f71463          	bne	a4,a5,8ca <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
 8a6:	fb843783          	ld	a5,-72(s0)
 8aa:	00878713          	addi	a4,a5,8
 8ae:	fae43c23          	sd	a4,-72(s0)
 8b2:	4398                	lw	a4,0(a5)
 8b4:	fcc42783          	lw	a5,-52(s0)
 8b8:	4681                	li	a3,0
 8ba:	4641                	li	a2,16
 8bc:	85ba                	mv	a1,a4
 8be:	853e                	mv	a0,a5
 8c0:	00000097          	auipc	ra,0x0
 8c4:	d52080e7          	jalr	-686(ra) # 612 <printint>
 8c8:	aa39                	j	9e6 <vprintf+0x23a>
      } else if(c == 'p') {
 8ca:	fdc42783          	lw	a5,-36(s0)
 8ce:	0007871b          	sext.w	a4,a5
 8d2:	07000793          	li	a5,112
 8d6:	02f71263          	bne	a4,a5,8fa <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
 8da:	fb843783          	ld	a5,-72(s0)
 8de:	00878713          	addi	a4,a5,8
 8e2:	fae43c23          	sd	a4,-72(s0)
 8e6:	6398                	ld	a4,0(a5)
 8e8:	fcc42783          	lw	a5,-52(s0)
 8ec:	85ba                	mv	a1,a4
 8ee:	853e                	mv	a0,a5
 8f0:	00000097          	auipc	ra,0x0
 8f4:	e30080e7          	jalr	-464(ra) # 720 <printptr>
 8f8:	a0fd                	j	9e6 <vprintf+0x23a>
      } else if(c == 's'){
 8fa:	fdc42783          	lw	a5,-36(s0)
 8fe:	0007871b          	sext.w	a4,a5
 902:	07300793          	li	a5,115
 906:	04f71c63          	bne	a4,a5,95e <vprintf+0x1b2>
        s = va_arg(ap, char*);
 90a:	fb843783          	ld	a5,-72(s0)
 90e:	00878713          	addi	a4,a5,8
 912:	fae43c23          	sd	a4,-72(s0)
 916:	639c                	ld	a5,0(a5)
 918:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
 91c:	fe843783          	ld	a5,-24(s0)
 920:	eb8d                	bnez	a5,952 <vprintf+0x1a6>
          s = "(null)";
 922:	00000797          	auipc	a5,0x0
 926:	4a678793          	addi	a5,a5,1190 # dc8 <malloc+0x16c>
 92a:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 92e:	a015                	j	952 <vprintf+0x1a6>
          putc(fd, *s);
 930:	fe843783          	ld	a5,-24(s0)
 934:	0007c703          	lbu	a4,0(a5)
 938:	fcc42783          	lw	a5,-52(s0)
 93c:	85ba                	mv	a1,a4
 93e:	853e                	mv	a0,a5
 940:	00000097          	auipc	ra,0x0
 944:	c9c080e7          	jalr	-868(ra) # 5dc <putc>
          s++;
 948:	fe843783          	ld	a5,-24(s0)
 94c:	0785                	addi	a5,a5,1
 94e:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 952:	fe843783          	ld	a5,-24(s0)
 956:	0007c783          	lbu	a5,0(a5)
 95a:	fbf9                	bnez	a5,930 <vprintf+0x184>
 95c:	a069                	j	9e6 <vprintf+0x23a>
        }
      } else if(c == 'c'){
 95e:	fdc42783          	lw	a5,-36(s0)
 962:	0007871b          	sext.w	a4,a5
 966:	06300793          	li	a5,99
 96a:	02f71463          	bne	a4,a5,992 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
 96e:	fb843783          	ld	a5,-72(s0)
 972:	00878713          	addi	a4,a5,8
 976:	fae43c23          	sd	a4,-72(s0)
 97a:	439c                	lw	a5,0(a5)
 97c:	0ff7f713          	andi	a4,a5,255
 980:	fcc42783          	lw	a5,-52(s0)
 984:	85ba                	mv	a1,a4
 986:	853e                	mv	a0,a5
 988:	00000097          	auipc	ra,0x0
 98c:	c54080e7          	jalr	-940(ra) # 5dc <putc>
 990:	a899                	j	9e6 <vprintf+0x23a>
      } else if(c == '%'){
 992:	fdc42783          	lw	a5,-36(s0)
 996:	0007871b          	sext.w	a4,a5
 99a:	02500793          	li	a5,37
 99e:	00f71f63          	bne	a4,a5,9bc <vprintf+0x210>
        putc(fd, c);
 9a2:	fdc42783          	lw	a5,-36(s0)
 9a6:	0ff7f713          	andi	a4,a5,255
 9aa:	fcc42783          	lw	a5,-52(s0)
 9ae:	85ba                	mv	a1,a4
 9b0:	853e                	mv	a0,a5
 9b2:	00000097          	auipc	ra,0x0
 9b6:	c2a080e7          	jalr	-982(ra) # 5dc <putc>
 9ba:	a035                	j	9e6 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 9bc:	fcc42783          	lw	a5,-52(s0)
 9c0:	02500593          	li	a1,37
 9c4:	853e                	mv	a0,a5
 9c6:	00000097          	auipc	ra,0x0
 9ca:	c16080e7          	jalr	-1002(ra) # 5dc <putc>
        putc(fd, c);
 9ce:	fdc42783          	lw	a5,-36(s0)
 9d2:	0ff7f713          	andi	a4,a5,255
 9d6:	fcc42783          	lw	a5,-52(s0)
 9da:	85ba                	mv	a1,a4
 9dc:	853e                	mv	a0,a5
 9de:	00000097          	auipc	ra,0x0
 9e2:	bfe080e7          	jalr	-1026(ra) # 5dc <putc>
      }
      state = 0;
 9e6:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 9ea:	fe442783          	lw	a5,-28(s0)
 9ee:	2785                	addiw	a5,a5,1
 9f0:	fef42223          	sw	a5,-28(s0)
 9f4:	fe442783          	lw	a5,-28(s0)
 9f8:	fc043703          	ld	a4,-64(s0)
 9fc:	97ba                	add	a5,a5,a4
 9fe:	0007c783          	lbu	a5,0(a5)
 a02:	dc0795e3          	bnez	a5,7cc <vprintf+0x20>
    }
  }
}
 a06:	0001                	nop
 a08:	0001                	nop
 a0a:	60a6                	ld	ra,72(sp)
 a0c:	6406                	ld	s0,64(sp)
 a0e:	6161                	addi	sp,sp,80
 a10:	8082                	ret

0000000000000a12 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 a12:	7159                	addi	sp,sp,-112
 a14:	fc06                	sd	ra,56(sp)
 a16:	f822                	sd	s0,48(sp)
 a18:	0080                	addi	s0,sp,64
 a1a:	fcb43823          	sd	a1,-48(s0)
 a1e:	e010                	sd	a2,0(s0)
 a20:	e414                	sd	a3,8(s0)
 a22:	e818                	sd	a4,16(s0)
 a24:	ec1c                	sd	a5,24(s0)
 a26:	03043023          	sd	a6,32(s0)
 a2a:	03143423          	sd	a7,40(s0)
 a2e:	87aa                	mv	a5,a0
 a30:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
 a34:	03040793          	addi	a5,s0,48
 a38:	fcf43423          	sd	a5,-56(s0)
 a3c:	fc843783          	ld	a5,-56(s0)
 a40:	fd078793          	addi	a5,a5,-48
 a44:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
 a48:	fe843703          	ld	a4,-24(s0)
 a4c:	fdc42783          	lw	a5,-36(s0)
 a50:	863a                	mv	a2,a4
 a52:	fd043583          	ld	a1,-48(s0)
 a56:	853e                	mv	a0,a5
 a58:	00000097          	auipc	ra,0x0
 a5c:	d54080e7          	jalr	-684(ra) # 7ac <vprintf>
}
 a60:	0001                	nop
 a62:	70e2                	ld	ra,56(sp)
 a64:	7442                	ld	s0,48(sp)
 a66:	6165                	addi	sp,sp,112
 a68:	8082                	ret

0000000000000a6a <printf>:

void
printf(const char *fmt, ...)
{
 a6a:	7159                	addi	sp,sp,-112
 a6c:	f406                	sd	ra,40(sp)
 a6e:	f022                	sd	s0,32(sp)
 a70:	1800                	addi	s0,sp,48
 a72:	fca43c23          	sd	a0,-40(s0)
 a76:	e40c                	sd	a1,8(s0)
 a78:	e810                	sd	a2,16(s0)
 a7a:	ec14                	sd	a3,24(s0)
 a7c:	f018                	sd	a4,32(s0)
 a7e:	f41c                	sd	a5,40(s0)
 a80:	03043823          	sd	a6,48(s0)
 a84:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 a88:	04040793          	addi	a5,s0,64
 a8c:	fcf43823          	sd	a5,-48(s0)
 a90:	fd043783          	ld	a5,-48(s0)
 a94:	fc878793          	addi	a5,a5,-56
 a98:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
 a9c:	fe843783          	ld	a5,-24(s0)
 aa0:	863e                	mv	a2,a5
 aa2:	fd843583          	ld	a1,-40(s0)
 aa6:	4505                	li	a0,1
 aa8:	00000097          	auipc	ra,0x0
 aac:	d04080e7          	jalr	-764(ra) # 7ac <vprintf>
}
 ab0:	0001                	nop
 ab2:	70a2                	ld	ra,40(sp)
 ab4:	7402                	ld	s0,32(sp)
 ab6:	6165                	addi	sp,sp,112
 ab8:	8082                	ret

0000000000000aba <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 aba:	7179                	addi	sp,sp,-48
 abc:	f422                	sd	s0,40(sp)
 abe:	1800                	addi	s0,sp,48
 ac0:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 ac4:	fd843783          	ld	a5,-40(s0)
 ac8:	17c1                	addi	a5,a5,-16
 aca:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ace:	00000797          	auipc	a5,0x0
 ad2:	32a78793          	addi	a5,a5,810 # df8 <freep>
 ad6:	639c                	ld	a5,0(a5)
 ad8:	fef43423          	sd	a5,-24(s0)
 adc:	a815                	j	b10 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ade:	fe843783          	ld	a5,-24(s0)
 ae2:	639c                	ld	a5,0(a5)
 ae4:	fe843703          	ld	a4,-24(s0)
 ae8:	00f76f63          	bltu	a4,a5,b06 <free+0x4c>
 aec:	fe043703          	ld	a4,-32(s0)
 af0:	fe843783          	ld	a5,-24(s0)
 af4:	02e7eb63          	bltu	a5,a4,b2a <free+0x70>
 af8:	fe843783          	ld	a5,-24(s0)
 afc:	639c                	ld	a5,0(a5)
 afe:	fe043703          	ld	a4,-32(s0)
 b02:	02f76463          	bltu	a4,a5,b2a <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b06:	fe843783          	ld	a5,-24(s0)
 b0a:	639c                	ld	a5,0(a5)
 b0c:	fef43423          	sd	a5,-24(s0)
 b10:	fe043703          	ld	a4,-32(s0)
 b14:	fe843783          	ld	a5,-24(s0)
 b18:	fce7f3e3          	bgeu	a5,a4,ade <free+0x24>
 b1c:	fe843783          	ld	a5,-24(s0)
 b20:	639c                	ld	a5,0(a5)
 b22:	fe043703          	ld	a4,-32(s0)
 b26:	faf77ce3          	bgeu	a4,a5,ade <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b2a:	fe043783          	ld	a5,-32(s0)
 b2e:	479c                	lw	a5,8(a5)
 b30:	1782                	slli	a5,a5,0x20
 b32:	9381                	srli	a5,a5,0x20
 b34:	0792                	slli	a5,a5,0x4
 b36:	fe043703          	ld	a4,-32(s0)
 b3a:	973e                	add	a4,a4,a5
 b3c:	fe843783          	ld	a5,-24(s0)
 b40:	639c                	ld	a5,0(a5)
 b42:	02f71763          	bne	a4,a5,b70 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
 b46:	fe043783          	ld	a5,-32(s0)
 b4a:	4798                	lw	a4,8(a5)
 b4c:	fe843783          	ld	a5,-24(s0)
 b50:	639c                	ld	a5,0(a5)
 b52:	479c                	lw	a5,8(a5)
 b54:	9fb9                	addw	a5,a5,a4
 b56:	0007871b          	sext.w	a4,a5
 b5a:	fe043783          	ld	a5,-32(s0)
 b5e:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
 b60:	fe843783          	ld	a5,-24(s0)
 b64:	639c                	ld	a5,0(a5)
 b66:	6398                	ld	a4,0(a5)
 b68:	fe043783          	ld	a5,-32(s0)
 b6c:	e398                	sd	a4,0(a5)
 b6e:	a039                	j	b7c <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
 b70:	fe843783          	ld	a5,-24(s0)
 b74:	6398                	ld	a4,0(a5)
 b76:	fe043783          	ld	a5,-32(s0)
 b7a:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
 b7c:	fe843783          	ld	a5,-24(s0)
 b80:	479c                	lw	a5,8(a5)
 b82:	1782                	slli	a5,a5,0x20
 b84:	9381                	srli	a5,a5,0x20
 b86:	0792                	slli	a5,a5,0x4
 b88:	fe843703          	ld	a4,-24(s0)
 b8c:	97ba                	add	a5,a5,a4
 b8e:	fe043703          	ld	a4,-32(s0)
 b92:	02f71563          	bne	a4,a5,bbc <free+0x102>
    p->s.size += bp->s.size;
 b96:	fe843783          	ld	a5,-24(s0)
 b9a:	4798                	lw	a4,8(a5)
 b9c:	fe043783          	ld	a5,-32(s0)
 ba0:	479c                	lw	a5,8(a5)
 ba2:	9fb9                	addw	a5,a5,a4
 ba4:	0007871b          	sext.w	a4,a5
 ba8:	fe843783          	ld	a5,-24(s0)
 bac:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 bae:	fe043783          	ld	a5,-32(s0)
 bb2:	6398                	ld	a4,0(a5)
 bb4:	fe843783          	ld	a5,-24(s0)
 bb8:	e398                	sd	a4,0(a5)
 bba:	a031                	j	bc6 <free+0x10c>
  } else
    p->s.ptr = bp;
 bbc:	fe843783          	ld	a5,-24(s0)
 bc0:	fe043703          	ld	a4,-32(s0)
 bc4:	e398                	sd	a4,0(a5)
  freep = p;
 bc6:	00000797          	auipc	a5,0x0
 bca:	23278793          	addi	a5,a5,562 # df8 <freep>
 bce:	fe843703          	ld	a4,-24(s0)
 bd2:	e398                	sd	a4,0(a5)
}
 bd4:	0001                	nop
 bd6:	7422                	ld	s0,40(sp)
 bd8:	6145                	addi	sp,sp,48
 bda:	8082                	ret

0000000000000bdc <morecore>:

static Header*
morecore(uint nu)
{
 bdc:	7179                	addi	sp,sp,-48
 bde:	f406                	sd	ra,40(sp)
 be0:	f022                	sd	s0,32(sp)
 be2:	1800                	addi	s0,sp,48
 be4:	87aa                	mv	a5,a0
 be6:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
 bea:	fdc42783          	lw	a5,-36(s0)
 bee:	0007871b          	sext.w	a4,a5
 bf2:	6785                	lui	a5,0x1
 bf4:	00f77563          	bgeu	a4,a5,bfe <morecore+0x22>
    nu = 4096;
 bf8:	6785                	lui	a5,0x1
 bfa:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
 bfe:	fdc42783          	lw	a5,-36(s0)
 c02:	0047979b          	slliw	a5,a5,0x4
 c06:	2781                	sext.w	a5,a5
 c08:	2781                	sext.w	a5,a5
 c0a:	853e                	mv	a0,a5
 c0c:	00000097          	auipc	ra,0x0
 c10:	9b0080e7          	jalr	-1616(ra) # 5bc <sbrk>
 c14:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
 c18:	fe843703          	ld	a4,-24(s0)
 c1c:	57fd                	li	a5,-1
 c1e:	00f71463          	bne	a4,a5,c26 <morecore+0x4a>
    return 0;
 c22:	4781                	li	a5,0
 c24:	a03d                	j	c52 <morecore+0x76>
  hp = (Header*)p;
 c26:	fe843783          	ld	a5,-24(s0)
 c2a:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
 c2e:	fe043783          	ld	a5,-32(s0)
 c32:	fdc42703          	lw	a4,-36(s0)
 c36:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
 c38:	fe043783          	ld	a5,-32(s0)
 c3c:	07c1                	addi	a5,a5,16
 c3e:	853e                	mv	a0,a5
 c40:	00000097          	auipc	ra,0x0
 c44:	e7a080e7          	jalr	-390(ra) # aba <free>
  return freep;
 c48:	00000797          	auipc	a5,0x0
 c4c:	1b078793          	addi	a5,a5,432 # df8 <freep>
 c50:	639c                	ld	a5,0(a5)
}
 c52:	853e                	mv	a0,a5
 c54:	70a2                	ld	ra,40(sp)
 c56:	7402                	ld	s0,32(sp)
 c58:	6145                	addi	sp,sp,48
 c5a:	8082                	ret

0000000000000c5c <malloc>:

void*
malloc(uint nbytes)
{
 c5c:	7139                	addi	sp,sp,-64
 c5e:	fc06                	sd	ra,56(sp)
 c60:	f822                	sd	s0,48(sp)
 c62:	0080                	addi	s0,sp,64
 c64:	87aa                	mv	a5,a0
 c66:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c6a:	fcc46783          	lwu	a5,-52(s0)
 c6e:	07bd                	addi	a5,a5,15
 c70:	8391                	srli	a5,a5,0x4
 c72:	2781                	sext.w	a5,a5
 c74:	2785                	addiw	a5,a5,1
 c76:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
 c7a:	00000797          	auipc	a5,0x0
 c7e:	17e78793          	addi	a5,a5,382 # df8 <freep>
 c82:	639c                	ld	a5,0(a5)
 c84:	fef43023          	sd	a5,-32(s0)
 c88:	fe043783          	ld	a5,-32(s0)
 c8c:	ef95                	bnez	a5,cc8 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
 c8e:	00000797          	auipc	a5,0x0
 c92:	15a78793          	addi	a5,a5,346 # de8 <base>
 c96:	fef43023          	sd	a5,-32(s0)
 c9a:	00000797          	auipc	a5,0x0
 c9e:	15e78793          	addi	a5,a5,350 # df8 <freep>
 ca2:	fe043703          	ld	a4,-32(s0)
 ca6:	e398                	sd	a4,0(a5)
 ca8:	00000797          	auipc	a5,0x0
 cac:	15078793          	addi	a5,a5,336 # df8 <freep>
 cb0:	6398                	ld	a4,0(a5)
 cb2:	00000797          	auipc	a5,0x0
 cb6:	13678793          	addi	a5,a5,310 # de8 <base>
 cba:	e398                	sd	a4,0(a5)
    base.s.size = 0;
 cbc:	00000797          	auipc	a5,0x0
 cc0:	12c78793          	addi	a5,a5,300 # de8 <base>
 cc4:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 cc8:	fe043783          	ld	a5,-32(s0)
 ccc:	639c                	ld	a5,0(a5)
 cce:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 cd2:	fe843783          	ld	a5,-24(s0)
 cd6:	4798                	lw	a4,8(a5)
 cd8:	fdc42783          	lw	a5,-36(s0)
 cdc:	2781                	sext.w	a5,a5
 cde:	06f76863          	bltu	a4,a5,d4e <malloc+0xf2>
      if(p->s.size == nunits)
 ce2:	fe843783          	ld	a5,-24(s0)
 ce6:	4798                	lw	a4,8(a5)
 ce8:	fdc42783          	lw	a5,-36(s0)
 cec:	2781                	sext.w	a5,a5
 cee:	00e79963          	bne	a5,a4,d00 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
 cf2:	fe843783          	ld	a5,-24(s0)
 cf6:	6398                	ld	a4,0(a5)
 cf8:	fe043783          	ld	a5,-32(s0)
 cfc:	e398                	sd	a4,0(a5)
 cfe:	a82d                	j	d38 <malloc+0xdc>
      else {
        p->s.size -= nunits;
 d00:	fe843783          	ld	a5,-24(s0)
 d04:	4798                	lw	a4,8(a5)
 d06:	fdc42783          	lw	a5,-36(s0)
 d0a:	40f707bb          	subw	a5,a4,a5
 d0e:	0007871b          	sext.w	a4,a5
 d12:	fe843783          	ld	a5,-24(s0)
 d16:	c798                	sw	a4,8(a5)
        p += p->s.size;
 d18:	fe843783          	ld	a5,-24(s0)
 d1c:	479c                	lw	a5,8(a5)
 d1e:	1782                	slli	a5,a5,0x20
 d20:	9381                	srli	a5,a5,0x20
 d22:	0792                	slli	a5,a5,0x4
 d24:	fe843703          	ld	a4,-24(s0)
 d28:	97ba                	add	a5,a5,a4
 d2a:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
 d2e:	fe843783          	ld	a5,-24(s0)
 d32:	fdc42703          	lw	a4,-36(s0)
 d36:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
 d38:	00000797          	auipc	a5,0x0
 d3c:	0c078793          	addi	a5,a5,192 # df8 <freep>
 d40:	fe043703          	ld	a4,-32(s0)
 d44:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
 d46:	fe843783          	ld	a5,-24(s0)
 d4a:	07c1                	addi	a5,a5,16
 d4c:	a091                	j	d90 <malloc+0x134>
    }
    if(p == freep)
 d4e:	00000797          	auipc	a5,0x0
 d52:	0aa78793          	addi	a5,a5,170 # df8 <freep>
 d56:	639c                	ld	a5,0(a5)
 d58:	fe843703          	ld	a4,-24(s0)
 d5c:	02f71063          	bne	a4,a5,d7c <malloc+0x120>
      if((p = morecore(nunits)) == 0)
 d60:	fdc42783          	lw	a5,-36(s0)
 d64:	853e                	mv	a0,a5
 d66:	00000097          	auipc	ra,0x0
 d6a:	e76080e7          	jalr	-394(ra) # bdc <morecore>
 d6e:	fea43423          	sd	a0,-24(s0)
 d72:	fe843783          	ld	a5,-24(s0)
 d76:	e399                	bnez	a5,d7c <malloc+0x120>
        return 0;
 d78:	4781                	li	a5,0
 d7a:	a819                	j	d90 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d7c:	fe843783          	ld	a5,-24(s0)
 d80:	fef43023          	sd	a5,-32(s0)
 d84:	fe843783          	ld	a5,-24(s0)
 d88:	639c                	ld	a5,0(a5)
 d8a:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 d8e:	b791                	j	cd2 <malloc+0x76>
  }
}
 d90:	853e                	mv	a0,a5
 d92:	70e2                	ld	ra,56(sp)
 d94:	7442                	ld	s0,48(sp)
 d96:	6121                	addi	sp,sp,64
 d98:	8082                	ret
