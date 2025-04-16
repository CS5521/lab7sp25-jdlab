
_ps:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "pstat.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
  ps();
   6:	e8 65 02 00 00       	call   270 <ps>
  exit();
   b:	e8 85 03 00 00       	call   395 <exit>

00000010 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	57                   	push   %edi
  14:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  15:	8b 4d 08             	mov    0x8(%ebp),%ecx
  18:	8b 55 10             	mov    0x10(%ebp),%edx
  1b:	8b 45 0c             	mov    0xc(%ebp),%eax
  1e:	89 cb                	mov    %ecx,%ebx
  20:	89 df                	mov    %ebx,%edi
  22:	89 d1                	mov    %edx,%ecx
  24:	fc                   	cld    
  25:	f3 aa                	rep stos %al,%es:(%edi)
  27:	89 ca                	mov    %ecx,%edx
  29:	89 fb                	mov    %edi,%ebx
  2b:	89 5d 08             	mov    %ebx,0x8(%ebp)
  2e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  31:	5b                   	pop    %ebx
  32:	5f                   	pop    %edi
  33:	5d                   	pop    %ebp
  34:	c3                   	ret    

00000035 <strcpy>:
#include "user.h"
#include "x86.h"
#include "pstat.h"
char*
strcpy(char *s, const char *t)
{
  35:	55                   	push   %ebp
  36:	89 e5                	mov    %esp,%ebp
  38:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  3b:	8b 45 08             	mov    0x8(%ebp),%eax
  3e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  41:	90                   	nop
  42:	8b 45 08             	mov    0x8(%ebp),%eax
  45:	8d 50 01             	lea    0x1(%eax),%edx
  48:	89 55 08             	mov    %edx,0x8(%ebp)
  4b:	8b 55 0c             	mov    0xc(%ebp),%edx
  4e:	8d 4a 01             	lea    0x1(%edx),%ecx
  51:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  54:	0f b6 12             	movzbl (%edx),%edx
  57:	88 10                	mov    %dl,(%eax)
  59:	0f b6 00             	movzbl (%eax),%eax
  5c:	84 c0                	test   %al,%al
  5e:	75 e2                	jne    42 <strcpy+0xd>
    ;
  return os;
  60:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  63:	c9                   	leave  
  64:	c3                   	ret    

00000065 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  65:	55                   	push   %ebp
  66:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  68:	eb 08                	jmp    72 <strcmp+0xd>
    p++, q++;
  6a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  6e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  72:	8b 45 08             	mov    0x8(%ebp),%eax
  75:	0f b6 00             	movzbl (%eax),%eax
  78:	84 c0                	test   %al,%al
  7a:	74 10                	je     8c <strcmp+0x27>
  7c:	8b 45 08             	mov    0x8(%ebp),%eax
  7f:	0f b6 10             	movzbl (%eax),%edx
  82:	8b 45 0c             	mov    0xc(%ebp),%eax
  85:	0f b6 00             	movzbl (%eax),%eax
  88:	38 c2                	cmp    %al,%dl
  8a:	74 de                	je     6a <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  8c:	8b 45 08             	mov    0x8(%ebp),%eax
  8f:	0f b6 00             	movzbl (%eax),%eax
  92:	0f b6 d0             	movzbl %al,%edx
  95:	8b 45 0c             	mov    0xc(%ebp),%eax
  98:	0f b6 00             	movzbl (%eax),%eax
  9b:	0f b6 c0             	movzbl %al,%eax
  9e:	29 c2                	sub    %eax,%edx
  a0:	89 d0                	mov    %edx,%eax
}
  a2:	5d                   	pop    %ebp
  a3:	c3                   	ret    

000000a4 <strlen>:

