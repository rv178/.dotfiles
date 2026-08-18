local present, ibl = pcall(require, "ibl")

if not present then
    return
end

ibl.setup()
