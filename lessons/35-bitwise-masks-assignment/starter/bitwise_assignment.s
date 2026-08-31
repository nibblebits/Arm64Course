.section .text

.global update_permissions
.type update_permissions, %function

// uint32_t update_permissions(uint32_t current, uint32_t grant_mask,
//                             uint32_t revoke_mask,
//                             uint32_t toggle_mask)
update_permissions:
    // TODO: grant, revoke, and toggle the requested bits in that order.
    mov w0, #0
    ret

.size update_permissions, . - update_permissions

.global extract_owner_field
.type extract_owner_field, %function

// uint32_t extract_owner_field(uint32_t permissions)
extract_owner_field:
    // TODO: return bits 8 through 15 in the low byte.
    mov w0, #0
    ret

.size extract_owner_field, . - extract_owner_field

.global has_any_permission
.type has_any_permission, %function

// uint32_t has_any_permission(uint32_t permissions, uint32_t mask)
has_any_permission:
    // TODO: return 1 if any selected bit is set, otherwise return 0.
    mov w0, #0
    ret

.size has_any_permission, . - has_any_permission

.section .note.GNU-stack,"",@progbits