uint
strlen(const char *s)
{
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  aa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  b1:	eb 04                	jmp    b7 <strlen+0x13>
  b3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  b7:	8b 55 fc             	mov    -0x4(%ebp),%edx
  ba:	8b 45 08             	mov    0x8(%ebp),%eax
  bd:	01 d0                	add    %edx,%eax
  bf:	0f b6 00             	movzbl (%eax),%eax
  c2:	84 c0                	test   %al,%al
  c4:	75 ed                	jne    b3 <strlen+0xf>
    ;
  return n;
  c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  c9:	c9                   	leave  
  ca:	c3                   	ret    

000000cb <memset>:

void*
memset(void *dst, int c, uint n)
{
  cb:	55                   	push   %ebp
  cc:	89 e5                	mov    %esp,%ebp
  ce:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  d1:	8b 45 10             	mov    0x10(%ebp),%eax
  d4:	89 44 24 08          	mov    %eax,0x8(%esp)
  d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  db:	89 44 24 04          	mov    %eax,0x4(%esp)
  df:	8b 45 08             	mov    0x8(%ebp),%eax
  e2:	89 04 24             	mov    %eax,(%esp)
  e5:	e8 26 ff ff ff       	call   10 <stosb>
  return dst;
  ea:	8b 45 08             	mov    0x8(%ebp),%eax
}
  ed:	c9                   	leave  
  ee:	c3                   	ret    

000000ef <strchr>:

char*
strchr(const char *s, char c)
{
  ef:	55                   	push   %ebp
  f0:	89 e5                	mov    %esp,%ebp
  f2:	83 ec 04             	sub    $0x4,%esp
  f5:	8b 45 0c             	mov    0xc(%ebp),%eax
  f8:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
  fb:	eb 14                	jmp    111 <strchr+0x22>
    if(*s == c)
  fd:	8b 45 08             	mov    0x8(%ebp),%eax
 100:	0f b6 00             	movzbl (%eax),%eax
 103:	3a 45 fc             	cmp    -0x4(%ebp),%al
 106:	75 05                	jne    10d <strchr+0x1e>
      return (char*)s;
 108:	8b 45 08             	mov    0x8(%ebp),%eax
 10b:	eb 13                	jmp    120 <strchr+0x31>
  for(; *s; s++)
 10d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	0f b6 00             	movzbl (%eax),%eax
 117:	84 c0                	test   %al,%al
 119:	75 e2                	jne    fd <strchr+0xe>
  return 0;
 11b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 120:	c9                   	leave  
 121:	c3                   	ret    

00000122 <gets>:

char*
gets(char *buf, int max)
{
 122:	55                   	push   %ebp
 123:	89 e5                	mov    %esp,%ebp
 125:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 128:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 12f:	eb 4c                	jmp    17d <gets+0x5b>
    cc = read(0, &c, 1);
 131:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 138:	00 
 139:	8d 45 ef             	lea    -0x11(%ebp),%eax
 13c:	89 44 24 04          	mov    %eax,0x4(%esp)
 140:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 147:	e8 61 02 00 00       	call   3ad <read>
 14c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 14f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 153:	7f 02                	jg     157 <gets+0x35>
      break;
 155:	eb 31                	jmp    188 <gets+0x66>
    buf[i++] = c;
 157:	8b 45 f4             	mov    -0xc(%ebp),%eax
 15a:	8d 50 01             	lea    0x1(%eax),%edx
 15d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 160:	89 c2                	mov    %eax,%edx
 162:	8b 45 08             	mov    0x8(%ebp),%eax
 165:	01 c2                	add    %eax,%edx
 167:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 16b:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 16d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 171:	3c 0a                	cmp    $0xa,%al
 173:	74 13                	je     188 <gets+0x66>
 175:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 179:	3c 0d                	cmp    $0xd,%al
 17b:	74 0b                	je     188 <gets+0x66>
  for(i=0; i+1 < max; ){
 17d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 180:	83 c0 01             	add    $0x1,%eax
 183:	3b 45 0c             	cmp    0xc(%ebp),%eax
 186:	7c a9                	jl     131 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 188:	8b 55 f4             	mov    -0xc(%ebp),%edx
 18b:	8b 45 08             	mov    0x8(%ebp),%eax
 18e:	01 d0                	add    %edx,%eax
 190:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 193:	8b 45 08             	mov    0x8(%ebp),%eax
}
 196:	c9                   	leave  
 197:	c3                   	ret    

00000198 <stat>:

int
stat(const char *n, struct stat *st)
{
 198:	55                   	push   %ebp
 199:	89 e5                	mov    %esp,%ebp
 19b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 19e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1a5:	00 
 1a6:	8b 45 08             	mov    0x8(%ebp),%eax
 1a9:	89 04 24             	mov    %eax,(%esp)
 1ac:	e8 24 02 00 00       	call   3d5 <open>
 1b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1b4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1b8:	79 07                	jns    1c1 <stat+0x29>
    return -1;
 1ba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1bf:	eb 23                	jmp    1e4 <stat+0x4c>
  r = fstat(fd, st);
 1c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c4:	89 44 24 04          	mov    %eax,0x4(%esp)
 1c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1cb:	89 04 24             	mov    %eax,(%esp)
 1ce:	e8 1a 02 00 00       	call   3ed <fstat>
 1d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d9:	89 04 24             	mov    %eax,(%esp)
 1dc:	e8 dc 01 00 00       	call   3bd <close>
  return r;
 1e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1e4:	c9                   	leave  
 1e5:	c3                   	ret    

000001e6 <atoi>:

int
atoi(const char *s)
{
 1e6:	55                   	push   %ebp
 1e7:	89 e5                	mov    %esp,%ebp
 1e9:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1ec:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 1f3:	eb 25                	jmp    21a <atoi+0x34>
    n = n*10 + *s++ - '0';
 1f5:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1f8:	89 d0                	mov    %edx,%eax
 1fa:	c1 e0 02             	shl    $0x2,%eax
 1fd:	01 d0                	add    %edx,%eax
 1ff:	01 c0                	add    %eax,%eax
 201:	89 c1                	mov    %eax,%ecx
 203:	8b 45 08             	mov    0x8(%ebp),%eax
 206:	8d 50 01             	lea    0x1(%eax),%edx
 209:	89 55 08             	mov    %edx,0x8(%ebp)
 20c:	0f b6 00             	movzbl (%eax),%eax
 20f:	0f be c0             	movsbl %al,%eax
 212:	01 c8                	add    %ecx,%eax
 214:	83 e8 30             	sub    $0x30,%eax
 217:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 21a:	8b 45 08             	mov    0x8(%ebp),%eax
 21d:	0f b6 00             	movzbl (%eax),%eax
 220:	3c 2f                	cmp    $0x2f,%al
 222:	7e 0a                	jle    22e <atoi+0x48>
 224:	8b 45 08             	mov    0x8(%ebp),%eax
 227:	0f b6 00             	movzbl (%eax),%eax
 22a:	3c 39                	cmp    $0x39,%al
 22c:	7e c7                	jle    1f5 <atoi+0xf>
  return n;
 22e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 231:	c9                   	leave  
 232:	c3                   	ret    

00000233 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 233:	55                   	push   %ebp
 234:	89 e5                	mov    %esp,%ebp
 236:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 239:	8b 45 08             	mov    0x8(%ebp),%eax
 23c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 23f:	8b 45 0c             	mov    0xc(%ebp),%eax
 242:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 245:	eb 17                	jmp    25e <memmove+0x2b>
    *dst++ = *src++;
 247:	8b 45 fc             	mov    -0x4(%ebp),%eax
 24a:	8d 50 01             	lea    0x1(%eax),%edx
 24d:	89 55 fc             	mov    %edx,-0x4(%ebp)
 250:	8b 55 f8             	mov    -0x8(%ebp),%edx
 253:	8d 4a 01             	lea    0x1(%edx),%ecx
 256:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 259:	0f b6 12             	movzbl (%edx),%edx
 25c:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 25e:	8b 45 10             	mov    0x10(%ebp),%eax
 261:	8d 50 ff             	lea    -0x1(%eax),%edx
 264:	89 55 10             	mov    %edx,0x10(%ebp)
 267:	85 c0                	test   %eax,%eax
 269:	7f dc                	jg     247 <memmove+0x14>
  return vdst;
 26b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 26e:	c9                   	leave  
 26f:	c3                   	ret    

00000270 <ps>:

void
ps(void)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	56                   	push   %esi
 275:	53                   	push   %ebx
 276:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pinfo;

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 27c:	c7 44 24 04 e9 08 00 	movl   $0x8e9,0x4(%esp)
 283:	00 
 284:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 28b:	e8 8d 02 00 00       	call   51d <printf>
  getpinfo(&pinfo);
 290:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 296:	89 04 24             	mov    %eax,(%esp)
 299:	e8 97 01 00 00       	call   435 <getpinfo>
  int i;
  for (i = 0; i < NPROC; i++) {
 29e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 2a5:	e9 ce 00 00 00       	jmp    378 <ps+0x108>
      if (pinfo[i].inuse) {
 2aa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2ad:	89 d0                	mov    %edx,%eax
 2af:	c1 e0 03             	shl    $0x3,%eax
 2b2:	01 d0                	add    %edx,%eax
 2b4:	c1 e0 02             	shl    $0x2,%eax
 2b7:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 2ba:	01 d8                	add    %ebx,%eax
 2bc:	2d 04 09 00 00       	sub    $0x904,%eax
 2c1:	8b 00                	mov    (%eax),%eax
 2c3:	85 c0                	test   %eax,%eax
 2c5:	0f 84 a9 00 00 00    	je     374 <ps+0x104>
        printf(1, "%d\t%d\t%d\t%c\t%s\n",
          pinfo[i].pid,
          pinfo[i].tickets,
          pinfo[i].ticks,
          pinfo[i].state,
          pinfo[i].name);
 2cb:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 2d1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2d4:	89 d0                	mov    %edx,%eax
 2d6:	c1 e0 03             	shl    $0x3,%eax
 2d9:	01 d0                	add    %edx,%eax
 2db:	c1 e0 02             	shl    $0x2,%eax
 2de:	83 c0 10             	add    $0x10,%eax
 2e1:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
          pinfo[i].state,
 2e4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2e7:	89 d0                	mov    %edx,%eax
 2e9:	c1 e0 03             	shl    $0x3,%eax
 2ec:	01 d0                	add    %edx,%eax
 2ee:	c1 e0 02             	shl    $0x2,%eax
 2f1:	8d 75 e8             	lea    -0x18(%ebp),%esi
 2f4:	01 f0                	add    %esi,%eax
 2f6:	2d e4 08 00 00       	sub    $0x8e4,%eax
 2fb:	0f b6 00             	movzbl (%eax),%eax
        printf(1, "%d\t%d\t%d\t%c\t%s\n",
 2fe:	0f be f0             	movsbl %al,%esi
 301:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 304:	89 d0                	mov    %edx,%eax
 306:	c1 e0 03             	shl    $0x3,%eax
 309:	01 d0                	add    %edx,%eax
 30b:	c1 e0 02             	shl    $0x2,%eax
 30e:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 311:	01 c8                	add    %ecx,%eax
 313:	2d f8 08 00 00       	sub    $0x8f8,%eax
 318:	8b 18                	mov    (%eax),%ebx
 31a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 31d:	89 d0                	mov    %edx,%eax
 31f:	c1 e0 03             	shl    $0x3,%eax
 322:	01 d0                	add    %edx,%eax
 324:	c1 e0 02             	shl    $0x2,%eax
 327:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 32a:	01 c8                	add    %ecx,%eax
 32c:	2d 00 09 00 00       	sub    $0x900,%eax
 331:	8b 08                	mov    (%eax),%ecx
 333:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 336:	89 d0                	mov    %edx,%eax
 338:	c1 e0 03             	shl    $0x3,%eax
 33b:	01 d0                	add    %edx,%eax
 33d:	c1 e0 02             	shl    $0x2,%eax
 340:	8d 55 e8             	lea    -0x18(%ebp),%edx
 343:	01 d0                	add    %edx,%eax
 345:	2d fc 08 00 00       	sub    $0x8fc,%eax
 34a:	8b 00                	mov    (%eax),%eax
 34c:	89 7c 24 18          	mov    %edi,0x18(%esp)
 350:	89 74 24 14          	mov    %esi,0x14(%esp)
 354:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 358:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 35c:	89 44 24 08          	mov    %eax,0x8(%esp)
 360:	c7 44 24 04 02 09 00 	movl   $0x902,0x4(%esp)
 367:	00 
 368:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 36f:	e8 a9 01 00 00       	call   51d <printf>
  for (i = 0; i < NPROC; i++) {
 374:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 378:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 37c:	0f 8e 28 ff ff ff    	jle    2aa <ps+0x3a>
      }
  }

}
 382:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 388:	5b                   	pop    %ebx
 389:	5e                   	pop    %esi
 38a:	5f                   	pop    %edi
 38b:	5d                   	pop    %ebp
 38c:	c3                   	ret    

0000038d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 38d:	b8 01 00 00 00       	mov    $0x1,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <exit>:
SYSCALL(exit)
 395:	b8 02 00 00 00       	mov    $0x2,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <wait>:
SYSCALL(wait)
 39d:	b8 03 00 00 00       	mov    $0x3,%eax
 3a2:	cd 40                	int    $0x40
 3a4:	c3                   	ret    

000003a5 <pipe>:
SYSCALL(pipe)
 3a5:	b8 04 00 00 00       	mov    $0x4,%eax
 3aa:	cd 40                	int    $0x40
 3ac:	c3                   	ret    

000003ad <read>:
SYSCALL(read)
 3ad:	b8 05 00 00 00       	mov    $0x5,%eax
 3b2:	cd 40                	int    $0x40
 3b4:	c3                   	ret    

000003b5 <write>:
SYSCALL(write)
 3b5:	b8 10 00 00 00       	mov    $0x10,%eax
 3ba:	cd 40                	int    $0x40
 3bc:	c3                   	ret    

000003bd <close>:
SYSCALL(close)
 3bd:	b8 15 00 00 00       	mov    $0x15,%eax
 3c2:	cd 40                	int    $0x40
 3c4:	c3                   	ret    

000003c5 <kill>:
SYSCALL(kill)
 3c5:	b8 06 00 00 00       	mov    $0x6,%eax
 3ca:	cd 40                	int    $0x40
 3cc:	c3                   	ret    

000003cd <exec>:
SYSCALL(exec)
 3cd:	b8 07 00 00 00       	mov    $0x7,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <open>:
SYSCALL(open)
 3d5:	b8 0f 00 00 00       	mov    $0xf,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    

000003dd <mknod>:
SYSCALL(mknod)
 3dd:	b8 11 00 00 00       	mov    $0x11,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <unlink>:
SYSCALL(unlink)
 3e5:	b8 12 00 00 00       	mov    $0x12,%eax
 3ea:	cd 40                	int    $0x40
 3ec:	c3                   	ret    

000003ed <fstat>:
SYSCALL(fstat)
 3ed:	b8 08 00 00 00       	mov    $0x8,%eax
 3f2:	cd 40                	int    $0x40
 3f4:	c3                   	ret    

000003f5 <link>:
SYSCALL(link)
 3f5:	b8 13 00 00 00       	mov    $0x13,%eax
 3fa:	cd 40                	int    $0x40
 3fc:	c3                   	ret    

000003fd <mkdir>:
SYSCALL(mkdir)
 3fd:	b8 14 00 00 00       	mov    $0x14,%eax
 402:	cd 40                	int    $0x40
 404:	c3                   	ret    

00000405 <chdir>:
SYSCALL(chdir)
 405:	b8 09 00 00 00       	mov    $0x9,%eax
 40a:	cd 40                	int    $0x40
 40c:	c3                   	ret    

0000040d <dup>:
SYSCALL(dup)
 40d:	b8 0a 00 00 00       	mov    $0xa,%eax
 412:	cd 40                	int    $0x40
 414:	c3                   	ret    

00000415 <getpid>:
SYSCALL(getpid)
 415:	b8 0b 00 00 00       	mov    $0xb,%eax
 41a:	cd 40                	int    $0x40
 41c:	c3                   	ret    

0000041d <sbrk>:
SYSCALL(sbrk)
 41d:	b8 0c 00 00 00       	mov    $0xc,%eax
 422:	cd 40                	int    $0x40
 424:	c3                   	ret    

00000425 <sleep>:
SYSCALL(sleep)
 425:	b8 0d 00 00 00       	mov    $0xd,%eax
 42a:	cd 40                	int    $0x40
 42c:	c3                   	ret    

0000042d <uptime>:
SYSCALL(uptime)
 42d:	b8 0e 00 00 00       	mov    $0xe,%eax
 432:	cd 40                	int    $0x40
 434:	c3                   	ret    

00000435 <getpinfo>:
SYSCALL(getpinfo)
 435:	b8 16 00 00 00       	mov    $0x16,%eax
 43a:	cd 40                	int    $0x40
 43c:	c3                   	ret    

0000043d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 43d:	55                   	push   %ebp
 43e:	89 e5                	mov    %esp,%ebp
 440:	83 ec 18             	sub    $0x18,%esp
 443:	8b 45 0c             	mov    0xc(%ebp),%eax
 446:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 449:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 450:	00 
 451:	8d 45 f4             	lea    -0xc(%ebp),%eax
 454:	89 44 24 04          	mov    %eax,0x4(%esp)
 458:	8b 45 08             	mov    0x8(%ebp),%eax
 45b:	89 04 24             	mov    %eax,(%esp)
 45e:	e8 52 ff ff ff       	call   3b5 <write>
}
 463:	c9                   	leave  
 464:	c3                   	ret    

00000465 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 465:	55                   	push   %ebp
 466:	89 e5                	mov    %esp,%ebp
 468:	56                   	push   %esi
 469:	53                   	push   %ebx
 46a:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 46d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 474:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 478:	74 17                	je     491 <printint+0x2c>
 47a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 47e:	79 11                	jns    491 <printint+0x2c>
    neg = 1;
 480:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 487:	8b 45 0c             	mov    0xc(%ebp),%eax
 48a:	f7 d8                	neg    %eax
 48c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 48f:	eb 06                	jmp    497 <printint+0x32>
  } else {
    x = xx;
 491:	8b 45 0c             	mov    0xc(%ebp),%eax
 494:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 497:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 49e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4a1:	8d 41 01             	lea    0x1(%ecx),%eax
 4a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4a7:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4ad:	ba 00 00 00 00       	mov    $0x0,%edx
 4b2:	f7 f3                	div    %ebx
 4b4:	89 d0                	mov    %edx,%eax
 4b6:	0f b6 80 90 0b 00 00 	movzbl 0xb90(%eax),%eax
 4bd:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4c1:	8b 75 10             	mov    0x10(%ebp),%esi
 4c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4c7:	ba 00 00 00 00       	mov    $0x0,%edx
 4cc:	f7 f6                	div    %esi
 4ce:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4d1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4d5:	75 c7                	jne    49e <printint+0x39>
  if(neg)
 4d7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4db:	74 10                	je     4ed <printint+0x88>
    buf[i++] = '-';
 4dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4e0:	8d 50 01             	lea    0x1(%eax),%edx
 4e3:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4e6:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4eb:	eb 1f                	jmp    50c <printint+0xa7>
 4ed:	eb 1d                	jmp    50c <printint+0xa7>
    putc(fd, buf[i]);
 4ef:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4f5:	01 d0                	add    %edx,%eax
 4f7:	0f b6 00             	movzbl (%eax),%eax
 4fa:	0f be c0             	movsbl %al,%eax
 4fd:	89 44 24 04          	mov    %eax,0x4(%esp)
 501:	8b 45 08             	mov    0x8(%ebp),%eax
 504:	89 04 24             	mov    %eax,(%esp)
 507:	e8 31 ff ff ff       	call   43d <putc>
  while(--i >= 0)
 50c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 510:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 514:	79 d9                	jns    4ef <printint+0x8a>
}
 516:	83 c4 30             	add    $0x30,%esp
 519:	5b                   	pop    %ebx
 51a:	5e                   	pop    %esi
 51b:	5d                   	pop    %ebp
 51c:	c3                   	ret    

0000051d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 51d:	55                   	push   %ebp
 51e:	89 e5                	mov    %esp,%ebp
 520:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 523:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 52a:	8d 45 0c             	lea    0xc(%ebp),%eax
 52d:	83 c0 04             	add    $0x4,%eax
 530:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 533:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 53a:	e9 7c 01 00 00       	jmp    6bb <printf+0x19e>
    c = fmt[i] & 0xff;
 53f:	8b 55 0c             	mov    0xc(%ebp),%edx
 542:	8b 45 f0             	mov    -0x10(%ebp),%eax
 545:	01 d0                	add    %edx,%eax
 547:	0f b6 00             	movzbl (%eax),%eax
 54a:	0f be c0             	movsbl %al,%eax
 54d:	25 ff 00 00 00       	and    $0xff,%eax
 552:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 555:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 559:	75 2c                	jne    587 <printf+0x6a>
      if(c == '%'){
 55b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 55f:	75 0c                	jne    56d <printf+0x50>
        state = '%';
 561:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 568:	e9 4a 01 00 00       	jmp    6b7 <printf+0x19a>
      } else {
        putc(fd, c);
 56d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 570:	0f be c0             	movsbl %al,%eax
 573:	89 44 24 04          	mov    %eax,0x4(%esp)
 577:	8b 45 08             	mov    0x8(%ebp),%eax
 57a:	89 04 24             	mov    %eax,(%esp)
 57d:	e8 bb fe ff ff       	call   43d <putc>
 582:	e9 30 01 00 00       	jmp    6b7 <printf+0x19a>
      }
    } else if(state == '%'){
 587:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 58b:	0f 85 26 01 00 00    	jne    6b7 <printf+0x19a>
      if(c == 'd'){
 591:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 595:	75 2d                	jne    5c4 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 597:	8b 45 e8             	mov    -0x18(%ebp),%eax
 59a:	8b 00                	mov    (%eax),%eax
 59c:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5a3:	00 
 5a4:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5ab:	00 
 5ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b0:	8b 45 08             	mov    0x8(%ebp),%eax
 5b3:	89 04 24             	mov    %eax,(%esp)
 5b6:	e8 aa fe ff ff       	call   465 <printint>
        ap++;
 5bb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5bf:	e9 ec 00 00 00       	jmp    6b0 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5c4:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5c8:	74 06                	je     5d0 <printf+0xb3>
 5ca:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5ce:	75 2d                	jne    5fd <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5d0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5d3:	8b 00                	mov    (%eax),%eax
 5d5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5dc:	00 
 5dd:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5e4:	00 
 5e5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ec:	89 04 24             	mov    %eax,(%esp)
 5ef:	e8 71 fe ff ff       	call   465 <printint>
        ap++;
 5f4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5f8:	e9 b3 00 00 00       	jmp    6b0 <printf+0x193>
      } else if(c == 's'){
 5fd:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 601:	75 45                	jne    648 <printf+0x12b>
        s = (char*)*ap;
 603:	8b 45 e8             	mov    -0x18(%ebp),%eax
 606:	8b 00                	mov    (%eax),%eax
 608:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 60b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 60f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 613:	75 09                	jne    61e <printf+0x101>
          s = "(null)";
 615:	c7 45 f4 12 09 00 00 	movl   $0x912,-0xc(%ebp)
        while(*s != 0){
 61c:	eb 1e                	jmp    63c <printf+0x11f>
 61e:	eb 1c                	jmp    63c <printf+0x11f>
          putc(fd, *s);
 620:	8b 45 f4             	mov    -0xc(%ebp),%eax
 623:	0f b6 00             	movzbl (%eax),%eax
 626:	0f be c0             	movsbl %al,%eax
 629:	89 44 24 04          	mov    %eax,0x4(%esp)
 62d:	8b 45 08             	mov    0x8(%ebp),%eax
 630:	89 04 24             	mov    %eax,(%esp)
 633:	e8 05 fe ff ff       	call   43d <putc>
          s++;
 638:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 63c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 63f:	0f b6 00             	movzbl (%eax),%eax
 642:	84 c0                	test   %al,%al
 644:	75 da                	jne    620 <printf+0x103>
 646:	eb 68                	jmp    6b0 <printf+0x193>
        }
      } else if(c == 'c'){
 648:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 64c:	75 1d                	jne    66b <printf+0x14e>
        putc(fd, *ap);
 64e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 651:	8b 00                	mov    (%eax),%eax
 653:	0f be c0             	movsbl %al,%eax
 656:	89 44 24 04          	mov    %eax,0x4(%esp)
 65a:	8b 45 08             	mov    0x8(%ebp),%eax
 65d:	89 04 24             	mov    %eax,(%esp)
 660:	e8 d8 fd ff ff       	call   43d <putc>
        ap++;
 665:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 669:	eb 45                	jmp    6b0 <printf+0x193>
      } else if(c == '%'){
 66b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 66f:	75 17                	jne    688 <printf+0x16b>
        putc(fd, c);
 671:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 674:	0f be c0             	movsbl %al,%eax
 677:	89 44 24 04          	mov    %eax,0x4(%esp)
 67b:	8b 45 08             	mov    0x8(%ebp),%eax
 67e:	89 04 24             	mov    %eax,(%esp)
 681:	e8 b7 fd ff ff       	call   43d <putc>
 686:	eb 28                	jmp    6b0 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 688:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 68f:	00 
 690:	8b 45 08             	mov    0x8(%ebp),%eax
 693:	89 04 24             	mov    %eax,(%esp)
 696:	e8 a2 fd ff ff       	call   43d <putc>
        putc(fd, c);
 69b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 69e:	0f be c0             	movsbl %al,%eax
 6a1:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a5:	8b 45 08             	mov    0x8(%ebp),%eax
 6a8:	89 04 24             	mov    %eax,(%esp)
 6ab:	e8 8d fd ff ff       	call   43d <putc>
      }
      state = 0;
 6b0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 6b7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6bb:	8b 55 0c             	mov    0xc(%ebp),%edx
 6be:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6c1:	01 d0                	add    %edx,%eax
 6c3:	0f b6 00             	movzbl (%eax),%eax
 6c6:	84 c0                	test   %al,%al
 6c8:	0f 85 71 fe ff ff    	jne    53f <printf+0x22>
    }
  }
}
 6ce:	c9                   	leave  
 6cf:	c3                   	ret    

000006d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6d6:	8b 45 08             	mov    0x8(%ebp),%eax
 6d9:	83 e8 08             	sub    $0x8,%eax
 6dc:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6df:	a1 ac 0b 00 00       	mov    0xbac,%eax
 6e4:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6e7:	eb 24                	jmp    70d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ec:	8b 00                	mov    (%eax),%eax
 6ee:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6f1:	77 12                	ja     705 <free+0x35>
 6f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6f9:	77 24                	ja     71f <free+0x4f>
 6fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fe:	8b 00                	mov    (%eax),%eax
 700:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 703:	77 1a                	ja     71f <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 705:	8b 45 fc             	mov    -0x4(%ebp),%eax
 708:	8b 00                	mov    (%eax),%eax
 70a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 70d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 710:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 713:	76 d4                	jbe    6e9 <free+0x19>
 715:	8b 45 fc             	mov    -0x4(%ebp),%eax
 718:	8b 00                	mov    (%eax),%eax
 71a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 71d:	76 ca                	jbe    6e9 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 71f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 722:	8b 40 04             	mov    0x4(%eax),%eax
 725:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 72c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72f:	01 c2                	add    %eax,%edx
 731:	8b 45 fc             	mov    -0x4(%ebp),%eax
 734:	8b 00                	mov    (%eax),%eax
 736:	39 c2                	cmp    %eax,%edx
 738:	75 24                	jne    75e <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 73a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73d:	8b 50 04             	mov    0x4(%eax),%edx
 740:	8b 45 fc             	mov    -0x4(%ebp),%eax
 743:	8b 00                	mov    (%eax),%eax
 745:	8b 40 04             	mov    0x4(%eax),%eax
 748:	01 c2                	add    %eax,%edx
 74a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 750:	8b 45 fc             	mov    -0x4(%ebp),%eax
 753:	8b 00                	mov    (%eax),%eax
 755:	8b 10                	mov    (%eax),%edx
 757:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75a:	89 10                	mov    %edx,(%eax)
 75c:	eb 0a                	jmp    768 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 75e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 761:	8b 10                	mov    (%eax),%edx
 763:	8b 45 f8             	mov    -0x8(%ebp),%eax
 766:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 768:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76b:	8b 40 04             	mov    0x4(%eax),%eax
 76e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 775:	8b 45 fc             	mov    -0x4(%ebp),%eax
 778:	01 d0                	add    %edx,%eax
 77a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 77d:	75 20                	jne    79f <free+0xcf>
    p->s.size += bp->s.size;
 77f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 782:	8b 50 04             	mov    0x4(%eax),%edx
 785:	8b 45 f8             	mov    -0x8(%ebp),%eax
 788:	8b 40 04             	mov    0x4(%eax),%eax
 78b:	01 c2                	add    %eax,%edx
 78d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 790:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 793:	8b 45 f8             	mov    -0x8(%ebp),%eax
 796:	8b 10                	mov    (%eax),%edx
 798:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79b:	89 10                	mov    %edx,(%eax)
 79d:	eb 08                	jmp    7a7 <free+0xd7>
  } else
    p->s.ptr = bp;
 79f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a2:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7a5:	89 10                	mov    %edx,(%eax)
  freep = p;
 7a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7aa:	a3 ac 0b 00 00       	mov    %eax,0xbac
}
 7af:	c9                   	leave  
 7b0:	c3                   	ret    

