///////////////////////////////////////////////////////////////////////
/// Copyright (c) 1988-2020 $organization$
///
/// This software is provided by the author and contributors ``as is'' 
/// and any express or implied warranties, including, but not limited to, 
/// the implied warranties of merchantability and fitness for a particular 
/// purpose are disclaimed. In no event shall the author or contributors 
/// be liable for any direct, indirect, incidental, special, exemplary, 
/// or consequential damages (including, but not limited to, procurement 
/// of substitute goods or services; loss of use, data, or profits; or 
/// business interruption) however caused and on any theory of liability, 
/// whether in contract, strict liability, or tort (including negligence 
/// or otherwise) arising in any way out of the use of this software, 
/// even if advised of the possibility of such damage.
///
///   File: reader.hpp
///
/// Author: $author$
///   Date: 3/10/2020, 9/1/2021
///////////////////////////////////////////////////////////////////////
#ifndef XOS_IO_READER_HPP
#define XOS_IO_READER_HPP

#include "xos/io/seeker.hpp"

namespace xos {
namespace io {

///  Class: readert
template <class TImplements = sequence>
class exported readert: virtual public TImplements {
public:
    typedef TImplements Implements, implements;

    typedef typename implements::what_t what_t;
    typedef typename implements::sized_t sized_t;
    typedef typename implements::endof_t endof_t;
    static const endof_t endof = implements::endof;

    /// read / fill
    virtual ssize_t read(what_t* what, size_t size) {
        ssize_t count = 0;
        return count;
    }    
    virtual ssize_t fill() {
        ssize_t count = 0;
        return count;
    }    
}; /// class exported readert
typedef readert<seeker> reader;

typedef readert<byte_seeker> byte_reader;
typedef readert<word_seeker> word_reader;

///  Class: char_readert
template <class TSeeker = char_seeker, class TImplements = readert<TSeeker> >
class exported char_readert: virtual public TImplements {
public:
    typedef TImplements Implements, implements;

    typedef typename implements::what_t what_t;
    typedef typename implements::sized_t sized_t;
    typedef typename implements::endof_t endof_t;
    static const endof_t endof = implements::endof;

    /// readx...
    virtual ssize_t readx(void* in, size_t size) {
        ssize_t count = 0;
        uint8_t* byte = 0;

        if ((byte = (uint8_t*)(in)) && (0 < size)) {
            ssize_t amount = 0;
            
            for (; 0 < size; --size, ++byte) {
                if (0 < (amount = getx(*byte))) {
                    ++count;
                } else {
                    if (0 > amount) {
                        count = amount;
                        break;
                    }
                }
            }
        }
        return count;
    }
    virtual ssize_t getx(uint8_t& byte) {
        ssize_t count = 0, amount = 0;
        sized_t x = (sized_t)(0);
        uint8_t n = 0;
        int8_t d = 0;

        for (byte = 0, n = 0; n < 2; ++n) {
            if (0 < (amount = this->read(&x, 1))) {
                if (0 <= (d = this->xtod(x))) {
                    byte = ((byte << 4) | (((uint8_t)d) & 15));
                    count += n;
                } else {
                    count = d;
                    break;
                }
            } else {
                count = amount;
                break;
            }
        }
        return count;
    }

    /// read64...
    virtual ssize_t read64(void* in, size_t size) {
        ssize_t count = 0;
        uint8_t* byte = 0;

        if ((byte = (uint8_t*)(in)) && (0 < size)) {
            ssize_t amount = 0;
            uint8_t carry = 0, shift = 0, b[2];

            for (carry = 0, shift = 2; 0 < size; size += amount, byte += amount) {
                if (0 > (amount = this->get64(b, carry, shift))) {
                    return amount;
                } else {
                    if (0 < (amount)) {
                        for (ssize_t i = 0; i < amount; ++i) {
                            byte[i] = b[i];
                        }
                        count += amount;
                    } else {
                        if (carry) {
                            if (2 == (shift)) {
                            } else {
                                if (4 == (shift)) {
                                } else {
                                }
                            }
                        } else {
                        }
                        break;
                    }
                }
            }
        }
        return count;
    }
    virtual ssize_t get64(uint8_t b[], uint8_t& carry, uint8_t& shift) {
        const uint8_t mask = ((uint8_t)-1);
        ssize_t count = 0, amount = 0;
        uint8_t n = 0;
        int8_t d = 0;
        sized_t x = (sized_t)(0);

        if (2 == (shift)) {
            for (n = 0; n < 2;) {
                if (0 >= (amount = this->read(&x, 1))) {
                    if (0 > (amount)) {
                        return amount;
                    } else {
                        shift = 2;
                        if (n < 1) {
                            carry = 0;
                            return 0;
                        } else {
                            b[0] = carry;
                            carry = 0;
                            return 1;
                        }
                    }
                } else {
                    if (0 <= (d = this->b64tod(x))) {
                        if (n < 1) {
                            carry = (((uint8_t)d) << 2);
                        } else {
                            shift += 2;
                            b[0] = (carry | (((uint8_t)d) >> 4));
                            carry = ((((uint8_t)d) & (mask >> 4)) << 4);
                            count = 1;
                        }
                        ++n;
                    }
                }
            }
        } else {
            if (4 == (shift)) {
                for (n = 0; n < 2;) {
                    if (0 >= (amount = this->read(&x, 1))) {
                        if (0 > amount) {
                            return amount;
                        } else {
                            b[n] = carry;
                            carry = 0;
                            shift = 2;
                            return 1;
                        }
                    } else {
                        if (0 <= (d = this->b64tod(x))) {
                            b[n] = (carry | (((uint8_t)d) >> (6 - shift)));
                            if (n < 1) {
                                carry = ((((uint8_t)d) & (mask >> 6)) << 6);
                                shift += 2;
                            } else {
                                carry = 0;
                                shift = 2;
                                count = 2;
                            }
                            ++n;
                        } else {
                            return 0;
                        }
                    }
                }
            } else {
            }
        }
        return count;
    }
}; /// class exported char_readert

typedef char_readert<char_seeker> char_reader;
typedef char_readert<tchar_seeker> tchar_reader;
typedef char_readert<wchar_seeker> wchar_reader;

} /// namespace io
} /// namespace xos

#endif /// ndef XOS_IO_READER_HPP 
