
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  if(argc != 3){
   9:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
   d:	74 19                	je     28 <main+0x28>
    printf(2, "Usage: ln old new\n");
   f:	c7 44 24 04 52 09 00 	movl   $0x952,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 63 05 00 00       	call   586 <printf>
    exit();
  23:	e8 d6 03 00 00       	call   3fe <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  28:	8b 45 0c             	mov    0xc(%ebp),%eax
  2b:	83 c0 08             	add    $0x8,%eax
  2e:	8b 10                	mov    (%eax),%edx
  30:	8b 45 0c             	mov    0xc(%ebp),%eax
  33:	83 c0 04             	add    $0x4,%eax
  36:	8b 00                	mov    (%eax),%eax
  38:	89 54 24 04          	mov    %edx,0x4(%esp)
  3c:	89 04 24             	mov    %eax,(%esp)
  3f:	e8 1a 04 00 00       	call   45e <link>
  44:	85 c0                	test   %eax,%eax
  46:	79 2c                	jns    74 <main+0x74>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  48:	8b 45 0c             	mov    0xc(%ebp),%eax
  4b:	83 c0 08             	add    $0x8,%eax
  4e:	8b 10                	mov    (%eax),%edx
  50:	8b 45 0c             	mov    0xc(%ebp),%eax
  53:	83 c0 04             	add    $0x4,%eax
  56:	8b 00                	mov    (%eax),%eax
  58:	89 54 24 0c          	mov    %edx,0xc(%esp)
  5c:	89 44 24 08          	mov    %eax,0x8(%esp)
  60:	c7 44 24 04 65 09 00 	movl   $0x965,0x4(%esp)
  67:	00 
  68:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  6f:	e8 12 05 00 00       	call   586 <printf>
  exit();
  74:	e8 85 03 00 00       	call   3fe <exit>

00000079 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  79:	55                   	push   %ebp
  7a:	89 e5                	mov    %esp,%ebp
  7c:	57                   	push   %edi
  7d:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  7e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  81:	8b 55 10             	mov    0x10(%ebp),%edx
  84:	8b 45 0c             	mov    0xc(%ebp),%eax
  87:	89 cb                	mov    %ecx,%ebx
  89:	89 df                	mov    %ebx,%edi
  8b:	89 d1                	mov    %edx,%ecx
  8d:	fc                   	cld    
  8e:	f3 aa                	rep stos %al,%es:(%edi)
  90:	89 ca                	mov    %ecx,%edx
  92:	89 fb                	mov    %edi,%ebx
  94:	89 5d 08             	mov    %ebx,0x8(%ebp)
  97:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  9a:	5b                   	pop    %ebx
  9b:	5f                   	pop    %edi
  9c:	5d                   	pop    %ebp
  9d:	c3                   	ret    

0000009e <strcpy>:
#include "user.h"
#include "x86.h"
#include "pstat.h"
char*
strcpy(char *s, const char *t)
{
  9e:	55                   	push   %ebp
  9f:	89 e5                	mov    %esp,%ebp
  a1:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  a4:	8b 45 08             	mov    0x8(%ebp),%eax
  a7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  aa:	90                   	nop
  ab:	8b 45 08             	mov    0x8(%ebp),%eax
  ae:	8d 50 01             	lea    0x1(%eax),%edx
  b1:	89 55 08             	mov    %edx,0x8(%ebp)
  b4:	8b 55 0c             	mov    0xc(%ebp),%edx
  b7:	8d 4a 01             	lea    0x1(%edx),%ecx
  ba:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  bd:	0f b6 12             	movzbl (%edx),%edx
  c0:	88 10                	mov    %dl,(%eax)
  c2:	0f b6 00             	movzbl (%eax),%eax
  c5:	84 c0                	test   %al,%al
  c7:	75 e2                	jne    ab <strcpy+0xd>
    ;
  return os;
  c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  cc:	c9                   	leave  
  cd:	c3                   	ret    

000000ce <strcmp>:

int
strcmp(const char *p, const char *q)
{
  ce:	55                   	push   %ebp
  cf:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  d1:	eb 08                	jmp    db <strcmp+0xd>
    p++, q++;
  d3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d7:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  db:	8b 45 08             	mov    0x8(%ebp),%eax
  de:	0f b6 00             	movzbl (%eax),%eax
  e1:	84 c0                	test   %al,%al
  e3:	74 10                	je     f5 <strcmp+0x27>
  e5:	8b 45 08             	mov    0x8(%ebp),%eax
  e8:	0f b6 10             	movzbl (%eax),%edx
  eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ee:	0f b6 00             	movzbl (%eax),%eax
  f1:	38 c2                	cmp    %al,%dl
  f3:	74 de                	je     d3 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  f5:	8b 45 08             	mov    0x8(%ebp),%eax
  f8:	0f b6 00             	movzbl (%eax),%eax
  fb:	0f b6 d0             	movzbl %al,%edx
  fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 101:	0f b6 00             	movzbl (%eax),%eax
 104:	0f b6 c0             	movzbl %al,%eax
 107:	29 c2                	sub    %eax,%edx
 109:	89 d0                	mov    %edx,%eax
}
 10b:	5d                   	pop    %ebp
 10c:	c3                   	ret    

0000010d <strlen>:

uint
strlen(const char *s)
{
 10d:	55                   	push   %ebp
 10e:	89 e5                	mov    %esp,%ebp
 110:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 113:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 11a:	eb 04                	jmp    120 <strlen+0x13>
 11c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 120:	8b 55 fc             	mov    -0x4(%ebp),%edx
 123:	8b 45 08             	mov    0x8(%ebp),%eax
 126:	01 d0                	add    %edx,%eax
 128:	0f b6 00             	movzbl (%eax),%eax
 12b:	84 c0                	test   %al,%al
 12d:	75 ed                	jne    11c <strlen+0xf>
    ;
  return n;
 12f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 132:	c9                   	leave  
 133:	c3                   	ret    

00000134 <memset>:

void*
memset(void *dst, int c, uint n)
{
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 13a:	8b 45 10             	mov    0x10(%ebp),%eax
 13d:	89 44 24 08          	mov    %eax,0x8(%esp)
 141:	8b 45 0c             	mov    0xc(%ebp),%eax
 144:	89 44 24 04          	mov    %eax,0x4(%esp)
 148:	8b 45 08             	mov    0x8(%ebp),%eax
 14b:	89 04 24             	mov    %eax,(%esp)
 14e:	e8 26 ff ff ff       	call   79 <stosb>
  return dst;
 153:	8b 45 08             	mov    0x8(%ebp),%eax
}
 156:	c9                   	leave  
 157:	c3                   	ret    

00000158 <strchr>:

char*
strchr(const char *s, char c)
{
 158:	55                   	push   %ebp
 159:	89 e5                	mov    %esp,%ebp
 15b:	83 ec 04             	sub    $0x4,%esp
 15e:	8b 45 0c             	mov    0xc(%ebp),%eax
 161:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 164:	eb 14                	jmp    17a <strchr+0x22>
    if(*s == c)
 166:	8b 45 08             	mov    0x8(%ebp),%eax
 169:	0f b6 00             	movzbl (%eax),%eax
 16c:	3a 45 fc             	cmp    -0x4(%ebp),%al
 16f:	75 05                	jne    176 <strchr+0x1e>
      return (char*)s;
 171:	8b 45 08             	mov    0x8(%ebp),%eax
 174:	eb 13                	jmp    189 <strchr+0x31>
  for(; *s; s++)
 176:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 17a:	8b 45 08             	mov    0x8(%ebp),%eax
 17d:	0f b6 00             	movzbl (%eax),%eax
 180:	84 c0                	test   %al,%al
 182:	75 e2                	jne    166 <strchr+0xe>
  return 0;
 184:	b8 00 00 00 00       	mov    $0x0,%eax
}
 189:	c9                   	leave  
 18a:	c3                   	ret    

0000018b <gets>:

char*
gets(char *buf, int max)
{
 18b:	55                   	push   %ebp
 18c:	89 e5                	mov    %esp,%ebp
 18e:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 191:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 198:	eb 4c                	jmp    1e6 <gets+0x5b>
    cc = read(0, &c, 1);
 19a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1a1:	00 
 1a2:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1a5:	89 44 24 04          	mov    %eax,0x4(%esp)
 1a9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1b0:	e8 61 02 00 00       	call   416 <read>
 1b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1b8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1bc:	7f 02                	jg     1c0 <gets+0x35>
      break;
 1be:	eb 31                	jmp    1f1 <gets+0x66>
    buf[i++] = c;
 1c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c3:	8d 50 01             	lea    0x1(%eax),%edx
 1c6:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1c9:	89 c2                	mov    %eax,%edx
 1cb:	8b 45 08             	mov    0x8(%ebp),%eax
 1ce:	01 c2                	add    %eax,%edx
 1d0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d4:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1d6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1da:	3c 0a                	cmp    $0xa,%al
 1dc:	74 13                	je     1f1 <gets+0x66>
 1de:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e2:	3c 0d                	cmp    $0xd,%al
 1e4:	74 0b                	je     1f1 <gets+0x66>
  for(i=0; i+1 < max; ){
 1e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e9:	83 c0 01             	add    $0x1,%eax
 1ec:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1ef:	7c a9                	jl     19a <gets+0xf>
      break;
  }
  buf[i] = '\0';
 1f1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1f4:	8b 45 08             	mov    0x8(%ebp),%eax
 1f7:	01 d0                	add    %edx,%eax
 1f9:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ff:	c9                   	leave  
 200:	c3                   	ret    

00000201 <stat>:

int
stat(const char *n, struct stat *st)
{
 201:	55                   	push   %ebp
 202:	89 e5                	mov    %esp,%ebp
 204:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 207:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 20e:	00 
 20f:	8b 45 08             	mov    0x8(%ebp),%eax
 212:	89 04 24             	mov    %eax,(%esp)
 215:	e8 24 02 00 00       	call   43e <open>
 21a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 21d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 221:	79 07                	jns    22a <stat+0x29>
    return -1;
 223:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 228:	eb 23                	jmp    24d <stat+0x4c>
  r = fstat(fd, st);
 22a:	8b 45 0c             	mov    0xc(%ebp),%eax
 22d:	89 44 24 04          	mov    %eax,0x4(%esp)
 231:	8b 45 f4             	mov    -0xc(%ebp),%eax
 234:	89 04 24             	mov    %eax,(%esp)
 237:	e8 1a 02 00 00       	call   456 <fstat>
 23c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 23f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 242:	89 04 24             	mov    %eax,(%esp)
 245:	e8 dc 01 00 00       	call   426 <close>
  return r;
 24a:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 24d:	c9                   	leave  
 24e:	c3                   	ret    

0000024f <atoi>:

int
atoi(const char *s)
{
 24f:	55                   	push   %ebp
 250:	89 e5                	mov    %esp,%ebp
 252:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 255:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 25c:	eb 25                	jmp    283 <atoi+0x34>
    n = n*10 + *s++ - '0';
 25e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 261:	89 d0                	mov    %edx,%eax
 263:	c1 e0 02             	shl    $0x2,%eax
 266:	01 d0                	add    %edx,%eax
 268:	01 c0                	add    %eax,%eax
 26a:	89 c1                	mov    %eax,%ecx
 26c:	8b 45 08             	mov    0x8(%ebp),%eax
 26f:	8d 50 01             	lea    0x1(%eax),%edx
 272:	89 55 08             	mov    %edx,0x8(%ebp)
 275:	0f b6 00             	movzbl (%eax),%eax
 278:	0f be c0             	movsbl %al,%eax
 27b:	01 c8                	add    %ecx,%eax
 27d:	83 e8 30             	sub    $0x30,%eax
 280:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	0f b6 00             	movzbl (%eax),%eax
 289:	3c 2f                	cmp    $0x2f,%al
 28b:	7e 0a                	jle    297 <atoi+0x48>
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
 290:	0f b6 00             	movzbl (%eax),%eax
 293:	3c 39                	cmp    $0x39,%al
 295:	7e c7                	jle    25e <atoi+0xf>
  return n;
 297:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 29a:	c9                   	leave  
 29b:	c3                   	ret    

0000029c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 29c:	55                   	push   %ebp
 29d:	89 e5                	mov    %esp,%ebp
 29f:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 2a2:	8b 45 08             	mov    0x8(%ebp),%eax
 2a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2a8:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ab:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2ae:	eb 17                	jmp    2c7 <memmove+0x2b>
    *dst++ = *src++;
 2b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2b3:	8d 50 01             	lea    0x1(%eax),%edx
 2b6:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2b9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2bc:	8d 4a 01             	lea    0x1(%edx),%ecx
 2bf:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2c2:	0f b6 12             	movzbl (%edx),%edx
 2c5:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2c7:	8b 45 10             	mov    0x10(%ebp),%eax
 2ca:	8d 50 ff             	lea    -0x1(%eax),%edx
 2cd:	89 55 10             	mov    %edx,0x10(%ebp)
 2d0:	85 c0                	test   %eax,%eax
 2d2:	7f dc                	jg     2b0 <memmove+0x14>
  return vdst;
 2d4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2d7:	c9                   	leave  
 2d8:	c3                   	ret    

000002d9 <ps>:

void
ps(void)
{
 2d9:	55                   	push   %ebp
 2da:	89 e5                	mov    %esp,%ebp
 2dc:	57                   	push   %edi
 2dd:	56                   	push   %esi
 2de:	53                   	push   %ebx
 2df:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pinfo;

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 2e5:	c7 44 24 04 79 09 00 	movl   $0x979,0x4(%esp)
 2ec:	00 
 2ed:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2f4:	e8 8d 02 00 00       	call   586 <printf>
  getpinfo(&pinfo);
 2f9:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 2ff:	89 04 24             	mov    %eax,(%esp)
 302:	e8 97 01 00 00       	call   49e <getpinfo>
  int i;
  for (i = 0; i < NPROC; i++) {
 307:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 30e:	e9 ce 00 00 00       	jmp    3e1 <ps+0x108>
      if (pinfo[i].inuse) {
 313:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 316:	89 d0                	mov    %edx,%eax
 318:	c1 e0 03             	shl    $0x3,%eax
 31b:	01 d0                	add    %edx,%eax
 31d:	c1 e0 02             	shl    $0x2,%eax
 320:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 323:	01 d8                	add    %ebx,%eax
 325:	2d 04 09 00 00       	sub    $0x904,%eax
 32a:	8b 00                	mov    (%eax),%eax
 32c:	85 c0                	test   %eax,%eax
 32e:	0f 84 a9 00 00 00    	je     3dd <ps+0x104>
        printf(1, "%d\t%d\t%d\t%c\t%s\n",
          pinfo[i].pid,
          pinfo[i].tickets,
          pinfo[i].ticks,
          pinfo[i].state,
          pinfo[i].name);
 334:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 33a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 33d:	89 d0                	mov    %edx,%eax
 33f:	c1 e0 03             	shl    $0x3,%eax
 342:	01 d0                	add    %edx,%eax
 344:	c1 e0 02             	shl    $0x2,%eax
 347:	83 c0 10             	add    $0x10,%eax
 34a:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
          pinfo[i].state,
 34d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 350:	89 d0                	mov    %edx,%eax
 352:	c1 e0 03             	shl    $0x3,%eax
 355:	01 d0                	add    %edx,%eax
 357:	c1 e0 02             	shl    $0x2,%eax
 35a:	8d 75 e8             	lea    -0x18(%ebp),%esi
 35d:	01 f0                	add    %esi,%eax
 35f:	2d e4 08 00 00       	sub    $0x8e4,%eax
 364:	0f b6 00             	movzbl (%eax),%eax
        printf(1, "%d\t%d\t%d\t%c\t%s\n",
 367:	0f be f0             	movsbl %al,%esi
 36a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 36d:	89 d0                	mov    %edx,%eax
 36f:	c1 e0 03             	shl    $0x3,%eax
 372:	01 d0                	add    %edx,%eax
 374:	c1 e0 02             	shl    $0x2,%eax
 377:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 37a:	01 c8                	add    %ecx,%eax
 37c:	2d f8 08 00 00       	sub    $0x8f8,%eax
 381:	8b 18                	mov    (%eax),%ebx
 383:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 386:	89 d0                	mov    %edx,%eax
 388:	c1 e0 03             	shl    $0x3,%eax
 38b:	01 d0                	add    %edx,%eax
 38d:	c1 e0 02             	shl    $0x2,%eax
 390:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 393:	01 c8                	add    %ecx,%eax
 395:	2d 00 09 00 00       	sub    $0x900,%eax
 39a:	8b 08                	mov    (%eax),%ecx
 39c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 39f:	89 d0                	mov    %edx,%eax
 3a1:	c1 e0 03             	shl    $0x3,%eax
 3a4:	01 d0                	add    %edx,%eax
 3a6:	c1 e0 02             	shl    $0x2,%eax
 3a9:	8d 55 e8             	lea    -0x18(%ebp),%edx
 3ac:	01 d0                	add    %edx,%eax
 3ae:	2d fc 08 00 00       	sub    $0x8fc,%eax
 3b3:	8b 00                	mov    (%eax),%eax
 3b5:	89 7c 24 18          	mov    %edi,0x18(%esp)
 3b9:	89 74 24 14          	mov    %esi,0x14(%esp)
 3bd:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 3c1:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 3c5:	89 44 24 08          	mov    %eax,0x8(%esp)
 3c9:	c7 44 24 04 92 09 00 	movl   $0x992,0x4(%esp)
 3d0:	00 
 3d1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3d8:	e8 a9 01 00 00       	call   586 <printf>
  for (i = 0; i < NPROC; i++) {
 3dd:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 3e1:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 3e5:	0f 8e 28 ff ff ff    	jle    313 <ps+0x3a>
      }
  }

}
 3eb:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 3f1:	5b                   	pop    %ebx
 3f2:	5e                   	pop    %esi
 3f3:	5f                   	pop    %edi
 3f4:	5d                   	pop    %ebp
 3f5:	c3                   	ret    

000003f6 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3f6:	b8 01 00 00 00       	mov    $0x1,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <exit>:
SYSCALL(exit)
 3fe:	b8 02 00 00 00       	mov    $0x2,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <wait>:
SYSCALL(wait)
 406:	b8 03 00 00 00       	mov    $0x3,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <pipe>:
SYSCALL(pipe)
 40e:	b8 04 00 00 00       	mov    $0x4,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <read>:
SYSCALL(read)
 416:	b8 05 00 00 00       	mov    $0x5,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <write>:
SYSCALL(write)
 41e:	b8 10 00 00 00       	mov    $0x10,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret    

00000426 <close>:
SYSCALL(close)
 426:	b8 15 00 00 00       	mov    $0x15,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret    

0000042e <kill>:
SYSCALL(kill)
 42e:	b8 06 00 00 00       	mov    $0x6,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret    

00000436 <exec>:
SYSCALL(exec)
 436:	b8 07 00 00 00       	mov    $0x7,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret    

0000043e <open>:
SYSCALL(open)
 43e:	b8 0f 00 00 00       	mov    $0xf,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret    

00000446 <mknod>:
SYSCALL(mknod)
 446:	b8 11 00 00 00       	mov    $0x11,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    

0000044e <unlink>:
SYSCALL(unlink)
 44e:	b8 12 00 00 00       	mov    $0x12,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret    

00000456 <fstat>:
SYSCALL(fstat)
 456:	b8 08 00 00 00       	mov    $0x8,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    

0000045e <link>:
SYSCALL(link)
 45e:	b8 13 00 00 00       	mov    $0x13,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <mkdir>:
SYSCALL(mkdir)
 466:	b8 14 00 00 00       	mov    $0x14,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret    

0000046e <chdir>:
SYSCALL(chdir)
 46e:	b8 09 00 00 00       	mov    $0x9,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret    

00000476 <dup>:
SYSCALL(dup)
 476:	b8 0a 00 00 00       	mov    $0xa,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret    

0000047e <getpid>:
SYSCALL(getpid)
 47e:	b8 0b 00 00 00       	mov    $0xb,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret    

00000486 <sbrk>:
SYSCALL(sbrk)
 486:	b8 0c 00 00 00       	mov    $0xc,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret    

0000048e <sleep>:
SYSCALL(sleep)
 48e:	b8 0d 00 00 00       	mov    $0xd,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret    

00000496 <uptime>:
SYSCALL(uptime)
 496:	b8 0e 00 00 00       	mov    $0xe,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret    

0000049e <getpinfo>:
SYSCALL(getpinfo)
 49e:	b8 16 00 00 00       	mov    $0x16,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret    

000004a6 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4a6:	55                   	push   %ebp
 4a7:	89 e5                	mov    %esp,%ebp
 4a9:	83 ec 18             	sub    $0x18,%esp
 4ac:	8b 45 0c             	mov    0xc(%ebp),%eax
 4af:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4b2:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4b9:	00 
 4ba:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4bd:	89 44 24 04          	mov    %eax,0x4(%esp)
 4c1:	8b 45 08             	mov    0x8(%ebp),%eax
 4c4:	89 04 24             	mov    %eax,(%esp)
 4c7:	e8 52 ff ff ff       	call   41e <write>
}
 4cc:	c9                   	leave  
 4cd:	c3                   	ret    

000004ce <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4ce:	55                   	push   %ebp
 4cf:	89 e5                	mov    %esp,%ebp
 4d1:	56                   	push   %esi
 4d2:	53                   	push   %ebx
 4d3:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4d6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4dd:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4e1:	74 17                	je     4fa <printint+0x2c>
 4e3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4e7:	79 11                	jns    4fa <printint+0x2c>
    neg = 1;
 4e9:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4f0:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f3:	f7 d8                	neg    %eax
 4f5:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4f8:	eb 06                	jmp    500 <printint+0x32>
  } else {
    x = xx;
 4fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 4fd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 500:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 507:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 50a:	8d 41 01             	lea    0x1(%ecx),%eax
 50d:	89 45 f4             	mov    %eax,-0xc(%ebp)
 510:	8b 5d 10             	mov    0x10(%ebp),%ebx
 513:	8b 45 ec             	mov    -0x14(%ebp),%eax
 516:	ba 00 00 00 00       	mov    $0x0,%edx
 51b:	f7 f3                	div    %ebx
 51d:	89 d0                	mov    %edx,%eax
 51f:	0f b6 80 20 0c 00 00 	movzbl 0xc20(%eax),%eax
 526:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 52a:	8b 75 10             	mov    0x10(%ebp),%esi
 52d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 530:	ba 00 00 00 00       	mov    $0x0,%edx
 535:	f7 f6                	div    %esi
 537:	89 45 ec             	mov    %eax,-0x14(%ebp)
 53a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 53e:	75 c7                	jne    507 <printint+0x39>
  if(neg)
 540:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 544:	74 10                	je     556 <printint+0x88>
    buf[i++] = '-';
 546:	8b 45 f4             	mov    -0xc(%ebp),%eax
 549:	8d 50 01             	lea    0x1(%eax),%edx
 54c:	89 55 f4             	mov    %edx,-0xc(%ebp)
 54f:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 554:	eb 1f                	jmp    575 <printint+0xa7>
 556:	eb 1d                	jmp    575 <printint+0xa7>
    putc(fd, buf[i]);
 558:	8d 55 dc             	lea    -0x24(%ebp),%edx
 55b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 55e:	01 d0                	add    %edx,%eax
 560:	0f b6 00             	movzbl (%eax),%eax
 563:	0f be c0             	movsbl %al,%eax
 566:	89 44 24 04          	mov    %eax,0x4(%esp)
 56a:	8b 45 08             	mov    0x8(%ebp),%eax
 56d:	89 04 24             	mov    %eax,(%esp)
 570:	e8 31 ff ff ff       	call   4a6 <putc>
  while(--i >= 0)
 575:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 579:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 57d:	79 d9                	jns    558 <printint+0x8a>
}
 57f:	83 c4 30             	add    $0x30,%esp
 582:	5b                   	pop    %ebx
 583:	5e                   	pop    %esi
 584:	5d                   	pop    %ebp
 585:	c3                   	ret    

00000586 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 586:	55                   	push   %ebp
 587:	89 e5                	mov    %esp,%ebp
 589:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 58c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 593:	8d 45 0c             	lea    0xc(%ebp),%eax
 596:	83 c0 04             	add    $0x4,%eax
 599:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 59c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5a3:	e9 7c 01 00 00       	jmp    724 <printf+0x19e>
    c = fmt[i] & 0xff;
 5a8:	8b 55 0c             	mov    0xc(%ebp),%edx
 5ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5ae:	01 d0                	add    %edx,%eax
 5b0:	0f b6 00             	movzbl (%eax),%eax
 5b3:	0f be c0             	movsbl %al,%eax
 5b6:	25 ff 00 00 00       	and    $0xff,%eax
 5bb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5be:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5c2:	75 2c                	jne    5f0 <printf+0x6a>
      if(c == '%'){
 5c4:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5c8:	75 0c                	jne    5d6 <printf+0x50>
        state = '%';
 5ca:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5d1:	e9 4a 01 00 00       	jmp    720 <printf+0x19a>
      } else {
        putc(fd, c);
 5d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5d9:	0f be c0             	movsbl %al,%eax
 5dc:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e0:	8b 45 08             	mov    0x8(%ebp),%eax
 5e3:	89 04 24             	mov    %eax,(%esp)
 5e6:	e8 bb fe ff ff       	call   4a6 <putc>
 5eb:	e9 30 01 00 00       	jmp    720 <printf+0x19a>
      }
    } else if(state == '%'){
 5f0:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5f4:	0f 85 26 01 00 00    	jne    720 <printf+0x19a>
      if(c == 'd'){
 5fa:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5fe:	75 2d                	jne    62d <printf+0xa7>
        printint(fd, *ap, 10, 1);
 600:	8b 45 e8             	mov    -0x18(%ebp),%eax
 603:	8b 00                	mov    (%eax),%eax
 605:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 60c:	00 
 60d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 614:	00 
 615:	89 44 24 04          	mov    %eax,0x4(%esp)
 619:	8b 45 08             	mov    0x8(%ebp),%eax
 61c:	89 04 24             	mov    %eax,(%esp)
 61f:	e8 aa fe ff ff       	call   4ce <printint>
        ap++;
 624:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 628:	e9 ec 00 00 00       	jmp    719 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 62d:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 631:	74 06                	je     639 <printf+0xb3>
 633:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 637:	75 2d                	jne    666 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 639:	8b 45 e8             	mov    -0x18(%ebp),%eax
 63c:	8b 00                	mov    (%eax),%eax
 63e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 645:	00 
 646:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 64d:	00 
 64e:	89 44 24 04          	mov    %eax,0x4(%esp)
 652:	8b 45 08             	mov    0x8(%ebp),%eax
 655:	89 04 24             	mov    %eax,(%esp)
 658:	e8 71 fe ff ff       	call   4ce <printint>
        ap++;
 65d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 661:	e9 b3 00 00 00       	jmp    719 <printf+0x193>
      } else if(c == 's'){
 666:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 66a:	75 45                	jne    6b1 <printf+0x12b>
        s = (char*)*ap;
 66c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 66f:	8b 00                	mov    (%eax),%eax
 671:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 674:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 678:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 67c:	75 09                	jne    687 <printf+0x101>
          s = "(null)";
 67e:	c7 45 f4 a2 09 00 00 	movl   $0x9a2,-0xc(%ebp)
        while(*s != 0){
 685:	eb 1e                	jmp    6a5 <printf+0x11f>
 687:	eb 1c                	jmp    6a5 <printf+0x11f>
          putc(fd, *s);
 689:	8b 45 f4             	mov    -0xc(%ebp),%eax
 68c:	0f b6 00             	movzbl (%eax),%eax
 68f:	0f be c0             	movsbl %al,%eax
 692:	89 44 24 04          	mov    %eax,0x4(%esp)
 696:	8b 45 08             	mov    0x8(%ebp),%eax
 699:	89 04 24             	mov    %eax,(%esp)
 69c:	e8 05 fe ff ff       	call   4a6 <putc>
          s++;
 6a1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 6a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6a8:	0f b6 00             	movzbl (%eax),%eax
 6ab:	84 c0                	test   %al,%al
 6ad:	75 da                	jne    689 <printf+0x103>
 6af:	eb 68                	jmp    719 <printf+0x193>
        }
      } else if(c == 'c'){
 6b1:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6b5:	75 1d                	jne    6d4 <printf+0x14e>
        putc(fd, *ap);
 6b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6ba:	8b 00                	mov    (%eax),%eax
 6bc:	0f be c0             	movsbl %al,%eax
 6bf:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c3:	8b 45 08             	mov    0x8(%ebp),%eax
 6c6:	89 04 24             	mov    %eax,(%esp)
 6c9:	e8 d8 fd ff ff       	call   4a6 <putc>
        ap++;
 6ce:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6d2:	eb 45                	jmp    719 <printf+0x193>
      } else if(c == '%'){
 6d4:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6d8:	75 17                	jne    6f1 <printf+0x16b>
        putc(fd, c);
 6da:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6dd:	0f be c0             	movsbl %al,%eax
 6e0:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e4:	8b 45 08             	mov    0x8(%ebp),%eax
 6e7:	89 04 24             	mov    %eax,(%esp)
 6ea:	e8 b7 fd ff ff       	call   4a6 <putc>
 6ef:	eb 28                	jmp    719 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6f1:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6f8:	00 
 6f9:	8b 45 08             	mov    0x8(%ebp),%eax
 6fc:	89 04 24             	mov    %eax,(%esp)
 6ff:	e8 a2 fd ff ff       	call   4a6 <putc>
        putc(fd, c);
 704:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 707:	0f be c0             	movsbl %al,%eax
 70a:	89 44 24 04          	mov    %eax,0x4(%esp)
 70e:	8b 45 08             	mov    0x8(%ebp),%eax
 711:	89 04 24             	mov    %eax,(%esp)
 714:	e8 8d fd ff ff       	call   4a6 <putc>
      }
      state = 0;
 719:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 720:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 724:	8b 55 0c             	mov    0xc(%ebp),%edx
 727:	8b 45 f0             	mov    -0x10(%ebp),%eax
 72a:	01 d0                	add    %edx,%eax
 72c:	0f b6 00             	movzbl (%eax),%eax
 72f:	84 c0                	test   %al,%al
 731:	0f 85 71 fe ff ff    	jne    5a8 <printf+0x22>
    }
  }
}
 737:	c9                   	leave  
 738:	c3                   	ret    

00000739 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 739:	55                   	push   %ebp
 73a:	89 e5                	mov    %esp,%ebp
 73c:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 73f:	8b 45 08             	mov    0x8(%ebp),%eax
 742:	83 e8 08             	sub    $0x8,%eax
 745:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 748:	a1 3c 0c 00 00       	mov    0xc3c,%eax
 74d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 750:	eb 24                	jmp    776 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 752:	8b 45 fc             	mov    -0x4(%ebp),%eax
 755:	8b 00                	mov    (%eax),%eax
 757:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 75a:	77 12                	ja     76e <free+0x35>
 75c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 762:	77 24                	ja     788 <free+0x4f>
 764:	8b 45 fc             	mov    -0x4(%ebp),%eax
 767:	8b 00                	mov    (%eax),%eax
 769:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 76c:	77 1a                	ja     788 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 76e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 771:	8b 00                	mov    (%eax),%eax
 773:	89 45 fc             	mov    %eax,-0x4(%ebp)
 776:	8b 45 f8             	mov    -0x8(%ebp),%eax
 779:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 77c:	76 d4                	jbe    752 <free+0x19>
 77e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 781:	8b 00                	mov    (%eax),%eax
 783:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 786:	76 ca                	jbe    752 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 788:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78b:	8b 40 04             	mov    0x4(%eax),%eax
 78e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 795:	8b 45 f8             	mov    -0x8(%ebp),%eax
 798:	01 c2                	add    %eax,%edx
 79a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79d:	8b 00                	mov    (%eax),%eax
 79f:	39 c2                	cmp    %eax,%edx
 7a1:	75 24                	jne    7c7 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a6:	8b 50 04             	mov    0x4(%eax),%edx
 7a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ac:	8b 00                	mov    (%eax),%eax
 7ae:	8b 40 04             	mov    0x4(%eax),%eax
 7b1:	01 c2                	add    %eax,%edx
 7b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b6:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bc:	8b 00                	mov    (%eax),%eax
 7be:	8b 10                	mov    (%eax),%edx
 7c0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c3:	89 10                	mov    %edx,(%eax)
 7c5:	eb 0a                	jmp    7d1 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ca:	8b 10                	mov    (%eax),%edx
 7cc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7cf:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d4:	8b 40 04             	mov    0x4(%eax),%eax
 7d7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7de:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e1:	01 d0                	add    %edx,%eax
 7e3:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7e6:	75 20                	jne    808 <free+0xcf>
    p->s.size += bp->s.size;
 7e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7eb:	8b 50 04             	mov    0x4(%eax),%edx
 7ee:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f1:	8b 40 04             	mov    0x4(%eax),%eax
 7f4:	01 c2                	add    %eax,%edx
 7f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f9:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7fc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ff:	8b 10                	mov    (%eax),%edx
 801:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804:	89 10                	mov    %edx,(%eax)
 806:	eb 08                	jmp    810 <free+0xd7>
  } else
    p->s.ptr = bp;
 808:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80e:	89 10                	mov    %edx,(%eax)
  freep = p;
 810:	8b 45 fc             	mov    -0x4(%ebp),%eax
 813:	a3 3c 0c 00 00       	mov    %eax,0xc3c
}
 818:	c9                   	leave  
 819:	c3                   	ret    

0000081a <morecore>:

static Header*
morecore(uint nu)
{
 81a:	55                   	push   %ebp
 81b:	89 e5                	mov    %esp,%ebp
 81d:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 820:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 827:	77 07                	ja     830 <morecore+0x16>
    nu = 4096;
 829:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 830:	8b 45 08             	mov    0x8(%ebp),%eax
 833:	c1 e0 03             	shl    $0x3,%eax
 836:	89 04 24             	mov    %eax,(%esp)
 839:	e8 48 fc ff ff       	call   486 <sbrk>
 83e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 841:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 845:	75 07                	jne    84e <morecore+0x34>
    return 0;
 847:	b8 00 00 00 00       	mov    $0x0,%eax
 84c:	eb 22                	jmp    870 <morecore+0x56>
  hp = (Header*)p;
 84e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 851:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 854:	8b 45 f0             	mov    -0x10(%ebp),%eax
 857:	8b 55 08             	mov    0x8(%ebp),%edx
 85a:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 85d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 860:	83 c0 08             	add    $0x8,%eax
 863:	89 04 24             	mov    %eax,(%esp)
 866:	e8 ce fe ff ff       	call   739 <free>
  return freep;
 86b:	a1 3c 0c 00 00       	mov    0xc3c,%eax
}
 870:	c9                   	leave  
 871:	c3                   	ret    

00000872 <malloc>:

void*
malloc(uint nbytes)
{
 872:	55                   	push   %ebp
 873:	89 e5                	mov    %esp,%ebp
 875:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 878:	8b 45 08             	mov    0x8(%ebp),%eax
 87b:	83 c0 07             	add    $0x7,%eax
 87e:	c1 e8 03             	shr    $0x3,%eax
 881:	83 c0 01             	add    $0x1,%eax
 884:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 887:	a1 3c 0c 00 00       	mov    0xc3c,%eax
 88c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 88f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 893:	75 23                	jne    8b8 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 895:	c7 45 f0 34 0c 00 00 	movl   $0xc34,-0x10(%ebp)
 89c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89f:	a3 3c 0c 00 00       	mov    %eax,0xc3c
 8a4:	a1 3c 0c 00 00       	mov    0xc3c,%eax
 8a9:	a3 34 0c 00 00       	mov    %eax,0xc34
    base.s.size = 0;
 8ae:	c7 05 38 0c 00 00 00 	movl   $0x0,0xc38
 8b5:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8bb:	8b 00                	mov    (%eax),%eax
 8bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c3:	8b 40 04             	mov    0x4(%eax),%eax
 8c6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8c9:	72 4d                	jb     918 <malloc+0xa6>
      if(p->s.size == nunits)
 8cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ce:	8b 40 04             	mov    0x4(%eax),%eax
 8d1:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8d4:	75 0c                	jne    8e2 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d9:	8b 10                	mov    (%eax),%edx
 8db:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8de:	89 10                	mov    %edx,(%eax)
 8e0:	eb 26                	jmp    908 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e5:	8b 40 04             	mov    0x4(%eax),%eax
 8e8:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8eb:	89 c2                	mov    %eax,%edx
 8ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f0:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f6:	8b 40 04             	mov    0x4(%eax),%eax
 8f9:	c1 e0 03             	shl    $0x3,%eax
 8fc:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 902:	8b 55 ec             	mov    -0x14(%ebp),%edx
 905:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 908:	8b 45 f0             	mov    -0x10(%ebp),%eax
 90b:	a3 3c 0c 00 00       	mov    %eax,0xc3c
      return (void*)(p + 1);
 910:	8b 45 f4             	mov    -0xc(%ebp),%eax
 913:	83 c0 08             	add    $0x8,%eax
 916:	eb 38                	jmp    950 <malloc+0xde>
    }
    if(p == freep)
 918:	a1 3c 0c 00 00       	mov    0xc3c,%eax
 91d:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 920:	75 1b                	jne    93d <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 922:	8b 45 ec             	mov    -0x14(%ebp),%eax
 925:	89 04 24             	mov    %eax,(%esp)
 928:	e8 ed fe ff ff       	call   81a <morecore>
 92d:	89 45 f4             	mov    %eax,-0xc(%ebp)
 930:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 934:	75 07                	jne    93d <malloc+0xcb>
        return 0;
 936:	b8 00 00 00 00       	mov    $0x0,%eax
 93b:	eb 13                	jmp    950 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 93d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 940:	89 45 f0             	mov    %eax,-0x10(%ebp)
 943:	8b 45 f4             	mov    -0xc(%ebp),%eax
 946:	8b 00                	mov    (%eax),%eax
 948:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 94b:	e9 70 ff ff ff       	jmp    8c0 <malloc+0x4e>
}
 950:	c9                   	leave  
 951:	c3                   	ret    