000007b1 <morecore>:

static Header*
morecore(uint nu)
{
 7b1:	55                   	push   %ebp
 7b2:	89 e5                	mov    %esp,%ebp
 7b4:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7b7:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7be:	77 07                	ja     7c7 <morecore+0x16>
    nu = 4096;
 7c0:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7c7:	8b 45 08             	mov    0x8(%ebp),%eax
 7ca:	c1 e0 03             	shl    $0x3,%eax
 7cd:	89 04 24             	mov    %eax,(%esp)
 7d0:	e8 48 fc ff ff       	call   41d <sbrk>
 7d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7d8:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7dc:	75 07                	jne    7e5 <morecore+0x34>
    return 0;
 7de:	b8 00 00 00 00       	mov    $0x0,%eax
 7e3:	eb 22                	jmp    807 <morecore+0x56>
  hp = (Header*)p;
 7e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ee:	8b 55 08             	mov    0x8(%ebp),%edx
 7f1:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f7:	83 c0 08             	add    $0x8,%eax
 7fa:	89 04 24             	mov    %eax,(%esp)
 7fd:	e8 ce fe ff ff       	call   6d0 <free>
  return freep;
 802:	a1 ac 0b 00 00       	mov    0xbac,%eax
}
 807:	c9                   	leave  
 808:	c3                   	ret    

