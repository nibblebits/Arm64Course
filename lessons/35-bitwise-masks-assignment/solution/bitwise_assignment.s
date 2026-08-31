.section .text

.global update_permissions
.type update_permissions, %function

// uint32_t update_permissions(uint32_t current, uint32_t grant_mask,
//                             uint32_t revoke_mask,
//                             uint32_t toggle_mask)
update_permissions:
    orr w0, w0, w1
    mvn w4, w2
    and w0, w0, w4
    eor w0, w0, w3
    ret

.size update_permissions, . - update_permissions

.global extract_owner_field
.type extract_owner_field, %function

// uint32_t extract_owner_field(uint32_t permissions)
extract_owner_field:
    lsr w0, w0, #8
    and w0, w0, #0xff
    ret

.size extract_owner_field, . - extract_owner_field

.global has_any_permission
.type has_any_permission, %function

// uint32_t has_any_permission(uint32_t permissions, uint32_t mask)
has_any_permission:
    tst w0, w1
    b.eq .Lno_permission
    mov w0, #1
    ret

.Lno_permission:
    mov w0, #0
    ret

.size has_any_permission, . - has_any_permission

.section .note.GNU-stack,"",@progbits