00000809 <malloc>:

void*
malloc(uint nbytes)
{
 809:	55                   	push   %ebp
 80a:	89 e5                	mov    %esp,%ebp
 80c:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 80f:	8b 45 08             	mov    0x8(%ebp),%eax
 812:	83 c0 07             	add    $0x7,%eax
 815:	c1 e8 03             	shr    $0x3,%eax
 818:	83 c0 01             	add    $0x1,%eax
 81b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 81e:	a1 ac 0b 00 00       	mov    0xbac,%eax
 823:	89 45 f0             	mov    %eax,-0x10(%ebp)
 826:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 82a:	75 23                	jne    84f <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 82c:	c7 45 f0 a4 0b 00 00 	movl   $0xba4,-0x10(%ebp)
 833:	8b 45 f0             	mov    -0x10(%ebp),%eax
 836:	a3 ac 0b 00 00       	mov    %eax,0xbac
 83b:	a1 ac 0b 00 00       	mov    0xbac,%eax
 840:	a3 a4 0b 00 00       	mov    %eax,0xba4
    base.s.size = 0;
 845:	c7 05 a8 0b 00 00 00 	movl   $0x0,0xba8
 84c:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 84f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 852:	8b 00                	mov    (%eax),%eax
 854:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 857:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85a:	8b 40 04             	mov    0x4(%eax),%eax
 85d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 860:	72 4d                	jb     8af <malloc+0xa6>
      if(p->s.size == nunits)
 862:	8b 45 f4             	mov    -0xc(%ebp),%eax
 865:	8b 40 04             	mov    0x4(%eax),%eax
 868:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 86b:	75 0c                	jne    879 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 86d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 870:	8b 10                	mov    (%eax),%edx
 872:	8b 45 f0             	mov    -0x10(%ebp),%eax
 875:	89 10                	mov    %edx,(%eax)
 877:	eb 26                	jmp    89f <malloc+0x96>
      else {
        p->s.size -= nunits;
 879:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87c:	8b 40 04             	mov    0x4(%eax),%eax
 87f:	2b 45 ec             	sub    -0x14(%ebp),%eax
 882:	89 c2                	mov    %eax,%edx
 884:	8b 45 f4             	mov    -0xc(%ebp),%eax
 887:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 88a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88d:	8b 40 04             	mov    0x4(%eax),%eax
 890:	c1 e0 03             	shl    $0x3,%eax
 893:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 896:	8b 45 f4             	mov    -0xc(%ebp),%eax
 899:	8b 55 ec             	mov    -0x14(%ebp),%edx
 89c:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 89f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a2:	a3 ac 0b 00 00       	mov    %eax,0xbac
      return (void*)(p + 1);
 8a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8aa:	83 c0 08             	add    $0x8,%eax
 8ad:	eb 38                	jmp    8e7 <malloc+0xde>
    }
    if(p == freep)
 8af:	a1 ac 0b 00 00       	mov    0xbac,%eax
 8b4:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8b7:	75 1b                	jne    8d4 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8bc:	89 04 24             	mov    %eax,(%esp)
 8bf:	e8 ed fe ff ff       	call   7b1 <morecore>
 8c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8cb:	75 07                	jne    8d4 <malloc+0xcb>
        return 0;
 8cd:	b8 00 00 00 00       	mov    $0x0,%eax
 8d2:	eb 13                	jmp    8e7 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8dd:	8b 00                	mov    (%eax),%eax
 8df:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 8e2:	e9 70 ff ff ff       	jmp    857 <malloc+0x4e>
}
 8e7:	c9                   	leave  
 8e8:	c3                   	ret    
